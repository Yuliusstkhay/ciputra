<?php
namespace App\Repository;

use App\Models\JadwalKuliah;
use Auth;
use Illuminate\Http\Request;

class JadwalKuliahRepository{
    
     public function getList($id){
        return JadwalKuliah::with('matakuliah.programstudi.fakultas')->whereHas('matakuliah.programstudi.fakultas',function($q){
            $q->where('universitas_id',Auth::user()->universitas_id);
        })->with('matakuliah.programstudi')->whereHas('matakuliah.programstudi',function($q) use ($id){
            $q->where('bidang_studi_id',$id);
        })->with(['matakuliah','dosenmahasiswa','semester'])->get();
    }
    
    public function insert(){
        $matkul = new JadwalKuliah();
        return $matkul;
    }
    
    
    public function show($id){
        $data = JadwalKuliah::find($id);
        return $data;
    }


}