<?php
namespace App\Repository;

use App\Models\Modul;
use App\Models\Role;
use App\Models\RoleAccess;
use Auth;
use Illuminate\Http\Request;

class RoleRepository{
    
    public function getModul(){
        return Modul::whereNull('parent_id')->where('is_visible',1)
                ->whereHas('child',function($q){
                    $q->where('is_visible',1);
                })
                ->with(['child','child.modulfungsi','child.modulfungsi.fungsi'])->get();
    }
    
    public function getList(){
        $data = Role::where('universitas_id',Auth::user()->universitas_id)->get();
        return $data;
    }
    
    public function getRoleDosen(Request $request){
        $data = Role::where('universitas_id',Auth::user()->universitas_id)
                ->where('is_dosen',1)->where('status',0);
        if($request->has('q')){
            $data->where('role_name','like','%'.$request->q.'%');
        }
        $data = $data->get();
        return $data;
    }
    
    public function getRoleMahasiswa(Request $request){
        $data = Role::where('universitas_id',Auth::user()->universitas_id)
                ->where('is_mahasiswa',1)->where('status',0);
        if($request->has('q')){
            $data->where('role_name','like','%'.$request->q.'%');
        }
        $data = $data->get();
        return $data;
    }
    
    public function getData(Request $request){
        $data = Role::where('universitas_id',Auth::user()->universitas_id)->where('status',0)->where('is_admin',1);
        if($request->has('q')){
            $data->where('role_name','like',"%".$request->q."%");
        }
        $data = $data->get();
        return $data;
    }
    
    
    public function getParent(){
        return Modul::whereNull('parent_id')->where('is_visible',1)
                ->whereHas('child',function($q){
                    $q->where('is_visible',1);
                })->get();
    }
    
    
    
    public function insert(){
        $role = new Role();
        return $role;
    }
    
    public function insertAccess(){
        $access = new RoleAccess();
        return $access;
    }
    
    
    public function show($id){
        $data = Role::find($id);
        return $data;
    }
    
    public function deleteAccess($id){
        $data = RoleAccess::where('role_id',$id);
        
        return $data;
    }


}