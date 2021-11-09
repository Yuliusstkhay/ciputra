<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ItemPenilaianController extends Controller
{
    public function index(){
        $data = [
            'title'=>"Master Item Penilaian"
        ];
        
        return view('master.itempenilaian.index',$data);
    }
}
