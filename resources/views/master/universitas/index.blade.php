@extends('template.header_footer') 
@section('css')
<link href="{{asset('DataTables/datatables.min.css')}}" rel="stylesheet">
    @stop
    @section('content')
    <div class="container-fluid">
        <h4 class="c-grey-900 mT-10 mB-30">Master Universitas</h4>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active" aria-current="page">Master Universitas</li>
            </ol>
        </nav>
        {{csrf_field()}}
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
                                    Daftar Universitas
                                </h2>
                            </div>
                            <!-- Page title actions -->
                            @if(checkHakAkses(["M01.02"]))
                            <div class="col-auto ms-auto">
                                <div class="btn-list">
                                    <a href="{{route('universitas.create')}}" class="btn btn-info d-sm-inline-block">
                                        <!-- Download SVG icon from http://tabler-icons.io/i/plus -->
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="18" height="18" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <line x1="12" y1="5" x2="12" y2="19" />
                                            <line x1="5" y1="12" x2="19" y2="12" />
                                        </svg> Tambah
                                    </a>
                                </div>
                            </div>
                            @endif
                        </div>
                    </div>
                    <table id="table-universitas" class="table table-hover" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Universitas</th>
                                <th>Status</th>
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
        var list = '{{route("universitas.list")}}';
        var nonaktif = '{{url("universitas/void")}}';
        var aktif = '{{url("universitas/unvoid")}}';
    </script>
    <script type="text/javascript" src="{{asset('js/universitas/index.js')}}"></script>
    @stop