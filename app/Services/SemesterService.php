<?php

namespace App\Services;

use App\Repository\SemesterRepository;
use DataTables;
use Illuminate\Http\Request;
use Auth;
use DB;

class SemesterService {

    public function __construct(SemesterRepository $semester) {
        $this->semester = $semester;
    }

    public function getList() {
        $data = $this->semester->getList();
        return Datatables::of($data)
                        ->addColumn('action', function ($data) {
                            $action = $this->getShow($data->semester_id);
                            if (checkHakAkses(["M07.03"])) {
                                $action .= $this->getEdit($data->semester_id);
                            }
                            if (checkHakAkses(["M07.04"])) {
                                if ($data->status == 0) {
                                    $action .= $this->getVoid($data->semester_id);
                                } else {
                                    $action .= $this->getUnvoid($data->semester_id);
                                }
                            }
                            return $action;
                        })
                        ->rawColumns(['action'])
                        ->addIndexColumn()
                        ->make(true);
    }

    private function getShow($id) {
        $action = '<a href="' . url('semester/show/' . $id) . '" title="Detail" class="btn cur-p btn-secondary m-3">
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
        $action = '<a href="' . url('semester/getDataUpdate/' . $id) . '"  class="btn cur-p btn-primary m-3">
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

    public function insert(Request $request) {
        DB::beginTransaction();
        $model = $this->semester->insert();
        $model->semester_name = $request->semester_name;
        $model->universitas_id = Auth::user()->universitas_id;
        if (!$model->save()) {
            DB::rollback();
            return false;
        }
        DB::commit();
        return true;
    }

    public function show($id) {
        return $this->semester->show($id);
    }

    public function update($id, Request $request) {
        DB::beginTransaction();
        $model = $this->semester->show($id);
        $model->semester_name = $request->semester_name;
        if (!$model->save()) {
            DB::rollback();
            return false;
        }
        DB::commit();
        return true;
    }

    public function updateStatus($id, $status) {
        DB::beginTransaction();
        $model = $this->semester->show($id);
        $model->status = ($status == "void") ? 1 : 0;
        if (!$model->save()) {
            DB::rollback();
            return false;
        }
        DB::commit();
        return true;
    }

}
