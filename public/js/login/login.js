//$(function(){
//    $('#frm-login').submit(function(e){
//       e.preventDefault();
//       console.log("test");
//    });
//})
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
        url: login,
        type: 'post',
        data: {
            _token: $('input[name="_token"]').val(),
            email: $('input[name="email"]').val(),
            password: $('input[name="password"]').val()
        },
        dataType: "json",
        beforeSend: function () {
            $('.btn-submit').hide();
            $('.btn-loading').show();
        },
        success: function (data) {
            console.log(data);
           if(data.result){
               notification("success", data.message);
               
               window.location.href = data.url;
           }else{

               notification("error", data.message);
           }


            $('.btn-submit').show();
            $('.btn-loading').hide();
        },
        error: function () {
            $('.btn-submit').show();
            $('.btn-loading').hide();
        }

    })
}

function notification(type, message) {
    toastr[type](message);
    toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-right",
        "preventDuplicates": false,
        "showDuration": 300,
        "hideDuration": 1000,
        "timeOut": 5000,
        "extendedTimeOut": 1000,
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }
}