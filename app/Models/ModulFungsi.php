<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ModulFungsi extends Model
{
    use HasFactory;
    protected $table = 'm_module_function';
    protected $primaryKey = 'module_function_id';
    public $incrementing = false;
    const CREATED_AT = 'dt_record';
    const UPDATED_AT = 'dt_modified';
    
    public function modul(){
        return $this->hasOne(Modul::class,'module_id','module_id');
    }
    
    public function fungsi(){
        return $this->hasOne(Fungsi::class,'function_id','function_id');
    }
}
