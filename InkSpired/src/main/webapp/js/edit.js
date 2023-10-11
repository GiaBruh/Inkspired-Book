function toggleEditing() {
    const inputs = document.querySelectorAll('input[disabled]');

    inputs.forEach(input => {
        input.removeAttribute('disabled');
    });
}
