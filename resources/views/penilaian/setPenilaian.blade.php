@extends('template.header_footer') 
@section('css')
<style>
    #btn-loading{
        display: none;
    }
    #btn-loading2{
        display: none;
    }
    #btn-loading3{
        display: none;
    }
    #btn-loadingKelompok{
        display: none;
    }
    #btn-loadingPenilai{
        display: none;
    }

    * {
        margin: 0;
        padding: 0
    }

    html {
        height: 100%
    }

    #grad1 {
        background-color:#9C27B0;
        background-image: linear-gradient(120deg, #FF4081, #81D4FA)
    }

    #msform {
        text-align: center;
        position: relative;
        margin-top: 20px
    }

    .lbl-left{
        text-align: left!important;
        position: relative;
    }

    #msform fieldset .form-card {
        background: white;
        border: 0 none;
        border-radius: 0px;
        box-shadow: 0 2px 2px 2px rgba(0, 0, 0, 0.2);
        padding: 20px 40px 30px 40px;
        box-sizing: border-box;
        width: 94%;
        margin: 0 3% 20px 3%;
        position: relative
    }

    #msform fieldset {
        background: white;
        border: 0 none;
        border-radius: 0.5rem;
        box-sizing: border-box;
        width: 100%;
        margin: 0;
        padding-bottom: 20px;
        position: relative
    }

    #msform fieldset:not(:first-of-type) {
        display: none
    }

    #msform fieldset .form-card {
        text-align: left;
        color: #9E9E9E
    }

    /*    #msform input,
        #msform textarea {
            padding: 0px 8px 4px 8px;
            border: none;
            border-bottom: 1px solid #ccc;
            border-radius: 0px;
            margin-bottom: 25px;
            margin-top: 2px;
            width: 100%;
            box-sizing: border-box;
            font-family: montserrat;
            color: #2C3E50;
            font-size: 16px;
            letter-spacing: 1px
        }*/

    /*    #msform input:focus,
        #msform textarea:focus {
            -moz-box-shadow: none !important;
            -webkit-box-shadow: none !important;
            box-shadow: none !important;
            border: none;
            font-weight: bold;
            border-bottom: 2px solid skyblue;
            outline-width: 0
        }*/

    #msform .action-button {
        width: 100px;
        background: skyblue;
        font-weight: bold;
        color: white;
        border: 0 none;
        border-radius: 0px;
        cursor: pointer;
        padding: 10px 5px;
        margin: 10px 5px
    }

    #msform .action-button:hover,
    #msform .action-button:focus {
        box-shadow: 0 0 0 2px white, 0 0 0 3px skyblue
    }

    #msform .action-button-previous {
        width: 100px;
        background: #616161;
        font-weight: bold;
        color: white;
        border: 0 none;
        border-radius: 0px;
        cursor: pointer;
        padding: 10px 5px;
        margin: 10px 5px
    }

    #msform .action-button-previous:hover,
    #msform .action-button-previous:focus {
        box-shadow: 0 0 0 2px white, 0 0 0 3px #616161
    }

    select.list-dt {
        border: none;
        outline: 0;
        border-bottom: 1px solid #ccc;
        padding: 2px 5px 3px 5px;
        margin: 2px
    }

    select.list-dt:focus {
        border-bottom: 2px solid skyblue
    }

    .card {
        z-index: 0;
        border: none;
        border-radius: 0.5rem;
        position: relative
    }

    .fs-title {
        font-size: 25px;
        color: #2C3E50;
        margin-bottom: 10px;
        font-weight: bold;
        text-align: left
    }

    #progressbar {
        margin-bottom: 30px;
        overflow: hidden;
        color: lightgrey
    }

    #progressbar .active {
        color: #000000
    }

    #progressbar li {
        list-style-type: none;
        font-size: 12px;
        width: 25%;
        float: left;
        position: relative
    }


    #progressbar #role:before {
        font-family: 'Font Awesome\ 5 Free';
        content: "\f007"
    }
    #progressbar #izin:before {
        font-family: 'Font Awesome 5 Free';
        font-weight: 900;
        content: "\f023"
    }

    #progressbar #teacher:before {
        font-family: 'Font Awesome 5 Free';
        font-weight: 900;
        content: "\f51c"
    }
    #progressbar #aggrement:before {
        font-family: 'Font Awesome 5 Free';
        font-weight: 900;
        content: "\f56c"
    }


    #progressbar li:before {
        width: 50px;
        height: 50px;
        line-height: 45px;
        display: block;
        font-size: 18px;
        color: #ffffff;
        background: lightgray;
        border-radius: 50%;
        margin: 0 auto 10px auto;
        padding: 2px
    }

    #progressbar li:after {
        content: '';
        width: 100%;
        height: 2px;
        background: #198754;
        position: absolute;
        left: 0;
        top: 25px;
        z-index: -1
    }

    #progressbar li.active:before,
    #progressbar li.active:after {
        background: #198754
    }

    .radio-group {
        position: relative;
        margin-bottom: 25px
    }

    .radio {
        display: inline-block;
        width: 204;
        height: 104;
        border-radius: 0;
        background: lightblue;
        box-shadow: 0 2px 2px 2px rgba(0, 0, 0, 0.2);
        box-sizing: border-box;
        cursor: pointer;
        margin: 8px 2px
    }

    .radio:hover {
        box-shadow: 2px 2px 2px 2px rgba(0, 0, 0, 0.3)
    }

    .radio.selected {
        box-shadow: 1px 1px 2px 2px rgba(0, 0, 0, 0.1)
    }

    .fit-image {
        width: 100%;
        object-fit: cover
    }
    
</style>
<link href="{{asset('DataTables/datatables.min.css')}}" rel="stylesheet">
@stop
@section('content')
<div class="container-fluid">
    <h4 class="c-grey-900 mT-10 mB-30">Atur Penilaian</h4>
    <div class="row">
        {{csrf_field()}}
        <div class="col-md-12 col-sm-12">
            <div class="bgc-white bd bdrs-3 p-20 mB-20">
                <div class="row">
                    <div class="col-md-12 mx-0">
                        <form id="msform" class="needs-validation" >
                            <!-- progressbar -->
                            <ul id="progressbar">
                                <li class="active" id="teacher"><strong>Dosen Penilai</strong></li>
                                <li id="aggrement"><strong>Penilaian</strong></li>
                                <li id="aggrement"><strong>Item Penilaian</strong></li>
                            </ul> <!-- fieldsets -->
                            <hr />
                            <fieldset>
                                <input type="hidden" id="penilaian_id" value="{{isset($data->penilaian)?$data->penilaian->penilaian_id:""}}" />
                                <div class="row">
                                    <div class="col-12">
                                        <h2 class="fs-title">
                                            {{$data->matakuliah->mata_kuliah_name}}
                                        </h2>
                                    </div>
                                    <div class="row lbl-left">
                                        <div class="col-4">
                                            <label>Mata Kuliah</label>
                                        </div>
                                        <div class="col-8">
                                            <label>: {{$data->matakuliah->mata_kuliah_name}}</label>
                                        </div>
                                    </div>
                                    <div class="row lbl-left">
                                        <div class="col-4">
                                            <label>Kode Mata Kuliah</label>
                                        </div>
                                        <div class="col-8">
                                            <label>: {{$data->matakuliah->mata_kuliah_id}}</label>
                                        </div>
                                    </div>
                                    <div class="row lbl-left">
                                        <div class="col-4">
                                            <label>Dosen Pengampu</label>
                                        </div>
                                        <div class="col-8">
                                            <label>: {{$data->dosenmahasiswa->name}}</label>
                                        </div>
                                    </div>
                                    <div class="row lbl-left">
                                        <div class="col-4">
                                            <label>Periode</label>
                                        </div>
                                        <div class="col-8">
                                            <label>: {{$data->semester->semester_name}}</label>
                                        </div>
                                    </div>
                                    <div class="row lbl-left">
                                        <div class="col-4">
                                            <label>Paralel</label>
                                        </div>
                                        <div class="col-8">
                                            <label>: {{$data->paralel}}</label>
                                        </div>
                                    </div>
                                    <div class="row lbl-left">
                                        <div class="col-4">
                                            <label>Jadwal</label>
                                        </div>
                                        <div class="col-8">
                                            <label>: {{$data->deskripsi}}</label>
                                        </div>
                                    </div>

                                </div>
                                <div class="row table-responsive mB-30">
                                    <table id="tbl-dosenpenilai" class="table table-hover table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th style="width:5%;">
                                                    <div class="form-check" style="text-align: center;">
                                                        <input class="form-check-input checkAll" type="checkbox" value="" id="checkAll">
                                                    </div>
                                                </th>
                                                <th style="width:5%;">No</th>
                                                <th style="text-align: center;">Dosen Penilai</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                    </table>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <button class="btn btn-primary float-end col-md-2 col-lg-2 col-sm-4" id="btn-loading" type="button" disabled>
                                            <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                                            Menunggu...
                                        </button>
                                        <button type="button" class="btn btn-primary float-end col-md-2 col-lg-2 col-sm-4 next" data-index="0" id="btn-save1">Simpan & Lanjutkan</button>
                                    </div>
                                </div>


                                <!--<input type="button" name="next" class="next action-button" value="Next Step" />-->
                            </fieldset>

                            <fieldset>
                                <div class="row mB-30">
                                    <table id="tbl-assesment" class="table table-hover" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <div class="form-check" style="text-align: center;">
                                                        <input class="form-check-input checkAssessmentAll" type="checkbox" value="" id="checkAssessmentAll">
                                                    </div>
                                                </th>
                                                <th>Assessment</th>
                                                <th>Kriteria Penilaian</th>
                                                <th>Persentase</th>
                                                <th>Penilai</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                           
                                        </tbody>
                                    </table>
                                </div>


                                <div class="row">
                                    <div class="col-12">
                                        <button type="button" name="previous" id="btn-kembali" class="btn btn-dark float-start previous" data-index="1">Kembali</button>
                                        <button class="btn btn-primary float-end" id="btn-loading2" type="button" disabled>
                                            <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                                            Menunggu...
                                        </button>
                                        <button type="button" class="btn btn-primary float-end  next" data-index="1" id="btn-save2">Simpan & Lanjutkan</button>
                                    </div>
                                </div>

                            </fieldset>

                            <fieldset>
                                <div class="row table-responsive mB-30">
                                    <table id="tbl-itemPenilaian" class="table table-hover" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Assessment</th>
                                                <th>Item Penilaian</th>
                                                <th>Persentase</th>
                                                <th>Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td style="width: 300px;">
                                                    Presentasi
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" name="example-text-input" placeholder="Item Penilaian">
                                                    <span id="responce"></span>
                                                </td>
                                                <td style="width: 120px;">
                                                    <div class="input-group input-group-flat ">
                                                        <input type="text" class="form-control text-end pe-0" value="" autocomplete="off">
                                                        <span class="input-group-text">
                                                            %
                                                        </span>
                                                    </div>
                                                    <span id="responce2"></span>
                                                </td>
                                                <td>
                                                    <button type="button" class="btn btn-info d-none d-sm-inline-block" onclick="addInput(), addInput2()">
                                                        <!-- Download SVG icon from http://tabler-icons.io/i/plus -->
                                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="18" height="18" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                                        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                        <line x1="12" y1="5" x2="12" y2="19" />
                                                        <line x1="5" y1="12" x2="19" y2="12" />
                                                        </svg> Add New
                                                    </button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>


                                <div class="row">
                                    <div class="col-12">
                                        <button type="button" name="previous" id="btn-kembali" class="btn btn-dark float-start previous" data-index="2">Kembali</button>
                                        <button class="btn btn-primary float-end" id="btn-loading3" type="button" disabled>
                                            <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                                            Menunggu...
                                        </button>
                                        <button type="button" class="btn btn-primary float-end next" data-index="2" id="btn-save3">Simpan</button>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
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
                <button type="button" class="close tutup" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <input type="hidden" id="asm_id" value="" />
                <table id="tbl-penilaiandosen" class="table table-hover" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>
                                <div class="form-check"><label class="form-check-label">
                                        <input class="form-check-input checkDosenPenilaiAll" id="checkDosenPenilaiAll" type="checkbox">&nbsp;
                                    </label>
                                </div>
                            </th>
                            <th>No</th>
                            <th>Nama</th>
                            <th>NIP</th>
                            <th>Program Studi</th>
                        </tr>
                    </thead>
                    <tbody>
                       
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary tutup"  data-dismiss="modal">Tutup</button>
                <button class="btn btn-primary " id="btn-loadingPenilai" type="button" disabled>
                    <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                    Menunggu...
                </button>
                <button type="button" class="btn btn-primary" id="penilai-tambah">Tambahkan</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modal-daftar-kelompok-mahasiswa" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Daftar Kelompok Mahasiswa</h5>
                <button type="button" class="close tutupListKelompok" data-dismiss="modal" aria-label="Close">
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
                                            <a href="#" class="btn btn-info d-none d-sm-inline-block" id="btn-addkelompok">
                                                <!-- Download SVG icon from http://tabler-icons.io/i/plus -->
                                                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="18" height="18" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                <line x1="12" y1="5" x2="12" y2="19" />
                                                <line x1="5" y1="12" x2="19" y2="12" />
                                                </svg> Tambah Kelompok
                                            </a>
                                        </div>
                                        <table id="tbl-kelompok" class="table table-hover" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th>Nama Kelompok</th>
                                                    <th>Anggota Kelompok</th>
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
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary tutupListKelompok">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modal-add-kelompok-mahasiswa" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Tambah Kelompok Mahasiswa</h5>
                    <button type="button" class="close tutupAdd" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group mb-3 row mT-20">
                            <label class="form-label col-3 col-form-label">Nama Kelompok</label>
                            <div class="col-9">
                                <input type="text" class="form-control" name="nama_kelompok" id="nama_kelompok" placeholder="Nama Kelompok">
                            </div>
                        </div>
                    </form>
                    <table id="tbl-kelompokmahasiswa" class="table table-hover" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input class="form-check-input ckAllKelompok" id="ckAllKelompok" type="checkbox">&nbsp;
                                        </label>
                                    </div>
                                </th>
                                <th>No</th>
                                <th>Nama</th>
                                <th>NIM</th>
                                <th>Program Studi</th>
                            </tr>
                        </thead>
                        <tbody>
                           
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary tutupAdd" data-dismiss="modal">Tutup</button>
                    <button class="btn btn-primary " id="btn-loadingKelompok" type="button" disabled>
                        <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                        Menunggu...
                    </button>
                    <button type="submit" class="btn btn-primary" id="btnTambahKelompok" disabled="">Simpan</button>
                </div>
            </div>
        </div>
    </div>
@stop
@section('js')
<script type="text/javascript" src="{{asset('DataTables/datatables.min.js')}}"></script>
<script type="text/javascript">
@if(isset($data->penilaian))
        var listDosen = '{{route("penilaian.getDosen",[$data->dosenmahasiswa->bidang_studi_id,$data->penilaian->penilaian_id])}}';
        var listAssessment = '{{route("penilaian.getAssessment",$data->penilaian->penilaian_id)}}';
        
@else
        var listDosen = '{{route("penilaian.getDosen",$data->dosenmahasiswa->bidang_studi_id)}}';
        var listAssessment = '{{route("penilaian.getAssessment")}}';
@endif
        var store1 = '{{route("penilaian.storeTahap1",$data->jadwal_kuliah_id)}}';
        var getDosenDetail = '{{url("penilaian/getDosenPenilai")}}';
        var getKelompok = '{{url("penilaian/getKelompok")}}';
        var listMahasiswa = '{{url("penilaian/listMahasiswa")}}';
        var storeKelompok='{{route("penilaian.storeKelompok")}}';
        var deleteKelompok = '{{route("penilaian.deleteKelompok")}}';
        var storePenilai = '{{route("penilaian.insertPenilai")}}';
        var store2 = '{{route("penilaian.storeTahap2")}}';
        var listKriteria = '{{url("penilaian/listKriteriaAssessment")}}';
        var store3 = '{{route("penilaian.storeTahap3")}}';
 </script>
<script type="text/javascript" src="{{asset('js/penilaian/dosen.js')}}"></script>
@stop