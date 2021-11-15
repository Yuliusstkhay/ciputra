<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use DB;
use App\Http\Resources\ModuleChildTwoResource;

class ModuleChildResource extends JsonResource
{
    
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        $query = 'select mf.module_function_id,mf.module_id,mf.function_id,
                    mfn.function_name,
                    (CASE
                            WHEN ra.role_id IS NULL THEN NULL
                            ELSE "checked"

                    END) as checkStatus
                    from m_module_function mf
                    INNER JOIN m_function mfn on mf.function_id = mfn.function_id
                    left JOIN m_role_access ra on mf.module_function_id = ra.module_function_id and ra.role_id="'.$request->id.'" 
                    where mf.module_id="'.$this->module_id.'"
                    ';
        $select = DB::select($query);
        
        return [
            'module_id'=>$this->module_id,
            'module_name'=>$this->module_name,
            'modulfungsi'=> ModuleChildTwoResource::collection($select)
        ];
    }
}
