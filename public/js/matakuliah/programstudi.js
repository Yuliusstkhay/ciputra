$(function () {
    var table = $('#tbl-programstudi').DataTable({
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
                data: 'bidang_studi_name',
                name: 'bidang_studi_name'
            },
            {
                data: 'fakultas.fakultas_name',
                name: 'fakultas.fakultas_name'
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


