<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Hash;
use Auth;
use App\Models\User;

class LoginController extends Controller {

    public function index() {
        $data = [
            'title' => "Universitas Ciputra - Sistem Penilaian Mahasiswa"
        ];

        return view('auth.login', $data);
    }
    
    public function loginProcess(Request $request){
        $credentials = $request->validate([
            'email' => ['required', 'email'],
            'password' => ['required'],
        ]);
        
        $email = $request->email;
        $password = $request->password;
        
        if(Auth::attempt(['user_id'=>$email,'password'=>$password,'is_locked'=>0])){
            return response()->json([
                'result'=>true,
                'message'=>"Sukses! Login Berhasil",
                'url'=> url('dashboard')
            ]);
        }else{
            return response()->json([
                'result'=>false,
                'message'=>"Gagal! Email atau Password tidak sesuai"
            ]);
        }
        
        
    }
    
    public function logout(){
       Auth::logout();
       
       return redirect()->route('login');
    }

}
