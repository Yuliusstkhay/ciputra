<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\ModuleChildResource;
use App\Models\Modul;

class ModuleFunctionResource extends JsonResource
{

    
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        $modul = Modul::where('is_visible',1)->where('parent_id',$this->module_id)->get();
        return [
            'module_id'=>$this->module_id,
            'module_name'=>$this->module_name,
            'child'=> ModuleChildResource::collection($modul)
        ];
    }
}
