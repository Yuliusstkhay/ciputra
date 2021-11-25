<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Wuwx\LaravelAutoNumber\AutoNumberTrait;
use Auth;

class DosenMahasiswa extends Model
{
     use HasFactory,AutoNumberTrait;
    protected $table = 'm_dosen_mahasiswa';
    protected $primaryKey = 'id';
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
                'format' => 'DM.'.Auth::user()->universitas_id.'.?', // autonumber format. '?' will be replaced with the generated number.
                'length' => 6, // The number of digits in an autonumber
            ],
        ];
    }
    
    public function programstudi(){
        return $this->hasOne(ProgramStudi::class,'bidang_studi_id','bidang_studi_id');
    }
    
    public function penilaianDetail(){
        return $this->hasOne(PenilaianDosenMahasiswaDetail::class,'dosen_mahasiswa_id','id');
    }
    
    public function user(){
        return $this->hasOne(User::class,'user_id','email');
    }
}
