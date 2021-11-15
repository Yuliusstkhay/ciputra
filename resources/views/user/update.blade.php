@extends('template.header_footer') 
@section('css')
<style>
    #btn-loading{
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

    #progressbar #account:before {
        font-family: FontAwesome;
        content: "\f023"
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

    #progressbar #personal:before {
        font-family: FontAwesome;
        content: "\f007"
    }

    #progressbar #payment:before {
        font-family: FontAwesome;
        content: "\f09d"
    }

    #progressbar #confirm:before {
        font-family: FontAwesome;
        content: "\f00c"
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
<link rel="stylesheet" href="{{ asset('select2/dist/css/select2.min.css') }}">
@stop
@section('content')
<div class="container-fluid">
    <h4 class="c-grey-900 mT-10 mB-30">Tambah Pengguna</h4>
    <div class="row">
        {{csrf_field()}}
        <div class="col-md-12 col-sm-12">
            <div class="bgc-white bd bdrs-3 p-20 mB-20">
                <div class="row">
                    <div class="col-md-12 mx-0">
                        <form id="msform" class="needs-validation" >
                            <!-- progressbar -->
                            <ul id="progressbar">
                                <li class="active" id="role"><strong>Pengguna</strong></li>
                                <li id="izin"><strong>Izin Akses</strong></li>
                            </ul> <!-- fieldsets -->
                            <fieldset>
                                <div class="form-card">
                                    <h2 class="fs-title">Pengguna</h2> 
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6 col-sm-12">
                                            <div class="form-group">
                                                <label for="user_id" class="text-normal text-dark">Email</label> 
                                                <input type="email" class="form-control" id="user_id" name="user_id" placeholder="Email" readonly="" value="{{$data->user_id}}" required>
                                                <div class="invalid-feedback">
                                                    Email tidak valid.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="notes" class="text-normal text-dark">Keterangan</label> 
                                                <textarea class="form-control" name="notes" id="notes" rows="6">{!! $data->notes !!}</textarea>
                                            </div>
                                        </div>
                                    </div>

                                </div> 
                                <button type="button" id="btn-lanjutkan" class="btn btn-lg btn-primary next" name="next">Lanjutkan</button>
                                <!--<input type="button" name="next" class="next action-button" value="Next Step" />-->
                            </fieldset>
                            <fieldset>
                                <div class="form-card">
                                    <h2 class="fs-title">Akses</h2>
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label for="role_name" class="text-normal text-dark">Hak Akses</label> 
                                                <select class="form-control" id="role_name" style="width:100%;" name="role_name" required="">
                                                    <option value="{{$data->role_id}}" selected="">{{$data->role->role_name}}</option>
                                                </select>
                                                <div class="invalid-feedback">
                                                    Hak Akses harus dipilih.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" id="modul">
                                    </div>
                                </div>  
                                <button type="button" name="previous" id="btn-previous" class="btn btn-lg btn-dark previous">Kembali</button>
                                <button class="btn btn-lg btn-primary " id="btn-loading" type="button" disabled>
                                    <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                                    Menunggu...
                                </button>
                                <button type="button" id="btn-submit" class="btn btn-lg btn-primary">Perbarui</button>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@stop
@section('js')
<script type="text/javascript" src="{{asset('select2/dist/js/select2.min.js')}}"></script>
<script type="text/javascript">
var store = '{{route("user.update",$data->user_id)}}';
var role = '{{route("user.getRole")}}';
var getModul = '{{route("user.modulUpdate",$data->user_id)}}';
</script>
<script type="text/javascript" src="{{asset('js/user/update.js')}}"></script>
@stop