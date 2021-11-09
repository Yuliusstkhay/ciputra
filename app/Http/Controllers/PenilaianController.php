<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PenilaianController extends Controller
{
    public function index(){
        $data = [
            'title'=>"Penilaian"
        ];
        
        return view('penilaian.index',$data);
    }
    
    public function penilaian($id){
        $data = [
            'title'=>"Penilaian"
        ];
        
        return view('penilaian.penilaian',$data);
    }
    
    public function listPenilaian($id){
        $data = [
            'title'=>"Penilaian"
        ];
        
        return view('penilaian.listNilaiMahasiswa',$data);
    }
    
    public function create(){
       $data = [
            'title'=>"Tambah Penilaian"
        ];
        
        return view('penilaian.create',$data); 
    }
    
    public function aturPenilaian($id){
        $data = [
            'title'=>"Atur Penilaian"
        ];
        
        return view('penilaian.aturPenilaian',$data); 
    }
}
