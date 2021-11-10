<?php
namespace App\Repository;

use App\Models\DosenMahasiswa;
use Auth;
use Illuminate\Http\Request;

class DosenRepository{
    
     public function getList($id){
        return DosenMahasiswa::with('programstudi.fakultas')->whereHas('programstudi.fakultas',function($q){
            $q->where('universitas_id',Auth::user()->universitas_id);
        })->with('programstudi')->where('bidang_studi_id',$id)->where('tipe',0)->get();
    }
    
    public function getListDosen($id,Request $request){
        $data =DosenMahasiswa::with('programstudi.fakultas')->whereHas('programstudi.fakultas',function($q){
            $q->where('universitas_id',Auth::user()->universitas_id);
        })->with('programstudi')->where('bidang_studi_id',$id)->where('tipe',0);
        
        if($request->has('q')){
            $data->where('name','like',"%".$request->q."%");
        }
        $data = $data->get();
        return $data;
    }
    
    public function insert(){
        $matkul = new DosenMahasiswa();
        return $matkul;
    }
    
    
    public function show($id){
        $data = DosenMahasiswa::find($id);
        return $data;
    }


}