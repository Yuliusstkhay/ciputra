@extends('template.header_footer') 
@section('css')
@stop
@section('content')
<div class="container-fluid">
    <h4 class="c-grey-900 mT-10 mB-30">Detail Program Studi</h4>
    <div class="row">
        <div class="col-md-10 col-sm-12">
            <div class="bgc-white bd bdrs-3 p-20 mB-20">
                    <div class="form-group">
                        <label for="fakultas_id" class="text-normal text-dark">Fakultas</label> 
                        <input type="text" class="form-control" value="{{$data->fakultas->fakultas_name}}" disabled="" />
                    </div>
                    <div class="form-group">
                        <label for="programstudi_name" class="text-normal text-dark">Program Studi</label> 
                        <input type="text" class="form-control" value="{{$data->bidang_studi_name}}" disabled="">
                    </div>
                    <div class="form-group mb-5">
                        <div class="col-12">
                            <a href="{{url('programstudi/getDataUpdate/'.$data->bidang_studi_id)}}" class="btn btn-primary float-end col-md-2 col-lg-2 col-sm-3">Ubah Data</a>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</div>
@stop
@section('js')
@stop