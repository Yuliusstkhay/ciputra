<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\DosenService;

class DosenController extends Controller
{
    public function index(){
        $data = [
            'title'=>"Master Dosen"
        ];
        
        return view('master.dosen.fakultas',$data);
        
    }
    
     public function getDataFakultas(DosenService $dosenservice) {
        return $dosenservice->getDataFakultas();
    }
    
    
    public function programstudi($id){
       $data = [
            'title'=>"Master Dosen",
            'id'=>$id
        ];
        
        return view('master.dosen.programstudi',$data); 
    }
    
    public function getDataProgramStudi($id,DosenService $dosenservice){
        return $dosenservice->getDataProgramStudi($id);
    }
    
    public function dosen($id){
       $data = [
            'title'=>"Master Dosen",
           'id'=>$id
        ];
        
        return view('master.dosen.index',$data); 
    }
    
    public function datatable($id,DosenService $dosenservice) {
        return $dosenservice->getList($id);
    }
    
    public function create($id, DosenService $dosenservice) {
        $data = [
            'title' => "Tambah Master Dosen",
            'programStudi'=>$dosenservice->getDataProgram($id)
        ];


        return view('master.dosen.create', $data);
    }
    
    public function store(Request $request, DosenService $dosenservice) {
        try {
            $model = $dosenservice->insert($request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Dosen berhasil ditambahkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Dosen gagal ditambahkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada penyimpanan data. Mohon Hubungi admin'
            ]);
        }
    }
    
    public function show($id, DosenService $dosenservice) {
        $dosen = $dosenservice->show($id);

        $data = [
            'title' => "Detail Master Dosen",
            'data' => $dosen
        ];

        return view('master.dosen.show', $data);
    }
    
    public function getData($id, DosenService $dosenservice) {
        $dosen = $dosenservice->show($id);

        $data = [
            'title' => "Ubah Master Dosen",
            'data' => $dosen
        ];

        return view('master.dosen.update', $data);
    }
    
    public function update($id,Request $request, DosenService $dosenservice){
        try {
            $model = $dosenservice->update($id,$request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Dosen berhasil diperbarui'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Dosen gagal diperbarui'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        }
    }
    
    public function void($id, DosenService $dosenservice){
       try {
            $model = $dosenservice->updateStatus($id,"void");
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Dosen berhasil di nonaktifkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Dosen gagal dinonaktifkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        } 
    }
    
    public function unvoid($id, DosenService $dosenservice){
       try {
            $model = $dosenservice->updateStatus($id,"unvoid");
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Dosen berhasil di aktifkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Dosen gagal diaktifkan'
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
