<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class RoleController extends Controller
{
    public function index(){
        $data = [
            'title'=>'Master Role'
        ];
        
        return view('role.index',$data);
    }
    
    public function userMatrix($id){
        $data = [
            'title'=>'Master Role'
        ];
        
        return view('role.userMatrix',$data);
    }
}
