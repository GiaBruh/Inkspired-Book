function toggleEditing() {
    const inputs = document.querySelectorAll('input[disabled]');

    inputs.forEach(input => {
        if (input.name !== 'username' && input.name !== 'email') {
            input.removeAttribute('disabled');
        }
    });
}
