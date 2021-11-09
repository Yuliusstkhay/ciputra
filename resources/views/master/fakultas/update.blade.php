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
    <h4 class="c-grey-900 mT-10 mB-30">Ubah Fakultas</h4>
    <div class="row">
        <div class="col-md-10 col-sm-12">
            <div class="bgc-white bd bdrs-3 p-20 mB-20">
                <form id="frm-fakultas" class="needs-validation" novalidate>
                    {{csrf_field()}}
                    <div class="form-group">
                        <label for="fakultas_name" class="text-normal text-dark">Fakultas</label> 
                        <input type="text" class="form-control" id="fakultas_name" name="fakultas_name" placeholder="Fakultas" value="{{$data->fakultas_name}}" required>
                        <div class="invalid-feedback">
                            Fakultas tidak boleh kosong.
                        </div>
                    </div>
                    <div class="form-group mb-5">
                        <div class="col-12">
                            <button class="btn btn-primary float-end col-2" id="btn-loading" type="button" disabled>
                                <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                                Menunggu...
                            </button>
                            <button class="btn btn-primary float-end col-md-2 col-sm-3" id="btn-submit">Perbarui</button>
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
var store = '{{route("fakultas.update",$data->fakultas_id)}}';
</script>
<script type="text/javascript" src="{{asset('js/fakultas/update.js')}}"></script>
@stop