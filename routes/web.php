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

    Route::group(['prefix' => "fakultas"], function() {
        Route::get('/', [FakultasController::class, 'index'])->name('fakultas');
        Route::get('getData', [FakultasController::class, 'datatable'])->name('fakultas.list');
        Route::get('add', [FakultasController::class, 'create'])->name('fakultas.create');
        Route::post('store', [FakultasController::class, 'store'])->name('fakultas.store');
        Route::get('show/{fakultas}', [FakultasController::class, 'show']);
        Route::get('getData/{fakultas}', [FakultasController::class, 'getData']);
        Route::put('update/{fakultas}', [FakultasController::class, 'update'])->name('fakultas.update');
        Route::put('void/{fakultas}', [FakultasController::class, 'void'])->name('fakultas.void');
        Route::put('unvoid/{fakultas}', [FakultasController::class, 'unvoid'])->name('fakultas.unvoid');
    });

    Route::group(['prefix' => 'programstudi'], function() {
        Route::get('/', [ProgramStudiController::class, 'index'])->name('programstudi');
        Route::get('getData', [ProgramStudiController::class, 'datatable'])->name('programstudi.list');
        Route::get('add', [ProgramStudiController::class, 'create'])->name('programstudi.create');
        Route::post('store', [ProgramStudiController::class, 'store'])->name('programstudi.store');
        Route::get('show/{programstudi}', [ProgramStudiController::class, 'show']);
        Route::get('getDataUpdate/{programstudi}', [ProgramStudiController::class, 'getData']);
        Route::put('update/{programstudi}', [ProgramStudiController::class, 'update'])->name('programstudi.update');
        Route::put('void/{programstudi}', [ProgramStudiController::class, 'void'])->name('programstudi.void');
        Route::put('unvoid/{programstudi}', [ProgramStudiController::class, 'unvoid'])->name('programstudi.unvoid');
        Route::post('getFakultas', [ProgramStudiController::class, 'getFakultas'])->name('programstudi.getfakultas');
    });

    Route::group(['prefix' => 'matakuliah'], function() {
        Route::get('/', [MataKuliahController::class, 'index'])->name('matakuliah');
        Route::get('getDataFakultas', [MataKuliahController::class, 'getDataFakultas'])->name('matakuliah.fakultas');
        Route::get('programstudi/{programstudi}', [MataKuliahController::class, 'programstudi']);
        Route::get('getDataProgram/{programstudi}', [MataKuliahController::class, 'getDataProgramStudi'])->name('matakuliah.programstudi');
        Route::get('matkul/{matakuliah}', [MataKuliahController::class, 'matakuliah']);
        Route::get('getData/{matakuliah}', [MataKuliahController::class, 'datatable'])->name('matakuliah.list');
        Route::get('add/{matakuliah}', [MataKuliahController::class, 'create'])->name('matakuliah.create');
        Route::post('store', [MataKuliahController::class, 'store'])->name('matakuliah.store');
        Route::get('show/{matakuliah}', [MataKuliahController::class, 'show']);
        Route::get('getDataUpdate/{matakuliah}', [MataKuliahController::class, 'getData']);
        Route::put('update/{matakuliah}', [MataKuliahController::class, 'update'])->name('matakuliah.update');
        Route::put('void/{matakuliah}', [MataKuliahController::class, 'void'])->name('matakuliah.void');
        Route::put('unvoid/{matakuliah}', [MataKuliahController::class, 'unvoid'])->name('matakuliah.unvoid');
    });
    
    Route::group(['prefix'=>'semester'],function(){
        Route::get('/',[SemesterController::class,'index'])->name('semester');
        Route::get('getData', [SemesterController::class, 'datatable'])->name('semester.list');
        Route::get('add', [SemesterController::class, 'create'])->name('semester.create');
        Route::post('store', [SemesterController::class, 'store'])->name('semester.store');
        Route::get('show/{semester}', [SemesterController::class, 'show']);
        Route::get('getDataUpdate/{semester}', [SemesterController::class, 'getData']);
        Route::put('update/{semester}', [SemesterController::class, 'update'])->name('semester.update');
        Route::put('void/{semester}', [SemesterController::class, 'void'])->name('semester.void');
        Route::put('unvoid/{semester}', [SemesterController::class, 'unvoid'])->name('semester.unvoid');
    });
    
    Route::group(['prefix'=>'assesment'],function(){
        Route::get('/',[AssessmentController::class,'index'])->name('assesment');
        Route::get('getData', [AssessmentController::class, 'datatable'])->name('assesment.list');
        Route::get('add', [AssessmentController::class, 'create'])->name('assesment.create');
        Route::post('store', [AssessmentController::class, 'store'])->name('assesment.store');
        Route::get('show/{assessment}', [AssessmentController::class, 'show']);
        Route::get('getDataUpdate/{assessment}', [AssessmentController::class, 'getData']);
        Route::put('update/{assessment}', [AssessmentController::class, 'update'])->name('assesment.update');
        Route::put('void/{assessment}', [AssessmentController::class, 'void'])->name('assesment.void');
        Route::put('unvoid/{assessment}', [AssessmentController::class, 'unvoid'])->name('assesment.unvoid');
    });
    
    Route::group(['prefix'=>'universitas'],function(){
        Route::get('/',[UniversitasController::class,'index'])->name('universitas');
        Route::get('getData', [UniversitasController::class, 'datatable'])->name('universitas.list');
        Route::get('add', [UniversitasController::class, 'create'])->name('universitas.create');
        Route::post('store', [UniversitasController::class, 'store'])->name('universitas.store');
        Route::get('show/{universitas}', [UniversitasController::class, 'show']);
        Route::get('getDataUpdate/{universitas}', [UniversitasController::class, 'getData']);
        Route::put('update/{universitas}', [UniversitasController::class, 'update'])->name('universitas.update');
        Route::put('void/{universitas}', [UniversitasController::class, 'void'])->name('universitas.void');
        Route::put('unvoid/{universitas}', [UniversitasController::class, 'unvoid'])->name('universitas.unvoid');
    });
    
    Route::group(['prefix' => 'mahasiswa'], function() {
        Route::get('/', [MahasiswaController::class, 'index'])->name('mahasiswa');
        Route::get('getDataFakultas', [MahasiswaController::class, 'getDataFakultas'])->name('mahasiswa.fakultas');
        Route::get('programstudi/{programstudi}', [MahasiswaController::class, 'programstudi']);
        Route::get('getDataProgram/{programstudi}', [MahasiswaController::class, 'getDataProgramStudi'])->name('mahasiswa.programstudi');
        Route::get('mahasiswa/{mahasiswa}', [MahasiswaController::class, 'mahasiswa']);
        Route::get('getData/{mahasiswa}', [MahasiswaController::class, 'datatable'])->name('mahasiswa.list');
        Route::get('add/{mahasiswa}', [MahasiswaController::class, 'create'])->name('mahasiswa.create');
        Route::post('store', [MahasiswaController::class, 'store'])->name('mahasiswa.store');
        Route::get('show/{mahasiswa}', [MahasiswaController::class, 'show']);
        Route::get('getDataUpdate/{mahasiswa}', [MahasiswaController::class, 'getData']);
        Route::put('update/{mahasiswa}', [MahasiswaController::class, 'update'])->name('mahasiswa.update');
        Route::put('void/{mahasiswa}', [MahasiswaController::class, 'void'])->name('mahasiswa.void');
        Route::put('unvoid/{mahasiswa}', [MahasiswaController::class, 'unvoid'])->name('mahasiswa.unvoid');
    });
    
    Route::group(['prefix' => 'dosen'], function() {
        Route::get('/', [DosenController::class, 'index'])->name('dosen');
        Route::get('getDataFakultas', [DosenController::class, 'getDataFakultas'])->name('dosen.fakultas');
        Route::get('programstudi/{programstudi}', [DosenController::class, 'programstudi']);
        Route::get('getDataProgram/{programstudi}', [DosenController::class, 'getDataProgramStudi'])->name('dosen.programstudi');
        Route::get('dosen/{dosen}', [DosenController::class, 'dosen']);
        Route::get('getData/{dosen}', [DosenController::class, 'datatable'])->name('dosen.list');
        Route::get('add/{dosen}', [DosenController::class, 'create'])->name('dosen.create');
        Route::post('store', [DosenController::class, 'store'])->name('dosen.store');
        Route::get('show/{dosen}', [DosenController::class, 'show']);
        Route::get('getDataUpdate/{dosen}', [DosenController::class, 'getData']);
        Route::put('update/{dosen}', [DosenController::class, 'update'])->name('dosen.update');
        Route::put('void/{dosen}', [DosenController::class, 'void'])->name('dosen.void');
        Route::put('unvoid/{dosen}', [DosenController::class, 'unvoid'])->name('dosen.unvoid');
    });
    
    Route::group(['prefix'=>'jadwalkuliah'],function(){
        Route::get('/', [JadwalKuliahController::class, 'index'])->name('jadwalkuliah');
        Route::get('getDataFakultas', [JadwalKuliahController::class, 'getDataFakultas'])->name('jadwalkuliah.fakultas');
        Route::get('programstudi/{programstudi}', [JadwalKuliahController::class, 'programstudi']);
        Route::get('getDataProgram/{programstudi}', [JadwalKuliahController::class, 'getDataProgramStudi'])->name('jadwalkuliah.programstudi');
        Route::get('jadwalkuliah/{jadwalkuliah}', [JadwalKuliahController::class, 'jadwalkuliah']);
        Route::get('getData/{jadwalkuliah}', [JadwalKuliahController::class, 'datatable'])->name('jadwalkuliah.list');
        Route::get('add/{jadwalkuliah}', [JadwalKuliahController::class, 'create'])->name('jadwalkuliah.create');
        Route::post('store', [JadwalKuliahController::class, 'store'])->name('jadwalkuliah.store');
        Route::get('show/{jadwalkuliah}', [JadwalKuliahController::class, 'show']);
        Route::get('getDataUpdate/{jadwalkuliah}', [JadwalKuliahController::class, 'getData']);
        Route::put('update/{jadwalkuliah}', [JadwalKuliahController::class, 'update'])->name('jadwalkuliah.update');
        Route::put('void/{jadwalkuliah}', [JadwalKuliahController::class, 'void'])->name('jadwalkuliah.void');
        Route::put('unvoid/{jadwalkuliah}', [JadwalKuliahController::class, 'unvoid'])->name('jadwalkuliah.unvoid');
        
        Route::post('getMatkul/{programstudi}', [JadwalKuliahController::class, 'getMatkul'])->name('jadwalkuliah.matkul');
        Route::post('dosen/{dosen}',[JadwalKuliahController::class,'getDosen'])->name('jadwalkuliah.dosen');
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

    Route::group(['prefix' => 'role'], function() {
        Route::get('/', [RoleController::class, 'index'])->name('role');
        Route::get('userMatrix/{role}', [RoleController::class, 'userMatrix']);
    });

    Route::group(['prefix' => 'user'], function() {
        Route::get('/', [UserController::class, 'index'])->name('user');
    });

    

    




    Route::group(['prefix' => 'itempenilaian'], function() {
        Route::get('/', [ItemPenilaianController::class, 'index'])->name('itempenilaian');
    });
});

