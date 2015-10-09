function checkPasswordMatch() {
    var password = $("#NewPassword").val();
    var confirmPassword = $("#ConfirmPassword").val();

    if (password != confirmPassword)
        $("#bt-register").prop('disabled', true).addClass("btn-warning")
    else
        $("#bt-register").prop('disabled', false).removeClass("btn-warning");
}

$(document).ready(function () {
    $("#ConfirmPassword").keyup(checkPasswordMatch);
});
