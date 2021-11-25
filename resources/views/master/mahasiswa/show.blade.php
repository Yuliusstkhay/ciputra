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
    <h4 class="c-grey-900 mT-10 mB-30">Detail Mahasiswa</h4>
    <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('mahasiswa')}}">Fakultas</a></li>
                <li class="breadcrumb-item"><a href="{{url('mahasiswa/programstudi/'.$data->programStudi->fakultas_id)}}">Program Studi</a></li>
                <li class="breadcrumb-item"><a href="{{url('mahasiswa/mahasiswa/'.$data->programStudi->bidang_studi_id."_".$data->programStudi->fakultas->fakultas_id)}}">Master Mahasiswa</a></li>
                <li class="breadcrumb-item active" aria-current="page">Detail</li>
            </ol>
        </nav>
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
                                <label for="nip" class="text-normal text-dark">NIM</label> 
                                <input type="text" class="form-control" id="nip" name="nip" placeholder="NIM" value="{{$data->nip}}" disabled="" required>
                            </div>
                            <div class="form-group">
                                <label for="name" class="text-normal text-dark">Nama</label> 
                                <input type="text" class="form-control" id="name" name="name" placeholder="Nama" value="{{$data->name}}" disabled="" required>
                                
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-sm-12">
                            <div class="form-group">
                                <label for="email" class="text-normal text-dark">Email</label> 
                                <input type="email" class="form-control" id="email" name="email" placeholder="Email" value="{{$data->email}}" disabled="" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group mb-5">
                        <div class="col-12">
                            <a href="{{url('mahasiswa/mahasiswa/'.$data->programStudi->bidang_studi_id."_".$data->programStudi->fakultas->fakultas_id)}}" class="btn btn-dark float-start col-2">Kembali</a>
                            <a href="{{url('mahasiswa/getDataUpdate/'.$data->id)}}" class="btn btn-primary float-end col-md-2 col-lg-2 col-sm-3">Ubah Data</a>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</div>
@stop
@section('js')

@stop