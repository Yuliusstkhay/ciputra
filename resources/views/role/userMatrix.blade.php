@extends('template.header_footer') 
@section('css')
@stop
@section('content')
<div class="row gap-20 masonry pos-r">
    <div class="masonry-sizer col-md-6"></div>
    <div class="masonry-item col-md-12">
        <div class="bd bgc-white">
            <div class="layers">
                <div class="layer w-100 p-20">
                    <h6 class="lh-1">Sistem Penilaian Mahasiswa</h6>
                </div>
                <div class="layer w-100">
                    <div class="bgc-teal-500 c-white p-20">
                        <div class="peers ai-c jc-sb gap-40">
                            <div class="peer peer-greed">
                                <h3>User Matrix</h3>
                            </div>
                            <div class="peer">
                                <h3 class="text-right">
                                    <a href="{{route('role')}}" class="btn btn-light d-none d-sm-inline-block">
                                        <!-- Download SVG icon from http://tabler-icons.io/i/arrow-left -->
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="18" height="18" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><line x1="5" y1="12" x2="19" y2="12" /><line x1="5" y1="12" x2="11" y2="18" /><line x1="5" y1="12" x2="11" y2="6" /></svg>                                                            Back
                                    </a>
                                </h3>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive p-20">
                        <div class="form-check">
                            <label class="form-check-label">
                                <input class="form-check-input" type="checkbox" id="checkbox1">
                                Master
                                <input type="text" class="form-control text-end pe-0" value="" autocomplete="off" id="box1" style="display: none; width: 100px;" placeholder="%">
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@stop