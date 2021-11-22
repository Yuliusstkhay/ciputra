<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\PenilaianService;

class PenilaianController extends Controller
{
    public function index(){
        $data = [
            'title'=>"Penilaian"
        ];
        
        return view('penilaian.index',$data);
    }
    
    public function penilaian($id){
        $data = [
            'title'=>"Penilaian"
        ];
        
        return view('penilaian.penilaian',$data);
    }
    
    public function create(){
       $data = [
            'title'=>"Atur Penilaian"
        ];
        
        return view('penilaian.create',$data); 
    }
    
    public function datatable(PenilaianService $penilaianservice) {
        return $penilaianservice->getMatkulList();
    }
    
    public function createPenilaianJadwal($id, PenilaianService $penilaianservice){
        $jadwal = $penilaianservice->getJadwalKuliah($id);
        
        $data = [
            'title'=>"Atur Penilaian",
            'data'=>$jadwal
        ];
        
        return view('penilaian.setPenilaian',$data); 
    }
    
    public function getDosen($id,$penilaian=null,PenilaianService $penilaianservice){
        return $penilaianservice->getDosenList($id,$penilaian);
    }
    
    public function storeTahap1($id,Request $request, PenilaianService $penilaianservice){
        try {
            if(is_null($request->penilaian_id)){
               
                $model = $penilaianservice->insertTahap1($id,$request);
            }else{
                
                $model = $penilaianservice->updateTahap1($request);
            }
            if ($model['result']) {
                return response()->json([
                            'result' => true,
                            'message' => 'Pemilihan Dosen berhasil disimpan',
                            'id'=>$model['id']
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Pemilihan Dosen gagal disimpan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada penyimpanan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        }
    }
    public function getAssessment($penilaian=null,PenilaianService $penilaianservice){
        return $penilaianservice->getAssessmentList($penilaian);
    }
    
    public function getDosenPenilai($id,PenilaianService $penilaianservice){
        return $penilaianservice->getDosenPenilaianList($id);
    }
    
    public function getKelompok($penilaian,$assessment, PenilaianService $penilaianservice){
        return $penilaianservice->getKelompokList($penilaian,$assessment);
    }
    
    public function listMahasiswa($penilaian,$assessment, PenilaianService $penilaianservice){
        return $penilaianservice->getListMahasiswa($penilaian,$assessment);
    }
    
    public function storeKelompok(Request $request,PenilaianService $penilaianservice){
        try {             
                $model = $penilaianservice->insertKelompok($request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Penambahan Kelompok berhasil',
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Penambahan kelompok gagal'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada penyimpanan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()." ".$ex->getLine()
            ]);
        }
    }
    
    public function deleteKelompok(Request $request,PenilaianService $penilaianservice){
        try {
            $model = $penilaianservice->deleteKelompok($request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Kelompok berhasil di hapus'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Kelompok gagal dihapus'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        }
    }
    
    public function insertPenilai(Request $request,PenilaianService $penilaianservice){
       try {             
                $model = $penilaianservice->insertPenilai($request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Penambahan Dosen Penilai berhasil',
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Penambahan kelompok gagal'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada penyimpanan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()." ".$ex->getLine()
            ]);
        } 
    }
    
    public function storeTahap2(Request $request, PenilaianService $penilaianservice) {
        try {

            $model = $penilaianservice->insertUpdateTahap2($request);

            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Pemilihan Assessment berhasil disimpan',
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Pemilihan Assessment gagal disimpan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada penyimpanan data. Mohon Hubungi admin',
                        'error' => $ex->getMessage()
            ]);
        }
    }

    public function getKriteriaPenilaian($penilaian,PenilaianService $penilaianservice){
        return $penilaianservice->getKriteriaList($penilaian);
    }
    
    public function storeTahap3(Request $request,PenilaianService $penilaianservice){
       try {

            $model = $penilaianservice->insertUpdateTahap3($request);

            if ($model["result"]) {
                return response()->json([
                            'result' => true,
                            'message' => 'Atur Penilaian berhasil disimpan',
                            'url'=>$model["url"]
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Atur Penilaian gagal disimpan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada penyimpanan data. Mohon Hubungi admin',
                        'error' => $ex->getMessage()
            ]);
        } 
    }
    
    public function getList(PenilaianService $penilaianservice){
        return $penilaianservice->getListPenilaian();
    }
    
    public function assessment($penilaian, PenilaianService $penilaianservice){
        $header = $penilaianservice->getShowPenilaian($penilaian);
       $data = [
            'title'=>"Atur Penilaian",
            'data'=>$header
        ];
        
        return view('penilaian.setNilai',$data);  
    }
    
    public function listAssessment($penilaian, PenilaianService $penilaianservice){
        return $penilaianservice->getListAssessmentPenilaian($penilaian);
    }
    
    public function insertNilaiMahasiswa($penilaianAssessment,PenilaianService $penilaianservice){
        $header = $penilaianservice->getShowPenilaianAssessment($penilaianAssessment);
        $item = $penilaianservice->getListItem($penilaianAssessment);
        $mahasiswa= $penilaianservice->getListNilaiMahasiswa($penilaianAssessment);
        $data = [
            'title'=>"Masukkan nilai Mahasiswa",
            'data'=>$header,
            'item'=>$item,
            'mahasiswa'=>$mahasiswa

        ];
        
        return view('penilaian.nilaiMahasiswa',$data);  
    }
    
    public function storeNilai(Request $request,PenilaianService $penilaianservice){
      try {

            $model = $penilaianservice->insertNilai($request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Pemberian Nilai berhasil dilakukan',
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Pemberian Nilai gagal dilakukan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada penyimpanan data. Mohon Hubungi admin',
                        'error' => $ex->getMessage()
            ]);
        }   
    }
    
    public function void($id,PenilaianService $penilaianservice){
       try {
            $model = $penilaianservice->updateStatus($id,"void");
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Penilaian berhasil di nonaktifkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Penilaian gagal dinonaktifkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        } 
    }
    
    public function unvoid($id,PenilaianService $penilaianservice){
       try {
            $model = $penilaianservice->updateStatus($id,"unvoid");
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Penilaian berhasil di aktifkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Penilaian gagal diaktifkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        } 
    }
}
