<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Wuwx\LaravelAutoNumber\AutoNumberTrait;
use Auth;

class Role extends Model
{
    use HasFactory,AutoNumberTrait;
    protected $table = 'm_role';
    protected $primaryKey = 'role_id';
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
            'role_id' => [
                'format' => 'RL.'.Auth::user()->universitas_id.'.?', // autonumber format. '?' will be replaced with the generated number.
                'length' => 3, // The number of digits in an autonumber
            ],
        ];
    }
    
    public function roleAccess(){
        return $this->hasMany(RoleAccess::class,'role_id','role_id');
    }
}
