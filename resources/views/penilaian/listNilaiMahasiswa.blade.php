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
                            <a href="{{url('penilaian/asdsadad')}}">
                                <button type="button" class="btn btn-secondary btn-lg mr-0" style="float: right;">Back</button>
                            </a>
                            <h2 class="page-title">
                                Quiz 1
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
                            <th>Nama Mahasiswa</th>
                            <th>NIM</th>
                            <th>Nilai</th>
                            <th>Catatan</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="vertical-align:middle">1</td>
                            <td style="vertical-align:middle">
                                Tiger Nixon
                            </td>
                            <td style="vertical-align:middle">
                                02.23.21.02.001
                            </td>
                            <td style="width: 100px;">
                                <input type="number" class="form-control" name="example-text-input" placeholder="Nilai">
                            </td>
                            <td>
                                <input type="text" class="form-control" name="example-text-input" placeholder="Catatan">
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:middle">2</td>
                            <td style="vertical-align:middle">
                                Garrett Winters
                            </td>
                            <td style="vertical-align:middle">
                                02.23.21.02.002
                            </td>
                            <td style="width: 100px;">
                                <input type="number" class="form-control" name="example-text-input" placeholder="Nilai">
                            </td>
                            <td>
                                <input type="text" class="form-control" name="example-text-input" placeholder="Catatan">
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:middle">3</td>
                            <td style="vertical-align:middle">
                                Ashton Cox
                            </td>
                            <td style="vertical-align:middle">
                                02.23.21.02.003
                            </td>
                            <td style="width: 100px;">
                                <input type="number" class="form-control" name="example-text-input" placeholder="Nilai">
                            </td>
                            <td>
                                <input type="text" class="form-control" name="example-text-input" placeholder="Catatan">
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:middle">4</td>
                            <td style="vertical-align:middle">
                                Cedric Kelly
                            </td>
                            <td style="vertical-align:middle">
                                02.23.21.02.004
                            </td>
                            <td style="width: 100px;">
                                <input type="number" class="form-control" name="example-text-input" placeholder="Nilai">
                            </td>
                            <td>
                                <input type="text" class="form-control" name="example-text-input" placeholder="Catatan">
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:middle">5</td>
                            <td style="vertical-align:middle">
                                Airi Satou
                            </td>
                            <td style="vertical-align:middle">
                                02.23.21.02.005
                            </td>
                            <td style="width: 100px;">
                                <input type="number" class="form-control" name="example-text-input" placeholder="Nilai">
                            </td>
                            <td>
                                <input type="text" class="form-control" name="example-text-input" placeholder="Catatan">
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:middle">6</td>
                            <td style="vertical-align:middle">
                                Brielle Williamson
                            </td>
                            <td style="vertical-align:middle">
                                02.23.21.02.006
                            </td>
                            <td style="width: 100px;">
                                <input type="number" class="form-control" name="example-text-input" placeholder="Nilai">
                            </td>
                            <td>
                                <input type="text" class="form-control" name="example-text-input" placeholder="Catatan">
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:middle">7</td>
                            <td style="vertical-align:middle">
                                Herrod Chandler
                            </td>
                            <td style="vertical-align:middle">
                                02.23.21.02.007
                            </td>
                            <td style="width: 100px;">
                                <input type="number" class="form-control" name="example-text-input" placeholder="Nilai">
                            </td>
                            <td>
                                <input type="text" class="form-control" name="example-text-input" placeholder="Catatan">
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:middle">8</td>
                            <td style="vertical-align:middle">
                                Rhona Davidson
                            </td>
                            <td style="vertical-align:middle">
                                02.23.21.02.008
                            </td>
                            <td style="width: 100px;">
                                <input type="number" class="form-control" name="example-text-input" placeholder="Nilai">
                            </td>
                            <td>
                                <input type="text" class="form-control" name="example-text-input" placeholder="Catatan">
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:middle">9</td>
                            <td style="vertical-align:middle">
                                Colleen Hurst
                            </td>
                            <td style="vertical-align:middle">
                                02.23.21.02.009
                            </td>
                            <td style="width: 100px;">
                                <input type="number" class="form-control" name="example-text-input" placeholder="Nilai">
                            </td>
                            <td>
                                <input type="text" class="form-control" name="example-text-input" placeholder="Catatan">
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:middle">10</td>
                            <td style="vertical-align:middle">
                                Sonya Frost
                            </td>
                            <td style="vertical-align:middle">
                                02.23.21.02.010
                            </td>
                            <td style="width: 100px;">
                                <input type="number" class="form-control" name="example-text-input" placeholder="Nilai">
                            </td>
                            <td>
                                <input type="text" class="form-control" name="example-text-input" placeholder="Catatan">
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:middle">11</td>
                            <td style="vertical-align:middle">
                                Jena Gaines
                            </td>
                            <td style="vertical-align:middle">
                                02.23.21.02.011
                            </td>
                            <td style="width: 100px;">
                                <input type="number" class="form-control" name="example-text-input" placeholder="Nilai">
                            </td>
                            <td>
                                <input type="text" class="form-control" name="example-text-input" placeholder="Catatan">
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:middle">12</td>
                            <td style="vertical-align:middle">
                                Quinn Flynn
                            </td>
                            <td style="vertical-align:middle">
                                02.23.21.02.012
                            </td>
                            <td style="width: 100px;">
                                <input type="number" class="form-control" name="example-text-input" placeholder="Nilai">
                            </td>
                            <td>
                                <input type="text" class="form-control" name="example-text-input" placeholder="Catatan">
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:middle">13</td>
                            <td style="vertical-align:middle">
                                Charde Marshall
                            </td>
                            <td style="vertical-align:middle">
                                02.23.21.02.013
                            </td>
                            <td style="width: 100px;">
                                <input type="number" class="form-control" name="example-text-input" placeholder="Nilai">
                            </td>
                            <td>
                                <input type="text" class="form-control" name="example-text-input" placeholder="Catatan">
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:middle">14</td>
                            <td style="vertical-align:middle">
                                Haley Kennedy
                            </td>
                            <td style="vertical-align:middle">
                                02.23.21.02.014
                            </td>
                            <td style="width: 100px;">
                                <input type="number" class="form-control" name="example-text-input" placeholder="Nilai">
                            </td>
                            <td>
                                <input type="text" class="form-control" name="example-text-input" placeholder="Catatan">
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:middle">15</td>
                            <td style="vertical-align:middle">
                                Tatyana Fitzpatrick
                            </td>
                            <td style="vertical-align:middle">
                                02.23.21.02.015
                            </td>
                            <td style="width: 100px;">
                                <input type="number" class="form-control" name="example-text-input" placeholder="Nilai">
                            </td>
                            <td>
                                <input type="text" class="form-control" name="example-text-input" placeholder="Catatan">
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:middle">16</td>
                            <td style="vertical-align:middle">
                                Michael Silva
                            </td>
                            <td style="vertical-align:middle">
                                02.23.21.02.016
                            </td>
                            <td style="width: 100px;">
                                <input type="number" class="form-control" name="example-text-input" placeholder="Nilai">
                            </td>
                            <td>
                                <input type="text" class="form-control" name="example-text-input" placeholder="Catatan">
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:middle">17</td>
                            <td style="vertical-align:middle">
                                Paul Byrd
                            </td>
                            <td style="vertical-align:middle">
                                02.23.21.02.017
                            </td>
                            <td style="width: 100px;">
                                <input type="number" class="form-control" name="example-text-input" placeholder="Nilai">
                            </td>
                            <td>
                                <input type="text" class="form-control" name="example-text-input" placeholder="Catatan">
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:middle">18</td>
                            <td style="vertical-align:middle">
                                Gloria Little
                            </td>
                            <td style="vertical-align:middle">
                                02.23.21.02.018
                            </td>
                            <td style="width: 100px;">
                                <input type="number" class="form-control" name="example-text-input" placeholder="Nilai">
                            </td>
                            <td>
                                <input type="text" class="form-control" name="example-text-input" placeholder="Catatan">
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:middle">19</td>
                            <td style="vertical-align:middle">
                                Bradley Greer
                            </td>
                            <td style="vertical-align:middle">
                                02.23.21.02.019
                            </td>
                            <td style="width: 100px;">
                                <input type="number" class="form-control" name="example-text-input" placeholder="Nilai">
                            </td>
                            <td>
                                <input type="text" class="form-control" name="example-text-input" placeholder="Catatan">
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align:middle">20</td>
                            <td style="vertical-align:middle">
                                Dai Rios
                            </td>
                            <td style="vertical-align:middle">
                                02.23.21.02.020
                            </td>
                            <td style="width: 100px;">
                                <input type="number" class="form-control" name="example-text-input" placeholder="Nilai">
                            </td>
                            <td>
                                <input type="text" class="form-control" name="example-text-input" placeholder="Catatan">
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="col-auto mT-20 mB-10">
                    <button type="button" class="btn btn-primary btn-lg d-block mr-0 ml-auto">Save</button>
                </div>
            </div>
        </div>
    </div>
</div>
@stop