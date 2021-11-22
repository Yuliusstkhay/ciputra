$(function(){
    $('#btnSimpan').on('click',function(){
        $('.nilai').each(function(){
           if($(this).val() == null||$(this).val() == ""){
               Swal.fire(
                'Gagal!',
                "Field Nilai tidak boleh kosong",
                'error'
                );
            return false;
           } 
        });
        simpan();
    });
});

function simpan(){
    
    
    var formData = new FormData();
    formData.append('_token', $('input[name="_token"]').val());
    $('.nilai').each(function(){
        var mhs = $(this).data('mahasiswa');
        formData.append('mahasiswa[]', $(this).data('mahasiswa'));
        formData.append('assessmentdetail[]', $(this).data('id'));
        formData.append('nilai[]', $(this).val());
        formData.append('catatan[]', $('#catatan-'+mhs).val());        
    });

    $.ajax({
        type: "post",
        url: store,
        data: formData,
        dataType: "json",
        processData: false,
        contentType: false,
        beforeSend: function () {
            $('#btnSimpan').hide();
            $('#btn-loading').show();
        },
        success: function (data) {
            console.log(data);
            if (data.result) {
                notification("success", data.message);

            } else {

                notification("error", data.message);
            }


            $('#btnSimpan').show();
            $('#btn-loading').hide();

        },
        error: function (data) {
            $('#btnSimpan').show();
            $('#btn-loading').hide();
        }
    });
}