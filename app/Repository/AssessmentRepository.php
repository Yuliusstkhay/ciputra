<?php
namespace App\Repository;

use App\Models\Assessment;
use Auth;
use Illuminate\Http\Request;

class AssessmentRepository{
    
    public function getList(){
        return Assessment::where('universitas_id',Auth::user()->universitas_id)->get();
    }
    
    public function getData(Request $request){
        $data = Assessment::where('universitas_id',Auth::user()->universitas_id)->where('status',0);
        if($request->has('q')){
            $data->where('assessment_name','like',"%".$request->q."%");
        }
        $data = $data->get();
        return $data;
    }
    
    public function getListData(){
        $data = Assessment::where('universitas_id',Auth::user()->universitas_id)->where('status',0)->get();
        return $data;
    }
    
    public function insert(){
        $data = new Assessment();
        return $data;
    }
    
    
    public function show($id){
        $data = Assessment::find($id);
        return $data;
    }


}