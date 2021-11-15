<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Auth;

class RoleAccess extends Model
{
    use HasFactory;
    protected $table = 'm_role_access';
    protected $primaryKey = ['role_id','module_function_id'];
    public $incrementing = false;
    const CREATED_AT = 'dt_record';
    const UPDATED_AT = 'dt_modified';
    
    protected static function boot() {
        parent::boot();

        static::creating(function ($model) {
            $model->user_record = Auth::check() ? Auth::user()->user_id : '';
        });
    }
}
