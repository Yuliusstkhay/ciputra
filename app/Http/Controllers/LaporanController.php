<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\LaporanService;
use App\Http\Resources\AssessmentResource;
use App\Http\Resources\ItemPenilaianResource;
use Excel;
use App\Exports\GlobalReportExport;

class LaporanController extends Controller
{
    public function indexGlobal(){
        $data = [
            'title' => "Laporan Global"
        ];


        return view('laporan.global.jadwal', $data);
    }
    
     public function getJadwal(LaporanService $laporan){
        return $laporan->getList();
    }
    
    public function getDetail($penilaian,LaporanService $laporan){
       $header = $laporan->getPenilaian($penilaian);
       $data = [
            'title' => "Laporan Global",
            'data'=>$header
        ];


        return view('laporan.global.laporan', $data); 
    }
    
    public function getNilaiGlobal($id, LaporanService $laporan){
        $data = $laporan->getNilaiGlobal($id);
        return $data;
    }
    
    public function excelLaporan($penilaian, LaporanService $laporan){
        $data = $laporan->exportExcel($penilaian);
        
        return Excel::download(new GlobalReportExport($data),'LaporanGlobal.xlsx');
    }
    
    public function assessmentReport($penilaian, LaporanService $laporan){
        $header = $laporan->getPenilaian($penilaian);
        $assessment = $laporan->assessmentList($penilaian);
        $mahasiswa = $laporan->listMahasiswa($penilaian);
        $data = [
            'title' => "Laporan Assessment",
            'data'=>$header,
            'assessment'=>$assessment,
            'mahasiswa'=>$mahasiswa
        ];


        return view('laporan.global.assessment', $data); 
    }
    
    public function detailReport($penilaian,$mahasiswa,LaporanService $laporan){
        $header = $laporan->getPenilaian($penilaian);
        $mahasiswa = $laporan->showMahasiswa($mahasiswa);
        $data = [
            'title' => "Laporan Detail",
            'data'=>$header,
            'mahasiswa'=>$mahasiswa
        ];


        return view('laporan.global.detail', $data); 
    }
    
    public function listAssessment($penilaian,Request $request,LaporanService $laporan){
        $data = $laporan->getAssessment($penilaian,$request);
        return response()->json(AssessmentResource::collection($data));
    }
    
    public function listItemPenilaian($penilaian,Request $request,LaporanService $laporan){
        $data = $laporan->getItemPenilaian($penilaian,$request);

        return response()->json(ItemPenilaianResource::collection($data));
    }
    
    public function dataDetailReport($penilaian,$mahasiswa,$assessment,$itempenilaian,LaporanService $laporan){
        $data = $laporan->getItemDetailPenilaian($penilaian,$mahasiswa,$assessment,$itempenilaian);
        return $data;
    }
    
    
//    public function indexAssessment(){
//        $data = [
//            'title' => "Laporan Assessment"
//        ];
//
//
//        return view('laporan.assessment.jadwal', $data);
//    }
//    
//    public function indexDetail(){
//        $data = [
//            'title' => "Laporan Detail"
//        ];
//
//
//        return view('laporan.detail.jadwal', $data);
//    }
    
   
    
//    public function getJadwalAssessment(LaporanService $laporan){
//        return $laporan->getListAssessment();
//    }
//    
//    public function getJadwalDetail(LaporanService $laporan){
//        return $laporan->getListDetail();
//    }
//    
//    
//    
    public function getAssessment($penilaian, LaporanService $laporan){
       $header = $laporan->getPenilaian($penilaian);
       $data = [
            'title' => "Laporan Assessment",
            'data'=>$header
        ];


        return view('laporan.assessment.laporan', $data);  
    }
    
    
    
    public function getLaporanDetail($penilaian,$assessment,$itempenilaian,LaporanService $laporan){
        $data = $laporan->getItemDetailPenilaian($penilaian,$assessment,$itempenilaian);
        return $data;
        
    }
}
