$(function () {
    var table = $('#tbl-matkul').DataTable({
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
                data: 'mata_kuliah_name',
                name: 'mata_kuliah_name'
            },
            {
                data: 'mata_kuliah_id',
                name: 'mata_kuliah_id'
            },
            {
                data: 'programstudi.bidang_studi_name',
                name: 'programstudi.bidang_studi_name'
            },
            {
                data: 'programstudi.fakultas.fakultas_name',
                name: 'programstudi.fakultas.fakultas_name'
            },
            {
                data: 'status',
                name: 'status',
                render: function (data, type, row) {
                    if (data == 0) {
                        return '<span class="badge bgc-green-50 c-green-700 p-10 lh-0 tt-c badge-pill">Active</span>';
                    } else {
                        return '<span class="badge bgc-red-50 c-red-700 p-10 lh-0 tt-c badge-pill">Inactive</span>';
                    }
                }
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

    $('body').on('click', '.void', function (e) {
        Swal.fire({
            title: 'Apakah Kamu Yakin Ingin Menonaktifkan Data ini?',
            text: "",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Nonaktifkan',
            cancelButtonText: "Batal"
        }).then((result) => {
            if (result.value) {
                nonaktifkan(this, table);

            }
        })
    });
    
    $('body').on('click', '.unvoid', function (e) {
        Swal.fire({
            title: 'Apakah Kamu Yakin Ingin Mengaktifkan Data ini?',
            text: "",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Aktifkan',
            cancelButtonText: "Batal"
        }).then((result) => {
            if (result.value) {
                aktifkan(this, table);

            }
        })
    });
});

function nonaktifkan(thus, table) {
    var idx = $(thus).data('id');
    $.ajax({
        type: "put",
        url: nonaktif + "/" + idx,
        data: {
            _token: $('input[name="_token"]').val(),
        },
        dataType: "json",
        success: function (data) {
            if (data.result) {
                Swal.fire(
                        'Sukses!',
                        data.message,
                        'success'
                        );
                table.draw();
            } else {
                Swal.fire(
                        'Gagal!',
                        data.message,
                        'error'
                        );
            }
        },
        error: function (data) {
            Swal.fire(
                    'Gagal!',
                    data.message,
                    'error'
                    );
        }
    });
}

function aktifkan(thus, table) {
    var idx = $(thus).data('id');
    $.ajax({
        type: "put",
        url: aktif + "/" + idx,
        data: {
            _token: $('input[name="_token"]').val(),
        },
        dataType: "json",
        success: function (data) {
            if (data.result) {
                Swal.fire(
                        'Sukses!',
                        data.message,
                        'success'
                        );
                table.draw();
            } else {
                Swal.fire(
                        'Gagal!',
                        data.message,
                        'error'
                        );
            }
        },
        error: function (data) {
            Swal.fire(
                    'Gagal!',
                    data.message,
                    'error'
                    );
        }
    });
}

