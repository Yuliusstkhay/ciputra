@extends('template.header_footer') 
@section('css')
<link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet">
@stop
@section('content')
    <div class="container-fluid">
        <h4 class="c-grey-900 mT-10 mB-30">Penilaian</h4>
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
                                    Daftar Penilaian
                                </h2>
                            </div>
                            <!-- Page title actions -->
                            <div class="col-auto ms-auto d-print-none">
                                <div class="btn-list">
                                    <a href="{{url('penilaian/add')}}" class="btn btn-info d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-report">
                                        <!-- Download SVG icon from http://tabler-icons.io/i/plus -->
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="18" height="18" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <line x1="12" y1="5" x2="12" y2="19" />
                                            <line x1="5" y1="12" x2="19" y2="12" />
                                        </svg> Add New
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <table id="dataTable" class="table table-hover" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Mata Kuliah</th>
                                <th>Kode Mata Kuliah</th>
                                <th>Dosen Pengampu</th>
                                <th>Jadwal</th>
                                <th>Nilai</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <!-- <tfoot>
      <tr>
        <th>No</th>
        <th>Mata Kuliah</th>
        <th>Kode Mata Kuliah</th>
        <th>Dosen Pengampu</th>
        <th>Semester</th>
        <th>Jadwal</th>
        <th>Status</th>
        <th>Aksi</th>
      </tr>
    </tfoot> -->
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Gambar Teknik dan Permodelan<br>(Technical Drawing and 3D Modelling)</td>
                                <td>MK230001</td>
                                <td>Dr. Ir. Janti Gunawan, M.Eng.Sc., M.Com.IB.</td>
                                <td>Senin 09.00-11.00<br>Rabu 13.00-15.00</td>
                                <td>
                                    <a class="btn cur-p btn-success" href="{{url('penilaian/nilai/asdsadad')}}">   
                                        Nilai
                                    </a>
                                </td>
                                <td>
                                    <button type="button" class="btn cur-p btn-secondary">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="15" height="15"
                                             viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                             stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <circle cx="10" cy="10" r="7" />
                                            <line x1="21" y1="21" x2="15" y2="15" />
                                        </svg>
                                    </button>
                                    <button type="button" class="btn cur-p btn-primary">
                                        <!-- Download SVG icon from http://tabler-icons.io/i/edit -->
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="15" height="15"
                                             viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                             stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <path d="M9 7h-3a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-3" />
                                            <path d="M9 15h3l8.5 -8.5a1.5 1.5 0 0 0 -3 -3l-8.5 8.5v3" />
                                            <line x1="16" y1="5" x2="19" y2="8" />
                                        </svg>
                                    </button>
                                    <button type="button" class="btn cur-p btn-danger">
                                        <!-- Download SVG icon from http://tabler-icons.io/i/x -->
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="15" height="15" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><line x1="18" y1="6" x2="6" y2="18" /><line x1="6" y1="6" x2="18" y2="18" /></svg>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Entrepreneurship Essentials</td>
                                <td>MK220007</td>
                                <td>Dr. Ir. Janti Gunawan, M.Eng.Sc., M.Com.IB.</td>
                                <td>Selasa 09.00-11.00<br>Kamis 11.00-13.00</td>
                                <td>
                                    <button type="button" class="btn cur-p btn-success">   
                                        Nilai
                                    </button>
                                </td>
                                <td>
                                    <button type="button" class="btn cur-p btn-secondary">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="15" height="15"
                                             viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                             stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <circle cx="10" cy="10" r="7" />
                                            <line x1="21" y1="21" x2="15" y2="15" />
                                        </svg>
                                    </button>
                                    <button type="button" class="btn cur-p btn-primary">
                                        <!-- Download SVG icon from http://tabler-icons.io/i/edit -->
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="15" height="15"
                                             viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                             stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <path d="M9 7h-3a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-3" />
                                            <path d="M9 15h3l8.5 -8.5a1.5 1.5 0 0 0 -3 -3l-8.5 8.5v3" />
                                            <line x1="16" y1="5" x2="19" y2="8" />
                                        </svg>
                                    </button>
                                    <button type="button" class="btn cur-p btn-danger">
                                        <!-- Download SVG icon from http://tabler-icons.io/i/x -->
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="15" height="15" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><line x1="18" y1="6" x2="6" y2="18" /><line x1="6" y1="6" x2="18" y2="18" /></svg>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Desain Ruang Kompak<br>(Compact Space Design)</td>
                                <td>MK230021</td>
                                <td>Dr. Ir. Janti Gunawan, M.Eng.Sc., M.Com.IB.</td>
                                <td>Jumat 07.00-09.00</td>
                                <td>
                                    <button type="button" class="btn cur-p btn-success">
                                        Nilai
                                    </button>
                                </td>
                                <td>
                                    <button type="button" class="btn cur-p btn-secondary">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="15" height="15"
                                             viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                             stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <circle cx="10" cy="10" r="7" />
                                            <line x1="21" y1="21" x2="15" y2="15" />
                                        </svg>
                                    </button>
                                    <button type="button" class="btn cur-p btn-primary">
                                        <!-- Download SVG icon from http://tabler-icons.io/i/edit -->
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="15" height="15"
                                             viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                             stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <path d="M9 7h-3a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-3" />
                                            <path d="M9 15h3l8.5 -8.5a1.5 1.5 0 0 0 -3 -3l-8.5 8.5v3" />
                                            <line x1="16" y1="5" x2="19" y2="8" />
                                        </svg>
                                    </button>
                                    <button type="button" class="btn cur-p btn-danger">
                                        <!-- Download SVG icon from http://tabler-icons.io/i/x -->
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="15" height="15" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><line x1="18" y1="6" x2="6" y2="18" /><line x1="6" y1="6" x2="18" y2="18" /></svg>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>Sejarah dan Teori Desain di Indonesia<br>(Indonesian History and Theory)</td>
                                <td>MK230004</td>
                                <td>Prof. Dr. Ir. Sugeng Winardi</td>
                                <td>Senin 07.00-09.00<br>Kamis 11.00-13.00</td>
                                <td>
                                    <button type="button" class="btn cur-p btn-success">
                                        Nilai
                                    </button>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>Sistem Struktur Generatif<br>(Generative Structure System)</td>
                                <td>MK230005</td>
                                <td>Febe Yuanita Ratna Indudewi, S.E. M.M. </td>
                                <td>Selasa 09.00-11.00<br>Kamis 13.00-15.00</td>
                                <td>
                                    <button type="button" class="btn cur-p btn-success">
                                        Nilai
                                    </button>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>Arsitektur Digital<br>(Digital Architecture)</td>
                                <td>MK230008</td>
                                <td>Laij Victor Effendi, S.E., CMA. </td>
                                <td>Senin 11.00-13.00<br>Rabu 07.00-09.00</td>
                                <td>
                                    <button type="button" class="btn cur-p btn-success">
                                        Nilai
                                    </button>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>Simbolik, Inovasi, dan Teknologi<br>(Simbolic, Innovation, and Technology)</td>
                                <td>MK230011</td>
                                <td>Helena Sidharta, S.E., M.M.</td>
                                <td>Jumat 13.00-15.00</td>
                                <td>
                                    <button type="button" class="btn cur-p btn-success">
                                        Nilai
                                    </button>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    @stop