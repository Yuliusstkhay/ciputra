<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\UserService;
use App\Http\Resources\RoleResource;

class UserController extends Controller
{
    public function index(){
        $data = [
            'title'=>"Pengguna"
        ];
        
        return view('user.index',$data);
    }
    
    public function datatable(UserService $user) {
        return $user->getList();
    }
    
    public function create(){
        $data = [
            'title'=>'Pengguna'
        ];
        
        return view('user.create',$data);
    }
    
    public function getRole(Request $request, UserService $userservice){
        $data = $userservice->getRole($request);
        
        return response()->json(RoleResource::collection($data));
        
    }
    
    public function getModul(Request $request, UserService $userservice){
        $data = $userservice->getModul($request);
        
        return response()->json([
            'result'=>true,
            'data'=>$data
        ]);
    }
    
    public function store(Request $request, UserService $userservice) {
        try {
            $model = $userservice->insert($request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Pengguna berhasil ditambahkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Pengguna gagal ditambahkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada penyimpanan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        }
    }
    
    public function show($id, UserService $userservice) {
        $user = $userservice->show($id);

        $data = [
            'title' => "Detail Pengguna",
            'data' => $user
        ];

        return view('user.show', $data);
    }
    
    public function showUpdate($id, UserService $userservice) {
        $user = $userservice->show($id);

        $data = [
            'title' => "Perbarui Pengguna",
            'data' => $user
        ];

        return view('user.update', $data);
    }
    
    public function getModulUpdate($id,Request $request, UserService $userservice){
        $data = $userservice->getModulUpdate($id,$request);
        
        return response()->json([
            'result'=>true,
            'data'=>$data
        ]);
    }
    
    public function update($id,Request $request,UserService $userservice){
        try {
            $model = $userservice->update($id,$request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Pengguna berhasil diperbarui'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Pengguna gagal diperbarui'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        }
    }
    
     public function void($id,UserService $userservice){
       try {
            $model = $userservice->updateStatus($id,"void");
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Pengguna berhasil di nonaktifkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Pengguna gagal dinonaktifkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        } 
    }
    
    public function unvoid($id,UserService $userservice){
       try {
            $model = $userservice->updateStatus($id,"unvoid");
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Data Pengguna berhasil di aktifkan'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Data Pengguna gagal diaktifkan'
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                        'result' => false,
                        'message' => 'Terjadi kesalahan pada perubahan data. Mohon Hubungi admin',
                        'error'=>$ex->getMessage()
            ]);
        } 
    }
    
    public function changePassword($id){
        $data = [
            'title' => "Perbarui Password",
            'id' => $id
        ];

        return view('user.updatePassword', $data);
    }
    
    public function updatePassword($id,Request $request,UserService $userservice){
        try {
            $model = $userservice->updatePassword($id,$request);
            if ($model) {
                return response()->json([
                            'result' => true,
                            'message' => 'Password berhasil diperbarui'
                ]);
            }
            return response()->json([
                        'result' => false,
                        'message' => 'Password gagal diperbarui'
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
