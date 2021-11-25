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
    <h4 class="c-grey-900 mT-10 mB-30">Detail Master Mata Kuliah</h4>
    <div class="row">
        <div class="col-md-10 col-sm-12">
            <div class="bgc-white bd bdrs-3 p-20 mB-20">
                <form id="frm-programstudi" class="needs-validation" novalidate>
                    {{csrf_field()}}
                    <div class="form-group">
                        <label for="fakultas_id" class="text-normal text-dark">Fakultas</label> 
                        <input type="text" class="form-control" value="{{$data->programstudi->fakultas->fakultas_name}}" disabled="" />
                    </div>
                    <div class="form-group">
                        <label for="programstudi_name" class="text-normal text-dark">Program Studi</label> 
                        <input type="text" class="form-control" value="{{$data->programstudi->bidang_studi_name}}" disabled="" />
                    </div>
                    <div class="form-group">
                        <label for="mata_kuliah_name" class="text-normal text-dark">Mata Kuliah</label> 
                        <input type="text" class="form-control" id="mata_kuliah_name" name="mata_kuliah_name" value="{{$data->mata_kuliah_name}}" disabled="" placeholder="Mata Kuliah" required>
                    </div>
                    <div class="form-group mb-5">
                        <div class="col-12">
                            <a href="{{url('matakuliah/matkul/'.$data->programstudi->bidang_studi_id."_".$data->programstudi->fakultas_id)}}" class="btn btn-dark float-start col-2">Kembali</a>
                            <a href="{{url('matakuliah/getDataUpdate/'.$data->mata_kuliah_id)}}" class="btn btn-primary float-end col-md-2 col-lg-2 col-sm-3">Ubah Data</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@stop
@section('js')
@stop