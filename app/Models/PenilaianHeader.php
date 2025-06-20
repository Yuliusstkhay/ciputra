<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Wuwx\LaravelAutoNumber\AutoNumberTrait;
use Auth;

class PenilaianHeader extends Model
{
    use HasFactory,AutoNumberTrait;
    protected $table = 't_penilaian_header';
    protected $primaryKey = 'penilaian_id';
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
            'penilaian_id' => [
                'format' => 'PNL.'.Auth::user()->universitas_id.'.?', // autonumber format. '?' will be replaced with the generated number.
                'length' => 5, // The number of digits in an autonumber
            ],
        ];
    }
    
    public function jadwal(){
        return $this->hasOne(JadwalKuliah::class,'jadwal_kuliah_id','jadwal_kuliah_id');
    }
    
    public function penilaianAssessment(){
        return $this->hasMany(PenilaianAssessment::class,'penilaian_id','penilaian_id');
    }
    
}
