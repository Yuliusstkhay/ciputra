@extends('template.header_footer') 
@section('css')
<link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet">
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
                <table id="dataTable" class="table table-hover" cellspacing="0" width="100%">
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
                        <tr>
                            <td>1</td>
                            <td>Gambar Teknik dan Permodelan<br>(Technical Drawing and 3D Modelling)</td>
                            <td>MK230001</td>
                            <td>Dr. Ir. Janti Gunawan, M.Eng.Sc., M.Com.IB.</td>
                            <td>Senin 09.00-11.00<br>Rabu 13.00-15.00</td>
                            <td>
                                <a class="btn cur-p btn-success" href="{{url('penilaian/aturPenilaian/asdasda')}}">   
                                    Atur Penilaian
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Entrepreneurship Essentials</td>
                            <td>MK220007</td>
                            <td>Dr. Ir. Janti Gunawan, M.Eng.Sc., M.Com.IB.</td>
                            <td>Selasa 09.00-11.00<br>Kamis 11.00-13.00</td>
                            <td>
                                <button type="button" class="btn cur-p btn-success">   
                                    Atur Penilaian
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Desain Ruang Kompak<br>(Compact Space Design)</td>
                            <td>MK230021</td>
                            <td>Dr. Ir. Janti Gunawan, M.Eng.Sc., M.Com.IB.</td>
                            <td>Jumat 07.00-09.00</td>
                            <td>
                                <button type="button" class="btn cur-p btn-success">
                                    Atur Penilaian
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@stop