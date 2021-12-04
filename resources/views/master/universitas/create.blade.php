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
    <h4 class="c-grey-900 mT-10 mB-30">Tambah Universitas</h4>
    <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('universitas')}}">Master Universitas</a></li>
                <li class="breadcrumb-item active" aria-current="page">Tambah</li>
            </ol>
        </nav>
    <div class="row">
        <div class="col-md-10 col-sm-12">
            <div class="bgc-white bd bdrs-3 p-20 mB-20">
                <form id="frm-universitas" class="needs-validation" novalidate>
                    {{csrf_field()}}
                    <div class="form-group">
                        <label for="universitas_name" class="text-normal text-dark">Universitas</label> 
                        <input type="text" class="form-control" id="universitas_name" name="universitas_name" placeholder="Universitas" required>
                        <div class="invalid-feedback">
                            Universitas tidak boleh kosong.
                        </div>
                    </div>
                    <div class="form-group mb-5">
                        <div class="col-12">
                            <a href="{{route('universitas')}}" class="btn btn-dark float-start col-lg-2 col-md-2 col-sm-4 d-none d-lg-block d-md-block d-print-block">Kembali</a>
                            <button class="btn btn-primary float-end col-lg-2 col-md-2 col-sm-4" id="btn-loading" type="button" disabled>
                                <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                                Menunggu...
                            </button>
                            <button class="btn btn-primary float-end col-lg-2 col-md-2 col-sm-4" id="btn-submit">Simpan</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@stop
@section('js')
<script type="text/javascript">
var store = '{{route("universitas.store")}}';
var urlx = '{{route("universitas")}}';
</script>
<script type="text/javascript" src="{{asset('js/universitas/store.js')}}"></script>
@stop