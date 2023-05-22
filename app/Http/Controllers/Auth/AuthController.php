<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\AuthRequest;
use App\Http\Requests\UserRequest;
use App\Models\User;

use Validator;

class AuthController extends Controller
{
    public function __construct() {

        $this->middleware('auth:api', ['except' => ['login', 'register', 'me']]);
        
    }

    // Register User
    public function register(UserRequest $request) {

        $validated = $request->validated();

        $user = User::create(array_merge(
                    $validated,
                    ['password' => bcrypt($request->password)]
                ));

        return response()->json([
            'message' => 'Usuario registrado exitosamente',
            // 'user' => $user
        ], 201);
    }

    // Sing in session
    public function login(AuthRequest $request){

    	$validated = $request->validated();

        if (!$token = auth()->attempt($validated)) {
           
            return response()->json(['error' => 'Usuario NO registrado o Información incorrecta'], 401);
        }
        
        return $this->respondWithToken($token);

    }

    // Close session
    public function logout() {

        auth()->logout();

        return response()->json(['message' => 'Sesión cerrada exitosamente.']);

    }

    // Get User logged in
    public function me()
    {
        $logged = auth()->user();

        if($logged){

            $data = [ "id" => $logged->id, "name" => $logged->name, "email" => $logged->email  ];

            return response()->json(["logged_in" => $data]);

        }
        else{

            return response()->json(["message" => "Debes iniciar sesión."]);

        }
    }

    // Get user logged in
    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',  
            'expires_in' => auth()->factory()->getTTL() * 60
        ]);
    }
}
