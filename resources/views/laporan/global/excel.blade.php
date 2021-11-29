<table>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td style="width:100%">Laporan Global</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td colspan="4"><h2>{{$data['header']->jadwal->matakuliah->mata_kuliah_name}}</h2></td>
    </tr>
    <tr>
        <td>&nbsp;</td> 
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>Fakultas</td>
        <td colspan="3">:{{$data['header']->jadwal->matakuliah->programstudi->fakultas->fakultas_name}}</td>
        <td>&nbsp;</td>
        <td>Parallel</td>
        <td>:{{$data['header']->jadwal->paralel}}</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>Program Studi</td>
        <td colspan="3">:{{$data['header']->jadwal->matakuliah->programstudi->bidang_studi_name}}</td>
        <td>&nbsp;</td>
        <td>Dosen Pengampu</td>
        <td>:{{$data['header']->jadwal->dosenmahasiswa->name}}</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>Mata Kuliah</td>
        <td colspan="3">:{{$data['header']->jadwal->matakuliah->mata_kuliah_name}}</td>
        <td>&nbsp;</td>
        <td>Periode</td>
        <td>:{{$data['header']->jadwal->semester->semester_name}}</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>Kode Mata Kuliah</td>
        <td colspan="3">:{{$data['header']->jadwal->matakuliah->mata_kuliah_id}}</td>
        <td>&nbsp;</td>
        <td>Jadwal</td>
        <td>:{{$data['header']->jadwal->deskripsi}}</td>
    </tr>
</table>
<table>
    <tr>
        <th>&nbsp;</th>
        <th>No</th>
        <th>Nama Mahasiswa</th>
        <th>NIM</th>
        <th>Nilai</th>
    </tr>
    @foreach($data['detail'] as $key => $row)
    <tr>
        <td>&nbsp;</td>
        <td>{{$key+1}}</td>
        <td>{{$row->mahasiswa->name}}</td>
        <td>{{$row->mahasiswa->nip}}</td>
        <td>{{$row->nilai_akhir}}</td>
    </tr>
    @endforeach
</table>
