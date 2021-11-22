<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\PenilaianService;

class DashboardController extends Controller
{
    public function index(){
        $data = [
          'title'=>"Halaman Utama"  
        ];
        
        
        return view('dashboard.index',$data);
    }
    
    public function getList(PenilaianService $penilaianservice){
        return $penilaianservice->getListPenilaian();
    }
}
