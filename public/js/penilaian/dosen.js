$(document).ready(function () {

    var current_fs, next_fs, previous_fs; //fieldsets
    var opacity;


    var table = $('#tbl-dosenpenilai').DataTable({
        processing: true,
        serverSide: true,
        "paging": false,
        responsive: true,
        "lengthMenu": [
            [5, 5, 100],
            [5, 5, 100]
        ],
        ajax: listDosen,
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
                name: 'name',
                'sClass': 'td-actions text-left',
            }

        ]
    });


    var assessment = $('#tbl-assesment').DataTable({
        processing: true,
        serverSide: true,
        "paging": false,   
        scrollY:"500px",
        scrollX:true,
        scrollCollapse:true,
        "autoWidth":false,
        "columnDefs": [
            { "width": "5%", "targets": 0 },
            { "width": "8%", "targets": 1 },
            { "width": "42%", "targets": 2 },
            { "width": "10%", "targets": 3 },
            { "width": "35%", "targets": 4 },
          ],
        ajax: listAssessment,
        columns: [
            {
                data: 'action',
                name: 'action',
                'sClass': 'td-actions text-center',
                orderable: false,
                searchable: false
            },
            {
                data: 'assessment_name',
                name: 'assessment_name',
                'sClass': 'td-actions text-left',
            },
            {
                data: 'kriteria_penilaian',
                name: 'kriteria_penilaian',
                'sClass': 'td-actions text-left',
                orderable: false,
                searchable: false
            },
            {
                data: 'persentase',
                name: 'persentase',
                'sClass': 'td-actions text-left',
                orderable: false,
                searchable: false
            },
            {
                data: 'penilai',
                name: 'penilai',
                'sClass': 'td-actions text-left',
                orderable: false,
                searchable: false
            }

        ]
    });
    $('#tbl-penilaiandosen').DataTable();
    $('#tbl-kelompok').DataTable();
    $('#tbl-kelompokmahasiswa').DataTable();
    $('#tbl-itemPenilaian').DataTable({
        responsive: true,
    });


    $('#btn-save1').on('click', function () {
        saveTahap1(assessment, this);
    });


});
$(document).on('click', '.checkAll', function () {
    if (document.getElementById('checkAll').checked) {
        $('.checkDosen').prop("checked", true);
    } else {
        $('.checkDosen').prop("checked", false);
    }
});

$(document).on('click', '.checkAssessmentAll', function () {
    if (document.getElementById('checkAssessmentAll').checked) {
        $('.checkAssessment').prop("checked", true);
    } else {
        $('.checkAssessment').prop("checked", false);
    }
});

$(document).on('click', '.ckPengampu', function () {
    var id = $(this).data('id');

    if (document.getElementById('ck-pengampu-' + id).checked) {
        document.getElementById('persenPengampu-' + id).style.display = "block";
    } else {
        document.getElementById('persenPengampu-' + id).style.display = "none";
    }
});

$(document).on('click', '.checkDosenAll', function () {
    if (document.getElementById('checkDosenAll').checked) {
        $('.checkDosen').prop("checked", true);
    } else {
        $('.checkDosen').prop("checked", false);
    }
});

$(document).on('click', '.checkDosenPenilaiAll', function () {
    if (document.getElementById('checkDosenPenilaiAll').checked) {
        $('.checkDosenPenilai').prop("checked", true);
    } else {
        $('.checkDosenPenilai').prop("checked", false);
    }
});

$(document).on('click', '.ckPenilai', function () {
    var assessment = $(this).data('assessment');

    if (document.getElementById('chk-penilai-' + assessment).checked) {
        $('#tbl-penilaiandosen').DataTable().destroy();
        var dosen = $('#tbl-penilaiandosen').DataTable({
            processing: true,
            serverSide: true,
            "paging": false,
            responsive: true,
            "lengthMenu": [
                [5, 10, 55, 10, 20],
                [5, 10, 55, 10, 20]
            ],
            ajax: getDosenDetail + "/" + $('#penilaian_id').val(),
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
                    data: 'dosen.name',
                    name: 'dosen.name',
                    'sClass': 'td-actions text-left',
                },
                {
                    data: 'dosen.nip',
                    name: 'dosen.nip',
                    'sClass': 'td-actions text-left',
                },
                {
                    data: 'dosen.programstudi.bidang_studi_name',
                    name: 'dosen.programstudi.bidang_studi_name',
                    'sClass': 'td-actions text-left',
                },
            ]
        });

        var asmid = $(this).data('assessment');
        $('#asm_id').val(asmid);
        $('#modal-daftar-dosen-penilai').modal('show');
        document.getElementById('persenPenilai-' + asmid).style.display = "block";

    } else {
        const element = document.getElementById("lstDosenPenilai-" + assessment);
        element.innerHTML = '';
        document.getElementById('persenPenilai-' + assessment).style.display = "none";
    }


});

$(document).on('click', '.tutup', function () {
    var asmid = $('#asm_id').val();
    document.getElementById("chk-penilai-" + asmid).checked = false;
    $('#modal-daftar-dosen-penilai').modal('hide');
});

$(document).on('click', '#penilai-tambah', function () {
    var formData = new FormData();
    formData.append('_token', $('input[name="_token"]').val());
    formData.append('penilaian_id', $('#penilaian_id').val());
    formData.append('assessment_id', $('#asm_id').val());
    $('.checkDosenPenilai:checked').each(function () {
        formData.append('dosen[]', $(this).val());
    });

    $.ajax({
        type: "post",
        url: storePenilai,
        data: formData,
        dataType: "json",
        processData: false,
        contentType: false,
        beforeSend: function () {
            $('#penilai-tambah').hide();
            $('#btn-loadingPenilai').show();
        },
        success: function (data) {
            if (data.result) {
                notification("success", data.message);
                tambahPenilaian();

            } else {

                notification("error", data.message);
            }


            $('#penilai-tambah').show();
            $('#btn-loadingPenilai').hide();

        },
        error: function (data) {
            $('#penilai-tambah').show();
            $('#btn-loadingPenilai').hide();
        }
    });


//    $('#lstDosenPenilai-'+assessment).html(html);
})

function tambahPenilaian() {
    var assessment = $('#asm_id').val();
    var html = "";
    $('.checkDosenPenilai:checked').each(function () {
        var id = $(this).data('id');
        var name = $(this).data('name');


        const div = document.createElement('div');
        div.classList.add("form-check");
        const element = document.getElementById("lstDosenPenilai-" + assessment);
        element.appendChild(div);

        const para = document.createElement('label');
        para.classList.add("form-check-label");
        div.appendChild(para);

        const ck = document.createElement('input');
        ck.classList.add("form-check-input");
        ck.setAttribute('value', assessment + "_" + id);
        ck.setAttribute('type', "checkbox");
        ck.setAttribute('checked', "checked");
        ck.setAttribute('disabled', "disabled");
        const text = document.createTextNode(name);
        para.appendChild(ck);
        para.appendChild(text);
//        html +='<label class="form-check-label"><input class="form-check-input" value="'+assessment+'"_"'+id+'" type="checkbox">'+name+'</label>';
    });
    $('#modal-daftar-dosen-penilai').modal('hide');
}

function saveTahap1(assessment, thus) {
    var formData = new FormData();
    formData.append('_token', $('input[name="_token"]').val());
    formData.append('penilaian_id', $('#penilaian_id').val());
    $('.checkDosen:checked').each(function () {
        formData.append('dosen[]', $(this).val());
    });

    $.ajax({
        type: "post",
        url: store1,
        data: formData,
        dataType: "json",
        processData: false,
        contentType: false,
        beforeSend: function () {
            $('#btn-save1').hide();
            $('#btn-loading').show();
        },
        success: function (data) {
            if (data.result) {
                notification("success", data.message);
                $('#penilaian_id').val(data.id);
                assessment.draw();
                setTimeout(function () {
                    next(thus);
                }, 500);

            } else {

                notification("error", data.message);
            }


            $('#btn-save1').show();
            $('#btn-loading').hide();

        },
        error: function (data) {
            $('#btn-save1').show();
            $('#btn-loading').hide();
        }
    })
}

$(document).on('click', '.ckMahasiswa', function () {
    var assessment = $(this).data('assessment');
    if (document.getElementById('chk-mahasiswa-' + assessment).checked) {

        kelompok(assessment);
        var asmid = $(this).data('assessment');
        $('#asm_id').val(asmid);
        $('#modal-daftar-kelompok-mahasiswa').modal('show');
        document.getElementById('persenMahasiswa-' + asmid).style.display = "block";

    } else {
        document.getElementById('persenMahasiswa-' + assessment).style.display = "none";
    }

});

$('#btn-addkelompok').on('click', function () {
    $('#nama_kelompok').val("");
    var assessment = $('#asm_id').val();
    $('#tbl-kelompokmahasiswa').DataTable().destroy();
    var dosen = $('#tbl-kelompokmahasiswa').DataTable({
        processing: true,
        serverSide: true,
        "paging": false,
        responsive: true,
        "lengthMenu": [
            [5, 10, 55, 10, 20],
            [5, 10, 55, 10, 20]
        ],
        ajax: listMahasiswa + "/" + $('#penilaian_id').val() + "/" + assessment,
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
                data: 'mahasiswa.name',
                name: 'mahasiswa.name',
                'sClass': 'td-actions text-left',
            },

            {
                data: 'mahasiswa.nip',
                name: 'mahasiswa.name',
                'sClass': 'td-actions text-left',

            },
            {
                data: 'mahasiswa.programstudi.bidang_studi_name',
                name: 'mahasiswa.programstudi.bidang_studi_name',
                'sClass': 'td-actions text-left',

            },
        ]
    });

    $('#modal-add-kelompok-mahasiswa').modal('show');
});

$(document).on('click', '.tutupAdd', function () {
    $('#modal-add-kelompok-mahasiswa').modal('hide');
});

$(document).on('click', '.ckAllKelompok', function () {
    if (document.getElementById('ckAllKelompok').checked) {
        $('.checkKelompok').prop("checked", true);
        var jumlah = $('.checkKelompok:checked').length;
        var nilai = $('#nama_kelompok').length;
        checkceklist(nilai, jumlah);
    } else {
        $('.checkKelompok').prop("checked", false);
        var jumlah = $('.checkKelompok:checked').length;
        var nilai = $('#nama_kelompok').length;
        checkceklist(nilai, jumlah);
    }
});

$('#nama_kelompok').on('keyup', function () {
    var jumlah = $('.checkKelompok:checked').length;
    var nilai = $(this).length;
    checkceklist(nilai, jumlah);
});

$(document).on('click', '.checkKelompok', function () {
    var jumlah = $('.checkKelompok:checked').length;
    var nilai = $('#nama_kelompok').length;
    checkceklist(nilai, jumlah);
});


function checkceklist(nilai, jumlah) {
    if (nilai != "" && jumlah > 0) {
        $('#btnTambahKelompok').prop('disabled', false);
    } else {
        $('#btnTambahKelompok').prop('disabled', true);
    }
}

$('#btnTambahKelompok').on('click', function () {
    var formData = new FormData();
    formData.append('_token', $('input[name="_token"]').val());
    formData.append('penilaian_id', $('#penilaian_id').val());
    formData.append('assessment_id', $('#asm_id').val());
    formData.append('nama_kelompok', $('#nama_kelompok').val());
    $('.checkKelompok:checked').each(function () {
        formData.append('mahasiswa[]', $(this).val());
    });

    $.ajax({
        type: "post",
        url: storeKelompok,
        data: formData,
        dataType: "json",
        processData: false,
        contentType: false,
        beforeSend: function () {
            $('#btnTambahKelompok').hide();
            $('#btn-loadingKelompok').show();
        },
        success: function (data) {
            if (data.result) {
                notification("success", data.message);
                kelompok($('#asm_id').val());
                $('#modal-add-kelompok-mahasiswa').modal('hide');
            } else {

                notification("error", data.message);
            }


            $('#btnTambahKelompok').show();
            $('#btn-loadingKelompok').hide();

        },
        error: function (data) {
            $('#btnTambahKelompok').show();
            $('#btn-loadingKelompok').hide();
        }
    })
});



function kelompok(assessment) {
    $('#tbl-kelompok').DataTable().destroy();
    var dosen = $('#tbl-kelompok').DataTable({
        processing: true,
        serverSide: true,
        "paging": false,
        responsive: true,
        "lengthMenu": [
            [5, 10, 55, 10, 20],
            [5, 10, 55, 10, 20]
        ],
        ajax: getKelompok + "/" + $('#penilaian_id').val() + "/" + assessment,
        columns: [

            {
                data: 'DT_RowIndex',
                name: 'DT_RowIndex',
                orderable: false,
                searchable: false
            },
            {
                data: 'head',
                name: 'head',
                'sClass': 'td-actions text-left',
            },

            {
                data: 'detailList',
                name: 'detailList',
                'sClass': 'td-actions text-left',

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
}


$('body').on('click', '.hapusKelompok', function (e) {
    Swal.fire({
        title: 'Apakah Kamu Yakin Ingin Menghapus Data ini?',
        text: "",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Hapus',
        cancelButtonText: "Batal"
    }).then((result) => {
        if (result.value) {
            hapusKelompok(this);

        }
    })
});

function hapusKelompok(thus) {
    var penilaian = $(thus).data('id');
    var assessment = $(thus).data('assessment');
    var kelompoks = $(thus).data('kelompok');
    $.ajax({
        type: "post",
        url: deleteKelompok,
        data: {
            _token: $('input[name="_token"]').val(),
            penilaian: penilaian,
            assessment: assessment,
            kelompok: kelompoks
        },
        dataType: "json",
        success: function (data) {
            if (data.result) {
                Swal.fire(
                        'Sukses!',
                        data.message,
                        'success'
                        );
                kelompok(assessment);
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

$(document).on('click', '.tutupListKelompok', function () {
    $('#modal-daftar-kelompok-mahasiswa').modal('hide');
});

$('.previous').on('click', function () {

    previouss(this);
});

$('#btn-save2').on('click', function () {
//    cek persentase
    var persen = 0;
    $('.checkAssessment:checked').each(function () {
        var x = $(this).val();
        persen += parseInt(document.getElementById('persentase-' + x).value);
    });
    if (persen < 100 || persen > 100) {
        Swal.fire(
                'Gagal!',
                "Persentase tidak boleh kurang atau lebih dari 100",
                'error'
                );
        return false;
    } else {
        var sukses = false;
        $('.checkAssessment:checked').each(function () {
            var persenPenilai = 0;
            var x = $(this).val();

            if (document.getElementById('ck-pengampu-' + x).checked) {
                persenPenilai += parseInt(document.getElementById('persenPengampu-' + x).value);
            } else {
                persenPenilai += 0;
            }

            if (document.getElementById('chk-penilai-' + x).checked) {
                persenPenilai += parseInt(document.getElementById('persenPenilai-' + x).value);
            } else {
                persenPenilai += 0;
            }

            if (document.getElementById('chk-mahasiswa-' + x).checked) {
                persenPenilai += parseInt(document.getElementById('persenMahasiswa-' + x).value);
            } else {
                persenPenilai += 0;
            }

            if (persenPenilai < 100 || persenPenilai > 100 || isNaN(persenPenilai)) {
                Swal.fire(
                        'Gagal!',
                        "Persentase Penilai tidak boleh kurang atau lebih dari 100",
                        'error'
                        );
                sukses = false;
                return false;
            } else {
                sukses = true;
            }
        });
        if (sukses) {
            saveTahap2(this);
        }

    }
});

function saveTahap2(thus) {
    var formData = new FormData();
    formData.append('_token', $('input[name="_token"]').val());
    formData.append('penilaian_id', $('#penilaian_id').val());
    $('.checkAssessment:checked').each(function () {
        var x = $(this).val();
        formData.append('assessment[]', $(this).val());
        formData.append('kriteriaPenilaian[]', document.getElementById('kriteria_penilaian-' + x).value);
        formData.append('persenAssessment[]', parseInt(document.getElementById('persentase-' + x).value));

        if (document.getElementById('ck-pengampu-' + x).checked) {
            formData.append('persenPengampu[]', parseInt(document.getElementById('persenPengampu-' + x).value));
        } else {
            formData.append('persenPengampu[]', 0);
        }

        if (document.getElementById('chk-penilai-' + x).checked) {
            formData.append('persenPenilai[]', parseInt(document.getElementById('persenPenilai-' + x).value));
        } else {
            formData.append('persenPenilai[]', 0);
        }

        if (document.getElementById('chk-mahasiswa-' + x).checked) {
            formData.append('persenMahasiswa[]', parseInt(document.getElementById('persenMahasiswa-' + x).value));
        } else {
            formData.append('persenMahasiswa[]', 0);
        }

    });


    $.ajax({
        type: "post",
        url: store2,
        data: formData,
        dataType: "json",
        processData: false,
        contentType: false,
        beforeSend: function () {
            $('#btn-save2').hide();
            $('#btn-loading2').show();
        },
        success: function (data) {
            if (data.result) {
                notification("success", data.message);

                setTimeout(function () {
                    next(thus);
                }, 500);
                itemPenilaian($('#penilaian_id').val());
            } else {

                notification("error", data.message);
            }


            $('#btn-save2').show();
            $('#btn-loading2').hide();

        },
        error: function (data) {
            $('#btn-save2').show();
            $('#btn-loading2').hide();
        }
    });
}

function itemPenilaian(penilaian) {
    $('#tbl-itemPenilaian').DataTable().destroy();
    var itm =$('#tbl-itemPenilaian').DataTable({
        processing: true,
        serverSide: true,
        "paging": false,
        responsive: true,
        scrollY:"300px",
        scrollX:true,
        scrollCollapse:true,
        "autoWidth":false,
        "lengthMenu": [
            [5, 10, 100, 10, 20],
            [5, 10, 100, 10, 20]
        ],
        ajax: listKriteria+"/"+penilaian,
        columns: [
            {
                data: 'DT_RowIndex',
                name: 'DT_RowIndex',
                orderable: false,
                searchable: false
            },
            {
                data: 'assessment.assessment_name',
                name: 'assessment.assessment_name',
                'sClass': 'td-actions text-left',
            },
            {
                data: 'itemPenilaian',
                name: 'itemPenilaian',
                'sClass': 'td-actions text-left',
                orderable: false,
                searchable: false
            },
            {
                data: 'persentase',
                name: 'persentase',
                'sClass': 'td-actions text-left',
                orderable: false,
                searchable: false
            },
            {
                data: 'action',
                name: 'action',
                'sClass': 'td-actions text-left',
                orderable: false,
                searchable: false
            }

        ]
    });
    itm.columns.adjust().draw();
}

$(document).on('click','.btnItem',function(){
   var assessment_id = $(this).data('value');
   var jumlah = $('.btn-hapus').length;
  
  const ck = document.createElement('input');
            ck.setAttribute('type', "text");
            ck.setAttribute('id', "item_penilaian_new-"+assessment_id+"-"+jumlah);
            ck.classList.add("form-control");
            ck.classList.add("itemPenilaian");
            ck.classList.add("mb-3");
            ck.setAttribute('data-penilaiassessment', assessment_id);
            ck.setAttribute('name', "item_penilaian-"+assessment_id+"[]");
            ck.setAttribute('placeholder', "Item Penilaian");
 const element = document.getElementById("item-" + assessment_id);
                element.appendChild(ck);
 
 const prs = document.createElement('div');
             prs.classList.add("input-group");
             prs.classList.add("input-group-flat");
 const fieldprs = document.createElement('input');
            fieldprs.setAttribute('type', "text");
            fieldprs.setAttribute('id', "persentase_item_penilaian_new-"+assessment_id+"-"+jumlah);
            fieldprs.classList.add("form-control");
            fieldprs.classList.add("text-end");
            fieldprs.classList.add("pe-1");
            fieldprs.classList.add("persentaseItemPenilaian");
            fieldprs.classList.add("mb-3");
            fieldprs.setAttribute('data-penilaiassessment', assessment_id);
            fieldprs.setAttribute('name', "persentase_item_penilaian-"+assessment_id+"[]");
            fieldprs.setAttribute('placeholder', "%");
            prs.appendChild(fieldprs);
const element2 = document.getElementById("persentase-" + assessment_id);
                element2.appendChild(prs);

const dvrow = document.createElement('div');
              dvrow.classList.add("row");
               
const btndel = document.createElement("button");
               btndel.setAttribute('type', "button");
               btndel.setAttribute('id', "btn_penilaian_new-"+assessment_id+"-"+jumlah);
               btndel.classList.add("btn");
               btndel.classList.add("btn-danger");
               btndel.classList.add("ml-3");
               btndel.classList.add("col-lg-4");
               btndel.classList.add("col-md-4");
               btndel.classList.add("col-sm-3");
               btndel.classList.add("mb-3");
               btndel.classList.add("btn-hapus");
               btndel.setAttribute('data-id', assessment_id);
               btndel.setAttribute('data-urutan', jumlah);
const icon = document.createElement("i");
            icon.classList.add("far");
            icon.classList.add("fa-trash-alt");
            btndel.appendChild(icon);           
            dvrow.appendChild(btndel);
const element3 = document.getElementById("aksi-"+assessment_id);
                element3.appendChild(dvrow);

});

$(document).on('click','.btn-hapus',function(){
   var assessment_id = $(this).data('id'); 
   var urutan = $(this).data('urutan'); 
    var item = document.getElementById("item_penilaian_new-" + assessment_id+"-"+urutan);
    item.remove();
    var persentasi = document.getElementById("persentase_item_penilaian_new-" + assessment_id+"-"+urutan);
    persentasi.remove();
    var aksi = document.getElementById("btn_penilaian_new-" + assessment_id+"-"+urutan);
    aksi.remove();
});

$('#btn-save3').on('click',function(){
    var persentase=0;
    var assessment="";
    var i =0;
    var status = true;
    $('.persentaseItemPenilaian').each(function(){
        var assessmentPenilaian = $(this).data('penilaiassessment');
        if(assessment != assessmentPenilaian){
            if (i != 0) {
                if (persentase < 100 || persentase > 100) {
 
                    Swal.fire(
                            'Gagal!',
                            "Persentase Penilai tidak boleh kurang atau lebih dari 100",
                            'error'
                            );
                    status = false;
                    return false;
                }
            }
            persentase = 0;
            persentase += parseInt(($(this).val()=="")?0:$(this).val());
            assessment = assessmentPenilaian;
        }else{
            persentase += parseInt(($(this).val()=="")?0:$(this).val());
            assessment = assessmentPenilaian;
        }
        i++;
        
        if(i == $('.persentaseItemPenilaian').length){

            if (persentase < 100 || persentase > 100) {

                Swal.fire(
                        'Gagal!',
                        "Persentase Penilai tidak boleh kurang atau lebih dari 100",
                        'error'
                        );
                status = false;
                return false;
            }
        }        
    });
    
    $('.itemPenilaian').each(function(){
        if($(this).val()==""){
           Swal.fire(
                    'Gagal!',
                    "Item Penilaian tidak boleh kosong",
                    'error'
                    );
            status = false;
            return false; 
        }
    });
    if (status) {
        tahap3();
    }
});

function tahap3(){
   var formData = new FormData();
    formData.append('_token', $('input[name="_token"]').val());
    formData.append('penilaian_id', $('#penilaian_id').val());
    $('.persentaseItemPenilaian').each(function(){
        var assessmentPenilaian = $(this).data('penilaiassessment');
        formData.append('penilaianAssessment[]', assessmentPenilaian);
        formData.append('persentasePenilaianAssessment[]', $(this).val());
    });
    $('.itemPenilaian ').each(function(){
        formData.append('itemPenilaian[]', $(this).val());
    });
    

    $.ajax({
        type: "post",
        url: store3,
        data: formData,
        dataType: "json",
        processData: false,
        contentType: false,
        beforeSend: function () {
            $('#btn-save3').hide();
            $('#btn-loading3').show();
        },
        success: function (data) {
            if (data.result) {
                notification("success", data.message);
//
                setTimeout(function () {
                    window.location.href = data.url;
                }, 500);
//                itemPenilaian($('#penilaian_id').val());
            } else {

                notification("error", data.message);
            }


            $('#btn-save3').show();
            $('#btn-loading3').hide();

        },
        error: function (data) {
            $('#btn-save3').show();
            $('#btn-loading3').hide();
        }
    }); 
}


function previouss(thus) {
//    current_fs = $('.previous').parent();
//    previous_fs = $('.previous').parent().prev();
    current_fs = $(thus).data('index');
    previous_fs = current_fs - 1;

//Remove class active
    $("#progressbar li").eq(current_fs).removeClass("active");
//    $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

//show the previous fieldset
//    previous_fs.show();
    $("fieldset").eq(previous_fs).css({"display": "block"});

//hide the current fieldset with style
    $("fieldset").eq(current_fs).animate({opacity: 0}, {
        step: function (now) {
// for making fielset appear animation
            opacity = 1 - now;

            $("fieldset").eq(current_fs).css({
                'display': 'none',
                'position': 'relative'
            });
            $("fieldset").eq(previous_fs).css({'opacity': opacity});
        },
        duration: 600
    });
}

function next(thus) {
//    current_fs = $('.next').parent();
//    next_fs = $('.next').parent().next();
    current_fs = $(thus).data('index');
    next_fs = current_fs + 1;


//Add Class Active
    $("#progressbar li").eq(next_fs).addClass("active");

//show the next fieldset
//    next_fs.show();
//   .show(); 
    $("fieldset").eq(next_fs).css({"display": "block"});
//hide the current fieldset with style
    $("fieldset").eq(current_fs).animate({opacity: 0}, {
        step: function (now) {
// for making fielset appear animation
            opacity = 1 - now;

            $("fieldset").eq(current_fs).css({
                'display': 'none',
                'position': 'relative'
            });
            $("fieldset").eq(next_fs).css({'opacity': opacity});
        },
        duration: 600
    });

}