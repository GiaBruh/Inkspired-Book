let subtotal = 0;
let total = 10000;

// For address input
$(document).ready(function () {
    $("input[name='address']").on("keyup", function() {
        if ($("input[name='address']").val().length === 0 || $("input[name='address']").val().length < 5) {
            $("button[name='btnPlaceOrder']").attr("disabled", '');
        } else {
            $("button[name='btnPlaceOrder']").removeAttr("disabled");
        }
    });
});

// For confirm modal
$(window).on('load', function() {
    $('#confirmmodal').modal('show');
});

function addTocheckout(bookid) {
    let isChecked = $("#" + bookid).is(":checked");

    if (isChecked) {
        $("#quantity" + bookid + " > div > button").removeAttr("disabled");
    } else {
        $("#quantity" + bookid + " > div > button").attr('disabled', '');
        $("#quantity" + bookid + " > input").val(1);
    }

    ajaxConnecttion(bookid, '+', isChecked);
}

function countQuantity(bookid, operator, quantity) {
    let a = parseInt($("#quantityval" + bookid).val());
    if (operator === '+') {
        if (a < quantity) {
            $("#quantityval" + bookid).val(a + 1);
        }
    } else {
        if (a > 1) {
            $("#quantityval" + bookid).val(a - 1);
        } else {
            $("#quantityval" + bookid).val(1);
        }
    }

    let isChecked = $("#" + bookid).is(":checked");

    if (a < quantity ||  operator === '-' && a > 1) {
        ajaxConnecttion(bookid, operator, isChecked);
    }
}

function ajaxConnecttion(bookid, operator, isChecked) {
    $.ajax({
        url: '/InkSpired/checkout/total',
        type: "get",
        data: {
            bookid: bookid,
            operator: operator,
            isChecked: isChecked
        },
        success: function (responseText) {
            total = parseInt(responseText) + 10000;
            subtotal = parseInt(responseText);

            disableCheckoutButton(responseText);


            $('#subtotal').text(new Intl.NumberFormat('en-DE').format(subtotal));
            $('#total').text(new Intl.NumberFormat('en-DE').format(total));
        }
    });
}

function disableCheckoutButton(subtotal) {
    if (subtotal === '0') {
        document.getElementsByName("btncheckout")[0].setAttribute('disabled', '');
    } else {
        document.getElementsByName("btncheckout")[0].removeAttribute('disabled');
    }
}