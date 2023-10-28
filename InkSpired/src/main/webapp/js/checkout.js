let subtotal = 0;
let total = 10000;

function addTocheckout(bookid) {
    let isChecked = $("#" + bookid).is(":checked");

    if (isChecked) {
        $("#quantity" + bookid + " > div > button").removeAttr("disabled");
        $("#quantity" + bookid + " > input").removeAttr("disabled");
    } else {
        $("#quantity" + bookid + " > div > button").attr('disabled', '');
        $("#quantity" + bookid + " > input").attr('disabled', '');
        $("#quantity" + bookid + " > input").val(1);
    }

    ajaxConnecttion(bookid, '+', isChecked);
}

function changQuantity(bookid, operator) {
    let isChecked = $("#" + bookid).is(":checked");

    ajaxConnecttion(bookid, operator, isChecked);
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