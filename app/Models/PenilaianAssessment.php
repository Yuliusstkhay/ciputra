<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Wuwx\LaravelAutoNumber\AutoNumberTrait;
use Auth;

class PenilaianAssessment extends Model
{
    use HasFactory,AutoNumberTrait;
    protected $table = 't_penilaian_assessment';
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
                'format' => 'BS.'.Auth::user()->universitas_id.'.?', // autonumber format. '?' will be replaced with the generated number.
                'length' => 5, // The number of digits in an autonumber
            ],
        ];
    }
    
    public function assessment(){
        return $this->hasOne(Assessment::class,'assessment_id','assessment_id');
    }
    
    public function penilaian(){
        return $this->hasOne(PenilaianHeader::class,'penilaian_id','penilaian_id');
    }
    
    public function penilaianAssessmentDetail(){
        return $this->hasMany(PenilaianAssessmentDetail::class,'penilaian_assessment_id','id');
    }
}
