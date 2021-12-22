<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Wuwx\LaravelAutoNumber\AutoNumberTrait;
use Auth;
use App\Models\PenilaianAssessmentNilai;

class PenilaianDosenMahasiswa extends Model
{
     use HasFactory,AutoNumberTrait;
    protected $table = 't_penilaian_dosen_mahasiswa';
    protected $primaryKey = ['penilaian_assessment_id','id','dosen_mahasiswa_id'];
    public $incrementing = false;
    const CREATED_AT = 'dt_record';
    const UPDATED_AT = 'dt_modified';
    
    protected static function boot() {
        parent::boot();

        static::creating(function ($model) {
            $model->user_record = Auth::check() ? Auth::user()->user_id : '';
        });
    }
    
    /**
     * Return the autonumber configuration array for this model.
     *
     * @return array
     */
    public function getAutoNumberOptions()
    {
        return [
            'id' => [
                'format' => 'PMD.'.Auth::user()->universitas_id.'.?', // autonumber format. '?' will be replaced with the generated number.
                'length' => 5, // The number of digits in an autonumber
            ],
        ];
    }
    
    public function penilaianAssessment(){
        return $this->hasOne(PenilaianAssessment::class,['penilaian_id','assessment_id'],['penilaian_id','assessment_id']);
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
    
    public function getCatatan($penilaianAssessmentID,$mahasiswaID){
        $data =PenilaianAssessmentNilai::where('penilaian_assessment_detail_id',$penilaianAssessmentID)
               ->where('mahasiswa_dosen_id',$mahasiswaID);
        if($data->count()>0){
            $data = $data->first()->catatan;
            return $data;
        }else{
            return null;
        }
    }
}
