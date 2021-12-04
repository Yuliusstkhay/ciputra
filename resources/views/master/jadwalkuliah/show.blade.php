@extends('template.header_footer') 
@section('css')
<style>
    #btn-loading{
        display: none;
    }
    
    .selectwidth{
        width: 100%!important;
    }
</style>
@stop
@section('content')
<div class="container-fluid">
    <h4 class="c-grey-900 mT-10 mB-30">Detail Jadwal Kuliah</h4>
    <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('jadwalkuliah')}}">Fakultas</a></li>
                <li class="breadcrumb-item"><a href="{{url('jadwalkuliah/programstudi/'.$data->matakuliah->programStudi->fakultas_id)}}">Program Studi</a></li>
                <li class="breadcrumb-item"><a href="{{url('jadwalkuliah/jadwalkuliah/'.$data->matakuliah->programStudi->bidang_studi_id."_".$data->matakuliah->programStudi->fakultas->fakultas_id)}}">Jadwal Kuliah</a></li>
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
                                <input type="text" class="form-control" value="{{$data->matakuliah->programStudi->fakultas->fakultas_name}}" disabled="" />
                            </div>
                            <div class="form-group">
                                <label for="programstudi_name" class="text-normal text-dark">Program Studi</label> 
                                <input type="text" class="form-control" value="{{$data->matakuliah->programStudi->bidang_studi_name}}" disabled="" />
                            </div>
                            <div class="form-group">
                                <label for="kode_mata_kuliah" class="text-normal text-dark">Kode Mata Kuliah</label> 
                                <input type="text" class="form-control" value="{{$data->matakuliah->mata_kuliah_id}}" disabled="" />
                            </div>
                            <div class="form-group">
                                <label for="mata_kuliah_id" class="text-normal text-dark">Mata Kuliah</label> 
                                <input type="text" class="form-control" value="{{$data->matakuliah->mata_kuliah_name}}" disabled="" />
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-sm-12">
                            <div class="form-group">
                                <label for="paralel" class="text-normal text-dark">Paralel</label> 
                                <input type="text" class="form-control" value="{{$data->paralel}}" disabled="" />
                            </div>
                            <div class="form-group">
                                <label for="dosen_pengampu" class="text-normal text-dark">Dosen Pengampu</label> 
                                <input type="text" class="form-control" value="{{$data->dosenmahasiswa->name}}" disabled="" />
                            </div>
                            <div class="form-group">
                                <label for="semester" class="text-normal text-dark">Semester</label> 
                                 <input type="text" class="form-control" value="{{$data->semester->semester_name}}" disabled="" />
                            </div>
                            <div class="form-group">
                                <label for="jadwal_kuliah" class="text-normal text-dark">Jadwal Kuliah</label> 
                                <textarea class="form-control" name="jadwal_kuliah" id="jadwal_kuliah" rows="6" required="" disabled="">{!! $data->deskripsi !!}</textarea>
                                
                            </div>
                        </div>
                    </div>
                    <div class="form-group mb-5">
                        <div class="col-12">
                            <a href="{{url('jadwalkuliah/jadwalkuliah/'.$data->matakuliah->programStudi->bidang_studi_id."_".$data->matakuliah->programStudi->fakultas->fakultas_id)}}" class="btn btn-dark float-start col-lg-2 col-md-2 col-sm-4 d-none d-lg-block d-md-block d-print-block">Kembali</a>
                            <a href="{{url('jadwalkuliah/getDataUpdate/'.$data->jadwal_kuliah_id)}}" class="btn btn-primary float-end col-lg-2 col-md-2 col-sm-4">Ubah Data</a>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</div>
@stop
