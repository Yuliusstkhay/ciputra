<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\UniversitasService;

class UniversitasController extends Controller
{
    public function index() {
        $data = [
            'title' => "Master Universitas"
        ];


        return view('master.universitas.index', $data);
    }

    public function datatable(UniversitasService $universitas) {
        return $universitas->getList();
    }

    public function create() {
        $data = [
            'title' => "Tambah Master Universitas"
        ];


        return view('master.universitas.create', $data);
    }

    public function store(Request $request, UniversitasService $universitas) {
        try {
            $model = $universitas->insert($request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Universitas berhasil ditambahkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Universitas gagal ditambahkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada penyimpanan data. Mohon Hubungi admin'
            ]);
        }
    }

    public function show($id, UniversitasService $universitasservice) {
        $universitas = $universitasservice->show($id);

        $data = [
            'title' => "Detail Master Universitas",
            'data' => $universitas
        ];

        return view('master.universitas.show', $data);
    }
    
    public function getData($id, UniversitasService $universitasservice) {
        $universitas = $universitasservice->show($id);

        $data = [
            'title' => "Ubah Master Universitas",
            'data' => $universitas
        ];

        return view('master.universitas.update', $data);
    }
    
    public function update($id,Request $request, UniversitasService $universitasservice){
        try {
            $model = $universitasservice->update($id,$request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Universitas berhasil diperbarui'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Universitas gagal diperbarui'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        }
    }
    
    public function void($id, UniversitasService $universitasservice){
       try {
            $model = $universitasservice->updateStatus($id,"void");
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Universitas berhasil di nonaktifkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Universitas gagal dinonaktifkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        } 
    }
    
    public function unvoid($id, UniversitasService $universitasservice){
       try {
            $model = $universitasservice->updateStatus($id,"unvoid");
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Universitas berhasil di aktifkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Universitas gagal diaktifkan'
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
