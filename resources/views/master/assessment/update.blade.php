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
    <h4 class="c-grey-900 mT-10 mB-30">Ubah Assessment</h4>
    <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('assesment')}}">Master Assessment</a></li>
                <li class="breadcrumb-item active" aria-current="page">Perbarui</li>
            </ol>
        </nav>
    <div class="row">
        <div class="col-md-10 col-sm-12">
            <div class="bgc-white bd bdrs-3 p-20 mB-20">
                <form id="frm-assessment" class="needs-validation" novalidate>
                    {{csrf_field()}}
                    <div class="form-group">
                        <label for="assessment_name" class="text-normal text-dark">Assessment</label> 
                        <input type="text" class="form-control" id="assessment_name" name="assessment_name" placeholder="Assessment" value="{{$data->assessment_name}}" required>
                        <div class="invalid-feedback">
                            Assessment tidak boleh kosong.
                        </div>
                    </div>
                    <div class="form-group mb-5">
                        <div class="col-12">
                            <a href="{{route('assesment')}}" class="btn btn-dark float-start col-2">Kembali</a>
                            <button class="btn btn-primary float-end col-2" id="btn-loading" type="button" disabled>
                                <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                                Menunggu...
                            </button>
                            <button class="btn btn-primary float-end col-2" id="btn-submit">Perbarui</button>
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
var store = '{{route("assesment.update",$data->assessment_id)}}';
var urlx = '{{route("assesment")}}';
</script>
<script type="text/javascript" src="{{asset('js/assessment/update.js')}}"></script>
@stop