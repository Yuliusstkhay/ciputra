@extends('template.header_footer') 
@section('css')
<link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet">
@stop
@section('content')
<div class="container-fluid">
    <h4 class="c-grey-900 mT-10 mB-30">Penilaian Mata Kuliah</h4>
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
                            <form>
                                <div class="form-group mb-3 row mT-20">
                                    <label class="form-label col-3 col-form-label">Dosen Penilai</label>
                                    <div class="col-6">
                                        <form action="#" method="get">
                                            <button type="button" class="btn btn-info d-none d-sm-inline-block" onclick="add_field()">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="18" height="18" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                <line x1="12" y1="5" x2="12" y2="19" />
                                                <line x1="5" y1="12" x2="19" y2="12" />
                                                </svg> Add
                                            </button>
                                            <span id="selects">
                                                <select id="orig_select" class="form-control mT-20">
                                                    {% for each in mechanic_list %}
                                                    <option selected="selected">Pilih dosen penilai</option>
                                                    <option>
                                                        Febe Yuanita Ratna Indudewi, S.E. M.M.	
                                                    </option>
                                                    <option>
                                                        Laij Victor Effendi, S.E., CMA.	
                                                    </option>
                                                    <option>
                                                        Helena Sidharta, S.E., M.M.	     
                                                    </option>
                                                    <option>
                                                        Bahasa Indonesia
                                                    </option>
                                                    <option>
                                                        Entrepreneurship Essentials
                                                    </option>
                                                    <option>
                                                        Desain Ruang Kompak (Compact Space Design)
                                                    </option>
                                                    {%endfor%}
                                                </select>
                                            </span>
                                        </form>
                                    </div>
                                </div>
                            </form>
                            <div class="form-footer">
                                <div class="row mT-50">
                                    <div class="col-auto mr-auto">
                                    </div>
                                    <div class="col-auto">
                                        <button type="submit" class="btn btn-primary btn-lg ">Save</button>
                                    </div>
                                    </form>
                                </div>
                                <!-- Page title actions -->
                            </div>
                        </div>
                        <!-- Page title actions -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="bgc-white bd bdrs-3 p-20 mB-20">
                <div class="page-header d-print-none mB-20">
                    <div class="row align-items-center">
                        <div class="col">
                            <!-- Page pre-title -->
                            <div class="form-group mb-3 row">
                                <h3 class="page-title mL-20">
                                    Item Penilaian
                                </h3>
                            </div>
                            <div class="btn-list mB-20" style="float: right;">
                                <a href="#" class="btn btn-info d-none d-sm-inline-block">
                                    <!-- Download SVG icon from http://tabler-icons.io/i/plus -->
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="18" height="18" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                    <line x1="12" y1="5" x2="12" y2="19" />
                                    <line x1="5" y1="12" x2="19" y2="12" />
                                    </svg> Add New
                                </a>
                            </div>
                            <table id="dataTable" class="table table-hover" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Item Penilaian</th>
                                        <th>Kriteria Penilaian</th>
                                        <th>Persentase</th>
                                        <th>Penilai</th>
                                        <th>Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td style="width: 300px;">
                                            <select id="inputState" class="form-control">
                                                <option selected="selected">Pilih item penilaian</option>
                                                <option>Tugas 1</option>
                                                <option>Tugas 2</option>
                                                <option>Tugas 3</option>
                                                <option>Quiz 1</option>
                                                <option>Quiz 2</option>
                                                <option>UTS</option>
                                                <option>UAS</option>
                                                <option>Presentasi</option>
                                                <option>Praktikum</option>
                                                <option>Tugas Kelompok</option>
                                                <option>Tugas Akhir</option>
                                            </select>
                                        </td>
                                        <td>
                                            <textarea class="form-control" data-bs-toggle="autosize" placeholder="Kriteria Penilaian"></textarea>
                                            <!-- 1. Materi Presentasi<br> 2. Penyajian Presentasi<br> 3. Sistematika Bahasa<br> 4. Sikap Presentasi -->
                                        </td>
                                        <td style="width: 120px;">
                                            <div class="input-group input-group-flat">
                                                <input type="text" class="form-control text-end pe-0" value="" autocomplete="off">
                                                <span class="input-group-text">
                                                    %
                                                </span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-check">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" id="checkbox1">
                                                    Dosen Pengampu
                                                    <input type="text" class="form-control text-end pe-0" value="" autocomplete="off" id="box1" style="display: none; width: 100px;" placeholder="%">
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" id="checkbox2" data-toggle="modal" data-target="#modal-daftar-dosen-penilai">
                                                    Dosen Penilai
                                                    <input type="text" class="form-control text-end pe-0 text-end" value="" autocomplete="off" id="box2" style="display: none; width: 100px;" placeholder="%">
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="checkbox" id="checkbox3" data-toggle="modal" data-target="#modal-daftar-kelompok-mahasiswa">
                                                    Mahasiswa
                                                    <input type="text" class="form-control text-end pe-0 text-end" value="" autocomplete="off" id="box3" style="display: none; width: 100px;" placeholder="%">
                                                </label>
                                            </div>
                                        </td>
                                        <td>
                                            <button type="button " class="btn cur-p btn-secondary ">   
                                                Remove
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="form-footer">
                                <div class="row mT-50">
                                    <div class="col-auto mr-auto">
                                    </div>
                                    <div class="col-auto">
                                        <a href="./penilaian.html">
                                            <button type="button" class="btn btn-primary btn-lg ">Save</button>
                                        </a>
                                    </div>
                                    </form>
                                </div>
                                <!-- Page title actions -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modal-daftar-dosen-penilai" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Daftar Dosen Penilai</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table id="dataTable2" class="table table-hover" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </th>
                            <th>No</th>
                            <th>Nama</th>
                            <th>NIP</th>
                            <th>Bidang Studi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </td>
                            <td>1</td>
                            <td>
                                Prof. Dr. Ir. Sugeng Winardi
                            </td>
                            <td>
                                1985.07.23.2005.02.2.002
                            </td>
                            <th>
                                Architechture Interior
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </td>
                            <td>2</td>
                            <td>
                                Febe Yuanita Ratna Indudewi, S.E. M.M.
                            </td>
                            <td>
                                1985.07.23.2005.02.2.003
                            </td>
                            <th>
                                Architechture Interior
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </td>
                            <td>3</td>
                            <td>
                                Laij Victor Effendi, S.E., CMA.
                            </td>
                            <td>
                                1985.07.23.2005.02.2.004
                            </td>
                            <th>
                                Architechture Interior
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </td>
                            <td>4</td>
                            <td>
                                Helena Sidharta, S.E., M.M.
                            </td>
                            <td>
                                1985.07.23.2005.02.2.005
                            </td>
                            <th>
                                Architechture Interior
                            </th>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">Add Selected</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modal-daftar-kelompok-mahasiswa" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Daftar Kelompok Mahasiswa</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="bgc-white bd bdrs-3 p-20 mB-20">
                            <div class="page-header d-print-none mB-20">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <!-- Page pre-title -->
                                        <div class="form-group mb-3 row">
                                            <h3 class="page-title mL-20">
                                                Daftar Kelompok Mahasiswa
                                            </h3>
                                        </div>
                                        <div class="btn-list mB-20" style="float: right;">
                                            <a href="#" class="btn btn-info d-none d-sm-inline-block" data-toggle="modal" data-target="#modal-add-kelompok-mahasiswa">
                                                <!-- Download SVG icon from http://tabler-icons.io/i/plus -->
                                                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="18" height="18" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                <line x1="12" y1="5" x2="12" y2="19" />
                                                <line x1="5" y1="12" x2="19" y2="12" />
                                                </svg> Add New
                                            </a>
                                        </div>
                                        <table id="dataTable" class="table table-hover" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th>Nama Kelompok</th>
                                                    <th>Anggota Kelompok</th>
                                                    <th>Aksi</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>
                                                        Kelompok 1
                                                    </td>
                                                    <td>
                                                        <span class="badge bgc-green-50 c-green-700 p-10 lh-0 tt-c badge-pill">
                                                            Tiger Nixon
                                                        </span>
                                                        <span class="badge bgc-green-50 c-green-700 p-10 lh-0 tt-c badge-pill">
                                                            Garrett Winters
                                                        </span>
                                                        <span class="badge bgc-green-50 c-green-700 p-10 lh-0 tt-c badge-pill">
                                                            Ashton Cox
                                                        </span>
                                                        <span class="badge bgc-green-50 c-green-700 p-10 lh-0 tt-c badge-pill">
                                                            Cedric Kelly
                                                        </span>
                                                        <span class="badge bgc-green-50 c-green-700 p-10 lh-0 tt-c badge-pill">
                                                            Airi Satou
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <button type="button" class="btn cur-p btn-primary ">   
                                                            Edit
                                                        </button>
                                                        <button type="button" class="btn cur-p btn-danger ">   
                                                            Delete
                                                        </button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td>
                                                        Kelompok 2
                                                    </td>
                                                    <td>
                                                        <span class="badge bgc-green-50 c-green-700 p-10 lh-0 tt-c badge-pill">
                                                            Brielle Williamson
                                                        </span>
                                                        <span class="badge bgc-green-50 c-green-700 p-10 lh-0 tt-c badge-pill">
                                                            Herrod Chandler
                                                        </span>
                                                        <span class="badge bgc-green-50 c-green-700 p-10 lh-0 tt-c badge-pill">
                                                            Rhona Davidson
                                                        </span>
                                                        <span class="badge bgc-green-50 c-green-700 p-10 lh-0 tt-c badge-pill">
                                                            Colleen Hurst	
                                                        </span>
                                                        <span class="badge bgc-green-50 c-green-700 p-10 lh-0 tt-c badge-pill">
                                                            Sonya Frost
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <button type="button" class="btn cur-p btn-primary ">   
                                                            Edit
                                                        </button>
                                                        <button type="button" class="btn cur-p btn-danger ">   
                                                            Delete
                                                        </button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>3</td>
                                                    <td>
                                                        Kelompok 3
                                                    </td>
                                                    <td>
                                                        <span class="badge bgc-green-50 c-green-700 p-10 lh-0 tt-c badge-pill">
                                                            Jena Gaines
                                                        </span>
                                                        <span class="badge bgc-green-50 c-green-700 p-10 lh-0 tt-c badge-pill">
                                                            Quinn Flynn
                                                        </span>
                                                        <span class="badge bgc-green-50 c-green-700 p-10 lh-0 tt-c badge-pill">
                                                            Charde Marshall
                                                        </span>
                                                        <span class="badge bgc-green-50 c-green-700 p-10 lh-0 tt-c badge-pill">
                                                            Haley Kennedy
                                                        </span>
                                                        <span class="badge bgc-green-50 c-green-700 p-10 lh-0 tt-c badge-pill">
                                                            Tatyana Fitzpatrick
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <button type="button" class="btn cur-p btn-primary ">   
                                                            Edit
                                                        </button>
                                                        <button type="button" class="btn cur-p btn-danger ">   
                                                            Delete
                                                        </button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>4</td>
                                                    <td>
                                                        Kelompok 4
                                                    </td>
                                                    <td>
                                                        <span class="badge bgc-green-50 c-green-700 p-10 lh-0 tt-c badge-pill">
                                                            Michael Silva
                                                        </span>
                                                        <span class="badge bgc-green-50 c-green-700 p-10 lh-0 tt-c badge-pill">
                                                            Paul Byrd
                                                        </span>
                                                        <span class="badge bgc-green-50 c-green-700 p-10 lh-0 tt-c badge-pill">
                                                            Gloria Little
                                                        </span>
                                                        <span class="badge bgc-green-50 c-green-700 p-10 lh-0 tt-c badge-pill">
                                                            Bradley Greer
                                                        </span>
                                                        <span class="badge bgc-green-50 c-green-700 p-10 lh-0 tt-c badge-pill">
                                                            Dai Rios
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <button type="button" class="btn cur-p btn-primary ">   
                                                            Edit
                                                        </button>
                                                        <button type="button" class="btn cur-p btn-danger ">   
                                                            Delete
                                                        </button>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modal-add-kelompok-mahasiswa" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Tambah Kelompok Mahasiswa</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group mb-3 row mT-20">
                        <label class="form-label col-3 col-form-label">Nama Kelompok</label>
                        <div class="col-9">
                            <input type="text" class="form-control" name="text-input" placeholder="Nama Kelompok">
                        </div>
                    </div>
                </form>
                <table id="dataTable2" class="table table-hover" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </th>
                            <th>No</th>
                            <th>Nama</th>
                            <th>NIM</th>
                            <th>Bidang Studi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </td>
                            <td>1</td>
                            <td>
                                Tiger Nixon
                            </td>
                            <td>
                                02.23.21.02.001
                            </td>
                            <th>
                                Architechture Interior
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </td>
                            <td>2</td>
                            <td>
                                Garrett Winters
                            </td>
                            <td>
                                02.23.21.02.002
                            </td>
                            <th>
                                Architechture Interior
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </td>
                            <td>3</td>
                            <td>
                                Ashton Cox
                            </td>
                            <td>
                                02.23.21.02.003
                            </td>
                            <th>
                                Architechture Interior
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </td>
                            <td>4</td>
                            <td>
                                Cedric Kelly
                            </td>
                            <td>
                                02.23.21.02.004
                            </td>
                            <th>
                                Architechture Interior
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </td>
                            <td>5</td>
                            <td>
                                Airi Satou
                            </td>
                            <td>
                                02.23.21.02.005
                            </td>
                            <th>
                                Architechture Interior
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </td>
                            <td>6</td>
                            <td>
                                Brielle Williamson
                            </td>
                            <td>
                                02.23.21.02.006
                            </td>
                            <th>
                                Architechture Interior
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </td>
                            <td>7</td>
                            <td>
                                Herrod Chandler
                            </td>
                            <td>
                                02.23.21.02.007
                            </td>
                            <th>
                                Architechture Interior
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </td>
                            <td>8</td>
                            <td>
                                Rhona Davidson
                            </td>
                            <td>
                                02.23.21.02.008
                            </td>
                            <th>
                                Architechture Interior
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </td>
                            <td>9</td>
                            <td>
                                Colleen Hurst
                            </td>
                            <td>
                                02.23.21.02.009
                            </td>
                            <th>
                                Architechture Interior
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </td>
                            <td>10</td>
                            <td>
                                Sonya Frost
                            </td>
                            <td>
                                02.23.21.02.010
                            </td>
                            <th>
                                Architechture Interior
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </td>
                            <td>11</td>
                            <td>
                                Jena Gaines
                            </td>
                            <td>
                                02.23.21.02.011
                            </td>
                            <th>
                                Architechture Interior
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </td>
                            <td>12</td>
                            <td>
                                Quinn Flynn
                            </td>
                            <td>
                                02.23.21.02.012
                            </td>
                            <th>
                                Architechture Interior
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </td>
                            <td>13</td>
                            <td>
                                Charde Marshall
                            </td>
                            <td>
                                02.23.21.02.013
                            </td>
                            <th>
                                Architechture Interior
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </td>
                            <td>14</td>
                            <td>
                                Haley Kennedy
                            </td>
                            <td>
                                02.23.21.02.014
                            </td>
                            <th>
                                Architechture Interior
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </td>
                            <td>15</td>
                            <td>
                                Tatyana Fitzpatrick
                            </td>
                            <td>
                                02.23.21.02.015
                            </td>
                            <th>
                                Architechture Interior
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </td>
                            <td>16</td>
                            <td>
                                Michael Silva
                            </td>
                            <td>
                                02.23.21.02.016
                            </td>
                            <th>
                                Architechture Interior
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </td>
                            <td>17</td>
                            <td>
                                Paul Byrd
                            </td>
                            <td>
                                02.23.21.02.017
                            </td>
                            <th>
                                Architechture Interior
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </td>
                            <td>18</td>
                            <td>
                                Gloria Little
                            </td>
                            <td>
                                02.23.21.02.018
                            </td>
                            <th>
                                Architechture Interior
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </td>
                            <td>19</td>
                            <td>
                                Bradley Greer
                            </td>
                            <td>
                                02.23.21.02.019
                            </td>
                            <th>
                                Architechture Interior
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-check"><label class="form-check-label"><input class="form-check-input"
                                                                                               type="checkbox">&nbsp;</label>
                                </div>
                            </td>
                            <td>20</td>
                            <td>
                                Dai Rios
                            </td>
                            <td>
                                02.23.21.02.020
                            </td>
                            <th>
                                Architechture Interior
                            </th>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary" data-dismiss="modal">Save</button>
            </div>
        </div>
    </div>
</div>
@stop
@section('js')
<script type="text/javascript ">
    $(document).ready(function() {
    $('#dataTable').DataTable({
    "paging": true,
    "ordering": true,
    "info": false
    });
    });
</script>
<script type="text/javascript">
    function toggleFields(selectId, buttonId) {
        var button = document.getElementById(buttonId);
        var select = document.getElementById(selectId);
        button.onclick = function () {
            console.log(this);
            if (this.checked) {
                select.style['display'] = 'block';
            } else {
                select.style['display'] = 'none';
            }
        };
    }
    toggleFields('select1', 'button');
    toggleFields('select2', 'button');
    toggleFields('select3', 'button');
</script>
<script type="text/javascript">
    function toggleFields(boxId, checkboxId) {
        var checkbox = document.getElementById(checkboxId);
        var box = document.getElementById(boxId);
        checkbox.onclick = function () {
            console.log(this);
            if (this.checked) {
                box.style['display'] = 'block';
            } else {
                box.style['display'] = 'none';
            }
        };
    }
    toggleFields('box1', 'checkbox1');
    toggleFields('box2', 'checkbox2');
    toggleFields('box3', 'checkbox3');
</script>
<script>
    function add_field() {
        var container = document.getElementById('selects'),
                input = document.createElement('select');

        input.innerHTML = document.getElementById('orig_select').innerHTML;

        input.setAttribute('type', 'select');
        input.setAttribute('name', 'pet');
        input.setAttribute('class', 'form-control');
        container.appendChild(input);
    }
    ;
</script>
@stop