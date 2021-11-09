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
    <h4 class="c-grey-900 mT-10 mB-30">Detail Dosen</h4>
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="bgc-white bd bdrs-3 p-20 mB-20">

                    <div class="row">
                        <div class="col-md-6 col-lg-6 col-sm-12">
                            <div class="form-group">
                                <label for="fakultas_id" class="text-normal text-dark">Fakultas</label> 
                                <input type="text" class="form-control" value="{{$data->programStudi->fakultas->fakultas_name}}" disabled="" />
                            </div>
                            <div class="form-group">
                                <label for="programstudi_name" class="text-normal text-dark">Program Studi</label> 
                                <input type="text" class="form-control" value="{{$data->programStudi->bidang_studi_name}}" disabled="" />
                            </div>
                            <div class="form-group">
                                <label for="nip" class="text-normal text-dark">NIP</label> 
                                <input type="text" class="form-control" id="nip" name="nip" placeholder="NIM" value="{{$data->nip}}" disabled="">
                            </div>
                            <div class="form-group">
                                <label for="name" class="text-normal text-dark">Nama</label> 
                                <input type="text" class="form-control" id="name" name="name" placeholder="Nama" value="{{$data->name}}" disabled="">
                                
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-sm-12">
                            <div class="form-group">
                                <label for="email" class="text-normal text-dark">Email</label> 
                                <input type="email" class="form-control" id="email" name="email" value="{{$data->email}}" disabled="" />
                            </div>
                            <div class="form-group">
                                <label for="jabatan" class="text-normal text-dark">Jabatan</label> 
                                <input type="jabatan" class="form-control" id="jabatan" name="jabatan" value="{{$data->jabatan}}" disabled="">
                            </div>
                        </div>
                    </div>
                    <div class="form-group mb-5">
                        <div class="col-12">
                            <a href="{{url('dosen/getDataUpdate/'.$data->id)}}" class="btn btn-primary float-end col-md-2 col-lg-2 col-sm-3">Ubah Data</a>
                        </div>
                    </div>

            </div>
        </div>
    </div>
</div>
@stop