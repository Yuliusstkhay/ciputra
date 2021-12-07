@extends('template.header_footer') 
@section('css')
<style>
    #btn-loading{
        display: none;
    }
</style>
<link rel="stylesheet" href="{{ asset('select2/dist/css/select2.min.css') }}">
@stop
@section('content')
<div class="container-fluid">
    <h4 class="c-grey-900 mT-10 mB-30">Ubah Program Studi</h4>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('programstudi')}}">Master Program Studi</a></li>
            <li class="breadcrumb-item active" aria-current="page">Ubah</li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-10 col-sm-12">
            <div class="bgc-white bd bdrs-3 p-20 mB-20">
                <form id="frm-programstudi" class="needs-validation" novalidate>
                    {{csrf_field()}}
                    <div class="form-group">
                        <label for="fakultas_id" class="text-normal text-dark">Fakultas</label> 
                        <select class="form-control" style="width:100%" name="fakultas_id" id="fakultas_id" required="">
                            <option value="{{$data->fakultas_id}}">{{$data->fakultas->fakultas_name}}</option>
                        </select>
                        <div class="invalid-feedback">
                            Fakultas tidak boleh kosong.
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="programstudi_name" class="text-normal text-dark">Program Studi</label> 
                        <input type="text" class="form-control" id="programstudi_name" name="programstudi_name" placeholder="Program Studi" value="{{$data->bidang_studi_name}}" required>
                        <div class="invalid-feedback">
                            Program Studi tidak boleh kosong.
                        </div>
                    </div>
                    <div class="form-group mb-5">
                        <div class="col-12">
                            <a href="{{route('programstudi')}}" class="btn btn-dark float-start col-lg-2 col-md-2 col-sm-4 d-none d-lg-block d-md-block d-print-block">Kembali</a>
                            <button class="btn btn-primary float-end col-lg-2 col-md-2 col-sm-4" id="btn-loading" type="button" disabled>
                                <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                                Menunggu...
                            </button>
                            <button class="btn btn-primary float-end col-lg-2 col-md-2 col-sm-4" id="btn-submit">Perbarui</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@stop
@section('js')
<script type="text/javascript" src="{{asset('select2/dist/js/select2.min.js')}}"></script>
<script type="text/javascript">
var store = '{{route("programstudi.update",$data->bidang_studi_id)}}';
var fakultas = '{{route("programstudi.getfakultas")}}';
var urlx = '{{route("programstudi")}}';
</script>
<script type="text/javascript" src="{{asset('js/programstudi/update.js')}}"></script>
@stop