<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Modul extends Model {

    use HasFactory;

    protected $table = 'm_module';
    protected $primaryKey = 'module_id';
    public $incrementing = false;

    const CREATED_AT = 'dt_record';
    const UPDATED_AT = 'dt_modified';

    public function child() {
        return $this->hasMany(Modul::class,'parent_id','module_id');
    }

    public function modulfungsi() {
        return $this->hasMany(ModulFungsi::class, 'module_id', 'module_id');
    }

}
