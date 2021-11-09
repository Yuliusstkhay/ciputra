<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\SemesterService;

class SemesterController extends Controller
{
    public function index() {
        $data = [
            'title' => "Master Semester"
        ];


        return view('master.semester.index', $data);
    }

    public function datatable(SemesterService $semesterservice) {
        return $semesterservice->getList();
    }

    public function create() {
        $data = [
            'title' => "Tambah Master Semester"
        ];


        return view('master.semester.create', $data);
    }

    public function store(Request $request, SemesterService $semesterservice) {
        try {
            $model = $semesterservice->insert($request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Semester berhasil ditambahkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Semester gagal ditambahkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada penyimpanan data. Mohon Hubungi admin'
            ]);
        }
    }

    public function show($id, SemesterService $semesterservice) {
        $fakultas = $semesterservice->show($id);

        $data = [
            'title' => "Detail Master Semester",
            'data' => $fakultas
        ];

        return view('master.semester.show', $data);
    }
    
    public function getData($id, SemesterService $semesterservice) {
        $semester = $semesterservice->show($id);

        $data = [
            'title' => "Ubah Master Semester",
            'data' => $semester
        ];

        return view('master.semester.update', $data);
    }
    
    public function update($id,Request $request, SemesterService $semesterservice){
        try {
            $model = $semesterservice->update($id,$request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Semester berhasil diperbarui'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Semester gagal diperbarui'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        }
    }
    
    public function void($id, SemesterService $semesterservice){
       try {
            $model = $semesterservice->updateStatus($id,"void");
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Semester berhasil di nonaktifkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Semester gagal dinonaktifkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        } 
    }
    
    public function unvoid($id, SemesterService $semesterservice){
       try {
            $model = $semesterservice->updateStatus($id,"unvoid");
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Semester berhasil di aktifkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Semester gagal diaktifkan'
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
