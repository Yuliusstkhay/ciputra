(function(){
     'use strict';
    window.addEventListener('load', function () {
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.getElementsByClassName('needs-validation');
        // Loop over them and prevent submission
        var validation = Array.prototype.filter.call(forms, function (form) {
            form.addEventListener('submit', function (event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                } else {
                    event.preventDefault();
                    save();
                }
                form.classList.add('was-validated');
            }, false);
        });
    }, false);
})();

$(function(){

    $('#role_id').select2({
        placeholder: 'Pilih Hak Akses',
        ajax: {
            url: hakakses,
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
});

function save() {
    $.ajax({
        url: store,
        type: 'post',
        data: {
            _token: $('input[name="_token"]').val(),
            program_studi_id: $('#program_studi_id').val(),
            nip:$('#nip').val(),
            name:$('#name').val(),
            email:$('#email').val(),
            password:$('#password').val(),
            role_id:$('#role_id').val()

        },
        dataType: "json",
        beforeSend: function () {
            $('#btn-submit').hide();
            $('#btn-loading').show();
        },
        success: function (data) {
           if(data.result){
               notification("success", data.message);
               setTimeout(function () {
                    window.location.href = urlx;
                }, 500);
           }else{

               notification("error", data.message);
           }


            $('#btn-submit').show();
            $('#btn-loading').hide();
        },
        error: function () {
            $('#btn-submit').show();
            $('#btn-loading').hide();
        }

    })
}
