<?php

namespace App\Http\Controllers\Tasks;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Requests\TaskRequest;
use App\Models\Task;

class TasksController extends Controller
{
    public function index()
    {
        $tasks = DB::select('call get_task()');

        return response()->json(['tasks' => $tasks]);

    }

    public function allTask()
    {

        $tasks = Task::select('id', 'title', 'description')
                     ->paginate(5);
        
        return response()->json(['tasks' => $tasks]);

    }

    public function show($id)
    {
        // Show Task for id
        $task  = Task::firstWhere('id', $id);

        return response()->json(['task' => $task]);


    }

    public function store(TaskRequest $request)
    {

        $data = [
            
            $request->title, 
            $request->description

        ];

        // Create Task
        $task = DB::select('call create_tasks(?, ?)', $data);

        return response()->json(
        [
            'success'=> 'Tarea creada exitosamente!',
            'code'=>200
        ]);
    
       
    }

    public function update(TaskRequest $request, $id)
    {

        $logged = auth()->user();
        
        if(!$logged){
            return response()->json(["message" => "Debes iniciar sesión."]);

        }

        $data = [

            $id,
            $request->title, 
            $request->description

        ];

        // Update Task
        $taskupd = DB::select('call update_tasks(?, ?, ?)', $data);

        return response()->json(
        [
            'success'=> 'Tarea actualizada exitosamente!',
            'code'=>200
        ]);

    }

    public function delete($id)
    {
        // Delete Task
        $deletetk = DB::select('call delete_task(?)', [$id]);

        return response()->json(
        [
            'success'=> 'Tarea eliminada exitosamente!',
            'code'=>200
        ]);

    }
}
