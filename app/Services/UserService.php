<?php

namespace App\Services;

use App\Repository\UserRepository;
use App\Repository\RoleRepository;
use DataTables;
use Illuminate\Http\Request;
use Auth;
use DB;
use App\Http\Resources\ModuleFunctionResource;
use App\Http\Resources\ModuleFunctionUpdateResource;
use Hash;

class UserService {

    public function __construct(
    UserRepository $user, RoleRepository $role
    ) {
        $this->user = $user;
        $this->role = $role;
    }

    public function getList() {
        $data = $this->user->getList();
        return Datatables::of($data)
                        ->addColumn('action', function ($data) {
                            $action = "";
//                            $action = $this->getShow($data->user_id);
                            if (checkHakAkses(["U02.03"])) {
                                $action = $this->getEdit($data->user_id);
                            }
                            if (checkHakAkses(["U02.04"])) {
                                if ($data->is_locked == 0) {
                                    $action .= $this->getVoid($data->user_id);
                                } else {
                                    $action .= $this->getUnvoid($data->user_id);
                                }
                            }
                            if (checkHakAkses(["U02.03"])) {
                                $action .= $this->ubahPassword($data->user_id);
                            }
                            return $action;
                        })
                        ->rawColumns(['action'])
                        ->addIndexColumn()
                        ->make(true);
    }

    private function getShow($id) {
        $action = '<a href="' . url('user/show/' . $id) . '" title="Detail" class="btn cur-p btn-secondary m-3">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="15" height="15"
                                             viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                             stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <circle cx="10" cy="10" r="7" />
                                            <line x1="21" y1="21" x2="15" y2="15" />
                                        </svg>
                                    </a>';
        return $action;
    }

    private function getEdit($id) {
        $action = '<a href="' . url('user/showData/' . $id) . '"  class="btn cur-p btn-primary m-3">
                                        <!-- Download SVG icon from http://tabler-icons.io/i/edit -->
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="15" height="15"
                                             viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                             stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <path d="M9 7h-3a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-3" />
                                            <path d="M9 15h3l8.5 -8.5a1.5 1.5 0 0 0 -3 -3l-8.5 8.5v3" />
                                            <line x1="16" y1="5" x2="19" y2="8" />
                                        </svg>
                                    </a>';
        return $action;
    }

    private function ubahPassword($id) {
        $action = '<a href="' . url('user/changePassword/' . $id) . '" title="Ubah Password" class="btn cur-p btn-dark">
                  <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="15" height="15" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><rect x="5" y="11" width="14" height="10" rx="2" /><circle cx="12" cy="16" r="1" /><path d="M8 11v-4a4 4 0 0 1 8 0v4" /></svg>
                 </a>';
        return $action;
    }

    private function getVoid($id) {
        $action = '<button type="button" class="btn cur-p btn-danger m-3 void" title="Nonaktifkan" data-id="' . $id . '">
                                        <!-- Download SVG icon from http://tabler-icons.io/i/x -->
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="15" height="15" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><line x1="18" y1="6" x2="6" y2="18" /><line x1="6" y1="6" x2="18" y2="18" /></svg>
                                    </button>';
        return $action;
    }

    private function getUnvoid($id) {
        $action = '<button type="button" class="btn cur-p btn-success m-3 unvoid" title="aktifkan" data-id="' . $id . '">
                                        <!-- Download SVG icon from http://tabler-icons.io/i/check -->
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="15" height="15"
                                             viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                             stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <path d="M5 12l5 5l10 -10" />
                                        </svg>
                                    </button>';
        return $action;
    }

    public function getRole(Request $request) {
        return $this->role->getData($request);
    }

    public function insert(Request $request) {
        DB::beginTransaction();
        $model = $this->user->insert();
        $model->user_id = $request->user_id;
        $model->password = Hash::make($request->password);
        $model->type = 2;
        $model->universitas_id = Auth::user()->universitas_id;
        $model->notes = $request->notes;
        $model->role_id = $request->role_id;
        if (!$model->save()) {
            DB::rollback();
            return false;
        }
        foreach ($request->modul_access as $key => $row) {
            $detail = $this->user->insertAccess();
            $detail->module_function_id = $row;
            $detail->user_id = $model->user_id;
            if (!$detail->save()) {
                DB::rollback();
                return false;
            }
        }

        DB::commit();
        return true;
    }

    public function show($id) {
        return $this->user->show($id);
    }

    public function getModul(Request $request) {
        $parent = $this->role->getParent();
        return ModuleFunctionResource::collection($parent);
    }

    public function getModulUpdate($id, Request $request) {
        $parent = $this->role->getParent();
        $request->merge([
            'id' => $id,
        ]);
        return ModuleFunctionUpdateResource::collection($parent);
    }

    public function update($id, Request $request) {
        DB::beginTransaction();
        $model = $this->user->show($id);
        $model->notes = $request->notes;
        $model->role_id = $request->role_id;
        if (!$model->save()) {
            DB::rollback();
            return false;
        }

        $delete = $this->user->deleteAccess($model->user_id);
        if ($delete->count() > 0) {
            if (!$delete->delete()) {
                DB::rollback();
                return false;
            }
        }

        foreach ($request->modul_access as $key => $row) {
            $detail = $this->user->insertAccess();
            $detail->module_function_id = $row;
            $detail->user_id = $model->user_id;
            if (!$detail->save()) {
                DB::rollback();
                return false;
            }
        }

        DB::commit();
        return true;
    }

    public function updateStatus($id, $status) {
        DB::beginTransaction();
        $model = $this->user->show($id);
        $model->is_locked = ($status == "void") ? 1 : 0;
        if (!$model->save()) {
            DB::rollback();
            return false;
        }
        DB::commit();
        return true;
    }

    public function updatePassword($id, Request $request) {
        DB::beginTransaction();
        $model = $this->user->show($id);
        $model->password = Hash::make($request->password);
        if (!$model->save()) {
            DB::rollback();
            return false;
        }

        DB::commit();
        return true;
    }

}
