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
function redirectToResetController() {
    var newPassword = document.getElementById('newPassword').value;
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/InkSpired/admin/reset?newPassword=" + encodeURIComponent(newPassword), true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                // Handle the response from the controller (if needed)
                console.log("Reset starts", xhr.responseText);
            } else {
                console.error("Error resetting password");
            }
        }
    }
}