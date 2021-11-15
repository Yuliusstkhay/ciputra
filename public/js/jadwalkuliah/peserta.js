$(function () {
    var table = $('#tbl-peserta').DataTable({
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
                data: 'mahasiswa.name',
                name: 'mahasiswa.name'
            },
            {
                data: 'mahasiswa.id',
                name: 'mahasiswa.id'
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

    var mhs = $('#tbl-mahasiswa').DataTable({
        processing: true,
        serverSide: true,
        "lengthMenu": [
            [10, 25, 50, 100],
            [10, 25, 50, 100]
        ],
        ajax: mahasiswa,
        columns: [
            {
                data: 'action',
                name: 'action',
                'sClass': 'td-actions text-center',
                orderable: false,
                searchable: false
            },
            {
                data: 'DT_RowIndex',
                name: 'DT_RowIndex',
                orderable: false,
                searchable: false
            },
            {
                data: 'name',
                name: 'name'
            },
            {
                data: 'id',
                name: 'id'
            },
            {
                data: 'programstudi.bidang_studi_name',
                name: 'programstudi.bidang_studi_name'
            },
        ]
    });

    $('.btn-peserta').on('click', function () {
        mhs.draw();
    });

    $('#btn-addpeserta').on('click', function () {
        const peserta = [];
        $('.checkPeserta:checked').each(function () {
            peserta.push($(this).val());
        });
        save(mhs, table, peserta);
    });

    $('body').on('click', '.btn-delete', function (e) {
        Swal.fire({
            title: 'Apakah Kamu Yakin Ingin Menghapus Peserta ini?',
            text: "",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Hapus',
            cancelButtonText: "Batal"
        }).then((result) => {
            if (result.value) {
                hapus(this, table);

            }
        })
    });

});

$('#checkAll').on('click', function () {
    if (document.getElementById('checkAll').checked) {
        $('.checkPeserta').prop("checked", true);
    } else {
        $('.checkPeserta').prop("checked", false);
    }
    updateCounter();

});

$(document).on('click', '.checkPeserta', function () {
    updateCounter();
})

function updateCounter() {
    var len = $(".checkPeserta:checked").length;
    if (len > 0) {
        $('#btn-addpeserta').prop('disabled', false);
    } else {
        $('#btn-addpeserta').prop('disabled', true);
    }
}

function save(mhs, table, peserta) {
    $.ajax({
        url: store,
        type: 'post',
        data: {
            _token: $('input[name="_token"]').val(),
            peserta: peserta

        },
        dataType: "json",
        beforeSend: function () {
            $('#btn-addpeserta').hide();
            $('#btn-loading').show();
        },
        success: function (data) {
            console.log(data);
            if (data.result) {
                notification("success", data.message);
                mhs.draw();
                table.draw();
            } else {

                notification("error", data.message);
            }


            $('#btn-addpeserta').show();
            $('#btn-loading').hide();
        },
        error: function () {
            $('#btn-addpeserta').show();
            $('#btn-loading').hide();
        }

    })
}


function hapus(thus, table) {
    var idx = $(thus).data('id');
    var mhs = $(thus).data('mhs');
    $.ajax({
        type: "delete",
        url: nonaktif + "/" + idx+"/"+mhs,
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