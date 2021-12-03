$(function(){
    $('#btnSimpan').on('click',function(){
        var status = true;
        $('.nilai').each(function(){
           if($(this).val() == null||$(this).val() == ""){
               Swal.fire(
                'Gagal!',
                "Field Nilai tidak boleh kosong",
                'error'
                );
             status = false;
            return false;
           } 
        });
        if(status){
           simpan(); 
        }
        
    });
});

function simpan(){
    
    
    var formData = new FormData();
    formData.append('_token', $('input[name="_token"]').val());
    $('.nilai').each(function(){
        var mhs = $(this).data('mahasiswa');
        console.log(mhs);
        formData.append('mahasiswa[]', $(this).data('mahasiswa'));
        formData.append('assessmentdetail[]', $(this).data('id'));
        formData.append('nilai[]', $(this).val());
        formData.append('catatan[]', document.getElementById('catatan-'+mhs).value);
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
                setTimeout(function () {
                    window.location.href = urlx;
                }, 500);
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