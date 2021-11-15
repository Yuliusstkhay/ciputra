<ul class="sidebar-menu scrollable pos-r">
    <li class="nav-item mT-30 actived">
        <a class="sidebar-link" href="{{route('dashboard')}}"><span class="icon-holder">
                <i class="c-teal-500 ti-home"></i> </span><span class="title">Dashboard</span>
        </a>
    </li>
    
    <li class="nav-item dropdown"><a class="dropdown-toggle" href="javascript:void(0);"><span
                class="icon-holder"><i class="c-teal-500 ti-view-list-alt"></i> </span><span class="title">Master</span>
            <span class="arrow"><i class="ti-angle-right"></i></span></a>
        <ul class="dropdown-menu">
            <li class="nav-item dropdown"><a href="{{route('universitas')}}"><span>Master Universitas</span></a></li>
            <li class="nav-item dropdown"><a href="{{route('fakultas')}}"><span>Master Fakultas</span></a></li>
            <li class="nav-item dropdown"><a href="{{route('programstudi')}}"><span>Master Program Studi</span></a></li>
            <li class="nav-item dropdown"><a href="{{route('matakuliah')}}"><span>Master Mata Kuliah</span></a></li>
            <li class="nav-item dropdown"><a href="{{route('dosen')}}"><span>Master Dosen</span></a></li>
            <li class="nav-item dropdown"><a href="{{route('mahasiswa')}}"><span>Master Mahasiswa</span></a></li>
            <li class="nav-item dropdown"><a href="{{route('semester')}}"><span>Master Semester</span></a></li>
            <li class="nav-item dropdown"><a href="{{route('jadwalkuliah')}}"><span>Jadwal Kuliah</span></a></li>
            <li class="nav-item dropdown"><a href="{{route('assesment')}}"><span>Master Assessment</span></a></li>
        </ul>
    </li>
    <li class="nav-item dropdown"><a class="dropdown-toggle" href="javascript:void(0);"><span class="icon-holder"><i
                    class="c-teal-500 ti-share"></i> </span><span class="title">Pengelolaan Pengguna</span><span class="arrow"><i class="ti-angle-right"></i></span></a>
        <ul class="dropdown-menu">
            <li class="nav-item dropdown"><a href="{{route('role')}}"><span>Hak Akses</span></a></li>
            <li class="nav-item dropdown"><a href="{{route('user')}}"><span>Pengguna</span></a></li>
        </ul>
    </li>
    <li class="nav-item"><a class="sidebar-link" href="{{route('penilaian')}}"><span class="icon-holder"><i
                    class="c-teal-500 ti-pencil"></i> </span><span class="title">Penilaian</span></a></li>
</ul>