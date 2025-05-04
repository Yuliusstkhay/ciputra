<!doctype html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
        <title>{{$title}}</title>
        <link rel="stylesheet" href="{{ asset('bootstrap/css/bootstrap.min.css') }}">
        <link rel="stylesheet" href="{{ asset('bootstrap/css/bootstrap-grid.min.css') }}">

        <style>
            #loader {
                transition: all .3s ease-in-out;
                opacity: 1;
                visibility: visible;
                position: fixed;
                height: 100vh;
                width: 100%;
                background: #fff;
                z-index: 90000
            }

            #loader.fadeOut {
                opacity: 0;
                visibility: hidden
            }

            .spinner {
                width: 40px;
                height: 40px;
                position: absolute;
                top: calc(50% - 20px);
                left: calc(50% - 20px);
                background-color: #333;
                border-radius: 100%;
                -webkit-animation: sk-scaleout 1s infinite ease-in-out;
                animation: sk-scaleout 1s infinite ease-in-out
            }

            @-webkit-keyframes sk-scaleout {
                0% {
                    -webkit-transform: scale(0)
                }
                100% {
                    -webkit-transform: scale(1);
                    opacity: 0
                }
            }

            @keyframes sk-scaleout {
                0% {
                    -webkit-transform: scale(0);
                    transform: scale(0)
                }
                100% {
                    -webkit-transform: scale(1);
                    transform: scale(1);
                    opacity: 0
                }
            }
            #btn-loading{
                display: none;
            }
        </style>
        <link rel="stylesheet" type="text/css" href="{{asset('toastr/build/toastr.css')}}" />
        <link href="{{asset('template/css/style.css')}}" rel="stylesheet">

    </head>

    <body class="app">
        <div id="loader">
            <div class="spinner"></div>
        </div>
        <script>
            window.addEventListener('load', function load() {
                const loader = document.getElementById('loader');
                setTimeout(function () {
                    loader.classList.add('fadeOut');
                }, 300);
            });
        </script>
        <div class="peers ai-s fxw-nw h-100vh">
            <div class="d-n@sm- peer peer-greed h-100 pos-r bgr-n bgpX-l bgpY-b bgsz-cv" style="background-image:url({{asset('template/images/bg_univ.png')}})">
                <div class="pos-a centerXY">
                    <!-- <div class="bgc-white bdrs-50p pos-r" style="width:120px;height:120px"><img class="pos-a centerXY" src="{{asset('template/images/logo2.png')}}" alt=""></div> -->
                </div>
            </div>
            <div class="col-sm-12 col-md-4 peer pX-40 pY-80 h-100 bg-gray scrollable pos-r" style="min-width:320px">
                <h4 class="fw-300 c-grey-900 mB-40 d-none d-md-block d-lg-block">Login</h4>
                <div class="form-group d-lg-none d-md-none">
                    <img src="{{asset('image/horizontal_logo.png')}}" class="img-fluid " alt="Logo Ciputra">
                </div>
                
                <form id="frm-login" class="needs-validation" novalidate>
                    {{csrf_field()}}
                    <div class="form-group">
                        <label for="email" class="text-normal text-dark">Email</label> 
                        <input type="email" class="form-control" id="email" name="email" placeholder="Email">
                        <div class="invalid-feedback">
                            Mohon Isikan Email yang valid.
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="text-normal text-dark">Password</label> 
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                        <div class="invalid-feedback">
                            Password tidak boleh kosong.
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="peers ai-c jc-sb fxw-nw ">
                            <div class="peer">
                                <button class="btn btn-primary" id="btn-loading" type="button" disabled>
                                    <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                                    Menunggu...
                                </button>
                                <button class="btn btn-primary col-sm-12" id="btn-submit">Login</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script>
            var assets = '{{asset("")}}';
        </script>
        <script type="text/javascript" src="{{asset('template/js/vendor.js')}}"></script>
        <script type="text/javascript" src="{{asset('template/js/bundle.js')}}"></script>
        <script type="text/javascript" src="{{asset('template/jquery.js')}}"></script>
        <script src="{{ asset('bootstrap/js/bootstrap.min.js') }}"></script>
        <script src="{{asset('toastr/toastr.js')}}"></script>
        <script type="text/javascript">
            var login = '{{route("login.process")}}';
            toastr.options.toastClass = 'toastr';
        </script>
        <script type="text/javascript" src="{{asset('js/login/login.js')}}"></script>
    </body>

</html>