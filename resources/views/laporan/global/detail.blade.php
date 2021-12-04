@extends('template.header_footer') 
@section('css')
<link href="{{asset('DataTables/datatables.min.css')}}" rel="stylesheet">
<link rel="stylesheet" href="{{ asset('select2/dist/css/select2.min.css') }}">
@stop
@section('content')
<div class="container-fluid">
    <h4 class="c-grey-900 mT-10 mB-30">
        Laporan Detail
    </h4>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('laporan.global')}}">Laporan</a></li>
                <li class="breadcrumb-item"><a href="{{route('laporan.globalreport',$data->penilaian_id)}}">Global</a></li>
                <li class="breadcrumb-item"><a href="{{route('laporan.assessmentreport',$data->penilaian_id)}}">Assessment</a></li>
                <li class="breadcrumb-item active" aria-current="page">Assessment</li>
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
                       <h2>{{$mahasiswa->name}} ({{$mahasiswa->nip}})</h2>
                    </div>
                </div>
                <form>
                    <div class="row">
                        <div class="col-lg-6 col-md-12">
                            <div class="form-group mb-3 row mT-10">
                                <label class="form-label col-3 col-form-label">Assessment</label>
                                <div class="col">
                                    <select id="assessment" style="width:100%" class="form-control">
                                        <option value="all" selected="">Semua</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12">
                            <div class="form-group mb-3 row mT-10">
                                <label class="form-label col-3 col-form-label">Item Penilaian</label>
                                <div class="col">
                                    <select id="itempenilaian" style="width:100%" class="form-control">
                                        <option value="all" selected="">Semua</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <table id="tbl-laporandetail" class="table table-hover" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Assessment</th>
                            <th>Item Penilaian</th>
                            <th>Penilai</th>
                            <th>Nilai</th>
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
<div class="modal fade" id="modal-catatan-tugas" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Catatan</h5>
                    <button type="button" class="close btnclose" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
                </div>
                <div class="modal-body">
<!--                    <div class="bgc-teal-500 c-white pT-20 pB-20 pL-20 pR-10">
                        <div class="peers ai-c jc-sb">
                            <div class="peer peer-greed">
                                <div class="col">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-12">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <a>Mata Kuliah</a>
                                                </div>
                                                <div class="col-md-8">
                                                    <a>: Gambar Teknik dan Permodelan</a>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <a>Dosen Pengampu</a>
                                                </div>
                                                <div class="col-md-8">
                                                    <a>: Dr. Ir. Janti Gunawan, M.Eng.Sc., M.Com.IB.</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-12">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <a>Assessment</a>
                                                </div>
                                                <div class="col-md-8">
                                                    <a>: Tugas</a>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <a>Penilai</a>
                                                </div>
                                                <div class="col-md-8">
                                                    <a>: Dr. Ir. Janti Gunawan, M.Eng.Sc., M.Com.IB.</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>-->
                    <div class="bgc-white bd bdrs-3 p-20 mB-20">
                        <form>
                            <div class="row align-items-center">
                                <div class="col-12">
                                    <p class="catatan" style="text-align: left;font-weight: 500;"></p>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btnclose" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
@stop
@section('js')
<script type="text/javascript" src="{{asset('select2/dist/js/select2.min.js')}}"></script>
<script type="text/javascript" src="{{asset('DataTables/datatables.min.js')}}"></script>
<script type="text/javascript">
    var assessment = '{{route("laporan.assessment",$data->penilaian_id)}}';
    var itempenilaian = '{{route("laporan.itempenilaian",$data->penilaian_id)}}';
    var list = '{{url("LaporanGlobal/dataDetailReport/".$data->penilaian_id."/".$mahasiswa->id)}}';
</script>
<script type="text/javascript" src="{{asset('js/laporan/global/detail.js')}}"></script>
@stop