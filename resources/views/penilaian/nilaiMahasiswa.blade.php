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
    <h4 class="c-grey-900 mT-10 mB-30">Penilaian</h4>
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
                            <a href="{{url('penilaian/assessment/'.$data->penilaian_id)}}">
                                <button type="button" class="btn btn-secondary btn-lg mr-0" style="float: right;">Kembali</button>
                            </a>
                            <h2 class="page-title">
                                {{$data->assessment->assessment_name}}
                            </h2>
                            <div class="row">
                                <div class="col-md-3 mT-20">
                                    <a>Mata Kuliah</a>
                                </div>
                                <div class="col-md-9 mT-20">
                                    <a>: {{$data->penilaian->jadwal->matakuliah->mata_kuliah_name}}</a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <a>Kode Mata Kuliah</a>
                                </div>
                                <div class="col-md-9">
                                    <a>: {{$data->penilaian->jadwal->matakuliah->mata_kuliah_id}}</a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <a>Dosen Pengampu</a>
                                </div>
                                <div class="col-md-9">
                                    <a>: {{$data->penilaian->jadwal->dosenmahasiswa->name}}</a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <a>Periode</a>
                                </div>
                                <div class="col-md-9">
                                    <a>: {{$data->penilaian->jadwal->semester->semester_name}}</a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <a>Jadwal</a>
                                </div>
                                <div class="col-md-9">
                                    <a>: {{$data->penilaian->jadwal->deskripsi}}</a>
                                </div>
                            </div>
                        </div>
                        <!-- Page title actions -->
                        <div class="col-auto ms-auto d-print-none">
                        </div>
                    </div>
                </div>
                <table id="dataTable" class="table table-hover" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Nama Mahasiswa</th>
                            <th>NIM</th>
                            @foreach($item as $key => $row)
                            <th>{{$row->item_penilaian}}</th>
                            @endforeach
                            <th>Catatan</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($mahasiswa as $key => $row)
                        <tr>
                            <td style="vertical-align:middle">{{$key+1}}</td>
                            <td style="vertical-align:middle">
                                {{$row->mahasiswa->name}}
                            </td>
                            <td style="vertical-align:middle">
                                {{$row->mahasiswa->nip}}
                            </td>
                            @foreach($item as $x => $y)
                            <td style="width: 100px;">
                                <input type="number" class="form-control nilai" data-mahasiswa="{{$row->mahasiswa->id}}" data-id="{{$y->id}}" value="{{$row->getNilai($y->id,$row->mahasiswa->id)}}" id="nilai-{{$row->mahasiswa->id}}-{{$y->id}}" placeholder="Nilai">
                            </td>            
                            @endforeach
                            <td>
                                <textarea class="form-control catatan" data-mahasiswa="{{$row->mahasiswa->id}}" id="catatan-{{$row->mahasiswa->id}}" rows="3"></textarea>
                            </td>
                        </tr>        
                        @endforeach        
                       
                    </tbody>
                </table>
                <div class="row mt-5">
                    <div class="col-12">
                        <button class="btn btn-primary btn-lg float-end col-2" id="btn-loading" type="button" disabled>
                        <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                        Menunggu...
                    </button>
                    <button type="button" class="btn btn-primary btn-lg float-end" id="btnSimpan">Simpan</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@stop
@section('js')
<script type="text/javascript" src="{{asset('DataTables/datatables.min.js')}}"></script>
<script type="text/javascript">
    var store = '{{route("penilaian.storeNilai")}}';
    var urlx = '{{url("penilaian/assessment/".$data->penilaian_id)}}'
</script>
<script type="text/javascript" src="{{asset('js/penilaian/storeNilai.js')}}"></script>
@stop