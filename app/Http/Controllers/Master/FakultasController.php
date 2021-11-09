<?php

namespace App\Http\Controllers\master;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\FakultasService;

class FakultasController extends Controller {

    public function index() {
        $data = [
            'title' => "Master Fakultas"
        ];


        return view('master.fakultas.index', $data);
    }

    public function datatable(FakultasService $fakultasservice) {
        return $fakultasservice->getList();
    }

    public function create() {
        $data = [
            'title' => "Tambah Master Fakultas"
        ];


        return view('master.fakultas.create', $data);
    }

    public function store(Request $request, FakultasService $fakultasservice) {
        try {
            $model = $fakultasservice->insert($request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Fakultas berhasil ditambahkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Fakultas gagal ditambahkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada penyimpanan data. Mohon Hubungi admin'
            ]);
        }
    }

    public function show($id, FakultasService $fakultasservice) {
        $fakultas = $fakultasservice->show($id);

        $data = [
            'title' => "Detail Master Fakultas",
            'data' => $fakultas
        ];

        return view('master.fakultas.show', $data);
    }
    
    public function getData($id, FakultasService $fakultasservice) {
        $fakultas = $fakultasservice->show($id);

        $data = [
            'title' => "Ubah Master Fakultas",
            'data' => $fakultas
        ];

        return view('master.fakultas.update', $data);
    }
    
    public function update($id,Request $request,FakultasService $fakultasservice){
        try {
            $model = $fakultasservice->update($id,$request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Fakultas berhasil diperbarui'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Fakultas gagal diperbarui'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        }
    }
    
    public function void($id,FakultasService $fakultasservice){
       try {
            $model = $fakultasservice->updateStatus($id,"void");
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Fakultas berhasil di nonaktifkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Fakultas gagal dinonaktifkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        } 
    }
    
    public function unvoid($id,FakultasService $fakultasservice){
       try {
            $model = $fakultasservice->updateStatus($id,"unvoid");
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Fakultas berhasil di aktifkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Fakultas gagal diaktifkan'
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
