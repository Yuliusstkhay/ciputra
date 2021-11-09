<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\AssessmentService;

class AssessmentController extends Controller
{
    public function index() {
        $data = [
            'title' => "Master Assessment"
        ];


        return view('master.assessment.index', $data);
    }

    public function datatable(AssessmentService $assessmentservice) {
        return $assessmentservice->getList();
    }

    public function create() {
        $data = [
            'title' => "Tambah Master Assessment"
        ];


        return view('master.assessment.create', $data);
    }

    public function store(Request $request, AssessmentService $assessmentservice) {
        try {
            $model = $assessmentservice->insert($request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Assessment berhasil ditambahkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Assessment gagal ditambahkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada penyimpanan data. Mohon Hubungi admin'
            ]);
        }
    }

    public function show($id, AssessmentService $assessmentservice) {
        $assessment = $assessmentservice->show($id);

        $data = [
            'title' => "Detail Master Assessment",
            'data' => $assessment
        ];

        return view('master.assessment.show', $data);
    }
    
    public function getData($id, AssessmentService $assessmentservice) {
        $assessment = $assessmentservice->show($id);

        $data = [
            'title' => "Ubah Master Assessment",
            'data' => $assessment
        ];

        return view('master.assessment.update', $data);
    }
    
    public function update($id,Request $request, AssessmentService $assessmentservice){
        try {
            $model = $assessmentservice->update($id,$request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Assessment berhasil diperbarui'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Assessment gagal diperbarui'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        }
    }
    
    public function void($id, AssessmentService $assessmentservice){
       try {
            $model = $assessmentservice->updateStatus($id,"void");
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Assessment berhasil di nonaktifkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Assessment gagal dinonaktifkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        } 
    }
    
    public function unvoid($id, AssessmentService $assessmentservice){
       try {
            $model = $assessmentservice->updateStatus($id,"unvoid");
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Assessment berhasil di aktifkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Assessment gagal diaktifkan'
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
