<?php

use App\Models\UserAccess;

function checkHakAkses($kode){
    
    $data = UserAccess::where('user_id',Auth::user()->user_id)->whereIn('module_function_id',$kode)->count();
    if($data > 0){
        return true;
    }else{
        return false;
    }
}

