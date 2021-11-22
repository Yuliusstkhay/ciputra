<ul class="sidebar-menu scrollable pos-r">
    <li class="nav-item mT-30 actived">
        <a class="sidebar-link" href="{{route('dashboard')}}"><span class="icon-holder">
                <i class="c-teal-500 ti-home"></i> </span><span class="title">Dashboard</span>
        </a>
    </li>
    @if(checkHakAkses(["M01.01","M02.01","M03.01","M04.01","M05.01","M06.01","M07.01","M08.01","M09.01"]))
    <li class="nav-item dropdown"><a class="dropdown-toggle" href="javascript:void(0);"><span
                class="icon-holder"><i class="c-teal-500 ti-view-list-alt"></i> </span><span class="title">Master</span>
            <span class="arrow"><i class="ti-angle-right"></i></span></a>
        <ul class="dropdown-menu">
            @if(checkHakAkses(["M01.01"]))
            <li class="nav-item dropdown"><a href="{{route('universitas')}}"><span>Master Universitas</span></a></li>
            @endif
            @if(checkHakAkses(["M02.01"]))
            <li class="nav-item dropdown"><a href="{{route('fakultas')}}"><span>Master Fakultas</span></a></li>
            @endif
            @if(checkHakAkses(["M03.01"]))
            <li class="nav-item dropdown"><a href="{{route('programstudi')}}"><span>Master Program Studi</span></a></li>
            @endif
            @if(checkHakAkses(["M04.01"]))
            <li class="nav-item dropdown"><a href="{{route('matakuliah')}}"><span>Master Mata Kuliah</span></a></li>
            @endif
            @if(checkHakAkses(["M05.01"]))
            <li class="nav-item dropdown"><a href="{{route('dosen')}}"><span>Master Dosen</span></a></li>
            @endif
            @if(checkHakAkses(["M06.01"]))
            <li class="nav-item dropdown"><a href="{{route('mahasiswa')}}"><span>Master Mahasiswa</span></a></li>
            @endif
            @if(checkHakAkses(["M07.01"]))
            <li class="nav-item dropdown"><a href="{{route('semester')}}"><span>Master Semester</span></a></li>
            @endif
            @if(checkHakAkses(["M08.01"]))
            <li class="nav-item dropdown"><a href="{{route('jadwalkuliah')}}"><span>Jadwal Kuliah</span></a></li>
            @endif
            @if(checkHakAkses(["M09.01"]))
            <li class="nav-item dropdown"><a href="{{route('assesment')}}"><span>Master Assessment</span></a></li>
            @endif
        </ul>
    </li>
    @endif
    @if(checkHakAkses(["U01.01","U02.01"]))
    <li class="nav-item dropdown"><a class="dropdown-toggle" href="javascript:void(0);"><span class="icon-holder"><i
                    class="c-teal-500 ti-share"></i> </span><span class="title">Pengelolaan Pengguna</span><span class="arrow"><i class="ti-angle-right"></i></span></a>
        <ul class="dropdown-menu">
            @if(checkHakAkses(["U01.01"]))
            <li class="nav-item dropdown"><a href="{{route('role')}}"><span>Hak Akses</span></a></li>
            @endif
            @if(checkHakAkses(["U02.01"]))
            <li class="nav-item dropdown"><a href="{{route('user')}}"><span>Pengguna</span></a></li>
            @endif
        </ul>
    </li>
    @endif
    <li class="nav-item"><a class="sidebar-link" href="{{route('penilaian')}}"><span class="icon-holder"><i class="c-teal-500 ti-pencil"></i> </span><span class="title">Penilaian</span></a></li>
    @if(checkHakAkses(["R01.01","R02.01","R03.01"]))
    <li class="nav-item dropdown"><a class="dropdown-toggle" href="javascript:void(0);"><span
                class="icon-holder"><i class="c-teal-500 ti-files"></i> </span><span class="title">Laporan</span>
            <span class="arrow"><i class="ti-angle-right"></i></span></a>
        <ul class="dropdown-menu">
            @if(checkHakAkses(["R01.01"]))
            <li class="nav-item dropdown"><a href="{{route('laporan.global')}}"><span>Laporan Global</span></a></li>
            @endif
            @if(checkHakAkses(["R02.01"]))
            <li class="nav-item dropdown"><a href="{{route('laporan.assessment')}}"><span>Laporan Assessment</span></a></li>
            @endif
            @if(checkHakAkses(["R03.01"]))
            <li class="nav-item dropdown"><a href="{{route('laporan.detail')}}"><span>Laporan Detail</span></a></li>
            @endif
        </ul>
    </li>
    @endif
</ul>