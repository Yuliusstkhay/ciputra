$(function () {
    var table = $('#tbl-laporanglobal').DataTable({
        processing: true,
        serverSide: true,
        responsive: true,
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
                data: 'mahasiswa.name',
                name: 'mahasiswa.name'
            },
            {
                data: 'mahasiswa.nip',
                name: 'mahasiswa.nip'
            },
            {
                data: 'nilai_akhir',
                name: 'nilai_akhir'
            },
//            {
//                data: 'action',
//                name: 'action',
//                'sClass': 'td-actions text-center',
//                orderable: false,
//                searchable: false
//            }
        ]
    });

});


