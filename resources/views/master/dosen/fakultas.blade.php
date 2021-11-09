@extends('template.header_footer') 
@section('css')
<link href="{{asset('DataTables/datatables.min.css')}}" rel="stylesheet">
    @stop
    @section('content')
    <div class="container-fluid">
        <h4 class="c-grey-900 mT-10 mB-30">Master Dosen</h4>
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
                                    Daftar Fakultas
                                </h2>
                            </div>
                            <!-- Page title actions -->
                        </div>
                    </div>
                    <table id="table-fakultas" class="table table-hover" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Fakultas</th>
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
        var list = '{{route("dosen.fakultas")}}';
    </script>
    <script type="text/javascript" src="{{asset('js/dosen/fakultas.js')}}"></script>
    @stop