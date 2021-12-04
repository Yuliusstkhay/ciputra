@extends('template.header_footer') 
@section('css')
<link href="{{asset('DataTables/datatables.min.css')}}" rel="stylesheet">
@stop
@section('content')
<div class="container-fluid">
    <h4 class="c-grey-900 mT-10 mB-30">
        Laporan Global

    </h4>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('laporan.global')}}">Laporan</a></li>
                <li class="breadcrumb-item active" aria-current="page">Global</li>
            </ol>
    </nav>
    <div class="row">
        {{csrf_field()}}
        <div class="col-md-12">
            <div class="bgc-teal-500 c-white pT-20 pB-20 pL-20 pR-10">
                <div class="peers ai-c jc-sb">
                    <div class="peer peer-greed">
                        <div class="col">
                            <!-- Page pre-title -->
                            <div class="page-pretitle">
                                Sistem Penilaian Mahasiswa
                            </div>
                            <h2 class="page-title">
                                {{$data->jadwal->matakuliah->mata_kuliah_name}}
                            </h2>
                            <div class="row">
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="row">
                                        <div class="col-4 mT-20">
                                            <a>Fakultas</a>
                                        </div>
                                        <div class="col-8 mT-20">
                                            <a>: {{$data->jadwal->matakuliah->programstudi->fakultas->fakultas_name}}</a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4">
                                            <a>Program Studi</a>
                                        </div>
                                        <div class="col-8">
                                            <a>: {{$data->jadwal->matakuliah->programstudi->bidang_studi_name}}</a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4">
                                            <a>Mata Kuliah</a>
                                        </div>
                                        <div class="col-8">
                                            <a>: {{$data->jadwal->matakuliah->mata_kuliah_name}}</a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4">
                                            <a>Parallel</a>
                                        </div>
                                        <div class="col-8">
                                            <a>: {{$data->jadwal->paralel}}</a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4">
                                            <a>Kode Mata Kuliah</a>
                                        </div>
                                        <div class="col-8">
                                            <a>: {{$data->jadwal->matakuliah->mata_kuliah_id}}</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="row">
                                        <div class="col-4 mT-20">
                                            <a>Dosen Pengampu</a>
                                        </div>
                                        <div class="col-8 mT-20">
                                            <a>: {{$data->jadwal->dosenmahasiswa->name}}</a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4">
                                            <a>Periode</a>
                                        </div>
                                        <div class="col-8">
                                            <a>: {{$data->jadwal->semester->semester_name}}</a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4">
                                            <a>Jadwal</a>
                                        </div>
                                        <div class="col-8">
                                            <a>: {{$data->jadwal->deskripsi}}</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="bgc-white bd bdrs-3 p-20 mB-20">
                <div class="page-header d-print-none mB-20">
                    <div class="row align-items-center">
                        <!-- Page title actions -->
                        <div class="col-auto ms-auto">
                            <div class="btn-list">
                                @if(checkHakAkses(["R01.07"]))
                                <a href="{{route('laporan.excel',$data->penilaian_id)}}" class="btn btn-info">
                                  Export Excel
                                </a>
                                @endif
                                <a href="{{route('laporan.assessmentreport',$data->penilaian_id)}}" class="btn btn-success">
                                    Laporan Assessment
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <table id="tbl-laporanglobal" class="table table-hover" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Nama Mahasiswa</th>
                            <th>NIM</th>
                            <th>Nilai Akhir</th>
                            <!--<th>Aksi</th>-->
                        </tr>
                    </thead>
                    <tbody>
                       
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@stop
@section('js')
<script type="text/javascript" src="{{asset('DataTables/datatables.min.js')}}"></script>
<script type="text/javascript">
    var list = '{{route("laporan.listGlobal",$data->penilaian_id)}}';
</script>
<script type="text/javascript" src="{{asset('js/laporan/global/index.js')}}"></script>
@stop