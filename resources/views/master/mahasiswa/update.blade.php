@extends('template.header_footer') 
@section('css')
<style>
    #btn-loading{
        display: none;
    }
</style>
@stop
@section('content')
<div class="container-fluid">
    <h4 class="c-grey-900 mT-10 mB-30">Ubah Mahasiswa</h4>
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="bgc-white bd bdrs-3 p-20 mB-20">
                <form id="frm-programstudi" class="needs-validation" novalidate>
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
                                <label for="nip" class="text-normal text-dark">NIM</label> 
                                <input type="text" class="form-control" id="nip" name="nip" placeholder="NIM" value="{{$data->nip}}" required>
                                <div class="invalid-feedback">
                                    NIM tidak boleh kosong.
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
                        </div>
                    </div>
                    <div class="form-group mb-5">
                        <div class="col-12">
                            <button class="btn btn-primary float-end col-2" id="btn-loading" type="button" disabled>
                                <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                                Menunggu...
                            </button>
                            <button class="btn btn-primary float-end col-2" id="btn-submit">Perbarui</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@stop
@section('js')
<script type="text/javascript">
    var store = '{{route("mahasiswa.update",$data->id)}}';
</script>
<script type="text/javascript" src="{{asset('js/mahasiswa/update.js')}}"></script>
@stop