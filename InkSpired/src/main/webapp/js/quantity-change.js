$('.quantity button').on('click', function () {
    var button = $(this);
    var oldValue = button.parent().parent().find('input').val();
    if (button.hasClass('btn-plus')) {
        var newVal = parseFloat(oldValue) + 1;
    } else {
        if (oldValue > 0) {
            var newVal = parseFloat(oldValue) - 1;
        } else {
            newVal = 0;
        }
    }
    button.parent().parent().find('input').val(newVal);
});
function AddTO(id) {
    let btn = "btn_".concat(id)
    if(document.getElementById(id).checked === false) {
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