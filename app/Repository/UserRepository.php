<?php
namespace App\Repository;

use App\Models\User;
use Auth;
use Illuminate\Http\Request;

class UserRepository{
    
    
    public function insert(){
        $data = new User();
        return $data;
    }
    
    
    public function show($id){
        $data = User::find($id);
        return $data;
    }


}