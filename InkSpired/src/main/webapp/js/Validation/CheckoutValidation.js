// For address input
$(document).ready(function () {
    $("input[name='address']").on("keyup", function() {
        if ($("input[name='address']").val().length === 0 || $("input[name='address']").val().length < 5) {
            $("button[name='btnPlaceOrder']").attr("disabled", '');
            $("#errormessage").html("The delivery address must be greater than 5 characters.");
        } else {
            $("button[name='btnPlaceOrder']").removeAttr("disabled");
            $("#errormessage").html("");
        }
    });
});