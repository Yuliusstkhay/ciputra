<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\MatkulService;

class MataKuliahController extends Controller
{
    public function index(){
        $data = [
            'title'=>"Master Mata Kuliah"
        ];
        
        return view('master.matakuliah.fakultas',$data);
    }
    
    public function getDataFakultas(MatkulService $matkulservice) {
        return $matkulservice->getDataFakultas();
    }
    
    public function programstudi($id){
       $data = [
            'title'=>"Master Mata Kuliah",
            'id'=>$id
        ];
        
        return view('master.matakuliah.programstudi',$data); 
    }
    
    public function getDataProgramStudi($id,MatkulService $matkulservice){
        return $matkulservice->getDataProgramStudi($id);
    }
    
    public function matakuliah($id){
        $idx = explode("_", $id);
       $data = [
            'title'=>"Master Mata Kuliah",
           'id'=>$idx[0],
           'fakultas'=>$idx[1]
        ];
        
        return view('master.matakuliah.index',$data); 
    }
    
    public function datatable($id,MatkulService $matkul) {
        return $matkul->getList($id);
    }
    
    public function create($id, MatkulService $matkul) {
        $data = [
            'title' => "Tambah Master Mata Kuliah",
            'programStudi'=>$matkul->getDataProgram($id),
        ];


        return view('master.matakuliah.create', $data);
    }
    
    public function store(Request $request, MatkulService $matkulservice) {
        try {
            $model = $matkulservice->insert($request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Mata Kuliah berhasil ditambahkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Mata Kuliah gagal ditambahkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada penyimpanan data. Mohon Hubungi admin'
            ]);
        }
    }
    
    public function show($id, MatkulService $matkulservice) {
        $matkul = $matkulservice->show($id);

        $data = [
            'title' => "Detail Master Mata Kuliah",
            'data' => $matkul
        ];

        return view('master.matakuliah.show', $data);
    }
    
    public function getData($id, MatkulService $matkulservice) {
        $matkul = $matkulservice->show($id);

        $data = [
            'title' => "Ubah Master Mata Kuliah",
            'data' => $matkul
        ];

        return view('master.matakuliah.update', $data);
    }
    
    public function update($id,Request $request, MatkulService $matkulservice){
        try {
            $model = $matkulservice->update($id,$request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Mata Kuliah berhasil diperbarui'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Mata Kuliah gagal diperbarui'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        }
    }
    
    public function void($id, MatkulService $matkulservice){
       try {
            $model = $matkulservice->updateStatus($id,"void");
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Mata Kuliah berhasil di nonaktifkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Mata Kuliah gagal dinonaktifkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        } 
    }
    
    public function unvoid($id, MatkulService $matkulservice){
       try {
            $model = $matkulservice->updateStatus($id,"unvoid");
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Mata Kuliah berhasil di aktifkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Mata Kuliah gagal diaktifkan'
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
