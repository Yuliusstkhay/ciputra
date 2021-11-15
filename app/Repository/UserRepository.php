<?php
namespace App\Repository;

use App\Models\User;
use App\Models\UserAccess;
use Auth;
use Illuminate\Http\Request;

class UserRepository{
    
    public function getList(){
        $data = User::where('universitas_id',Auth::user()->universitas_id)->with('role')->get();
        return $data;
    }
    
    
    public function insert(){
        $data = new User();
        return $data;
    }
    
    public function insertAccess(){
        $data = new UserAccess();
        return $data;
    }
    
    public function show($id){
        $data = User::find($id);
        return $data;
    }
    
    public function deleteAccess($id){
        $data = UserAccess::where('user_id',$id);
        
        return $data;
    }


}