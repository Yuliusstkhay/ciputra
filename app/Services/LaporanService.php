<?php

namespace App\Services;

use App\Repository\PenilaianRepository;
use App\Repository\JadwalKuliahRepository;
use App\Repository\MahasiswaRepository;
use DataTables;
use Illuminate\Http\Request;
use Auth;
use DB;

class LaporanService {

    public function __construct(PenilaianRepository $penilaian,JadwalKuliahRepository $jadwal, MahasiswaRepository $mahasiswa) {
        $this->penilaian = $penilaian;
        $this->jadwal = $jadwal;
        $this->mahasiswa = $mahasiswa;
        
    }

    public function getList() {
        $data = $this->penilaian->getListPenilaian();
        return Datatables::of($data)
                        ->addColumn('action', function ($data) {
                            $action = $this->getShow($data->penilaian_id);
   
                            return $action;
                        })
                        ->rawColumns(['action'])
                        ->addIndexColumn()
                        ->make(true);
    }

    private function getShow($id) {
        $action = '<a href="' . url('LaporanGlobal/show/' . $id) . '" title="Detail" class="btn cur-p btn-secondary m-3">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="15" height="15"
                                             viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                             stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <circle cx="10" cy="10" r="7" />
                                            <line x1="21" y1="21" x2="15" y2="15" />
                                        </svg>
                                    </a>';
        return $action;
    }
    
    public function getNilaiGlobal($id){
        $data = $this->penilaian->listReportGlobal($id);
        return Datatables::of($data)
                        ->addColumn('action', function ($data) {
                            $action = $this->getShow($data->penilaian_id);
   
                            return $action;
                        })
                        ->rawColumns(['action'])
                        ->addIndexColumn()
                        ->make(true);
    }
    
    public function assessmentList($penilaian){
        $data = $this->penilaian->listAssessment($penilaian);
        return $data;
    }
    
    public function listMahasiswa($penilaian){
       $jadwal= $this->penilaian->show($penilaian);
       $mahasiswa = $this->jadwal->getListPeserta($jadwal->jadwal_kuliah_id);
       return $mahasiswa;
    }
    
    public function showMahasiswa($id){
        return $this->mahasiswa->show($id);
    }
    
    public function getItemDetailPenilaian($penilaian,$mahasiswa,$assessment,$itempenilaian){
        $data = $this->penilaian->nilaiMahasiswa($mahasiswa);
        $itempenilaian = base64_decode($itempenilaian);
        if($itempenilaian != "all"){
            $item = explode("_",$itempenilaian);
            $data->whereHas('assessmentDetail',function($q) use ($item){
                $q->where('penilaian_assessment_id',$item[0])->where('item_penilaian',$item[1]);
            });
                       
        }
        if($assessment != "all"){
            $data->whereHas('assessmentDetail.penilaianAssessment',function ($q) use ($penilaian,$assessment){
                $q->where('assessment_id',$assessment)->where('penilaian_id',$penilaian);
            });
        }
        
        $data = $data->with(['assessmentDetail','assessmentDetail.dosenMahasiswa','assessmentDetail.penilaianAssessment','assessmentDetail.penilaianAssessment.assessment'])->get();
        return Datatables::of($data)
            ->addColumn('action', function ($data) {
                $action = $this->getCatatan($data->catatan);

                return $action;
            })
            ->rawColumns(['action'])
            ->addIndexColumn()
            ->make(true);
        
    }
    
    
    
    
    
    
    
    
    public function getItemDetailPenilaianOld($penilaian,$mahasiswa,$assessment,$itempenilaian){
        $data = $this->penilaian->getNilaiDetail($penilaian);
        if($assessment != "all"){
            $data->whereHas('penilaianAssessment',function ($q) use ($assessment){
            $q->where('assessment_id',$assessment);
            });
        }
        $itempenilaian = base64_decode($itempenilaian);
        
        if($itempenilaian != "all"){
            $item = explode("_",$itempenilaian);
            
            $data->where('penilaian_assessment_id',$item[0])->where('item_penilaian',$item[1]);
        }
        $data = $data->with(['penilaianAssessment.assessment','dosenMahasiswa'])->get();
        return Datatables::of($data)
            ->addColumn('action', function ($data) {
                $action = $this->getCatatan($data->catatan_nilai);

                return $action;
            })
            ->rawColumns(['action'])
            ->addIndexColumn()
            ->make(true);
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    public function getListAssessment() {
        $data = $this->penilaian->getListPenilaian();
        return Datatables::of($data)
                        ->addColumn('action', function ($data) {
                            $action = $this->getShowAssessment($data->penilaian_id);
   
                            return $action;
                        })
                        ->rawColumns(['action'])
                        ->addIndexColumn()
                        ->make(true);
    }
    
    private function getShowAssessment($id) {
        $action = '<a href="' . url('LaporanAssessment/show/' . $id) . '" title="Detail" class="btn cur-p btn-secondary m-3">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="15" height="15"
                                             viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                             stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <circle cx="10" cy="10" r="7" />
                                            <line x1="21" y1="21" x2="15" y2="15" />
                                        </svg>
                                    </a>';
        return $action;
    }
    
    public function getListDetail() {
        $data = $this->penilaian->getListPenilaian();
        return Datatables::of($data)
                        ->addColumn('action', function ($data) {
                            $action = $this->getDetail($data->penilaian_id);
   
                            return $action;
                        })
                        ->rawColumns(['action'])
                        ->addIndexColumn()
                        ->make(true);
    }
    
    private function getDetail($id) {
        $action = '<a href="' . url('LaporanDetail/show/' . $id) . '" title="Detail" class="btn cur-p btn-success m-3">
                                     Lihat Nilai   
                                    </a>';
        return $action;
    }
    
    public function getPenilaian($id){
        $data = $this->penilaian->show($id);
        return $data;
    }
    
    public function getAssessment($id,Request $request){
        $data = $this->penilaian->penilaianAssessmentReport($id,$request);
        return $data;
    }
    
    public function getItemPenilaian($id,Request $request){
        $getId = $this->penilaian->showPenilaianAssessment($id,$request->assessment)->id;
        $data = $this->penilaian->checkAssessmentDetail($getId)->select('penilaian_assessment_id','item_penilaian')->distinct()->get();
        return $data;
    }
    
    
    
    public function getCatatan($catatan){
        $action='<button class="btn cur-p btn-success btnCatatan" data-catatan="'.$catatan.'">   
                                    Lihat Catatan
                                </button>';
        return $action;
    }
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    public function insert(Request $request) {
        DB::beginTransaction();
        $model = $this->fakultas->insert();
        $model->fakultas_name = $request->fakultas_name;
        $model->universitas_id = Auth::user()->universitas_id;
        if (!$model->save()) {
            DB::rollback();
            return false;
        }
        DB::commit();
        return true;
    }

    public function show($id) {
        return $this->fakultas->show($id);
    }

    public function update($id,Request $request) {
        DB::beginTransaction();
        $model = $this->fakultas->show($id);
        $model->fakultas_name = $request->fakultas_name;
        if (!$model->save()) {
            DB::rollback();
            return false;
        }
        DB::commit();
        return true;
    }
    
    public function updateStatus($id,$status){
        DB::beginTransaction();
        $model = $this->fakultas->show($id);
        $model->status = ($status == "void")?1:0;
        if (!$model->save()) {
            DB::rollback();
            return false;
        }
        DB::commit();
        return true;
    }

}
