<?php
namespace App\Repository;

use App\Models\JadwalKuliah;
use App\Models\JadwalKuliahMahasiswa;
use App\Models\DosenMahasiswa;
use Auth;
use Illuminate\Http\Request;

class JadwalKuliahRepository{
    
     public function getList($id){
        return JadwalKuliah::with('matakuliah.programstudi.fakultas')->whereHas('matakuliah.programstudi.fakultas',function($q){
            $q->where('universitas_id',Auth::user()->universitas_id);
        })->with('matakuliah.programstudi')->whereHas('matakuliah.programstudi',function($q) use ($id){
            $q->where('bidang_studi_id',$id);
        })->with(['matakuliah','dosenmahasiswa','semester'])->withCount('jadwalMahasiswa')->get();
    }
    
    public function getListPenilaian(){
        if(Auth::user()->type == 0){
            $data = JadwalKuliah::where('dosen_mahasiswa_id',Auth::user()->dosen->id)
                    ->whereHas('matakuliah.programstudi.fakultas', function ($q) {
                                $q->where('universitas_id', Auth::user()->universitas_id);
                            })
                    ->with('matakuliah', 'dosenmahasiswa')
                    ->whereHas('semester', function ($q) {
                                $q->where('status', 0);
                            })
                    ->doesntHave('penilaian')->orWhereHas('penilaian', function ($q) {
                        $q->where('status', 0);
                    })->whereHas('penilaian.jadwal',function($q){
                        $q->where('dosen_mahasiswa_id',Auth::user()->dosen->id);
                    });

//            whereHas('matakuliah.programstudi.fakultas', function ($q) {
//                                $q->where('universitas_id', Auth::user()->universitas_id);
//                            })->with('matakuliah', 'dosenmahasiswa')
//                            ->whereHas('semester', function ($q) {
//                                $q->where('status', 0);
//                            })->doesntHave('penilaian')->orWhereHas('penilaian', function ($q) {
//                $q->where('status', 0);
//            })
        }else{
            $data = JadwalKuliah::where('dosen_mahasiswa_id',Auth::user()->dosen->id)->whereHas('matakuliah.programstudi.fakultas', function ($q) {
                                $q->where('universitas_id', Auth::user()->universitas_id);
                            })->with('matakuliah', 'dosenmahasiswa')
                            ->whereHas('semester', function ($q) {
                                $q->where('status', 0);
                            })->doesntHave('penilaian')->orWhereHas('penilaian', function ($q) {
                $q->where('status', 0);
            });
        }
        
        return $data->get();
    }
    
    
    public function getListPeserta($id){
        return JadwalKuliahMahasiswa::where('jadwal_kuliah_id',$id)->with(['mahasiswa','mahasiswa.programstudi'])->orderBy('index','asc')->get();
    }
    
    public function getListMahasiswa($idx){
        $jadwal = JadwalKuliah::find($idx);
        $id = [];
//        $data = JadwalKuliahMahasiswa::where('jadwal_kuliah_id',$id)->select('dosen_mahasiswa_id')->get();
        foreach($jadwal->jadwalMahasiswa as $key => $row){
            $id[$key] = $row->dosen_mahasiswa_id;
        }
        
        
        $mahasiswa = DosenMahasiswa::where('bidang_studi_id',$jadwal->matakuliah->programstudi->bidang_studi_id)
                    ->where('status',0)
                    ->where('tipe',1)->whereNotIn('id',$id)
                    ->with(['programstudi'])
                    ->get();
        return $mahasiswa;
        
    }
    
    public function ListMahasiswaPenilaian($idx,$mahasiswa){
        $data = JadwalKuliahMahasiswa::where('jadwal_kuliah_id',$idx)
                ->whereNotIn('dosen_mahasiswa_id',$mahasiswa)
                ->with(['mahasiswa','mahasiswa.programstudi'])->orderBy('index','asc')->get();
        return $data;
    }
    
    public function insert(){
        $matkul = new JadwalKuliah();
        return $matkul;
    }
    
    public function insertPeserta(){
        $model = new JadwalKuliahMahasiswa();
        return $model;
    }
    
    public function getIndexPeserta($id){
        $data = JadwalKuliahMahasiswa::where('jadwal_kuliah_id',$id)->max('index');
        return $data;
    }
    
    public function getPeserta($id,$mhs){
        $data = JadwalKuliahMahasiswa::where('jadwal_kuliah_id',$id)
                ->where('dosen_mahasiswa_id',$mhs);
        return $data;
    }
    
    
    public function show($id){
        $data = JadwalKuliah::find($id);
        return $data;
    }


}