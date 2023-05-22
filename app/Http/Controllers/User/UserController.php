<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Http\Requests\UserRequest;


class UserController extends Controller
{
    public function index()
    {
        $users = User::select( 'name', 'lastname', 'identification', 'email')->get();

        return response()->json(['users' => $users]);

    }

    public function show($id)
    {
        $auth = auth()->user();
        $user = User::select( 'id', 'name', 'lastname', 'identification', 'email')
                        ->findOrFail($id);

        return response()->json(['user' => $user]);


    }

    public function update(UserRequest $request, $id)
    {
      
        $user = User::findOrFail($id);

        $data = [

            'name' => $request->name, 
            'lastname' => $request->lastname, 
            'identification' => $request->identification,
            'email' => $request->email,
            // 'password' => $request->password

        ];

        $userup = $user->update($data);

        return response()->json(
        [
            'success'=> 'Usuario actualizado exitosamente!',
            'code'=>200
        ]);

   
    }

    public function delete($id)
    {
        $user = User::findOrfail($id);

        $deletetk = $user->delete();

        // Si cumple
        return response()->json(
            [
                'success'=> 'Usuario eliminada exitosamente!',
                'code'=>200
            ]);

    }
}
