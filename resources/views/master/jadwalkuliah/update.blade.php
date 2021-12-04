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
<link rel="stylesheet" href="{{ asset('select2/dist/css/select2.min.css') }}">
@stop
@section('content')
<div class="container-fluid">
    <h4 class="c-grey-900 mT-10 mB-30">Ubah Jadwal Kuliah</h4>
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
                <form id="frm-jadwalkuliah" class="needs-validation" novalidate>
                    {{csrf_field()}}
                    <input type="hidden" name="program_studi_id" id="program_studi_id" value="{{$data->matakuliah->programStudi->bidang_studi_id}}"  />
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
                                <label for="mata_kuliah_id" class="text-normal text-dark">Mata Kuliah</label> 
                                <select class="form-control" id="mata_kuliah_id" style="width:100%;" name="mata_kuliah_id" required="">
                                    <option value="{{$data->matakuliah->mata_kuliah_id}}" selected="">{{$data->matakuliah->mata_kuliah_name}}</option>
                                </select>
                                <div class="invalid-feedback">
                                    Mata Kuliah harus dipilih.
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="kode_mata_kuliah" class="text-normal text-dark">Kode Mata Kuliah</label> 
                                <input type="text" class="form-control" id="kode_mata_kuliah" name="kode_mata_kuliah" value="{{$data->matakuliah->mata_kuliah_id}}" placeholder="Kode Mata Kuliah" disabled="">
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-sm-12">
                            <div class="form-group">
                                <label for="paralel" class="text-normal text-dark">Paralel</label> 
                                <select class="form-control selectwidth" style="width:100%;" id="paralel" name="paralel" required="">
                                    <option value="" selected="selected">Pilih Paralel</option>
                                    <option value="A">
                                        A
                                    </option>
                                    <option value="B">
                                        B
                                    </option>
                                    <option value="C">
                                        C
                                    </option>
                                    <option value="D">
                                        D
                                    </option>
                                    <option value="E">
                                        E
                                    </option>
                                    <option value="F">
                                        F
                                    </option>
                                    <option value="G">
                                        G
                                    </option>
                                    <option value="H">
                                        H
                                    </option>
                                    <option value="I">
                                        I
                                    </option>
                                    <option value="J">
                                        J
                                    </option>
                                    <option value="K">
                                        K
                                    </option>
                                    <option value="L">
                                        L
                                    </option>
                                    <option value="M">
                                        M
                                    </option>
                                    <option value="N">
                                        N
                                    </option>
                                    <option value="O">
                                        O
                                    </option>
                                    <option value="P">
                                        P
                                    </option>
                                    <option value="Q">
                                        Q
                                    </option>
                                    <option value="R">
                                        R
                                    </option>
                                    <option value="S">
                                        S
                                    </option>
                                    <option value="T">
                                        T
                                    </option>
                                    <option value="U">
                                        U
                                    </option>
                                    <option value="V">
                                        V
                                    </option>
                                    <option value="W">
                                        W
                                    </option>
                                    <option value="X">
                                        X
                                    </option>
                                    <option value="Y">
                                        Y
                                    </option>
                                    <option value="Z">
                                        Z
                                    </option>
                                </select>
                                <div class="invalid-feedback">
                                    Paralel harus dipilih.
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="dosen_pengampu" class="text-normal text-dark">Dosen Pengampu</label> 
                                <select class="form-control" id="dosen_pengampu" style="width:100%;" name="dosen_pengampu" required="">
                                    <option value="{{$data->dosenmahasiswa->id}}" selected="">{{$data->dosenmahasiswa->name}}</option>
                                </select>
                                <div class="invalid-feedback">
                                    Dosen Pengampu harus dipilih.
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="semester" class="text-normal text-dark">Semester</label> 
                                <select class="form-control" id="semester" style="width:100%;" name="semester" required="">
                                    <option value="{{$data->semester->semester_id}}">{{$data->semester->semester_name}}</option>
                                </select>
                                <div class="invalid-feedback">
                                    Semester harus dipilih.
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="jadwal_kuliah" class="text-normal text-dark">Jadwal Kuliah</label> 
                                <textarea class="form-control" name="jadwal_kuliah" id="jadwal_kuliah" rows="6" required="">{!! $data->deskripsi !!}</textarea>
                                <div class="invalid-feedback">
                                    Jadwal Kuliah harus diisi.
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group mb-5">
                        <div class="col-12">
                            <a href="{{url('jadwalkuliah/jadwalkuliah/'.$data->matakuliah->programStudi->bidang_studi_id."_".$data->matakuliah->programStudi->fakultas->fakultas_id)}}" class="btn btn-dark float-start col-lg-2 col-md-2 col-sm-4 d-none d-lg-block d-md-block d-print-block">Kembali</a>
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
var store = '{{route("jadwalkuliah.update",$data->jadwal_kuliah_id)}}';
var matkul = '{{route("jadwalkuliah.matkul",$data->matakuliah->programStudi->bidang_studi_id)}}';
var dosen = '{{route("jadwalkuliah.dosen",$data->matakuliah->programStudi->bidang_studi_id)}}';
var semester = '{{route("jadwalkuliah.semester")}}';
var paralel = '{{$data->paralel}}';
var urlx = '{{url("jadwalkuliah/jadwalkuliah/".$data->matakuliah->programStudi->bidang_studi_id."_".$data->matakuliah->programStudi->fakultas->fakultas_id)}}';
</script>
<script type="text/javascript" src="{{asset('js/jadwalkuliah/update.js')}}"></script>
@stop