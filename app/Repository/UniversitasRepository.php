<?php
namespace App\Repository;

use App\Models\Universitas;
use Auth;
use Illuminate\Http\Request;

class UniversitasRepository{
    
    public function getList(){
        return Universitas::all();
    }
    
    public function getData(Request $request){
        $data = Universitas::where('status',0);
        if($request->has('q')){
            $data->where('universitas_name','like',"%".$request->q."%");
        }
        $data = $data->get();
        return $data;
    }
    
    public function getListData(){
        $data = Universitas::where('status',0)->get();
        return $data;
    }
    
    public function insert(){
        $data = new Universitas();
        return $data;
    }
    
    
    public function show($id){
        $data = Universitas::find($id);
        return $data;
    }


}