// validate password
function validatePasswords() {
    var newPassword = document.getElementById('newPassword').value;
    var newPasswordRepeat = document.getElementById('newPasswordRepeat').value;

    // Check if passwords match
    if (newPassword !== newPasswordRepeat) {
        document.getElementById('newPasswordMismatch').style.display = 'block';
        document.getElementById('newPasswordRepeatMismatch').style.display = 'block';
    } else {
        document.getElementById('newPasswordMismatch').style.display = 'none';
        document.getElementById('newPasswordRepeatMismatch').style.display = 'none';
    }
}
