@extends('template.header_footer') 
@section('css')
<style>
    #btn-loading{
        display: none;
    }
</style>
@stop
@section('content')
<div class="container-fluid">
    <h4 class="c-grey-900 mT-10 mB-30">Detail Universitas</h4>
    <div class="row">
        <div class="col-md-10 col-sm-12">
            <div class="bgc-white bd bdrs-3 p-20 mB-20">
                    {{csrf_field()}}
                    <div class="form-group">
                        <label for="universitas_name" class="text-normal text-dark">Universitas</label> 
                        <input type="text" class="form-control" id="universitas_name" name="universitas_name" placeholder="Universitas" value="{{$data->universitas_name}}" disabled="" required>
                    </div>
                    <div class="form-group mb-5">
                        <div class="col-12">
                            <a href="{{route('universitas')}}" class="btn btn-dark float-start col-2">Kembali</a>
                            <a href="{{url('universitas/getDataUpdate/'.$data->universitas_id)}}" class="btn btn-primary float-end col-2">Ubah Data</a>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</div>
@stop
@section('js')

@stop