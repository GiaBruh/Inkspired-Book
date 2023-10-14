function sendVerificationCode() {
    // show the verification code input
    document.getElementById("verificationCode").style.display = "block";


    var xhr = new XMLHttpRequest();
    xhr.open("GET", "/InkSpired/forgot", true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                // Handle the response from the controller (if needed)
                console.log("Verification code sent successfully", xhr.responseText);
            } else {
                console.error("Error sending verification code");
            }
        }
    };
    xhr.send();
}