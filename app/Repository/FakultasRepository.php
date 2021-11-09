<?php
namespace App\Repository;

use App\Models\Fakultas;
use Auth;
use Illuminate\Http\Request;

class FakultasRepository{
    
    public function getList(){
        return Fakultas::where('universitas_id',Auth::user()->universitas_id)->get();
    }
    
    public function getData(Request $request){
        $data = Fakultas::where('universitas_id',Auth::user()->universitas_id)->where('status',0);
        if($request->has('q')){
            $data->where('fakultas_name','like',"%".$request->q."%");
        }
        $data = $data->get();
        return $data;
    }
    
    public function getListData(){
        $data = Fakultas::where('universitas_id',Auth::user()->universitas_id)->where('status',0)->get();
        return $data;
    }
    
    public function insert(){
        $fakultas = new Fakultas();
        return $fakultas;
    }
    
    
    public function show($id){
        $data = Fakultas::find($id);
        return $data;
    }


}