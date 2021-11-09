<?php
namespace App\Repository;

use App\Models\ProgramStudi;
use Auth;

class ProgramStudiRepository{
    
    public function getList(){
        return ProgramStudi::with('fakultas')->whereHas('fakultas',function($q){
            $q->where('universitas_id',Auth::user()->universitas_id);
        })->get();
    }
    
    public function getListData($id){
        return ProgramStudi::with('fakultas')->whereHas('fakultas',function($q){
            $q->where('universitas_id',Auth::user()->universitas_id);
        })->where('status',0)
          ->where('fakultas_id',$id)
          ->get();
    }
    
    public function insert(){
        $programstudi = new ProgramStudi();
        return $programstudi;
    }
    
    
    public function show($id){
        $data = ProgramStudi::find($id);
        return $data;
    }


}