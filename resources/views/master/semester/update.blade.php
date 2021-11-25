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
    <h4 class="c-grey-900 mT-10 mB-30">Ubah Semester</h4>
    <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('semester')}}">Semester</a></li>
                <li class="breadcrumb-item active" aria-current="page">Perbarui</li>
            </ol>
        </nav>
    <div class="row">
        <div class="col-md-10 col-sm-12">
            <div class="bgc-white bd bdrs-3 p-20 mB-20">
                <form id="frm-semester" class="needs-validation" novalidate>
                    {{csrf_field()}}
                    <div class="form-group">
                        <label for="semester_name" class="text-normal text-dark">Semester</label> 
                        <input type="text" class="form-control" id="semester_name" name="semester_name" placeholder="Semester" value="{{$data->semester_name}}" required>
                        <div class="invalid-feedback">
                            Semester tidak boleh kosong.
                        </div>
                    </div>
                    <div class="form-group mb-5">
                        <div class="col-12">
                            <a href="{{route('semester')}}" class="btn btn-dark float-start col-2">Kembali</a>
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
var store = '{{route("semester.update",$data->semester_id)}}';
var urlx = '{{route("semester")}}';
</script>
<script type="text/javascript" src="{{asset('js/semester/update.js')}}"></script>
@stop