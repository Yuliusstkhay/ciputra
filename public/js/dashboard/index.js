$(function(){
   var table = $('#tbl-dashboard').DataTable({
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
                data: 'matkul',
                name: 'matkul'
            },
            {
                data: 'matkul_id',
                name: 'matkul_id'
            },
            {
                data: 'dosen_pengampu',
                name: 'dosen_pengampu'
            },

            {
                data: 'nilai',
                name: 'nilai',
                'sClass': 'td-actions text-center',
                orderable: false,
                searchable: false
            }
        ]
    });
 
});