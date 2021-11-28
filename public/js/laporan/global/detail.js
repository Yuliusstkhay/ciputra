$(function(){

    $('#assessment').select2({
        placeholder: 'Pilih Assessment',
        ajax: {
            url: assessment,
            delay: 250,
            dataType: "json",
            type: "post",
            data: function (params) {
                return {
                    q: params.term, // search term
                    page: params.page,
                    _token: $('input[name="_token"]').val()
                };
            },
            processResults: function (data, params) {
                // parse the results into the format expected by Select2
                // since we are using custom formatting functions we do not need to
                // alter the remote JSON data, except to indicate that infinite
                // scrolling can be used
                params.page = params.page || 1;
                return {
                    results: data,
                    pagination: {
                        more: (params.page * 30) < data.total_count
                    }
                };
            },
            cache: true
        }
    });
    
    $('#itempenilaian').select2({
        placeholder: 'Pilih Item Penilaian',
        ajax: {
            url: itempenilaian,
            delay: 250,
            dataType: "json",
            type: "post",
            data: function (params) {
                return {
                    q: params.term, // search term
                    page: params.page,
                    _token: $('input[name="_token"]').val(),
                    assessment : $('#assessment').val()
                };
            },
            processResults: function (data, params) {
                // parse the results into the format expected by Select2
                // since we are using custom formatting functions we do not need to
                // alter the remote JSON data, except to indicate that infinite
                // scrolling can be used
                params.page = params.page || 1;
                return {
                    results: data,
                    pagination: {
                        more: (params.page * 30) < data.total_count
                    }
                };
            },
            cache: true
        }
    });
    $('#tbl-laporandetail').DataTable();
    datatable();
    $('#assessment').on('change',function(){
       $('#itempenilaian').val("all").trigger('change'); 
       datatable();
    });
    
    $('#itempenilaian').on('change',function(){
       datatable();
    });
});

function datatable(){
    $('#tbl-laporandetail').DataTable().destroy();
    var table = $('#tbl-laporandetail').DataTable({
        processing: true,
        serverSide: true,
        "lengthMenu": [
            [10, 25,25, 50,25, 100],
            [10, 25,25, 50,25, 100]
        ],
        ajax: list+"/"+$('#assessment').val()+"/"+btoa($('#itempenilaian').val()),
        columns: [{
                data: 'DT_RowIndex',
                name: 'DT_RowIndex',
                orderable: false,
                searchable: false
            },
            {
                data: 'assessment_detail.penilaian_assessment.assessment.assessment_name',
                name: 'assessment_detail.penilaian_assessment.assessment.assessment_name'
            },
            {
                data: 'assessment_detail.item_penilaian',
                name: 'assessment_detail.item_penilaian'
            },
            {
                data: 'assessment_detail.dosen_mahasiswa.name',
                name: 'assessment_detail.dosen_mahasiswa.name'
            },
            {
                data: 'nilai',
                name: 'nilai'
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

$(document).on('click','.btnCatatan',function(){
    var catatan = $(this).data('catatan');
    $('.catatan').html(catatan);
   $('#modal-catatan-tugas').modal('show'); 
});
$('.btnclose').on('click',function(){
    $('#modal-catatan-tugas').modal('hide');
});