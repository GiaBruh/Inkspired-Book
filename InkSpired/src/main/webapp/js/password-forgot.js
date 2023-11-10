let lastResendTime = 0;
let resendTimeout = 30000;
let status = null;
let count = 0;

function sendVerificationCode() {
    count++;
    console.log("Count: ", count);
    const emailAddress = document.getElementById("emailAddress").value;
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "/InkSpired/forgot?email=" + encodeURIComponent(emailAddress), true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                // Handle the response from the controller (if needed)
                disableResendButton(resendTimeout);
                // console.log("Verification code sent successfully", xhr.responseText);
                status = xhr.responseText;
                console.log("Status: ", status);
                if(status !== "Email does not exist."){
                    document.getElementById("success").style.display = "block";
                    let count = 0;
                    // count to 3 then hide the success message
                    const timer = setInterval(function () {
                        if (count < 3) {
                            count++;
                            console.log("Count: ", count);
                        } else {
                            document.getElementById("success").style.display = "none";
                            clearInterval(timer);
                        }
                    }, 1000);
                    console.log("Yes");
                    var annoy = openSubmit();
                } else {
                    document.getElementById("fail").style.display = "block";
                    let count = 0;
                    // count to 3 then hide the success message
                    const timer = setInterval(function () {
                        if (count < 3) {
                            count++;
                            console.log("Count: ", count);
                        } else {
                            document.getElementById("fail").style.display = "none";
                            clearInterval(timer);
                        }
                    }, 1000);
                    console.log("No");
                }
            } else {
                console.error("Error sending verification code");
                document.getElementById("verificationCode").style.display = "none";
                document.getElementById("buttonGroup").style.display = "none";
                document.getElementById("sendVerificationCode").style.display = "block";
            }
        }
    };
    xhr.send();
    if (status === "Email does not exist.") {
        document.getElementById("verificationCode").style.display = "none";
        document.getElementById("buttonGroup").style.display = "none";
        document.getElementById("sendVerificationCode").style.display = "block";
    }
}

function openSubmit(){
    // show the verification code input
    document.getElementById("verificationCode").style.display = "block";
    // hide the send verification code button
    document.getElementById("sendVerificationCode").style.display = "none";
    // show the button group
    document.getElementById("buttonGroup").style.display = "flex";
    // show the resend verification code button
    document.getElementById("resendVerificationCode").style.display = "block";
    // show the verify verification code button
    document.getElementById("verifyVerificationCode").style.display = "block"
    return 1;
}

function resendVerificationCode() {
    const currentTime = Date.now();
    if (currentTime - lastResendTime < resendTimeout) {
        console.log("Resend button is disabled. Please wait before resending.");
        return;
    }
    lastResendTime = currentTime;
    // Call the sendVerificationCode function to resend the verification code
    sendVerificationCode();
}

//verify the verification code
function verifyVerificationCode() {
    const verificationCode = document.getElementById("verificationCode").value;
    const redirectButton = document.getElementById("redirectButton");
    const redirectButtonGroup = document.getElementById("redirectButtonGroup");
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/InkSpired/forgot?code=" + encodeURIComponent(verificationCode), true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                // Handle the response from the controller (if needed)
                // console.log("Verify starts", xhr.responseText);
            } else {
                console.error("Error verifying verification code");
            }
        }
        if (xhr.responseText === "Correct verification code.") {
            document.getElementById("buttonGroup").style.display = "none";
            redirectButtonGroup.style.display = "block";
            redirectButton.style.display = "block";
        }
    };
    xhr.send();
}

function disableResendButton(timeout) {
    // Disable the resend button for the specified timeout duration
    const resendButton = document.getElementById("resendVerificationCode");
    const sendButton = document.getElementById("sendVerificationCode");
    if (resendButton) {
        sendButton.disabled = true;
        resendButton.disabled = true;
        setTimeout(function () {
            resendButton.disabled = false;
            sendButton.disabled = false;
        }, timeout);

        // Print out the remaining time in the console
        const timer = setInterval(function () {
            if (timeout > 0) {
                console.log("Remaining time:", timeout / 1000, "seconds");
                // update the timer
                // document.getElementById("timer").style.display = "block";
                document.getElementById("timer").innerHTML = "Time left: " + String (timeout / 1000);
                timeout -= 1000;
            } else {
                // document.getElementById("timer").style.display = "none";
                document.getElementById("timer").innerHTML = "Time left: ";
                clearInterval(timer);
            }
        }, 1000);
    }
}