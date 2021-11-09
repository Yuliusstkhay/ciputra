<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\ProgramStudiService;
use App\Http\Resources\FakultasResource;

class ProgramStudiController extends Controller {

    public function index() {
        $data = [
            'title' => "Master Program Studi"
        ];


        return view('master.bidangstudi.index', $data);
    }
    
    public function datatable(ProgramStudiService $programstudi) {
        return $programstudi->getList();
    }

    public function create() {
        $data = [
            'title' => "Tambah Master Program Studi"
        ];


        return view('master.bidangstudi.create', $data);
    }

    public function store(Request $request, ProgramStudiService $programstudiservice) {
        try {
            $model = $programstudiservice->insert($request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Program Studi berhasil ditambahkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Program Studi gagal ditambahkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada penyimpanan data. Mohon Hubungi admin'
            ]);
        }
    }

    public function show($id, ProgramStudiService $programstudiservice) {
        $programstudi = $programstudiservice->show($id);

        $data = [
            'title' => "Detail Master Program Studi",
            'data' => $programstudi
        ];

        return view('master.bidangstudi.show', $data);
    }
    
    public function getData($id, ProgramStudiService $programstudiservice) {
        $program = $programstudiservice->show($id);

        $data = [
            'title' => "Ubah Master Program Studi",
            'data' => $program
        ];

        return view('master.bidangstudi.update', $data);
    }
    
    public function update($id,Request $request, ProgramStudiService $programstudiservice){
        try {
            $model = $programstudiservice->update($id,$request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Program Studi berhasil diperbarui'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Program Studi gagal diperbarui'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        }
    }
    
    public function void($id, ProgramStudiService $programstudiservice){
       try {
            $model = $programstudiservice->updateStatus($id,"void");
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Program Studi berhasil di nonaktifkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Program Studi gagal dinonaktifkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        } 
    }
    
    public function unvoid($id, ProgramStudiService $programstudiservice){
       try {
            $model = $programstudiservice->updateStatus($id,"unvoid");
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Program Studi berhasil di aktifkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Program Studi gagal diaktifkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        } 
    }
    
    public function getFakultas(Request $request, ProgramStudiService $programstudi){
        
        $data = $programstudi->getFakultas($request);
        
        return response()->json(FakultasResource::collection($data));
    }

}
