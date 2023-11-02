// For address input
const deliveryregex = /[!@#\$%\^\&\*\+=]+/;

$(document).ready(function () {
    $("input[name='address']").on("keyup", function() {
        let address = $("input[name='address']").val();
        if (deliveryregex.test(address)) {
            $("button[name='btnPlaceOrder']").attr("disabled", '');
            $("#errormessage").html("The delivery address cannot contains special characters.");
        } else if (address.length === 0 || address.length < 5) {
            $("button[name='btnPlaceOrder']").attr("disabled", '');
            $("#errormessage").html("The delivery address must be greater than 5 characters.");
        } else {
            $("button[name='btnPlaceOrder']").removeAttr("disabled");
            $("#errormessage").html("");
        }
    });
});