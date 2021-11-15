<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Wuwx\LaravelAutoNumber\AutoNumberTrait;
use Auth;

class JadwalKuliah extends Model
{
    use HasFactory,AutoNumberTrait;
    protected $table = 'm_jadwal_kuliah';
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
    
    /**
     * Return the autonumber configuration array for this model.
     *
     * @return array
     */
    public function getAutoNumberOptions()
    {
        return [
            'jadwal_kuliah_id' => [
                'format' => 'BS.'.Auth::user()->universitas_id.'.?', // autonumber format. '?' will be replaced with the generated number.
                'length' => 5, // The number of digits in an autonumber
            ],
        ];
    }
    
    public function matakuliah(){
        return $this->hasOne(Matkul::class,'mata_kuliah_id','mata_kuliah_id');
    }
    
    public function dosenmahasiswa(){
        return $this->hasOne(DosenMahasiswa::class,'id','dosen_mahasiswa_id');
    }
    
    public function semester(){
        return $this->hasOne(Semester::class,'semester_id','semester_id');
    }
    
    public function jadwalMahasiswa(){
        return $this->hasMany(JadwalKuliahMahasiswa::class,'jadwal_kuliah_id','jadwal_kuliah_id');
    }
    
}
