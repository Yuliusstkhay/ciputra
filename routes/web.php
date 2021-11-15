<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\PenilaianController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\Master\DosenController;
use App\Http\Controllers\Master\MahasiswaController;
use App\Http\Controllers\Master\BidangStudiController;
use App\Http\Controllers\Master\MataKuliahController;
use App\Http\Controllers\Master\ItemPenilaianController;
use App\Http\Controllers\Master\FakultasController;
use App\Http\Controllers\Master\ProgramStudiController;
use App\Http\Controllers\Master\SemesterController;
use App\Http\Controllers\Master\AssessmentController;
use App\Http\Controllers\Master\UniversitasController;
use App\Http\Controllers\Master\JadwalKuliahController;

/*
  |--------------------------------------------------------------------------
  | Web Routes
  |--------------------------------------------------------------------------
  |
  | Here is where you can register web routes for your application. These
  | routes are loaded by the RouteServiceProvider within a group which
  | contains the "web" middleware group. Now create something great!
  |
 */

Route::get('login', [LoginController::class, 'index'])->name('login');
Route::post('login/process', [LoginController::class, 'loginProcess'])->name('login.process');

Route::group(['middleware' => 'auth'], function() {
    Route::get('/', function () {
        $data = [
            'title' => "Halaman Utama"
        ];


        return view('dashboard.index', $data);
    });

    Route::group(['prefix' => "fakultas",'middleware'=>'user.akses:M02.01'], function() {
        Route::get('/', [FakultasController::class, 'index'])->name('fakultas')->middleware('user.akses:M02.01');
        Route::get('getData', [FakultasController::class, 'datatable'])->name('fakultas.list')->middleware('user.akses:M02.01');
        Route::get('add', [FakultasController::class, 'create'])->name('fakultas.create')->middleware('user.akses:M02.02');
        Route::post('store', [FakultasController::class, 'store'])->name('fakultas.store')->middleware('user.akses:M02.02');
        Route::get('show/{fakultas}', [FakultasController::class, 'show'])->middleware('user.akses:M02.01');
        Route::get('getData/{fakultas}', [FakultasController::class, 'getData'])->middleware('user.akses:M02.03');
        Route::put('update/{fakultas}', [FakultasController::class, 'update'])->name('fakultas.update')->middleware('user.akses:M02.03');
        Route::put('void/{fakultas}', [FakultasController::class, 'void'])->name('fakultas.void')->middleware('user.akses:M02.04');
        Route::put('unvoid/{fakultas}', [FakultasController::class, 'unvoid'])->name('fakultas.unvoid')->middleware('user.akses:M02.04');
    });

    Route::group(['prefix' => 'programstudi','middleware'=>'user.akses:M03.01'], function() {
        Route::get('/', [ProgramStudiController::class, 'index'])->name('programstudi')->middleware('user.akses:M03.01');
        Route::get('getData', [ProgramStudiController::class, 'datatable'])->name('programstudi.list')->middleware('user.akses:M03.01');
        Route::get('add', [ProgramStudiController::class, 'create'])->name('programstudi.create')->middleware('user.akses:M03.02');
        Route::post('store', [ProgramStudiController::class, 'store'])->name('programstudi.store')->middleware('user.akses:M03.02');
        Route::get('show/{programstudi}', [ProgramStudiController::class, 'show'])->middleware('user.akses:M03.01');
        Route::get('getDataUpdate/{programstudi}', [ProgramStudiController::class, 'getData'])->middleware('user.akses:M03.03');
        Route::put('update/{programstudi}', [ProgramStudiController::class, 'update'])->name('programstudi.update')->middleware('user.akses:M03.03');
        Route::put('void/{programstudi}', [ProgramStudiController::class, 'void'])->name('programstudi.void')->middleware('user.akses:M03.04');
        Route::put('unvoid/{programstudi}', [ProgramStudiController::class, 'unvoid'])->name('programstudi.unvoid')->middleware('user.akses:M03.04');
        Route::post('getFakultas', [ProgramStudiController::class, 'getFakultas'])->name('programstudi.getfakultas')->middleware('user.akses:M03.01');
    });

    Route::group(['prefix' => 'matakuliah','middleware'=>'user.akses:M04.01'], function() {
        Route::get('/', [MataKuliahController::class, 'index'])->name('matakuliah')->middleware('user.akses:M04.01');
        Route::get('getDataFakultas', [MataKuliahController::class, 'getDataFakultas'])->name('matakuliah.fakultas')->middleware('user.akses:M04.01');
        Route::get('programstudi/{programstudi}', [MataKuliahController::class, 'programstudi'])->middleware('user.akses:M04.01');
        Route::get('getDataProgram/{programstudi}', [MataKuliahController::class, 'getDataProgramStudi'])->name('matakuliah.programstudi')->middleware('user.akses:M04.01');
        Route::get('matkul/{matakuliah}', [MataKuliahController::class, 'matakuliah'])->middleware('user.akses:M04.01');
        Route::get('getData/{matakuliah}', [MataKuliahController::class, 'datatable'])->name('matakuliah.list')->middleware('user.akses:M04.01');
        Route::get('add/{matakuliah}', [MataKuliahController::class, 'create'])->name('matakuliah.create')->middleware('user.akses:M04.02');
        Route::post('store', [MataKuliahController::class, 'store'])->name('matakuliah.store')->middleware('user.akses:M04.02');
        Route::get('show/{matakuliah}', [MataKuliahController::class, 'show'])->middleware('user.akses:M04.01');
        Route::get('getDataUpdate/{matakuliah}', [MataKuliahController::class, 'getData'])->middleware('user.akses:M04.03');
        Route::put('update/{matakuliah}', [MataKuliahController::class, 'update'])->name('matakuliah.update')->middleware('user.akses:M04.03');
        Route::put('void/{matakuliah}', [MataKuliahController::class, 'void'])->name('matakuliah.void')->middleware('user.akses:M04.04');
        Route::put('unvoid/{matakuliah}', [MataKuliahController::class, 'unvoid'])->name('matakuliah.unvoid')->middleware('user.akses:M04.04');
    });

    Route::group(['prefix' => 'semester','middleware'=>'user.akses:M07.01'], function() {
        Route::get('/', [SemesterController::class, 'index'])->name('semester')->middleware('user.akses:M07.01');
        Route::get('getData', [SemesterController::class, 'datatable'])->name('semester.list')->middleware('user.akses:M07.01');
        Route::get('add', [SemesterController::class, 'create'])->name('semester.create')->middleware('user.akses:M07.02');
        Route::post('store', [SemesterController::class, 'store'])->name('semester.store')->middleware('user.akses:M07.02');
        Route::get('show/{semester}', [SemesterController::class, 'show'])->middleware('user.akses:M07.01');
        Route::get('getDataUpdate/{semester}', [SemesterController::class, 'getData'])->middleware('user.akses:M07.03');
        Route::put('update/{semester}', [SemesterController::class, 'update'])->name('semester.update')->middleware('user.akses:M07.03');
        Route::put('void/{semester}', [SemesterController::class, 'void'])->name('semester.void')->middleware('user.akses:M07.04');
        Route::put('unvoid/{semester}', [SemesterController::class, 'unvoid'])->name('semester.unvoid')->middleware('user.akses:M07.04');
    });

    Route::group(['prefix' => 'assesment','middleware'=>'user.akses:M09.01'], function() {
        Route::get('/', [AssessmentController::class, 'index'])->name('assesment')->middleware('user.akses:M09.01');
        Route::get('getData', [AssessmentController::class, 'datatable'])->name('assesment.list')->middleware('user.akses:M09.01');
        Route::get('add', [AssessmentController::class, 'create'])->name('assesment.create')->middleware('user.akses:M09.02');
        Route::post('store', [AssessmentController::class, 'store'])->name('assesment.store')->middleware('user.akses:M09.02');
        Route::get('show/{assessment}', [AssessmentController::class, 'show'])->middleware('user.akses:M09.01');
        Route::get('getDataUpdate/{assessment}', [AssessmentController::class, 'getData'])->middleware('user.akses:M09.03');
        Route::put('update/{assessment}', [AssessmentController::class, 'update'])->name('assesment.update')->middleware('user.akses:M09.03');
        Route::put('void/{assessment}', [AssessmentController::class, 'void'])->name('assesment.void')->middleware('user.akses:M09.04');
        Route::put('unvoid/{assessment}', [AssessmentController::class, 'unvoid'])->name('assesment.unvoid')->middleware('user.akses:M09.04');
    });

    Route::group(['prefix' => 'universitas','middleware'=>'user.akses:M01.01'], function() {
        Route::get('/', [UniversitasController::class, 'index'])->name('universitas')->middleware('user.akses:M01.01');
        Route::get('getData', [UniversitasController::class, 'datatable'])->name('universitas.list')->middleware('user.akses:M01.01');
        Route::get('add', [UniversitasController::class, 'create'])->name('universitas.create')->middleware('user.akses:M01.02');
        Route::post('store', [UniversitasController::class, 'store'])->name('universitas.store')->middleware('user.akses:M01.02');
        Route::get('show/{universitas}', [UniversitasController::class, 'show'])->middleware('user.akses:M01.01');
        Route::get('getDataUpdate/{universitas}', [UniversitasController::class, 'getData'])->middleware('user.akses:M01.03');
        Route::put('update/{universitas}', [UniversitasController::class, 'update'])->name('universitas.update')->middleware('user.akses:M01.03');
        Route::put('void/{universitas}', [UniversitasController::class, 'void'])->name('universitas.void')->middleware('user.akses:M01.04');
        Route::put('unvoid/{universitas}', [UniversitasController::class, 'unvoid'])->name('universitas.unvoid')->middleware('user.akses:M01.04');
    });

    Route::group(['prefix' => 'mahasiswa','middleware'=>'user.akses:M06.01'], function() {
        Route::get('/', [MahasiswaController::class, 'index'])->name('mahasiswa')->middleware('user.akses:M06.01');
        Route::get('getDataFakultas', [MahasiswaController::class, 'getDataFakultas'])->name('mahasiswa.fakultas')->middleware('user.akses:M06.01');
        Route::get('programstudi/{programstudi}', [MahasiswaController::class, 'programstudi'])->middleware('user.akses:M06.01');
        Route::get('getDataProgram/{programstudi}', [MahasiswaController::class, 'getDataProgramStudi'])->name('mahasiswa.programstudi')->middleware('user.akses:M06.01');
        Route::get('mahasiswa/{mahasiswa}', [MahasiswaController::class, 'mahasiswa'])->middleware('user.akses:M06.01');
        Route::get('getData/{mahasiswa}', [MahasiswaController::class, 'datatable'])->name('mahasiswa.list')->middleware('user.akses:M06.01');
        Route::get('add/{mahasiswa}', [MahasiswaController::class, 'create'])->name('mahasiswa.create')->middleware('user.akses:M06.02');
        Route::post('store', [MahasiswaController::class, 'store'])->name('mahasiswa.store')->middleware('user.akses:M06.02');
        Route::get('show/{mahasiswa}', [MahasiswaController::class, 'show'])->middleware('user.akses:M06.01');
        Route::get('getDataUpdate/{mahasiswa}', [MahasiswaController::class, 'getData'])->middleware('user.akses:M06.03');
        Route::put('update/{mahasiswa}', [MahasiswaController::class, 'update'])->name('mahasiswa.update')->middleware('user.akses:M06.03');
        Route::put('void/{mahasiswa}', [MahasiswaController::class, 'void'])->name('mahasiswa.void')->middleware('user.akses:M06.04');
        Route::put('unvoid/{mahasiswa}', [MahasiswaController::class, 'unvoid'])->name('mahasiswa.unvoid')->middleware('user.akses:M06.04');
    });

    Route::group(['prefix' => 'dosen','middleware'=>'user.akses:M05.01'], function() {
        Route::get('/', [DosenController::class, 'index'])->name('dosen')->middleware('user.akses:M05.01');
        Route::get('getDataFakultas', [DosenController::class, 'getDataFakultas'])->name('dosen.fakultas')->middleware('user.akses:M05.01');
        Route::get('programstudi/{programstudi}', [DosenController::class, 'programstudi'])->middleware('user.akses:M05.01');
        Route::get('getDataProgram/{programstudi}', [DosenController::class, 'getDataProgramStudi'])->name('dosen.programstudi')->middleware('user.akses:M05.01');
        Route::get('dosen/{dosen}', [DosenController::class, 'dosen'])->middleware('user.akses:M05.01');
        Route::get('getData/{dosen}', [DosenController::class, 'datatable'])->name('dosen.list')->middleware('user.akses:M05.01');
        Route::get('add/{dosen}', [DosenController::class, 'create'])->name('dosen.create')->middleware('user.akses:M05.02');
        Route::post('store', [DosenController::class, 'store'])->name('dosen.store')->middleware('user.akses:M05.02');
        Route::get('show/{dosen}', [DosenController::class, 'show'])->middleware('user.akses:M05.01');
        Route::get('getDataUpdate/{dosen}', [DosenController::class, 'getData'])->middleware('user.akses:M05.03');
        Route::put('update/{dosen}', [DosenController::class, 'update'])->name('dosen.update')->middleware('user.akses:M05.03');
        Route::put('void/{dosen}', [DosenController::class, 'void'])->name('dosen.void')->middleware('user.akses:M05.04');
        Route::put('unvoid/{dosen}', [DosenController::class, 'unvoid'])->name('dosen.unvoid')->middleware('user.akses:M05.04');
    });

    Route::group(['prefix' => 'jadwalkuliah','middleware'=>'user.akses:M08.01'], function() {
        Route::get('/', [JadwalKuliahController::class, 'index'])->name('jadwalkuliah')->middleware('user.akses:M08.01');
        Route::get('getDataFakultas', [JadwalKuliahController::class, 'getDataFakultas'])->name('jadwalkuliah.fakultas')->middleware('user.akses:M08.01');
        Route::get('programstudi/{programstudi}', [JadwalKuliahController::class, 'programstudi'])->middleware('user.akses:M08.01');
        Route::get('getDataProgram/{programstudi}', [JadwalKuliahController::class, 'getDataProgramStudi'])->name('jadwalkuliah.programstudi')->middleware('user.akses:M08.01');
        Route::get('jadwalkuliah/{jadwalkuliah}', [JadwalKuliahController::class, 'jadwalkuliah'])->middleware('user.akses:M08.01');
        Route::get('getData/{jadwalkuliah}', [JadwalKuliahController::class, 'datatable'])->name('jadwalkuliah.list')->middleware('user.akses:M08.01');
        Route::get('add/{jadwalkuliah}', [JadwalKuliahController::class, 'create'])->name('jadwalkuliah.create')->middleware('user.akses:M08.02');
        Route::post('store', [JadwalKuliahController::class, 'store'])->name('jadwalkuliah.store')->middleware('user.akses:M08.02');
        Route::get('show/{jadwalkuliah}', [JadwalKuliahController::class, 'show'])->middleware('user.akses:M08.01');
        Route::get('getDataUpdate/{jadwalkuliah}', [JadwalKuliahController::class, 'getData'])->middleware('user.akses:M08.03');
        Route::put('update/{jadwalkuliah}', [JadwalKuliahController::class, 'update'])->name('jadwalkuliah.update')->middleware('user.akses:M08.03');
        Route::put('void/{jadwalkuliah}', [JadwalKuliahController::class, 'void'])->name('jadwalkuliah.void')->middleware('user.akses:M08.04');
        Route::put('unvoid/{jadwalkuliah}', [JadwalKuliahController::class, 'unvoid'])->name('jadwalkuliah.unvoid')->middleware('user.akses:M08.04');

        Route::post('getMatkul/{programstudi}', [JadwalKuliahController::class, 'getMatkul'])->name('jadwalkuliah.matkul')->middleware('user.akses:M08.01');
        Route::post('dosen/{dosen}', [JadwalKuliahController::class, 'getDosen'])->name('jadwalkuliah.dosen')->middleware('user.akses:M08.01');
        Route::post('semester', [JadwalKuliahController::class, 'getSemester'])->name('jadwalkuliah.semester')->middleware('user.akses:M08.01');

//        peserta
        Route::get('peserta/{jadwalkuliah}', [JadwalKuliahController::class, 'listPeserta'])->name('jadwalkuliah.listpeserta')->middleware('user.akses:M08.06');
        Route::get('listPeserta/{jadwalkuliah}', [JadwalKuliahController::class, 'listDataPeserta'])->name('jadwalkuliah.pesertaData')->middleware('user.akses:M08.06');
        Route::get('mahasiswaAll/{jadwalkuliah}', [JadwalKuliahController::class, 'mahasiswaAll'])->name('jadwalkuliah.mahasiswaAll')->middleware('user.akses:M08.06');
        Route::post('storePeserta/{jadwalkuliah}', [JadwalKuliahController::class, 'storePeserta'])->name('jadwalkuliah.storePeserta')->middleware('user.akses:M08.06');
        Route::delete('removePeserta/{jadwalkuliah}/{idmhs}', [JadwalKuliahController::class, 'removePeserta'])->name('jadwalkuliah.removePeserta')->middleware('user.akses:M08.06');
    });

    Route::group(['prefix' => 'role','middleware'=>'user.akses:U01.01'], function() {
        Route::get('/', [RoleController::class, 'index'])->name('role')->middleware('user.akses:U01.01');
        Route::get('add', [RoleController::class, 'create'])->name('role.create')->middleware('user.akses:U01.02');
        Route::post('getModul', [RoleController::class, 'getModul'])->name('role.modul')->middleware('user.akses:U01.01');
        Route::post('getModulUpdate/{role}', [RoleController::class, 'getModulUpdate'])->name('role.modulUpdate')->middleware('user.akses:U01.03');
        Route::post('store', [RoleController::class, 'store'])->name('role.store')->middleware('user.akses:U01.02');
        Route::get('getData', [RoleController::class, 'datatable'])->name('role.list')->middleware('user.akses:U01.01');
        Route::get('showData/{role}', [RoleController::class, 'show'])->middleware('user.akses:U01.01');
        Route::post('update/{role}',[RoleController::class,'update'])->name('role.update')->middleware('user.akses:U01.02');
        Route::put('void/{universitas}', [RoleController::class, 'void'])->name('role.void')->middleware('user.akses:U01.04');
        Route::put('unvoid/{universitas}', [RoleController::class, 'unvoid'])->name('role.unvoid')->middleware('user.akses:U01.04');
    });
    
    Route::group(['prefix' => 'user','middleware'=>'user.akses:U02.01'], function() {
        Route::get('/', [UserController::class, 'index'])->name('user')->middleware('user.akses:U02.01');
        Route::get('getData', [UserController::class, 'datatable'])->name('user.list')->middleware('user.akses:U02.01');
        Route::get('add', [UserController::class, 'create'])->name('user.create')->middleware('user.akses:U02.02');
        Route::post('getRole',[UserController::class,'getRole'])->name('user.getRole')->middleware('user.akses:U02.02');
        Route::post('getModul', [UserController::class, 'getModul'])->name('user.modul')->middleware('user.akses:U02.02');
        Route::post('store', [UserController::class, 'store'])->name('user.store')->middleware('user.akses:U02.02');
        Route::get('show/{user}',[UserController::class,'show'])->middleware('user.akses:U02.01');
        Route::get('showData/{user}', [UserController::class, 'showUpdate'])->middleware('user.akses:U02.03');
        Route::post('update/{user}',[UserController::class,'update'])->name('user.update')->middleware('user.akses:U02.03');
        Route::post('getModulUpdate/{user}', [UserController::class, 'getModulUpdate'])->name('user.modulUpdate')->middleware('user.akses:U02.03');
        Route::put('void/{user}', [UserController::class, 'void'])->name('user.void')->middleware('user.akses:U02.04');
        Route::put('unvoid/{user}', [UserController::class, 'unvoid'])->name('user.unvoid')->middleware('user.akses:U02.04');
        Route::get('changePassword/{user}',[UserController::class,'changePassword'])->middleware('user.akses:U02.03');
        Route::put('updatePassword/{user}',[UserController::class,'updatePassword'])->name('user.updatePassword')->middleware('user.akses:U02.03');
    });


    Route::group(['prefix' => "dashboard"], function() {
        Route::get('/', [DashboardController::class, 'index'])->name('dashboard');
    });

    Route::group(['prefix' => 'penilaian'], function() {
        Route::get('/', [PenilaianController::class, 'index'])->name('penilaian');
        Route::get('nilai/{penilaian}', [PenilaianController::class, 'penilaian']);
        Route::get('item/{penilaian}', [PenilaianController::class, 'listPenilaian']);
        Route::get('add', [PenilaianController::class, 'create']);
        Route::get('aturPenilaian/{penilaian}', [PenilaianController::class, 'aturPenilaian']);
    });



    








    Route::group(['prefix' => 'itempenilaian'], function() {
        Route::get('/', [ItemPenilaianController::class, 'index'])->name('itempenilaian');
    });
});

