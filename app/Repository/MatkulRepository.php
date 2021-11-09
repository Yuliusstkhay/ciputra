<?php
namespace App\Repository;

use App\Models\Matkul;
use Auth;
use Illuminate\Http\Request;

class MatkulRepository{
    
     public function getList($id){
        return Matkul::with('programstudi.fakultas')->whereHas('programstudi.fakultas',function($q){
            $q->where('universitas_id',Auth::user()->universitas_id);
        })->with('programstudi')->where('bidang_studi_id',$id)->get();
    }
    
    public function insert(){
        $matkul = new Matkul();
        return $matkul;
    }
    
    
    public function show($id){
        $data = Matkul::find($id);
        return $data;
    }


}