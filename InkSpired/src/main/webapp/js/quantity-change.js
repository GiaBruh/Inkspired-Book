// function changeQuantity(bookid) {
//     $('#quantity' + bookid + ' button').on('click', function () {
//         let maxQuantity = parseInt($("input[name='maxquantity" + bookid + "']").val());
//         let button = $(this);
//         let oldValue = parseInt(document.getElementById("quantityval" + bookid).value);
//         let newVal = oldValue;
//         if (button.hasClass('btn-plus')) {
//             if (oldValue < maxQuantity) {
//                 newVal = oldValue + 1;
//             }
//         } else {
//             if (oldValue > 1) {
//                 newVal = oldValue - 1;
//             } else {
//                 newVal = 1;
//             }
//         }
//         document.getElementById("quantityval" + bookid).value = newVal;
//     });
// }

function AddTO(id) {
    let btn = "btn_".concat(id)
    if (document.getElementById(id).checked === false) {
        document.getElementById(id).checked = true;
        document.getElementById(btn).classList.remove('btn-dark');
        document.getElementById(btn).classList.add('btn-light');
        document.getElementById(btn).style.color = "green";
    } else {
        document.getElementById(id).checked = false;
        document.getElementById(btn).classList.remove('btn-light');
        document.getElementById(btn).classList.add('btn-dark');
        document.getElementById(btn).style.color = "white";
    }
}