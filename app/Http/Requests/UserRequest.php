<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */
    public function rules(): array
    {
        $id = ( ($this->getMethod() === 'PUT') ? $this->id : null);
        $password = ( ($this->getMethod() === 'PUT') ? 'nullable|min:6|confirmed' : 'required|min:6|confirmed');

        return [

            'name' => 'required',
            'lastname' => 'required',
            'identification' => 'required|unique:users,identification,'.$id,
            'email' => 'required|email|unique:users,email,' .$id,
            'password' => $password,

        ];
    }

    public function attributes()
    {
        return [
            'name' => 'Nombre(s)',
            'lastname' => 'Apellido(s)',
            'identification' => 'Nro. Identificación',
            'email' => 'Correo electrónico',
            'password' => 'Contraseña',
             
        ];
    }

    public function messages()
    {
      
        return [

            'name.required' => 'Digite nombre(s)',
            'lastname.required' => 'Digite apellido(s)',
            'identification.required' => 'Digite identificación',
            'identification.unique' => 'el número de identificación ya se encuentra registrado',
            'email.required' => 'Digite correo electrónico',
            'email.unique' => 'El correo electrónico ya se encuentra registrado',
            'email.email' => 'Correo electrónico no valido',
            'password.required' => 'Digite contraseña',
            'password.min' => 'La contraseña contiene minimo 6 caracteres',
            'password.confirmed' => 'La contraseña no coincide con la casilla de confirmación',
            
        ];
    }
}
