var subtotal = 0;
var total = 10000;

function addTocheckout(bookid) {
    $.ajax({
        url: '/InkSpired/checkout',
        type: "get",
        data: {
            bookid: bookid
        },
        success: function (responseText) {
            if ($("#" + bookid).is(":checked")) {
                total += parseInt(responseText);
                subtotal += parseInt(responseText);
            } else {
                total -= parseInt(responseText);
                subtotal -= parseInt(responseText);
            }

            $('#subtotal').text(subtotal + "");
            $('#total').text(total + "");
        }
    });
}