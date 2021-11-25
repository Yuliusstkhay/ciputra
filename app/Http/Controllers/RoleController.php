<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\RoleService;

class RoleController extends Controller
{
    public function index(){
        $data = [
            'title'=>'Master Role'
        ];
        
        return view('role.index',$data);
    }
    
    public function create(){
        $data = [
            'title'=>'Master Hak Akses'
        ];
        
        return view('role.create',$data);
    }
    
    public function userMatrix($id){
        $data = [
            'title'=>'Master Role'
        ];
        
        return view('role.userMatrix',$data);
    }
    
    public function getModul(Request $request, RoleService $role){
        $data = $role->getModul();
        
        return response()->json([
            'result'=>true,
            'data'=>$data
        ]);
    }
    public function getModulUpdate($id,Request $request, RoleService $role){
        $data = $role->getModulUpdate($id,$request);
        
        return response()->json([
            'result'=>true,
            'data'=>$data
        ]);
    }
    
    public function datatable(RoleService $role) {
        return $role->getList();
    }
    
    public function store(Request $request, RoleService $roleservices) {
        try {
            $model = $roleservices->insert($request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Hak Akses berhasil ditambahkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Akses gagal ditambahkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada penyimpanan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        }
    }
    public function void($id,RoleService $roleservices){
       try {
            $model = $roleservices->updateStatus($id,"void");
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Hak Akses berhasil di nonaktifkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Hak Akses gagal dinonaktifkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        } 
    }
    
    public function unvoid($id,RoleService $roleservices){
       try {
            $model = $roleservices->updateStatus($id,"unvoid");
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Hak Akses berhasil di aktifkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Hak Akses gagal diaktifkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        } 
    }
    
     public function show($id, RoleService $roleservices) {
        $role = $roleservices->show($id);

        $data = [
            'title' => "Ubah Hak Akses",
            'data' => $role
        ];

        return view('role.update', $data);
    }
    
    public function update($id,Request $request,RoleService $roleservices){
        try {
            $model = $roleservices->update($id,$request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Hak Akses berhasil diperbarui'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Hak Akses gagal diperbarui'
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
