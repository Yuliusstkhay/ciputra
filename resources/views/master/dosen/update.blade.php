@extends('template.header_footer') 
@section('css')
<style>
    #btn-loading{
        display: none;
    }
</style>
<link rel="stylesheet" href="{{ asset('select2/dist/css/select2.min.css') }}">
@stop
@section('content')
<div class="container-fluid">
    <h4 class="c-grey-900 mT-10 mB-30">Perbarui Dosen</h4>
    <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('dosen')}}">Fakultas</a></li>
                <li class="breadcrumb-item"><a href="{{url('dosen/programstudi/'.$data->programStudi->fakultas->fakultas_id)}}">Program Studi</a></li>
                <li class="breadcrumb-item"><a href="{{url('dosen/dosen/'.$data->programStudi->bidang_studi_id."_".$data->programStudi->fakultas->fakultas_id)}}">Master Dosen</a></li>
                <li class="breadcrumb-item active" aria-current="page">Ubah</li>
            </ol>
        </nav>
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="bgc-white bd bdrs-3 p-20 mB-20">
                <form id="frm-dosen" class="needs-validation" novalidate>
                    {{csrf_field()}}
                    <input type="hidden" name="program_studi_id" id="program_studi_id" value="{{$data->programStudi->bidang_studi_id}}"  />
                    <div class="row">
                        <div class="col-md-6 col-lg-6 col-sm-12">
                            <div class="form-group">
                                <label for="fakultas_id" class="text-normal text-dark">Fakultas</label> 
                                <input type="text" class="form-control" value="{{$data->programStudi->fakultas->fakultas_name}}" disabled="" />
                            </div>
                            <div class="form-group">
                                <label for="programstudi_name" class="text-normal text-dark">Program Studi</label> 
                                <input type="text" class="form-control" value="{{$data->programStudi->bidang_studi_name}}" disabled="" />
                            </div>
                            <div class="form-group">
                                <label for="nip" class="text-normal text-dark">NIP</label> 
                                <input type="text" class="form-control" id="nip" name="nip" placeholder="NIP" value="{{$data->nip}}" required>
                                <div class="invalid-feedback">
                                    NIP tidak boleh kosong.
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="name" class="text-normal text-dark">Nama</label> 
                                <input type="text" class="form-control" id="name" name="name" placeholder="Nama" value="{{$data->name}}" required>
                                <div class="invalid-feedback">
                                    Nama tidak boleh kosong.
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-sm-12">
                            <div class="form-group">
                                <label for="email" class="text-normal text-dark">Email</label> 
                                <input type="email" class="form-control" id="email" name="email" placeholder="Email" value="{{$data->email}}" required>
                                <div class="invalid-feedback">
                                    Email harus valid.
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="jabatan" class="text-normal text-dark">Jabatan</label> 
                                <input type="jabatan" class="form-control" id="jabatan" name="jabatan" placeholder="Jabatan" value="{{$data->jabatan}}" required>
                                <div class="invalid-feedback">
                                    Jabatan tidak boleh kosong.
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="role_id" class="text-normal text-dark">Hak Akses</label> 
                                <select class="form-control col-12" style="width:100%!important;" name="role_id" id="role_id" required="">
                                    <option value="{{$data->user->role_id}}">{{$data->user->role->role_name}}</option>
                                </select>
                                <div class="invalid-feedback">
                                    Hak Akses Harus Dipilih.
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group mb-5">
                        <div class="col-12">
                            <a href="{{url('dosen/dosen/'.$data->programStudi->bidang_studi_id."_".$data->programStudi->fakultas->fakultas_id)}}" class="btn btn-dark float-start col-lg-2 col-md-2 col-sm-4 d-none d-lg-block d-md-block d-print-block">Kembali</a>
                            <button class="btn btn-primary float-end col-lg-2 col-md-2 col-sm-4" id="btn-loading" type="button" disabled>
                                <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                                Menunggu...
                            </button>
                            <button class="btn btn-primary float-end col-lg-2 col-md-2 col-sm-4" id="btn-submit">Perbarui</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@stop
@section('js')
<script type="text/javascript" src="{{asset('select2/dist/js/select2.min.js')}}"></script>
<script type="text/javascript">
    
    var store = '{{route("dosen.update",$data->id)}}';
    var urlx = '{{url("dosen/dosen/".$data->programStudi->bidang_studi_id."_".$data->programStudi->fakultas->fakultas_id)}}';
    var hakakses = '{{route("dosen.hakakses")}}';
</script>
<script type="text/javascript" src="{{asset('js/dosen/update.js')}}"></script>
@stop