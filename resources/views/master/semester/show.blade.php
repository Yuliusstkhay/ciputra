@extends('template.header_footer') 
@section('css')
<style>
    #btn-loading{
        display: none;
    }
    .text-besar{
        font-size: 18px!important;
    }
</style>
@stop
@section('content')
<div class="container-fluid">
    <h4 class="c-grey-900 mT-10 mB-30">Detail Semester</h4>
    <div class="row">
        <div class="col-md-10 col-sm-12">
            <div class="bgc-white bd bdrs-3 p-20 mB-20">

                    <div class="form-group">
                        <label for="semester_name" class="text-normal text-dark text-besar">Semester:</label> 
                        <input type="text" class="form-control" id="semester_name" name="semester_name" value="{{$data->semester_name}}" placeholder="Semester" disabled> 
                    </div>

                    <div class="form-group mb-5">
                        <div class="col-12">
                            <a href="{{url('semester/getDataUpdate/'.$data->semester_id)}}" class="btn btn-primary float-end col-2">Ubah Data</a>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</div>
@stop
@section('js')

@stop