<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class SemesterResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id'=>$this->semester_id,
            'text'=>$this->semester_name
        ];
    }
}
