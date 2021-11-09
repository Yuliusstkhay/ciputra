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
                                Gambar Teknik dan Permodelan
                            </h2>
                            <div class="row">
                                <div class="col-md-3 mT-20">
                                    <a>Mata Kuliah</a>
                                </div>
                                <div class="col-md-9 mT-20">
                                    <a>: Gambar Teknik dan Permodelan</a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <a>Kode Mata Kuliah</a>
                                </div>
                                <div class="col-md-9">
                                    <a>: MK230001</a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <a>Dosen Pengampu</a>
                                </div>
                                <div class="col-md-9">
                                    <a>: Dr. Ir. Janti Gunawan, M.Eng.Sc., M.Com.IB.</a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <a>Periode</a>
                                </div>
                                <div class="col-md-9">
                                    <a>: Gasal 2021/2022</a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <a>Jadwal</a>
                                </div>
                                <div class="col-md-9">
                                    <a>: Senin 09.00-11.00, Rabu 13.00-15.00</a>
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
                            <th>Item Penilaian</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Tugas</td>
                            <td>
                                <a class="btn cur-p btn-success" href="#">   
                                    Nilai
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Quiz 1</td>
                            <td>
                                <a class="btn cur-p btn-success" href="{{url('penilaian/item/asaasasa')}}">   
                                    Nilai
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>Quiz 2</td>
                            <td>
                                <a class="btn cur-p btn-success" href="#">   
                                    Nilai
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>UTS</td>
                            <td>
                                <a class="btn cur-p btn-success" href="#">   
                                    Nilai
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>UAS</td>
                            <td>
                                <a class="btn cur-p btn-success" href="#">   
                                    Nilai
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>Presentasi</td>
                            <td>
                                <a class="btn cur-p btn-success" href="#">   
                                    Nilai
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@stop