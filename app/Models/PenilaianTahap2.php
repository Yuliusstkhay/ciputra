<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Wuwx\LaravelAutoNumber\AutoNumberTrait;
use Auth;

class PenilaianTahap2 extends Model
{
    use HasFactory,AutoNumberTrait;
    protected $table = 't_penilaian_nilai_tahap2';
    protected $primaryKey = 'tahap2_id';
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
            'tahap2_id' => [
                'format' => 'THP.'.Auth::user()->universitas_id.'.?', // autonumber format. '?' will be replaced with the generated number.
                'length' => 5, // The number of digits in an autonumber
            ],
        ];
    }
    
    public function mahasiswa(){
        return $this->hasOne(DosenMahasiswa::class,'id','mahasiswa_dosen_id');
    }
}
