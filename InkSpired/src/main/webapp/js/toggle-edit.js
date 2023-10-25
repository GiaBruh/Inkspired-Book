function toggleEditing() {
    const inputs = document.querySelectorAll('input[disabled]');

    inputs.forEach(input => {
        // if (input.name !== 'username' && input.name !== 'email') {
            input.removeAttribute('disabled');
        // }
    });
    document.getElementById("cancel").style.display = "block";
}
function cancelEditing() {
    const inputs = document.querySelectorAll('input');
    inputs.forEach(input => {
        // if (input.name !== 'username' && input.name !== 'email') {
        input.setAttribute('disabled', '');
        // }
    });

    document.getElementById("cancel").style.display = "none";
}
