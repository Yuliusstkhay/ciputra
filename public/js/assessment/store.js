
(function () {
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

function save() {
    $.ajax({
        url: store,
        type: 'post',
        data: {
            _token: $('input[name="_token"]').val(),
            assessment_name: $('input[name="assessment_name"]').val(),
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

