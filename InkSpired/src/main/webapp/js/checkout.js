var subtotal = 0;
var total = 10000;

function addTocheckout(bookid) {
    let isChecked = $("#" + bookid).is(":checked");
    $.ajax({
        url: '/InkSpired/checkout',
        type: "get",
        data: {
            bookid: bookid,
            isChecked: isChecked
        },
        success: function (responseText) {
            if (isChecked) {
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