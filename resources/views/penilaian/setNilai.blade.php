@extends('template.header_footer') 
@section('css')
<link href="{{asset('DataTables/datatables.min.css')}}" rel="stylesheet">
@stop
@section('content')
<div class="container-fluid">
    {{csrf_field()}}
                        <h4 class="c-grey-900 mT-10 mB-30">Penilaian</h4>
                        <div class="row">
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
                                                   {{$data->jadwal->matakuliah->mata_kuliah_name}}
                                                </h2>
                                                <div class="row">
                                                    <div class="col-md-3 mT-20">
                                                        <a>Mata Kuliah</a>
                                                    </div>
                                                    <div class="col-md-9 mT-20">
                                                        <a>: {{$data->jadwal->matakuliah->mata_kuliah_name}}</a>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <a>Kode Mata Kuliah</a>
                                                    </div>
                                                    <div class="col-md-9">
                                                        <a>: {{$data->jadwal->matakuliah->mata_kuliah_id}}</a>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <a>Dosen Pengampu</a>
                                                    </div>
                                                    <div class="col-md-9">
                                                        <a>: {{$data->jadwal->dosenmahasiswa->name}}</a>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <a>Periode</a>
                                                    </div>
                                                    <div class="col-md-9">
                                                        <a>: {{$data->jadwal->semester->semester_name}}</a>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <a>Jadwal</a>
                                                    </div>
                                                    <div class="col-md-9">
                                                        <a>: {{$data->jadwal->deskripsi}}</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Page title actions -->
                                            <div class="col-auto ms-auto d-print-none">
                                            </div>
                                        </div>
                                    </div>
                                    <table id="tbl-assessmentNilai" class="table table-hover" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Assessment</th>
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


@stop
@section('js')
<script type="text/javascript" src="{{asset('DataTables/datatables.min.js')}}"></script>
<script type="text/javascript">
    var list = '{{route("penilaian.listAssessment",$data->penilaian_id)}}';
</script>
<script type="text/javascript" src="{{asset('js/penilaian/assessment.js')}}"></script>
@stop