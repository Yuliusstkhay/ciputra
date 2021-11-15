$(document).ready(function () {

    var current_fs, next_fs, previous_fs; //fieldsets
    var opacity;

    $(".next").click(function () {
        if ($('#role_name').val() == "") {
            $('#role_name').addClass('is-invalid');
            return false;
        } else {
            $('#role_name').removeClass('is-invalid');
            $('#role_name').addClass('is-valid');
            current_fs = $(this).parent();
            next_fs = $(this).parent().next();

//Add Class Active
            $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

//show the next fieldset
            next_fs.show();
//hide the current fieldset with style
            current_fs.animate({opacity: 0}, {
                step: function (now) {
// for making fielset appear animation
                    opacity = 1 - now;

                    current_fs.css({
                        'display': 'none',
                        'position': 'relative'
                    });
                    next_fs.css({'opacity': opacity});
                },
                duration: 600
            });
        }


    });

    $(".previous").click(function () {

        current_fs = $(this).parent();
        previous_fs = $(this).parent().prev();

//Remove class active
        $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

//show the previous fieldset
        previous_fs.show();

//hide the current fieldset with style
        current_fs.animate({opacity: 0}, {
            step: function (now) {
// for making fielset appear animation
                opacity = 1 - now;

                current_fs.css({
                    'display': 'none',
                    'position': 'relative'
                });
                previous_fs.css({'opacity': opacity});
            },
            duration: 600
        });
    });


});

$('#btn-lanjutkan').on('click', function () {

    loadModule();
});

function loadModule() {
    $.ajax({
        url: getModul,
        type: 'post',
        data: {
            _token: $('input[name="_token"]').val(),

        },
        dataType: "json",
        beforeSend: function () {
//            $('#btn-submit').hide();
//            $('#btn-loading').show();
        },
        success: function (data) {
            console.log(data);
            if (data.result) {
                listModul(data.data);
//               notification("success", data.message);
////               document.getElementById("frm-programstudi").reset();
//               $('#programstudi_name').val("");
//               $('#fakultas_id').val(null).trigger('change');
//               var form = document.getElementById("frm-programstudi");
//               form.classList.add('was-validated');
            } else {

                notification("error", data.message);
            }


//            $('#btn-submit').show();
//            $('#btn-loading').hide();
        },
        error: function () {
//            $('#btn-submit').show();
//            $('#btn-loading').hide();
        }

    })
}

function listModul(data) {
    var html = '';
    var child = "";
    $.each(data, function (index, val) {
        html += '<div class="col">';
        html += '<div class="form-check">';
        html += '<h5 class="text-dark"><input class="form-check-input checkMaster" data-index="' + val.module_id + '" type="checkbox" value="" id="check-master-' + val.module_id + '">';
        html += '<label class="form-check-label" for="check-master-' + index + '">' + val.module_name;
        html += '</label></h5>';
        child = "";
        $.each(val.child, function (s, x) {
            child += '<div class="col-12">';
            child += '<div class="form-check">';
            child += '<h5 class="text-dark"><input class="form-check-input checkModul checkParent-' + x.parent_id + '" data-index="' + x.module_id + '" data-urutan="' + s + '" type="checkbox" value="' + x.module_id + '" id="check-' + x.module_id + '-' + s + '">';
            child += '<label class="form-check-label" for="check-module-' + s + '">' + x.module_name;
            child += '</label></h5>';
            $.each(x.modulfungsi, function (a, b) {
                child += '<div class="col-12">';
                child += '<div class="form-check">';
                child += '<h5 class="text-dark"><input class="form-check-input checkParentModul-' + x.module_id + ' checkParentFunction-' + x.parent_id + ' checkfunction" data-index="' + x.module_id + '" data-urutanmodul="' + s + '" data-urutan="' + a + '"  type="checkbox" value="' + b.module_function_id + '" id="check-function-' + x.module_id + '-' + a + '">';
                child += '<label class="form-check-label" for="check-function-' + s + '">' + b.fungsi.function_name;
                child += '</label></h5>';
                child += '</div>';
                child += '</div>';
            });
            child += '</div>';
            child += '</div>';
        });
        html += child;
        html += '</div>';

        html += '</div>';
    });

    $('#modul').html(html);
}

$(document).on('click', '.checkMaster', function () {
    var index = $(this).data('index');
    if (document.getElementById('check-master-' + index).checked) {
        $('.checkParent-' + index).prop("checked", true);
        $('.checkParentFunction-' + index).prop("checked", true);
    } else {
        $('.checkParent-' + index).prop("checked", false);
        $('.checkParentFunction-' + index).prop("checked", false);
    }
});
$(document).on('click', '.checkModul', function () {
    var index = $(this).data('index');
    var urutan = $(this).data('urutan');
    if (document.getElementById('check-' + index + '-' + urutan).checked) {
        $('.checkParentModul-' + index).prop("checked", true);
    } else {
        $('.checkParentModul-' + index).prop("checked", false);
    }
});

$(document).on('click', '.checkfunction', function () {
    var index = $(this).data('index');
    var urutan = $(this).data('urutan');
    var urutanmodul = $(this).data('urutanmodul');
    if (document.getElementById('check-function-' + index + '-' + urutan).checked) {
        $('#check-' + index + '-' + urutanmodul).prop("checked", true);
    } else {
        $('#check-' + index + '-' + urutanmodul).prop("checked", false);
    }
});

$('#btn-submit').on('click', function () {
    var formData = new FormData();
    formData.append('_token', $('input[name="_token"]').val());
    formData.append('role_name', $('#role_name').val());
    if (document.getElementById('check-admin').checked) {
        formData.append('check_admin', 1);
    } else {
        formData.append('check_admin', 0);
    }
    if (document.getElementById('check-dosen').checked) {
        formData.append('check_dosen', 1);
    } else {
        formData.append('check_dosen', 0);
    }
    if (document.getElementById('check-mahasiswa').checked) {
        formData.append('check_mahasiswa', 1);
    } else {
        formData.append('check_mahasiswa', 0);
    }
    formData.append('notes', $('#notes').val());
    $('.checkfunction:checked').each(function () {
        formData.append('modul_access[]', $(this).val());
    });

    $.ajax({
        type: "post",
        url: store,
        data: formData,
        dataType: "json",
        processData: false,
        contentType: false,
        beforeSend: function () {
            $('#btn-submit').hide();
            $('#btn-loading').show();
        },
        success: function (data) {
            console.log(data);
            if (data.result) {
                notification("success", data.message);
                $('.checkfunction').prop("checked", false);
                $('.checkModul').prop("checked", false);
                $('.checkMaster').prop("checked", false);
                $('#check-admin').prop("checked", false);
                $('#check-dosen').prop("checked", false);
                $('#check-mahasiswa').prop("checked", false);
                $('#notes').val("");
                $('#role_name').val("");
                $('#role_name').removeClass('is-valid');
                previouss();
            } else {

                notification("error", data.message);
            }


            $('#btn-submit').show();
            $('#btn-loading').hide();

        },
        error: function (data) {
            $('#btn-submit').show();
            $('#btn-loading').hide();
        }
    })
});

function previouss() {
    current_fs = $('.previous').parent();
    previous_fs = $('.previous').parent().prev();

//Remove class active
    $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

//show the previous fieldset
    previous_fs.show();

//hide the current fieldset with style
    current_fs.animate({opacity: 0}, {
        step: function (now) {
// for making fielset appear animation
            opacity = 1 - now;

            current_fs.css({
                'display': 'none',
                'position': 'relative'
            });
            previous_fs.css({'opacity': opacity});
        },
        duration: 600
    });
}