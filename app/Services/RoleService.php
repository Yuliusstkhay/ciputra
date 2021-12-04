<?php

namespace App\Services;

use App\Repository\RoleRepository;
use DataTables;
use Illuminate\Http\Request;
use Auth;
use DB;
use App\Http\Resources\ModuleFunctionResource;

class RoleService {

    public function __construct(RoleRepository $role) {
        $this->role = $role;
    }

    public function getModul() {
        return $this->role->getModul();
    }

    public function getModulUpdate($id, Request $request) {
        $parent = $this->role->getParent();
        $request->merge([
            'id' => $id,
        ]);
        return ModuleFunctionResource::collection($parent);
    }

    public function insert(Request $request) {
        DB::beginTransaction();
        $model = $this->role->insert();
        $model->role_name = $request->role_name;
        $model->universitas_id = Auth::user()->universitas_id;
        $model->notes = $request->notes;
        $model->is_admin = $request->check_admin;
        $model->is_dosen = $request->check_dosen;
        $model->is_mahasiswa = $request->check_mahasiswa;
        if (!$model->save()) {
            DB::rollback();
            return false;
        }
        foreach ($request->modul_access as $key => $row) {
            $detail = $this->role->insertAccess();
            $detail->module_function_id = $row;
            $detail->role_id = $model->role_id;
            if (!$detail->save()) {
                DB::rollback();
                return false;
            }
        }



        DB::commit();
        return true;
    }

    public function update($id, Request $request) {
        DB::beginTransaction();
        $model = $this->role->show($id);
        $model->role_name = $request->role_name;
        $model->notes = $request->notes;
        $model->is_admin = $request->check_admin;
        $model->is_dosen = $request->check_dosen;
        $model->is_mahasiswa = $request->check_mahasiswa;
        if (!$model->save()) {
            DB::rollback();
            return false;
        }

        $delete = $this->role->deleteAccess($model->role_id);
        if (!$delete->delete()) {
            DB::rollback();
            return false;
        }

        foreach ($request->modul_access as $key => $row) {
            $detail = $this->role->insertAccess();
            $detail->module_function_id = $row;
            $detail->role_id = $model->role_id;
            if (!$detail->save()) {
                DB::rollback();
                return false;
            }
        }

        DB::commit();
        return true;
    }

    public function getList() {
        $data = $this->role->getList();
        return Datatables::of($data)
                        ->addColumn('action', function ($data) {
                            $action = "";
                            if (checkHakAkses(["U01.03"])) {
                                $action = $this->getEdit($data->role_id);
                            }
                            if (checkHakAkses(["U01.04"])) {
                                if ($data->status == 0) {
                                    $action .= $this->getVoid($data->role_id);
                                } else {
                                    $action .= $this->getUnvoid($data->role_id);
                                }
                            }
                            return $action;
                        })
                        ->rawColumns(['action'])
                        ->addIndexColumn()
                        ->make(true);
    }

    private function getEdit($id) {
        $action = '<a href="' . url('role/showData/' . $id) . '"  class="btn cur-p btn-primary m-3">
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

    public function show($id) {
        return $this->role->show($id);
    }

    public function updateStatus($id, $status) {
        DB::beginTransaction();
        $model = $this->role->show($id);
        $model->status = ($status == "void") ? 1 : 0;
        if (!$model->save()) {
            DB::rollback();
            return false;
        }
        DB::commit();
        return true;
    }

}
