<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\LaporanService;
use App\Http\Resources\AssessmentResource;
use App\Http\Resources\ItemPenilaianResource;

class LaporanController extends Controller
{
    public function indexGlobal(){
        $data = [
            'title' => "Laporan Global"
        ];


        return view('laporan.global.jadwal', $data);
    }
    
    
    public function indexAssessment(){
        $data = [
            'title' => "Laporan Assessment"
        ];


        return view('laporan.assessment.jadwal', $data);
    }
    
    public function indexDetail(){
        $data = [
            'title' => "Laporan Detail"
        ];


        return view('laporan.detail.jadwal', $data);
    }
    
    public function getJadwal(LaporanService $laporan){
        return $laporan->getList();
    }
    
    public function getJadwalAssessment(LaporanService $laporan){
        return $laporan->getListAssessment();
    }
    
    public function getJadwalDetail(LaporanService $laporan){
        return $laporan->getListDetail();
    }
    
    public function getDetail($penilaian,LaporanService $laporan){
        $header = $laporan->getPenilaian($penilaian);
       $data = [
            'title' => "Laporan Detail",
            'data'=>$header
        ];


        return view('laporan.detail.laporan', $data); 
    }
    
    public function getAssessment($penilaian, LaporanService $laporan){
       $header = $laporan->getPenilaian($penilaian);
       $data = [
            'title' => "Laporan Assessment",
            'data'=>$header
        ];


        return view('laporan.assessment.laporan', $data);  
    }
    
    public function listAssessment($penilaian,Request $request,LaporanService $laporan){
        $data = $laporan->getAssessment($penilaian,$request);
        return response()->json(AssessmentResource::collection($data));
    }
    
    public function listItemPenilaian($penilaian,Request $request,LaporanService $laporan){
        $data = $laporan->getItemPenilaian($penilaian,$request);

        return response()->json(ItemPenilaianResource::collection($data));
    }
    
    public function getLaporanDetail($penilaian,$assessment,$itempenilaian,LaporanService $laporan){
        $data = $laporan->getItemDetailPenilaian($penilaian,$assessment,$itempenilaian);
        return $data;
        
    }
}
