$(function () {
    var table = $('#table-jadwal').DataTable({
        processing: true,
        serverSide: true,
        "lengthMenu": [
            [10, 25, 50, 100],
            [10, 25, 50, 100]
        ],
        ajax: list,
        columns: [{
                data: 'DT_RowIndex',
                name: 'DT_RowIndex',
                orderable: false,
                searchable: false
            },
            {
                data: 'jadwal.matakuliah.mata_kuliah_name',
                name: 'jadwal.matakuliah.mata_kuliah_name'
            },
            {
                data: 'jadwal.matakuliah.mata_kuliah_id',
                name: 'jadwal.matakuliah.mata_kuliah_id'
            },
            {
                data: 'jadwal.dosenmahasiswa.name',
                name: 'jadwal.dosenmahasiswa.name'
            },
            {
                data: 'jadwal.deskripsi',
                name: 'jadwal.deskripsi'
            },

            {
                data: 'action',
                name: 'action',
                'sClass': 'td-actions text-center',
                orderable: false,
                searchable: false
            }
        ]
    });

});


