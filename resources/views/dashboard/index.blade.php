@extends('template.header_footer') 
@section('css')
<link href="{{asset('DataTables/datatables.min.css')}}" rel="stylesheet">
@stop
@section('content')
<div class="container-fluid">
   <div class="bd bgc-white">
            <div class="row">
                <div class="col-12">
                    <div class="bgc-teal-500 c-white p-20">
                        <div class="peers ai-c jc-sb gap-40">
                            <div class="peer peer-greed">
                                <h3>{{(Auth::user()->type == 2)?Auth::user()->user_id:Auth::user()->dosen->name}}</h3>
                                <p class="mB-0">{{(Auth::user()->type == 2)?"":Auth::user()->dosen->nip}}</p>
                            </div>
<!--                            <div class="peer">
                                <h3 class="text-right">7</h3>
                            </div>-->
                        </div>
                    </div>
                </div>
            </div> 
            <div class="row p-20">
                <div class="col-12">
                    <div class="table-responsive">
                        <table class="table" id="tbl-dashboard">
                            <thead>
                                <tr>
                                    <th class="bdwT-0">No</th>
                                    <th class="bdwT-0">Mata Kuliah</th>
                                    <th class="bdwT-0">Kode Mata Kuliah</th>
                                    <th class="bdwT-0">Dosen Pengampu</th>
                                    <th class="bdwT-0">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            
            <div class="ta-c bdT w-100 p-20"><a href="{{route('penilaian')}}">Lihat semua penilaian</a></div>
        </div> 
</div>
@stop
@section('js')
    <script type="text/javascript" src="{{asset('DataTables/datatables.min.js')}}"></script>
    <script type="text/javascript">
        var list = '{{route("dashboard.list")}}';
    </script>
    <script type="text/javascript" src="{{asset('js/dashboard/index.js')}}"></script>
    @stop