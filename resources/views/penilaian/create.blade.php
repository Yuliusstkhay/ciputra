@extends('template.header_footer') 
@section('css')
<link href="{{asset('DataTables/datatables.min.css')}}" rel="stylesheet">
@stop
@section('content')
<div class="container-fluid">
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
                                Daftar Mata Kuliah Diampu
                            </h2>
                        </div>
                        <!-- Page title actions -->
                        <div class="col-auto ms-auto d-print-none">
                        </div>
                    </div>
                </div>
                <table id="tbl-jadwalkuliah" class="table table-hover" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Mata Kuliah</th>
                            <th>Kode Mata Kuliah</th>
                            <th>Dosen Pengampu</th>
                            <th>Jadwal</th>
                            <th>Penilaian</th>
                        </tr>
                    </thead>
                    <tbody>
<!--                        <tr>
                            <td>1</td>
                            <td>Gambar Teknik dan Permodelan<br>(Technical Drawing and 3D Modelling)</td>
                            <td>MK230001</td>
                            <td>Dr. Ir. Janti Gunawan, M.Eng.Sc., M.Com.IB.</td>
                            <td>Senin 09.00-11.00<br>Rabu 13.00-15.00</td>
                            <td>
                                <a class="btn cur-p btn-success" href="./add-penilaian.html">   
                                    Atur Penilaian
                                </a>
                            </td>
                        </tr>-->

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
        var list = '{{route("penilaian.jadwalkuliah")}}';
    </script>
    <script type="text/javascript" src="{{asset('js/penilaian/create.js')}}"></script>
    @stop