<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\MahasiswaService;

class MahasiswaController extends Controller
{
    public function index(){
        $data = [
            'title'=>"Master Mahasiswa"
        ];
        
        return view('master.mahasiswa.fakultas',$data);
    }
    
    public function getDataFakultas(MahasiswaService $mahasiswaservice) {
        return $mahasiswaservice->getDataFakultas();
    }
    
    
    public function programstudi($id){
       $data = [
            'title'=>"Master Mahasiswa",
            'id'=>$id
        ];
        
        return view('master.mahasiswa.programstudi',$data); 
    }
    
    public function getDataProgramStudi($id,MahasiswaService $mahasiswaservice){
        return $mahasiswaservice->getDataProgramStudi($id);
    }
    
    public function mahasiswa($id){
       $data = [
            'title'=>"Master Mahasiswa",
           'id'=>$id
        ];
        
        return view('master.mahasiswa.index',$data); 
    }
    
    public function datatable($id,MahasiswaService $mahasiswaservice) {
        return $mahasiswaservice->getList($id);
    }
    
    public function create($id, MahasiswaService $mahasiswaservice) {
        $data = [
            'title' => "Tambah Master Mahasiswa",
            'programStudi'=>$mahasiswaservice->getDataProgram($id)
        ];


        return view('master.mahasiswa.create', $data);
    }
    
    public function store(Request $request, MahasiswaService $mahasiswaservice) {
        try {
            $model = $mahasiswaservice->insert($request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Mahasiswa berhasil ditambahkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Mahasiswa gagal ditambahkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada penyimpanan data. Mohon Hubungi admin'
            ]);
        }
    }
    
    public function show($id, MahasiswaService $mahasiswaservice) {
        $mahasiswa = $mahasiswaservice->show($id);

        $data = [
            'title' => "Detail Master Mahasiswa",
            'data' => $mahasiswa
        ];

        return view('master.mahasiswa.show', $data);
    }
    
    public function getData($id, MahasiswaService $mahasiswaservice) {
        $mahasiswa = $mahasiswaservice->show($id);

        $data = [
            'title' => "Ubah Master Mahasiswa",
            'data' => $mahasiswa
        ];

        return view('master.mahasiswa.update', $data);
    }
    
    public function update($id,Request $request, MahasiswaService $mahasiswaservice){
        try {
            $model = $mahasiswaservice->update($id,$request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Mahasiswa berhasil diperbarui'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Mahasiswa gagal diperbarui'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        }
    }
    
    public function void($id, MahasiswaService $mahasiswaservice){
       try {
            $model = $mahasiswaservice->updateStatus($id,"void");
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Mahasiswa berhasil di nonaktifkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Mahasiswa gagal dinonaktifkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        } 
    }
    
    public function unvoid($id, MahasiswaService $mahasiswaservice){
       try {
            $model = $mahasiswaservice->updateStatus($id,"unvoid");
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Mahasiswa berhasil di aktifkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Mahasiswa gagal diaktifkan'
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
