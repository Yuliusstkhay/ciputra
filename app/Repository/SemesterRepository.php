<?php
namespace App\Repository;

use App\Models\Semester;
use Auth;
use Illuminate\Http\Request;

class SemesterRepository{
    
    public function getList(){
        return Semester::where('universitas_id',Auth::user()->universitas_id)->get();
    }
    
    public function getData(Request $request){
        $data = Semester::where('universitas_id',Auth::user()->universitas_id)->where('status',0);
        if($request->has('q')){
            $data->where('semester_name','like',"%".$request->q."%");
        }
        $data = $data->get();
        return $data;
    }
    
    
    public function getListData(){
        $data = Semester::where('universitas_id',Auth::user()->universitas_id)->where('status',0)->get();
        return $data;
    }
    
    public function insert(){
        $fakultas = new Semester();
        return $fakultas;
    }
    
    
    public function show($id){
        $data = Semester::find($id);
        return $data;
    }


}