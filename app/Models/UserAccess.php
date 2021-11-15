<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Auth;

class UserAccess extends Model
{
    use HasFactory;
    protected $table = 'm_user_access';
    protected $primaryKey = ['user_id','module_function_id'];
    public $incrementing = false;
    const CREATED_AT = 'dt_record';
    const UPDATED_AT = 'dt_modified';
    
    protected static function boot() {
        parent::boot();

        static::creating(function ($model) {
            $model->user_record = Auth::check() ? Auth::user()->user_id : '';
        });
    }
    
    public function fakultas(){
        return $this->hasOne(Fakultas::class,'fakultas_id','fakultas_id');
    }
    
    public function modulfunction(){
        return $this->hasOne(ModulFungsi::class,'module_function_id','module_function_id');
    }
}
