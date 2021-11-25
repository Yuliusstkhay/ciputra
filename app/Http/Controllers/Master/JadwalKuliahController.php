<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\JadwalKuliahService;
use App\Http\Resources\MatkulResource;
use App\Http\Resources\DosenMahasiswaResource;
use App\Http\Resources\SemesterResource;

class JadwalKuliahController extends Controller
{
    public function index(){
        $data = [
            'title'=>"Master Jadwal Kuliah"
        ];
        
        return view('master.jadwalkuliah.fakultas',$data);
        
    }
    
     public function getDataFakultas(JadwalKuliahService $jadwalkuliahservice) {
        return $jadwalkuliahservice->getDataFakultas();
    }
    
    
    public function programstudi($id){
       $data = [
            'title'=>"Master Jadwal Kuliah",
            'id'=>$id
        ];
        
        return view('master.jadwalkuliah.programstudi',$data); 
    }
    
    public function getDataProgramStudi($id,JadwalKuliahService $jadwalkuliahservice){
        return $jadwalkuliahservice->getDataProgramStudi($id);
    }
    
    public function jadwalkuliah($id){
        $idx = explode("_", $id);
       $data = [
            'title'=>"Master Jadwal Kuliah",
           'id'=>$idx[0],
           'fakultas'=>$idx[1]
        ];
        
        return view('master.jadwalkuliah.index',$data); 
    }
    
    public function datatable($id,JadwalKuliahService $jadwalkuliahservice) {
        return $jadwalkuliahservice->getList($id);
    }
    
    public function create($id, JadwalKuliahService $jadwalkuliahservice) {
        $data = [
            'title' => "Tambah Master Jadwal Kuliah",
            'programStudi'=>$jadwalkuliahservice->getDataProgram($id)
        ];


        return view('master.jadwalkuliah.create', $data);
    }
    
    public function store(Request $request, JadwalKuliahService $jadwalkuliahservice) {
        try {
            $model = $jadwalkuliahservice->insert($request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Jadwal Kuliah berhasil ditambahkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Jadwal Kuliah gagal ditambahkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada penyimpanan data. Mohon Hubungi admin'
            ]);
        }
    }
    
    public function storePeserta($id,Request $request, JadwalKuliahService $jadwalkuliahservice){
       try {
            $model = $jadwalkuliahservice->insertPeserta($id,$request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Peserta Jadwal Kuliah berhasil ditambahkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Peserta Jadwal Kuliah gagal ditambahkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada penyimpanan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        } 
    }
    
    public function show($id, JadwalKuliahService $jadwalkuliahservice) {
        $jadwal = $jadwalkuliahservice->show($id);

        $data = [
            'title' => "Detail Master Jadwal Kuliah",
            'data' => $jadwal
        ];

        return view('master.jadwalkuliah.show', $data);
    }
    
    public function getData($id, JadwalKuliahService $jadwalkuliahservice) {
        $jadwal = $jadwalkuliahservice->show($id);

        $data = [
            'title' => "Ubah Master Jadwal Kuliah",
            'data' => $jadwal
        ];

        return view('master.jadwalkuliah.update', $data);
    }
    
    public function update($id,Request $request, JadwalKuliahService $jadwalkuliahservice){
        try {
            $model = $jadwalkuliahservice->update($id,$request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Jadwal Kuliah berhasil diperbarui'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Jadwal Kuliah gagal diperbarui'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        }
    }
    
    public function void($id, JadwalKuliahService $jadwalkuliahservice){
       try {
            $model = $jadwalkuliahservice->updateStatus($id,"void");
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Jadwal Kuliah berhasil di nonaktifkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Jadwal Kuliah gagal dinonaktifkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        } 
    }
    
    public function unvoid($id, JadwalKuliahService $jadwalkuliahservice){
       try {
            $model = $jadwalkuliahservice->updateStatus($id,"unvoid");
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Jadwal Kuliah berhasil di aktifkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Jadwal Kuliah gagal diaktifkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        } 
    }
    
    public function getMatkul($id,Request $request,JadwalKuliahService $jadwalkuliahservice){
        $data = $jadwalkuliahservice->getListMatkul($id,$request);
        
        return response()->json(MatkulResource::collection($data));
    }
    
    public function getDosen($id,Request $request, JadwalKuliahService $jadwalkuliahservice){
        $data = $jadwalkuliahservice->getListDosen($id,$request);
        
        return response()->json(DosenMahasiswaResource::collection($data));
    }
    
    public function getSemester(Request $request,JadwalKuliahService $jadwalkuliahservice){
       $data = $jadwalkuliahservice->getListSemester($request);
        
        return response()->json(SemesterResource::collection($data)); 
    }
    
    public function listPeserta($id, JadwalKuliahService $jadwalkuliahservice){
        $jadwal = $jadwalkuliahservice->show($id);
        
        $data = [
            'title' => "Tambah Peserta",
            'data' => $jadwal
        ];

        return view('master.jadwalkuliah.peserta', $data);
    }
    
    public function listDataPeserta($id, JadwalKuliahService $jadwalkuliahservice){
        return $jadwalkuliahservice->getListPeserta($id);
    }
    
    public function mahasiswaAll($id,JadwalKuliahService $jadwalkuliahservice){
        return $jadwalkuliahservice->getListMahasiswa($id);
    }
    
    public function removePeserta($id,$idmhs,JadwalKuliahService $jadwalkuliahservice){
      try {
            $model = $jadwalkuliahservice->deletePeserta($id,$idmhs);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Peserta Kuliah berhasil di hapus'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Peserta Kuliah gagal di hapus'
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
