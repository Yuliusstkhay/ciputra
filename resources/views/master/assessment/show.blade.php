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
    <h4 class="c-grey-900 mT-10 mB-30">Detail Assessment</h4>
    <div class="row">
        <div class="col-md-10 col-sm-12">
            <div class="bgc-white bd bdrs-3 p-20 mB-20">
                    {{csrf_field()}}
                    <div class="form-group">
                        <label for="assessment_name" class="text-normal text-dark">Assessment</label> 
                        <input type="text" class="form-control" id="assessment_name" name="assessment_name" value="{{$data->assessment_name}}" disabled="" placeholder="Assessment" required>
                    </div>
                    <div class="form-group mb-5">
                        <div class="col-12">
                            <a href="{{url('assesment/getDataUpdate/'.$data->assessment_id)}}" class="btn btn-primary float-end col-2">Ubah Data</a>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</div>
@stop
@section('js')

@stop