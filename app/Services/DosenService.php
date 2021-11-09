<?php

namespace App\Services;

use App\Repository\FakultasRepository;
use App\Repository\ProgramStudiRepository;
use App\Repository\DosenRepository;
use App\Repository\UserRepository;
use DataTables;
use Illuminate\Http\Request;
use Auth;
use DB;
use Hash;

class DosenService {

    protected $fakultas, $programstudi, $dosen,$user;

    public function __construct(FakultasRepository $fakultas, ProgramStudiRepository $programstudi, DosenRepository $dosen, UserRepository $user) {
        $this->fakultas = $fakultas;
        $this->programstudi = $programstudi;
        $this->dosen = $dosen;
        $this->user = $user;
    }

    public function getDataFakultas() {
        $data = $this->fakultas->getListData();
        return Datatables::of($data)
                        ->addColumn('action', function ($data) {
                            $action = $this->getProgramStudi($data->fakultas_id);
                            return $action;
                        })
                        ->rawColumns(['action'])
                        ->addIndexColumn()
                        ->make(true);
    }

    public function getProgramStudi($id) {
        $action = '<a href="' . url('dosen/programstudi/' . $id) . '" type="button" class="btn cur-p btn-success">
                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="18" height="18" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                    <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                    <line x1="12" y1="5" x2="12" y2="19" />
                    <line x1="5" y1="12" x2="19" y2="12" />
                </svg> Tambah Dosen
            </a>';
        return $action;
    }

    public function getDataProgramStudi($id) {
        $data = $this->programstudi->getListData($id);
        return Datatables::of($data)
                        ->addColumn('action', function ($data) {
                            $action = $this->getMatkul($data->bidang_studi_id);
                            return $action;
                        })
                        ->rawColumns(['action'])
                        ->addIndexColumn()
                        ->make(true);
    }

    public function getMatkul($id) {
        $action = '<a href="' . url('dosen/dosen/' . $id) . '" type="button" class="btn cur-p btn-success">
                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="18" height="18" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                    <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                    <line x1="12" y1="5" x2="12" y2="19" />
                    <line x1="5" y1="12" x2="19" y2="12" />
                </svg> Tambah Dosen
            </a>';
        return $action;
    }

    public function getList($id) {
        $data = $this->dosen->getList($id);
        return Datatables::of($data)
                        ->addColumn('action', function ($data) {
                            $action = $this->getShow($data->id);
                            $action .= $this->getEdit($data->id);
                            if ($data->status == 0) {
                                $action .= $this->getVoid($data->id);
                            } else {
                                $action .= $this->getUnvoid($data->id);
                            }
                            return $action;
                        })
                        ->rawColumns(['action'])
                        ->addIndexColumn()
                        ->make(true);
    }

    private function getShow($id) {
        $action = '<a href="' . url('dosen/show/' . $id) . '" title="Detail" class="btn cur-p btn-secondary m-3">
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
        $action = '<a href="' . url('dosen/getDataUpdate/' . $id) . '"  class="btn cur-p btn-primary m-3">
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

    public function getDataProgram($id) {
        return $this->programstudi->show($id);
    }

    public function insert(Request $request) {
        DB::beginTransaction();
        $model = $this->dosen->insert();
        $model->nip = $request->nip;
        $model->name = $request->name;
        $model->email = $request->email;
        $model->bidang_studi_id = $request->program_studi_id;
        $model->jabatan = $request->jabatan;
        $model->tipe = 0;
        if (!$model->save()) {
            DB::rollback();
            return false;
        }
        
        $user = $this->user->insert();
        $user->user_id = $request->email;
        $user->password = Hash::make('12345');
        $user->type = 0;
        $user->universitas_id = Auth::user()->universitas_id;
        if (!$user->save()) {
            DB::rollback();
            return false;
        }
        
        DB::commit();
        return true;
    }

    public function show($id) {
        return $this->dosen->show($id);
    }

    public function update($id, Request $request) {
        DB::beginTransaction();
        $model = $this->dosen->show($id);
        $model->nip = $request->nip;
        $model->name = $request->name;
        $model->email = $request->email;
        $model->jabatan = $request->jabatan;
        if (!$model->save()) {
            DB::rollback();
            return false;
        }
        
        
        DB::commit();
        return true;
    }

    public function updateStatus($id, $status) {
        DB::beginTransaction();
        $model = $this->dosen->show($id);
        $model->status = ($status == "void") ? 1 : 0;
        if (!$model->save()) {
            DB::rollback();
            return false;
        }
        DB::commit();
        return true;
    }

}
