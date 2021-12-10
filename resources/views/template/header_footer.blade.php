<!doctype html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=0.9,shrink-to-fit=no">
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
        </style>
        <link rel="stylesheet" type="text/css" href="{{asset('toastr/build/toastr.css')}}" />
        <link rel="stylesheet" href="{{asset('sweetalert2/dist/sweetalert2.min.css')}}">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
        <link href="{{asset('template/css/style.css')}}" rel="stylesheet">

        @yield('css')
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
        <div>
            <div class="sidebar">
                <div class="sidebar-inner">
                    <div class="sidebar-logo">
                        <div class="peers ai-c fxw-nw">
                            <div class="peer peer-greed">
                                <a class="sidebar-link td-n" href="{{route('dashboard')}}">
                                    <div class="peers ai-c fxw-nw">
                                        <div class="peer">
                                            <div class="logo"><img src="{{asset('template/images/logo2.png')}}" alt=""></div>
                                        </div>
                                        <div class="peer peer-greed">
                                            <h5 class="lh-1 mB-0 logo-text">Universitas Ciputra</h5>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="peer">
                                <div class="mobile-toggle sidebar-toggle"><a href="" class="td-n"><i class="ti-arrow-circle-left"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    @include('template.menu')
                </div>
            </div>
            <div class="page-container">
                <div class="header navbar">
                    <div class="header-container">
                        <ul class="nav-left">
                            <li><a id="sidebar-toggle" class="sidebar-toggle" href="javascript:void(0);"><i class="ti-menu"></i></a>
                            </li>
                            <li class="search-box"><a class="search-toggle no-pdd-right" href="javascript:void(0);"><i
                                        class="search-icon ti-search pdd-right-10"></i> <i
                                        class="search-icon-close ti-close pdd-right-10"></i></a></li>
                            <li class="search-input"><input class="form-control" type="text" placeholder="Search..."></li>
                        </ul>
                        <ul class="nav-right">
                            <li class="dropdown">
                                <a href="" class="dropdown-toggle no-after peers fxw-nw ai-c lh-1" data-toggle="dropdown">
                                    <div class="peer mR-10"><img class="w-2r bdrs-50p" src="{{asset('image/user_icon.png')}}" alt=""></div>
                                    <div class="peer"><span class="fsz-sm c-grey-900 p-3">{{(Auth::user()->type == 2)?Auth::user()->user_id:Auth::user()->dosen->name}}</span></div>
                                </a>
                                <ul class="dropdown-menu fsz-sm">
                                    <li><a href="{{route('profil')}}" class="d-b td-n pY-5 bgcH-grey-100 c-grey-700"><i class="fas fa-user-circle mR-10"></i>
                                            <span>Profil</span></a>
                                    </li>
                                    <li><a href="{{route('logout')}}" class="d-b td-n pY-5 bgcH-grey-100 c-grey-700"><i class="ti-power-off mR-10"></i>
                                            <span>Logout</span></a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <main class="main-content bgc-grey-100">
                    <div id="mainContent">
                        @yield('content')
                    </div>
                </main>
                <footer class="bdT ta-c p-30 lh-0 fsz-sm c-grey-600"><span>Copyright © 2021. All rights reserved.</span>
                </footer>
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
        <script src="{{asset('sweetalert2/dist/sweetalert2.min.js')}}"></script>
        <script type="text/javascript">
            toastr.options.toastClass = 'toastr';
            function notification(type, message) {
                toastr[type](message);
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": false,
                    "showDuration": 300,
                    "hideDuration": 1000,
                    "timeOut": 5000,
                    "extendedTimeOut": 1000,
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
            }
        </script>
        @yield('js')
    </body>

</html>