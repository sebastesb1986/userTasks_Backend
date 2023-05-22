<?php

namespace App\Http\Controllers\Tasks;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Http\Requests\TaskListRequest;
use App\Models\Tasklist;

class TasksListController extends Controller
{
    public function index()
    {
        $auth = auth()->user();
        $tasklists = Tasklist::with(['users' => function($td) use($auth){
                            $td->select('id', 'name', 'lastname');
                        }])
                        ->select('id', 'list_code', 'title', 'description', 'user_id')
                        ->where('user_id', $auth->id)
                        ->get();

        return response()->json(['tasklists' => $tasklists]);

    }

    public function show($code)
    {
        $tasklist = Tasklist::with(['users' => function($td){
                                $td->select('id', 'name', 'lastname');
                            }])
                            ->select('id', 'list_code', 'title', 'description', 'user_id')
                            ->firstWhere('list_code', $code);

        // Obtener las tareas que le corresponden a la lista consultada
        $tklPivot = $tasklist->tasks()->pluck('task_id');
                            
        return response()->json(['tasklist' => $tasklist, 'tklPivot' => $tklPivot]);


    }

    public function store(TaskListRequest $request)
    {
        $auth = auth()->user();

        $task_id = $request->task_id;

        // Generar el codigo unico de la lista de tareas
        $listCode = uniqid();
        
        $data = [

            'list_code' => $listCode,
            'title' => $request->title, 
            'description' => $request->description

        ];

        $tasklists = $auth->tasklist()->create($data);

        $tasklists->tasks()->sync($request->task_id, false);

        return response()->json(
        [
            'success'=> 'Lista de tareas registrada exitosamente!',
            'code'=>200
        ]);

    }

    public function update(TaskListRequest $request, $code)
    {
  
        $auth = auth()->user();

        $task_id = $request->task_id;

        $task_list = Tasklist::firstWhere('list_code', $code);

        $data = [

            'title' => $request->title, 
            'description' => $request->description

        ];

        $tkl = $task_list->update($data);

        $tasklists = $task_list->tasks()->sync($request->task_id);

        return response()->json(
        [
            'success'=> 'Lista de tareas actualizada exitosamente!',
            'code'=>200
        ]);
   
    }

    public function delete($id)
    {
        $tasklist = Tasklist::findOrfail($id);

        $deletetkl = $tasklist->delete();

        return response()->json(
        [
            'success'=> 'Lista de tareas eliminada exitosamente!',
            'code'=>200
        ]);


    }
}
