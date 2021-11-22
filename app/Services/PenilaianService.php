<?php

namespace App\Services;

use App\Repository\JadwalKuliahRepository;
use App\Repository\DosenRepository;
use App\Repository\PenilaianRepository;
use App\Repository\AssessmentRepository;
use DataTables;
use Illuminate\Http\Request;
use Auth;
use DB;
use Hash;

class PenilaianService {

    protected $jadwalkuliah, $dosen, $penilaian, $assessment;

    public function __construct(
    JadwalKuliahRepository $jadwalkuliah, DosenRepository $dosen, PenilaianRepository $penilaian, AssessmentRepository $assessment
    ) {
        $this->jadwalkuliah = $jadwalkuliah;
        $this->dosen = $dosen;
        $this->penilaian = $penilaian;
        $this->assessment = $assessment;
    }

    public function getMatkulList() {
        $data = $this->jadwalkuliah->getListPenilaian();
        return Datatables::of($data)
                        ->addColumn('action', function ($data) {
                            $action = $this->getAturPenilaian($data->jadwal_kuliah_id);
                            return $action;
                        })
                        ->rawColumns(['action'])
                        ->addIndexColumn()
                        ->make(true);
    }

    public function getAturPenilaian($id) {
        $action = '<a href="' . url('penilaian/tambahPenilaianJadwal/' . $id) . '" type="button" class="btn cur-p btn-success">
                 Atur Penilaian
            </a>';
        return $action;
    }

    public function getJadwalKuliah($id) {
        return $this->jadwalkuliah->show($id);
    }

    public function getDosenList($id, $penilaian) {
        $data = $this->dosen->getListPenilaianDosen($id);
        return Datatables::of($data)
                        ->addColumn('action', function ($data) use ($penilaian) {
                            $check = "";

                            if (is_null($penilaian)) {
                                $action = $this->getChecklistDosen($data->id, $check);
                            } else {

                                $hasil = $this->penilaian->checkPenilaianDosen($penilaian, $data->id);
                                if ($hasil > 0) {
                                    $check = "checked";
                                }

                                $action = $this->getChecklistDosen($data->id, $check);
                            }

                            return $action;
                        })
                        ->rawColumns(['action'])
                        ->addIndexColumn()
                        ->make(true);
    }

    public function getChecklistDosen($id, $check) {
        $action = '<div class="form-check" style="text-align: center;">
                    <input class="form-check-input checkDosen" type="checkbox" value="' . $id . '" id="flexCheckDefault" ' . $check . '>
                </div>';
        return $action;
    }

    public function getAssessmentList($penilaian) {
        $data = $this->assessment->getListData();
        return Datatables::of($data)
                        ->addColumn('action', function ($data) use ($penilaian) {
                            $check = "";

                            if (is_null($penilaian)) {
                                $action = $this->getChecklistAssessment($data->assessment_id, $check);
                            } else {
//
                                $hasil = $this->penilaian->checkPenilaianAssessment($penilaian, $data->assessment_id);
                                if ($hasil > 0) {
                                    $check = "checked";
                                }
//
                                $action = $this->getChecklistAssessment($data->assessment_id, $check);
                            }

                            return $action;
                        })
                        ->addColumn('kriteria_penilaian', function($data) use ($penilaian) {
                            $hasil = "";
                            if (is_null($penilaian)) {
                                $action = $this->getKriteriaPenilaian($data->assessment_id, $hasil);
                            } else {
                                $hasil = $this->penilaian->getKriteriaPenilaian($penilaian, $data->assessment_id);
                                $action = $this->getKriteriaPenilaian($data->assessment_id, $hasil);
                            }

                            return $action;
                        })
                        ->addColumn('persentase', function($data) use ($penilaian) {
                            $hasil = 0;
                            if (is_null($penilaian)) {
                                $action = $this->getPersentase($data->assessment_id, $hasil);
                            } else {
                                $hasil = $this->penilaian->getPersentase($penilaian, $data->assessment_id);
                                $action = $this->getPersentase($data->assessment_id, $hasil);
                            }

                            return $action;
                        })
                        ->addColumn('penilai', function($data) use ($penilaian) {
                            $check = "";
                            $checkedPengampu = "";
                            $checkedPenilai="";
                            $checkedMahasiswa="";
                            if (is_null($penilaian)) {
                                $action = $this->getPenilai($data->assessment_id, $check);
                            } else {
                                $hasil = $this->penilaian->getPenilaianDosen($penilaian)->count();
                                if ($hasil == 0) {
                                    $check = "disabled";
                                }

                                $checkPengampu = $this->penilaian->getPengampuPenilai($penilaian, $data->assessment_id);
                                if ($checkPengampu->count() > 0) {
                                    $checkPengampu = $checkPengampu->first();
                                    if ((int) $checkPengampu->value_persentase_pengampu > 0) {
                                        $checkedPengampu = "checked";
                                    }
                                    if ((int) $checkPengampu->value_persentasi_penilai > 0) {
                                        $checkedPenilai = "checked";
                                    }
                                    if ((int) $checkPengampu->value_persentase_mahasiswa > 0) {
                                        $checkedMahasiswa = "checked";
                                    }
                                    $dosenPenilai = $this->penilaian->getPenilaianDosenMahasiswa($penilaian)
                                            ->where('assessment_id',$data->assessment_id)
                                            ->where('status_jabatan',1);
                                    if($dosenPenilai->count() >  0){
                                        $dosenPenilai = $dosenPenilai->get();
                                    }else{
                                        $dosenPenilai = null;
                                    }
                                    
                                    
                                    
                                    
                                    $action = $this->checklistPengampu((int) $checkPengampu->value_persentase_pengampu, $checkedPengampu, $data->assessment_id);
                                    $action .= $this->checklistPenilai((int) $checkPengampu->value_persentasi_penilai, $checkedPenilai, $data->assessment_id,$dosenPenilai);
                                    $action .= $this->checklistMahasiswa((int) $checkPengampu->value_persentase_mahasiswa, $checkedMahasiswa, $data->assessment_id);
                                    
                                    
                                    
                                }else{
                                    $action = $this->checklistPengampu(0, $checkedPengampu, $data->assessment_id);
                                    $action .= $this->checklistPenilai(0, $checkedPenilai, $data->assessment_id,null);
                                    $action .= $this->checklistMahasiswa(0, $checkedMahasiswa, $data->assessment_id);
                                }

//                                $action = $this->getPenilai($data->assessment_id, $check);
                            }

                            return $action;
                        })
                        ->rawColumns(['action', 'kriteria_penilaian', 'persentase', 'penilai'])
                        ->addIndexColumn()
                        ->make(true);
    }

    public function getChecklistAssessment($id, $check) {
        $action = '<div class="form-check" style="text-align: center;">
                    <input class="form-check-input checkAssessment" type="checkbox" value="' . $id . '" id="flexCheckDefault" ' . $check . '>
                </div>';
        return $action;
    }

    public function getKriteriaPenilaian($id, $hasil) {
        $action = '<textarea class="form-control" rows="5" id="kriteria_penilaian-' . $id . '">' . $hasil . '</textarea>';
        return $action;
    }

    public function getPersentase($id, $hasil) {
        $action = '<div class="input-group input-group-flat">
                <input type="text" class="form-control text-end pe-1" max="100" id="persentase-' . $id . '" value="' . $hasil . '" autocomplete="off">
                <span class="input-group-text">
                  %
                </span>
            </div>';
        return $action;
    }

    public function checklistPengampu($persen, $check, $assessment) {

        if ($persen > 0) {
            $action = '<div class="form-check">
                        <label class="form-check-label">
                            <input class="form-check-input ckPengampu" data-id="' . $assessment . '" type="checkbox" id="ck-pengampu-' . $assessment . '" ' . $check . '>
                            Dosen Pengampu
                            <input type="text" class="form-control text-end pe-1"   value="'.$persen.'" autocomplete="off" id="persenPengampu-' . $assessment . '" style="width: 100%;" placeholder="%">
                        </label>
                   </div>';
        } else {
            $action = '<div class="form-check">
                        <label class="form-check-label">
                            <input class="form-check-input ckPengampu" data-id="' . $assessment . '" type="checkbox" id="ck-pengampu-' . $assessment . '" ' . $check . '>
                            Dosen Pengampu
                            <input type="text" class="form-control text-end pe-1"   value="" autocomplete="off" id="persenPengampu-' . $assessment . '" style="display: none; width: 100%;" placeholder="%">
                        </label>
                   </div>';
        }


        return $action;
    }
    
    public function checklistPenilai($persen,$check,$assessment,$dosenPenilai){
        if ($persen > 0) {
            $action='<div class="form-check">
                <label class="form-check-label">
                    <input class="form-check-input ckPenilai" type="checkbox" data-assessment="' . $assessment . '"  id="chk-penilai-' . $assessment . '"  ' . $check . '>
                    Dosen Penilai
                    <input type="text" class="form-control text-end pe-1 text-end" value="'.$persen.'" autocomplete="off" id="persenPenilai-' . $assessment . '" style="width: 100%;" placeholder="%">
                </label>
                <div id="lstDosenPenilai-' . $assessment . '">';
            if(!is_null($dosenPenilai)){
                foreach($dosenPenilai as $key => $row){
                    $action .='<div class="form-check">'.
                              '<label class="form-check-label">'.
                              '<input class="form-check-input ckPenilai-'.$assessment.'" value="'.$assessment."_".$row->dosen_mahasiswa_id.'" type="checkbox" checked="checked" disabled>'.
                              $row->mahasiswa->name.
                              '</label>'.
                              '</div>';
                }
            }        
            
            $action .='</div>
            </div>';
        }else{
            $action='<div class="form-check">
                <label class="form-check-label">
                    <input class="form-check-input ckPenilai" type="checkbox" data-assessment="' . $assessment . '"  id="chk-penilai-' . $assessment . '"  ' . $check . '>
                    Dosen Penilai
                    <input type="text" class="form-control text-end pe-1 text-end" value="" autocomplete="off" id="persenPenilai-' . $assessment . '" style="display: none; width: 100%;" placeholder="%">
                </label>
                <div id="lstDosenPenilai-' . $assessment . '">
                    
                </div>
            </div>';
        }
        
        return $action;
    }
    
    public function checklistMahasiswa($persen,$check,$assessment){
        if($persen > 0){
            $action = '<div class="form-check">
                <label class="form-check-label">
                    <input class="form-check-input ckMahasiswa" type="checkbox" data-assessment="' . $assessment . '" id="chk-mahasiswa-' . $assessment . '" '.$check.' >
                    Mahasiswa
                    <input type="text" class="form-control text-end pe-1 text-end" value="'.$persen.'" autocomplete="off" id="persenMahasiswa-' . $assessment . '" style="width: 100%;" placeholder="%">
                </label>
            </div>';
        }else{
           $action = '<div class="form-check">
                <label class="form-check-label">
                    <input class="form-check-input ckMahasiswa" type="checkbox" data-assessment="' . $assessment . '" id="chk-mahasiswa-' . $assessment . '" '.$check.' >
                    Mahasiswa
                    <input type="text" class="form-control text-end pe-1 text-end" value="" autocomplete="off" id="persenMahasiswa-' . $assessment . '" style="display: none; width: 100%;" placeholder="%">
                </label>
            </div>'; 
        }
        
        
        return $action;
    }


    public function insertTahap1($id, Request $request) {
        DB::beginTransaction();
        $model = $this->penilaian->insert();
        $model->jadwal_kuliah_id = $id;
        if (!$model->save()) {
            DB::rollback();
            return [
                'result' => false,
                'message' => "gagal menambahka penilaian header"
            ];
        }
        if ($request->has('dosen')) {
            foreach ($request->dosen as $key => $row) {
                $dosen = $this->penilaian->insertDosen();
                $dosen->penilaian_id = $model->penilaian_id;
                $dosen->dosen_mahasiswa_id = $row;
                if (!$dosen->save()) {
                    DB::rollback();
                    return [
                        'result' => false,
                        'message' => "gagal menambahka penilaian dosen"
                    ];
                }
            }
        }


        DB::commit();
        return [
            'result' => true,
            'message' => "sukses menambahkan penilaian",
            'id' => $model->penilaian_id
        ];
    }

    public function updateTahap1(Request $request) {
        DB::beginTransaction();
        $delete = $this->penilaian->getPenilaianDosen($request->penilaian_id);
        if ($delete->count() > 0) {
            if (!$delete->delete()) {
                return [
                    'result' => false,
                    'message' => "gagal menambahkan penilaian dosen"
                ];
            }
        }
        if ($request->has('dosen')) {
            foreach ($request->dosen as $key => $row) {
                $dosen = $this->penilaian->insertDosen();
                $dosen->penilaian_id = $request->penilaian_id;
                $dosen->dosen_mahasiswa_id = $row;
                if (!$dosen->save()) {
                    DB::rollback();
                    return [
                        'result' => false,
                        'message' => "gagal menambahkan penilaian dosen"
                    ];
                }
            }
        }


        DB::commit();
        return [
            'result' => true,
            'message' => "sukses menambahkan penilaian",
            'id' => $request->penilaian_id
        ];
    }

    public function getDosenPenilaianList($id) {
        $data = $this->penilaian->getPenilaianDosen($id)->get();
        return Datatables::of($data)
                        ->addColumn('action', function ($data) {

                            $action = $this->getChecklistPenilaianDosen($data->dosen->id, $data->dosen->name);

                            return $action;
                        })
                        ->rawColumns(['action'])
                        ->addIndexColumn()
                        ->make(true);
    }

    public function getChecklistPenilaianDosen($id, $name) {
        $action = '<div class="form-check" style="text-align: center;">
                    <input class="form-check-input checkDosenPenilai" type="checkbox" data-id="' . $id . '" data-name="' . $name . '" value="' . $id . '" id="ck-dosen-penilai-' . $id . '">
                </div>';
        return $action;
    }

    public function getKelompokList($penilaian, $assessment) {
        $data = $this->penilaian->getKelompok($penilaian, $assessment);
        $head = [];
        if ($data->count() > 0) {
            $data = $data->get();

            foreach ($data as $key => $row) {
                $head[$key]['head'] = $row->kelompok_mahasiswa;
                $detail = $this->penilaian->getKelompokList($penilaian, $assessment, $row->kelompok_mahasiswa);
                $html = "";
                foreach ($detail as $x => $y) {
                    $html .= '<span class="badge bgc-green-50 c-green-700 p-10 lh-0 tt-c badge-pill">';
                    $html .= $y->mahasiswa->name;
                    $html .= '</span>';
                }
                $head[$key]['detail'] = $html;
            }
        }
        $head = collect($head);
        return Datatables::of($head)->addColumn('detailList', function ($data) {
                            return $data["detail"];
                        })
                        ->addColumn('action', function($data) use ($penilaian, $assessment) {
//                            $action = $this->getEdit($penilaian, $assessment);
//                            $action .= $this->getDelete($penilaian, $assessment,$data["head"]);
                            $action = $this->getDelete($penilaian, $assessment, $data["head"]);

                            return $action;
                        })
                        ->rawColumns(['detailList', 'action'])
                        ->addIndexColumn()
                        ->make(true);
    }

    private function getEdit($id, $assessment) {
        $action = '<button type="button" data-id="' . $id . '" data-kelompok="' . $kelompok . '" data-assessment="' . $assessment . '"  class="btn cur-p btn-primary m-3 btnEditKelompok">
                                        <!-- Download SVG icon from http://tabler-icons.io/i/edit -->
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="15" height="15"
                                             viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                             stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <path d="M9 7h-3a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-3" />
                                            <path d="M9 15h3l8.5 -8.5a1.5 1.5 0 0 0 -3 -3l-8.5 8.5v3" />
                                            <line x1="16" y1="5" x2="19" y2="8" />
                                        </svg>
                                    </button>';
        return $action;
    }

    private function getDelete($id, $assessment, $kelompok) {
        $action = '<button type="button" class="btn cur-p btn-danger m-3 hapusKelompok" title="Nonaktifkan" data-id="' . $id . '" data-kelompok="' . $kelompok . '" data-assessment="' . $assessment . '">
                                        <!-- Download SVG icon from http://tabler-icons.io/i/x -->
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="15" height="15" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><line x1="18" y1="6" x2="6" y2="18" /><line x1="6" y1="6" x2="18" y2="18" /></svg>
                                    </button>';
        return $action;
    }

    public function getListMahasiswa($penilaian, $assessment) {
        $pnl = $penilaian;
        $data = $this->penilaian->getKelompok($penilaian, $assessment);
        if ($data->count() > 0) {
            $data = $data->get();
            $id = [];

            foreach ($data as $key => $row) {
                $detail = $this->penilaian->getKelompokList($penilaian, $assessment, $row->kelompok_mahasiswa);

                foreach ($detail as $x => $y) {
                    array_push($id, $y->dosen_mahasiswa_id);
                }
            }
            $penilaian = $this->penilaian->show($penilaian);
            $listMahasiswa = $this->jadwalkuliah->ListMahasiswaPenilaian($penilaian->jadwal_kuliah_id, $id);
            if (is_null($listMahasiswa)) {
                $listMahasiswa = [];
            }
        } else {

            $penilaian = $this->penilaian->show($penilaian);
            $listMahasiswa = $this->jadwalkuliah->getListPeserta($penilaian->jadwal_kuliah_id);
        }

        return Datatables::of($listMahasiswa)
                        ->addColumn('action', function ($listMahasiswa) use ($pnl, $assessment) {

                            $action = $this->getChecklistKelompokMahasiswa($listMahasiswa->mahasiswa->id, $pnl, $assessment);

                            return $action;
                        })
                        ->rawColumns(['action'])
                        ->addIndexColumn()
                        ->make(true);
    }

    public function getChecklistKelompokMahasiswa($id, $penilaian, $assessment) {
        $action = '<div class="form-check" style="text-align: center;">
                    <input class="form-check-input checkKelompok" type="checkbox" data-penilaian="' . $penilaian . '" data-assessment="' . $assessment . '" data-id="' . $id . '"  value="' . $id . '" id="ck-kelompok-mahasiswa-' . $id . '">
                </div>';
        return $action;
    }

    public function insertKelompok(Request $request) {
        DB::beginTransaction();

        foreach ($request->mahasiswa as $key => $row) {
            $model = $this->penilaian->insertMahasiswa();
            $model->penilaian_id = $request->penilaian_id;
            $model->assessment_id = $request->assessment_id;
            $model->kelompok_mahasiswa = $request->nama_kelompok;
            $model->dosen_mahasiswa_id = $row;
            if (!$model->save()) {
                DB::rollback();
                return [
                    'result' => false,
                    'message' => "gagal menambahkan kelompok"
                ];
            }
        }
        DB::commit();
        return [
            'result' => true,
            'message' => "sukses menambahkan kelompok",
        ];
    }

    public function deleteKelompok(Request $request) {
        DB::beginTransaction();
        $model = $this->penilaian->deleteKelompokList($request->penilaian, $request->assessment, $request->kelompok);
        if (!$model->delete()) {
            DB::rollback();
            return false;
        }
        DB::commit();
        return true;
    }

    public function insertPenilai(Request $request){
       DB::beginTransaction();
        
       $check = $this->penilaian->deletePenilaiList($request->penilaian_id,$request->assessment_id);
        if($check->count()> 0){
                if (!$check->delete()) {
                    DB::rollback();
                    return [
                        'result' => false,
                        'message' => "gagal menambahkan dosen Penilai"
                    ];
                }
            }
        foreach ($request->dosen as $key => $row) {
            
            
            $model = $this->penilaian->insertMahasiswa();
            $model->penilaian_id = $request->penilaian_id;
            $model->assessment_id = $request->assessment_id;
            $model->kelompok_mahasiswa = "";
            $model->dosen_mahasiswa_id = $row;
            $model->status_jabatan = 1;
            if (!$model->save()) {
                DB::rollback();
                return [
                    'result' => false,
                    'message' => "gagal menambahkan dosen Penilai"
                ];
            }
        }
        DB::commit();
        return [
            'result' => true,
            'message' => "sukses menambahkan dosen Penilai",
        ]; 
    }
    
    public function insertUpdateTahap2(Request $request){
//        dd($request->all());
        DB::beginTransaction();
        
        foreach($request->assessment as $key => $row){
           $checkPenilaian = $this->penilaian->checkPenilaianAssessment($request->penilaian_id, $row);
            
           if($checkPenilaian > 0){
               $model = $this->penilaian->showPenilaianAssessment($request->penilaian_id,$row);
           }else{              
               $model = $this->penilaian->insertAssessment();
               $model->penilaian_id = $request->penilaian_id;
               $model->assessment_id = $row;              
           }
           $model->kriteria_penilaian = $request->kriteriaPenilaian[$key];
           $model->value = $request->persenAssessment[$key];
           $model->value_persentase_pengampu = $request->persenPengampu[$key];
           $model->value_persentasi_penilai = $request->persenPenilai[$key];
           $model->value_persentase_mahasiswa = $request->persenMahasiswa[$key];
           if (!$model->save()) {
                DB::rollback();
                return [
                    'result' => false,
                    'message' => "gagal menambahkan assessment"
                ];
            }
        }       

        DB::commit();
        return [
            'result' => true,
            'message' => "sukses menambahkan assessment",
        ];
    }
    
    public function getKriteriaList($penilaian){
        $data = $this->penilaian->getPenilaianAssessment($penilaian);
        return Datatables::of($data)
                        ->addColumn('action', function ($data) {

                            $action = $this->addKriteria($data->id);
                            

                            return $action;
                        })
                        ->addColumn('itemPenilaian',function($data) use ($penilaian){
                            $checkItem = $this->penilaian->checkAssessmentDetail($data->id);
                            $action='<div id="item-'.$data->id.'">';
                            if($checkItem->count()> 0){
                               $checkItem = $checkItem->select('penilaian_assessment_id','item_penilaian','value_persentase')->distinct()->get();
                               foreach($checkItem as $key => $row){
                                   $action .= $this->getFieldItem($row->item_penilaian, $data->id, $key);
                               }
                                
                            }else{
                                $action .= $this->getFieldItem("", $data->id, 0);
                            }
                            $action .='</div>';
                            return $action;
                        })
                        ->addColumn('persentase',function($data) use ($penilaian){
                            $checkItem = $this->penilaian->checkAssessmentDetail($data->id);
                            $action='<div id="persentase-'.$data->id.'">';
                            if($checkItem->count()> 0){
                               $checkItem = $checkItem->select('item_penilaian','value_persentase')->distinct()->get();
                               foreach($checkItem as $key => $row){
                                   $action .= $this->getFieldPersentase($row->value_persentase, $data->id, $key);
                               }
                                
                            }else{
                                $action .= $this->getFieldPersentase("", $data->id, 0);
                            }
                            $action .='</div>';
                            return $action;
                        })
                        ->rawColumns(['action','itemPenilaian','persentase'])
                        ->addIndexColumn()
                        ->make(true);
    }
    
    public function getFieldItem($item,$penilaianAssessment,$key) {
        $action = '<input type="text" class="form-control itemPenilaian mb-3" value="'.$item.'" id="item_penilaian-'.$penilaianAssessment.'-'.$key.'" data-id="'.$key.'" data-penilaiAssessment="'.$penilaianAssessment.'" name="item_penilaian-'.$penilaianAssessment.'[]" placeholder="Item Penilaian">';
        return $action;
    }
    
    public function getFieldPersentase($item,$penilaianAssessment,$key){
        $action ='<div class="input-group input-group-flat">
                <input type="text" class="form-control text-end pe-1 persentaseItemPenilaian mb-3" value="'.$item.'" id="persentase_item_penilaian-'.$penilaianAssessment.'-'.$key.'" data-id="'.$key.'" data-penilaiAssessment="'.$penilaianAssessment.'" name="persentase_item_penilaian-'.$penilaianAssessment.'[]" autocomplete="off" placeholder="%">
            </div>';
        return $action;
    }
    
    public function addKriteria($penilaianAssessment){
        $action ='<button type="button" class="btn btn-info d-none d-sm-inline-block btnItem" data-value="'.$penilaianAssessment.'">
                    <!-- Download SVG icon from http://tabler-icons.io/i/plus -->
                    <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="18" height="18" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                    <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                    <line x1="12" y1="5" x2="12" y2="19" />
                    <line x1="5" y1="12" x2="19" y2="12" />
                    </svg> Tambah Item
                </button>';
        return $action;
    }
    
    public function insertUpdateTahap3(Request $request){
        DB::beginTransaction();
        foreach($request->penilaianAssessment as $key => $row){
            $getPenilaianAssessment = $this->penilaian->showPenilaianAssessmentFind($row);
            
            if($getPenilaianAssessment->value_persentase_pengampu > 0){
                $id = $getPenilaianAssessment->penilaian->jadwal->dosen_mahasiswa_id;
                
//                check insert/update
                $check = $this->penilaian->showAssessmentDetail($getPenilaianAssessment->id,$id)->where('item_penilaian',$request->itemPenilaian[$key])->count();
                if($check > 0){
                    $model = $this->penilaian->showAssessmentDetail($getPenilaianAssessment->id,$id)->where('item_penilaian',$request->itemPenilaian[$key])->first();
                }else{
                    $model = $this->penilaian->insertAssessmentDetail();
                    $model->penilaian_assessment_id = $getPenilaianAssessment->id;
                    $model->dosen_mahasiswa_id = $id;
                }
                $model->value_persentase = $request->persentasePenilaianAssessment[$key];
                $model->item_penilaian = $request->itemPenilaian[$key];
                if (!$model->save()) {
                    DB::rollback();
                    return [
                        'result' => false,
                        'message' => "gagal menambahkan Set Jadwal Kuliah"
                    ];
                }
            }
            
            if($getPenilaianAssessment->value_persentasi_penilai > 0){
                $dosenpenilai = $this->penilaian->getPenilaianDosenMahasiswa($getPenilaianAssessment->penilaian_id)
                                ->where('assessment_id',$getPenilaianAssessment->assessment_id)
                                ->where('status_jabatan',1)->get();
                foreach($dosenpenilai as $y => $x){
 //                check insert/update
                    $check = $this->penilaian->showAssessmentDetail($getPenilaianAssessment->id,$x->dosen_mahasiswa_id)->where('item_penilaian',$request->itemPenilaian[$key])->count();
                    if ($check > 0) {
                        $model = $this->penilaian->showAssessmentDetail($getPenilaianAssessment->id, $x->dosen_mahasiswa_id)->where('item_penilaian',$request->itemPenilaian[$key])->first();
                    } else {
                        $model = $this->penilaian->insertAssessmentDetail();
                        $model->penilaian_assessment_id = $getPenilaianAssessment->id;
                        $model->dosen_mahasiswa_id = $x->dosen_mahasiswa_id;
                    }
                    $model->value_persentase = $request->persentasePenilaianAssessment[$key];
                    $model->item_penilaian = $request->itemPenilaian[$key];
                    if (!$model->save()) {
                        DB::rollback();
                        return [
                            'result' => false,
                            'message' => "gagal menambahkan Set Jadwal Kuliah"
                        ];
                    }
                }
            }
          
            if($getPenilaianAssessment->value_persentase_mahasiswa > 0){
                $mahasiswapenilai = $this->penilaian->getPenilaianDosenMahasiswa($getPenilaianAssessment->penilaian_id)
                                ->where('assessment_id',$getPenilaianAssessment->assessment_id)
                                ->where('status_jabatan',0)->get();
                foreach($mahasiswapenilai as $y => $x){
 //                check insert/update
                    $check = $this->penilaian->showAssessmentDetail($getPenilaianAssessment->id,$x->dosen_mahasiswa_id)->where('item_penilaian',$request->itemPenilaian[$key])->count();
                    if ($check > 0) {
                        $model = $this->penilaian->showAssessmentDetail($getPenilaianAssessment->id, $x->dosen_mahasiswa_id)->where('item_penilaian',$request->itemPenilaian[$key])->first();
                    } else {
                        $model = $this->penilaian->insertAssessmentDetail();
                        $model->penilaian_assessment_id = $getPenilaianAssessment->id;
                        $model->dosen_mahasiswa_id = $x->dosen_mahasiswa_id;
                    }
                    $model->value_persentase = $request->persentasePenilaianAssessment[$key];
                    $model->item_penilaian = $request->itemPenilaian[$key];
                    $model->status = 1;
                    if (!$model->save()) {
                        DB::rollback();
                        return [
                            'result' => false,
                            'message' => "gagal menambahkan Set Jadwal Kuliah"
                        ];
                    }
                }
            }
            
        }
        
        $header = $this->penilaian->show($request->penilaian_id);
        $header->status = 1;
        if (!$header->save()) {
            DB::rollback();
            return [
                'result' => false,
                'message' => "gagal menambahkan Set Jadwal Kuliah"
            ];
        }

        DB::commit();
        return [
            'result' => true,
            'message' => "sukses menambahkan assessment",
            "url"=> url('penilaian')
        ];
    }
    
   
    public function getListPenilaian(){
        $data = $this->penilaian->listPenilaian();
        return Datatables::of($data)
                        ->addColumn('action', function ($data) {
                            
                            $action="";
                            if ($data->jadwal->dosen_mahasiswa_id == Auth::user()->dosen->id) {
//                                $action = $this->getShow($data->penilaian_id);
                                $action .= $this->getEditPenilaian($data->jadwal_kuliah_id);
                                if ($data->status_transaksi == 0) {
                                    $action .= $this->getVoid($data->penilaian_id);
                                } else {
                                    $action .= $this->getUnvoid($data->penilaian_id);
                                }
                            }

                            return $action;
                        })
                        ->addColumn('matkul', function ($data) {
                            if(Auth::user()->type ==2){
                                return $data->jadwal->matakuliah->mata_kuliah_name;
                            }else{
                                return $data->jadwal->matakuliah->mata_kuliah_name;
                            }
                        })
                        ->addColumn('matkul_id', function ($data) {
                            if(Auth::user()->type ==2){
                                return $data->jadwal->matakuliah->mata_kuliah_id;
                            }else{
                                return $data->jadwal->matakuliah->mata_kuliah_id;
                            }
                        })
                        ->addColumn('dosen_pengampu', function ($data) {
                            if(Auth::user()->type ==2){
                                return $data->jadwal->dosenmahasiswa->name;
                            }else{
                                return $data->jadwal->dosenmahasiswa->name;
                            }
                        })
                        ->addColumn('jadwal', function ($data) {
                            if(Auth::user()->type ==2){
                                return $data->jadwal->deskripsi;
                            }else{
                                return $data->jadwal->deskripsi;
                            }
                        })
                        ->addColumn('nilai', function ($data) {
                            if(Auth::user()->type ==2){
                                $id = $data->penilaian_id;
                                return "";
                            }else{
                                $id = $data->penilaian_id;
                                return $this->getNilai($id);
                            }
                            
                        })
                        
                        ->rawColumns(['action','matkul','matkul_id','dosen_pengampu','jadwal','nilai'])
                        ->addIndexColumn()
                        ->make(true);
    }
    
    public function getShowPenilaian($penilaian){
        return $this->penilaian->show($penilaian);
    }
    
    public function getNilai($id){
        $action = '<a href="'.url('penilaian/assessment/'.$id).'" class="btn cur-p btn-success">
                                        Nilai
                                    </a>';
        return $action;
    }
    
    private function getShow($id) {
        $action = '<a href="' . url('dosen/show/' . $id) . '" title="Detail" class="btn cur-p btn-secondary m-3">
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
    
    private function getEditPenilaian($id) {
        $action = '<a href="' . url('penilaian/tambahPenilaianJadwal/' . $id) . '"  class="btn cur-p btn-primary m-3">
                                        <!-- Download SVG icon from http://tabler-icons.io/i/edit -->
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="15" height="15"
                                             viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                             stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <path d="M9 7h-3a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-3" />
                                            <path d="M9 15h3l8.5 -8.5a1.5 1.5 0 0 0 -3 -3l-8.5 8.5v3" />
                                            <line x1="16" y1="5" x2="19" y2="8" />
                                        </svg>
                                    </a>';
        return $action;
    }
    
    private function getVoid($id) {
        $action = '<button type="button" class="btn cur-p btn-danger m-3 void" title="Nonaktifkan" data-id="'.$id.'">
                                        <!-- Download SVG icon from http://tabler-icons.io/i/x -->
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="15" height="15" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><line x1="18" y1="6" x2="6" y2="18" /><line x1="6" y1="6" x2="18" y2="18" /></svg>
                                    </button>';
        return $action;
    }
    
    private function getUnvoid($id) {
        $action = '<button type="button" class="btn cur-p btn-success m-3 unvoid" title="aktifkan" data-id="' . $id . '">
                                        <!-- Download SVG icon from http://tabler-icons.io/i/check -->
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="15" height="15"
                                             viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                             stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <path d="M5 12l5 5l10 -10" />
                                        </svg>
                                    </button>';
        return $action;
    }

    public function getListAssessmentPenilaian($penilaian){
        $data = $this->penilaian->listAssessmentPenilaian($penilaian);
        return Datatables::of($data)
                        ->addColumn('action', function ($data) {
                                $action = $this->nilaiAssessment($data->id);

                            return $action;
                        })
                        
                        ->rawColumns(['action'])
                        ->addIndexColumn()
                        ->make(true);
    }
    private function nilaiAssessment($id){
        $action ='<a href="'.url('penilaian/insertNilaiMahasiswa/'.$id).'" class="btn cur-p btn-success">   
                 Nilai
                </a>';
        return $action;
    }
    public function getShowPenilaianAssessment($penilaianAssessment){
        return $this->penilaian->showPenilaianAssessmentFind($penilaianAssessment);
    }
    
    public function getListItem($penilaianAssessment){
        return $this->penilaian->showListItem($penilaianAssessment);
    }
    
    public function getListNilaiMahasiswa($penilaianAssessment){
        $data = $this->penilaian->showPenilaianAssessmentFind($penilaianAssessment);
        if(Auth::user()->type== 1){
            $getKelompok = $this->penilaian->getMahasiswaKelompok($data->penilaian_id,$data->assessment_id)->kelompok_mahasiswa;
            $mahasiswa = $this->penilaian->getListMahasiswaKelompok($data->penilaian_id,$data->assessment_id,$getKelompok);
        }else{
            $getData = $this->penilaian->show($data->penilaian_id);
            $mahasiswa = $getData->jadwal->jadwalMahasiswa;

        }
        return $mahasiswa;
    }
    
    public function insertNilai(Request $request){
        DB::beginTransaction();
        $id=[];
        foreach($request->mahasiswa as $key => $row){
            $check = $this->penilaian->checkPenilai($row,$request->assessmentdetail[$key]);
            if($check->count()> 0){
               $model = $check->first(); 
            }else{
               $model = $this->penilaian->insertNilai();
               $model->penilaian_assessment_detail_id = $request->assessmentdetail[$key];
               $model->mahasiswa_dosen_id = $row;
            }
            $model->nilai = $request->nilai[$key];
            $model->catatan = $request->catatan[$key];
            if (!$model->save()) {
                DB::rollback();
                return [
                    'result' => false,
                    'message' => "gagal menambahkan assessment"
                ];
            }
            
            if(!in_array($request->assessmentdetail[$key], $id)){
                array_push($id,$request->assessmentdetail[$key]);
            }
            
        }
        
//        cari rata2 tiap item penilaian
        foreach($id as $key => $row){
            $getData = $this->penilaian->listNilai($row);
            $jumlah = $getData->count();
            $total = (float) $getData->sum('nilai');
            $nilairata = $total/$jumlah;
            $model = $this->penilaian->showPenilaianAssessmentDetail($row)->first();
            $model->nilai = $nilairata;
            if (!$model->save()) {
                DB::rollback();
                return [
                    'result' => false,
                    'message' => "gagal menambahkan nilai rata-rata assessment detail "
                ];
            }
           
        }   

        DB::commit();
        return [
            'result' => true,
            'message' => "sukses menambahkan Penilaian",
        ];
    }
    
    
    public function updateStatus($id, $status) {
        DB::beginTransaction();
        $model = $this->penilaian->show($id);
        $model->status_transaksi = ($status == "void") ? 1 : 0;
        if (!$model->save()) {
            DB::rollback();
            return false;
        }
        DB::commit();
        return true;
    }
    

}
