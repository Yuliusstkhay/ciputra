@extends('template.header_footer') 
@section('css')
<style>
    #btn-loading{
        display: none;
    }
    
</style>
<link href="{{asset('DataTables/datatables.min.css')}}" rel="stylesheet">
@stop
@section('content')
<div class="container-fluid">
    <h4 class="c-grey-900 mT-10 mB-30">Peserta Kuliah</h4>
    <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('jadwalkuliah')}}">Fakultas</a></li>
                <li class="breadcrumb-item"><a href="{{url('jadwalkuliah/programstudi/'.$data->matakuliah->programStudi->fakultas_id)}}">Program Studi</a></li>
                <li class="breadcrumb-item"><a href="{{url('jadwalkuliah/jadwalkuliah/'.$data->matakuliah->programStudi->bidang_studi_id."_".$data->matakuliah->programStudi->fakultas->fakultas_id)}}">Jadwal Kuliah</a></li>
                <li class="breadcrumb-item active" aria-current="page">Detail</li>
            </ol>
        </nav>
    <div class="row">
        {{csrf_field()}}
        <div class="col-md-12">
            <div class="bgc-white bd bdrs-3 p-20 mB-20">
                <div class="page-header d-print-none mB-20">
                    <div class="row align-items-center">
                        <div class="col">
                            <!-- Page pre-title -->
                            <div class="page-pretitle">
                                Sistem Penilaian Mahasiswa
                            </div>
                            <h2 class="page-title">
                                {{$data->matakuliah->mata_kuliah_name}}
                            </h2>
                            <div class="row">
                                <div class="col-md-3 mT-20">
                                    <a>Fakultas</a>
                                </div>
                                <div class="col-md-9 mT-20">
                                    <a>: {{$data->matakuliah->programstudi->fakultas->fakultas_name}}</a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <a>Program Studi</a>
                                </div>
                                <div class="col-md-9">
                                    <a>: {{$data->matakuliah->programstudi->bidang_studi_name}}</a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <a>Mata Kuliah</a>
                                </div>
                                <div class="col-md-9">
                                    <a>: {{$data->matakuliah->mata_kuliah_name}}</a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <a>Kode Mata Kuliah</a>
                                </div>
                                <div class="col-md-9">
                                    <a>: {{$data->matakuliah->mata_kuliah_id}}</a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <a>Paralel</a>
                                </div>
                                <div class="col-md-9">
                                    <a>: {{$data->paralel}}</a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <a>Dosen Pengampu</a>
                                </div>
                                <div class="col-md-9">
                                    <a>: {{$data->dosenmahasiswa->name}}</a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <a>Periode</a>
                                </div>
                                <div class="col-md-9">
                                    <a>: {{$data->semester->semester_name}}</a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <a>Jadwal</a>
                                </div>
                                <div class="col-md-9">
                                    <a>: {!! $data->deskripsi !!}</a>
                                </div>
                            </div>
                        </div>
                        <!-- Page title actions -->
                        <div class="col-auto ms-auto d-print-none mT-160">
                            <div class="btn-list">
                                <a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-report">
                                    <!-- Download SVG icon from http://tabler-icons.io/i/download -->
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="16" height="16" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" /><polyline points="7 11 12 16 17 11" /><line x1="12" y1="4" x2="12" y2="16" /></svg>                                                        Import
                                </a>
                                <a href="#" class="btn btn-info d-none d-sm-inline-block btn-peserta" data-toggle="modal" data-target="#modal-add">
                                    <!-- Download SVG icon from http://tabler-icons.io/i/plus -->
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="18" height="18" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                    <line x1="12" y1="5" x2="12" y2="19" />
                                    <line x1="5" y1="12" x2="19" y2="12" />
                                    </svg> Tambah Peserta
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <table id="tbl-peserta" class="table table-hover" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Nama Mahasiswa</th>
                            <th>NIM</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modal-add" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Tambah Peserta Kuliah</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <table id="tbl-mahasiswa" class="table table-hover" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input " id="checkAll"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </th>
                            <th>No</th>
                            <th>Nama Mahasiswa</th>
                            <th>NIM</th>
                            <th>Program Studi</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                <button class="btn btn-primary float-end col-2" id="btn-loading" type="button" disabled>
                    <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                    Menunggu...
                </button>
                <button type="button" class="btn btn-primary" id="btn-addpeserta" disabled="">Tambahkan</button>
            </div>
        </div>
    </div>
</div>
@stop
@section('js')
<script type="text/javascript" src="{{asset('DataTables/datatables.min.js')}}"></script>
<script type="text/javascript">
var list = '{{route("jadwalkuliah.pesertaData",$data->jadwal_kuliah_id)}}';
var mahasiswa = '{{route("jadwalkuliah.mahasiswaAll",$data->jadwal_kuliah_id)}}';
var store= '{{route("jadwalkuliah.storePeserta",$data->jadwal_kuliah_id)}}';
var nonaktif = '{{url("jadwalkuliah/removePeserta")}}';
</script>
<script type="text/javascript" src="{{asset('js/jadwalkuliah/peserta.js')}}"></script>
@stop