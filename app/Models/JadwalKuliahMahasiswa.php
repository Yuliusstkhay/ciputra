<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Auth;
use App\Models\PenilaianAssessmentNilai;
use App\Models\PenilaianTahap1;
use App\Models\PenilaianTahap2;

class JadwalKuliahMahasiswa extends Model
{
    use HasFactory;
    protected $table = 'm_jadwal_mahasiswa';
    protected $primaryKey = 'jadwal_kuliah_id';
    public $incrementing = false;
    const CREATED_AT = 'dt_record';
    const UPDATED_AT = 'dt_modified';
    
    protected static function boot() {
        parent::boot();

        static::creating(function ($model) {
            $model->user_record = Auth::check() ? Auth::user()->user_id : '';
        });
    }
    
    
    public function mahasiswa(){
        return $this->hasOne(DosenMahasiswa::class,'id','dosen_mahasiswa_id');
    }
    
    public function getNilai($penilaianAssessmentID,$mahasiswaID){
        $data =PenilaianAssessmentNilai::where('penilaian_assessment_detail_id',$penilaianAssessmentID)
               ->where('mahasiswa_dosen_id',$mahasiswaID);
        if($data->count()>0){
            $data = $data->first()->nilai;
            return $data;
        }else{
            return 0;
        }
    }
    
    public function getNilaiTahap1($penilaianAssessment,$mahasiswaID){
        $data = PenilaianTahap1::where('penilaian_assessment_id',$penilaianAssessment)
                ->where('mahasiswa_dosen_id',$mahasiswaID);
        if($data->count()>0){
           $data = $data->first()->nilai_awal;
            return $data; 
        }else{
            return 0;
        }
    }
    
    public function getNilaiTahap2($penilaian,$mahasiswa){
        $data = PenilaianTahap2::where('penilaian_id',$penilaian)
                ->where('mahasiswa_dosen_id',$mahasiswa);
        
        if($data->count()>0){
           $data = $data->first()->nilai_akhir;
            return $data; 
        }else{
            return 0;
        }
    }
}
