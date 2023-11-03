let usernameRegister = '';
let passwordRegister = '';
let fullname = '';
let birthdate = new Date();
let gender = '';
let email = '';
let phone = '';

let validusernameRegister = false;
let validpasswordRegister = false;
let validfullname = false;
let validbirthdate = false;
let validgender = true;
let validemail = false;
let validphone = false;

const usernameregexRegister = /[\s!@#\$%\^\&*\)\(+=._-]+/;
const passwordregexRegister = /\s+/;
const fullnameregex = /[0-9!@#\$%\^\&*\)\(+=._-]+/;
const emailregex = /^(([^<>\(\)[\]\\.,;:\s@/"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
const phoneregex = /^0[\d]+$/;

$(document).ready(function() {
    $("input[name='registerusername']").on({
        'keyup change': function() {
                console.log(usernameRegister);
            usernameRegister = $("input[name='registerusername']").val();
            console.log(usernameRegister);
            if (usernameRegister.length < 1 || usernameRegister.length > 100) {
                validusernameRegister = false;
                $("#errorusername").html("The username can only be from 1 to 100 characters.");
            } else if (usernameregexRegister.test(usernameRegister)) {
                validusernameRegister = false;
                $("#errorusername").html("The username cannot contains special characters.");
            } else {
                validusernameRegister = true;
                $("#errorusername").html("");
            }
        }
    });

    $("input[name='registerpassword']").on({
        keyup: function() {
            passwordRegister = $("input[name='registerpassword']").val();

            if (passwordregexRegister.test(passwordRegister)) {
                validpasswordRegister = false;
                $("#errorpassword").html("The password cannot contains space characters.");
            } else if (passwordRegister.length < 3) {
                validpasswordRegister = false;
                $("#errorpassword").html("The password must be greater than 3 characters.");
            } else {
                validpasswordRegister = true;
                $("#errorpassword").html("");
            }
        }
    });

    $("input[name='fullname']").on({
        keyup: function() {
            fullname = $("input[name='fullname']").val();

            if (fullname.length < 1 || fullname.length > 100) {
                validfullname = false;
                $("#errorfullname").html("The full name can only be from 1 to 100 characters.");
            } else if (fullnameregex.test(fullname)) {
                validfullname = false;
                $("#errorfullname").html("The full name cannot contains special characters.");
            } else {
                validfullname = true;
                $("#errorfullname").html("");
            }
        },
        change: function() {
            fullname = $("input[name='fullname']").val();

            if (fullname.length < 1 || fullname.length > 100) {
                validfullname = false;
                $("#errorfullname").html("The full name can only be from 1 to 100 characters.");
            } else if (fullnameregex.test(fullname)) {
                validfullname = false;
                $("#errorfullname").html("The full name cannot contains special characters.");
            } else {
                validfullname = true;
                $("#errorfullname").html("");
            }
        }
    });

    $("input[name='birthdate']").change(function() {
        birthdate = new Date($("input[name='birthdate']").val()).setHours(7, 0, 0, 0);
        let recentdate = new Date().setHours(7, 0, 0, 0);

        if (birthdate > recentdate) {
            validbirthdate = false;
            $("#errorbirthdate").html("Invalid birthdate.");
        } else {
            validbirthdate = true;
            $("#errorbirthdate").html("");
        }
    });

    $("input[name='email']").on({
        keyup: function() {
            email = $("input[name='email']").val();

            if (email.length < 6 || email.length > 100) {
                validemail = false;
                $("#erroremail").html("The email must be from 6 to 100 characters.");
            } else if (!emailregex.test(email)) {
                validemail = false;
                $("#erroremail").html("Invalid email.");
            } else {
                validemail = true;
                $("#erroremail").html("");
            }
        },
        change: function() {
            email = $("input[name='email']").val();

            if (!emailregex.test(email)) {
                validemail = false;
                $("#erroremail").html("Invalid email.");
            } else if (email.length < 6 || email.length > 100) {
                validemail = false;
                $("#erroremail").html("The email must be from 6 to 100 characters.");
            } else {
                validemail = true;
                $("#erroremail").html("");
            }
        }
    });

    $("input[name='phone']").on({
        keyup: function() {
            phone = $("input[name='phone']").val();

            if (!phoneregex.test(phone)) {
                validphone = false;
                $("#errorphone").html("The phone can only contains numbers and start with 0.");
            } else if (phone.length < 3 || phone.length > 15) {
                validphone = false;
                $("#errorphone").html("The phone must be from 3 to 15 characters.");
            } else {
                validphone = true;
                $("#errorphone").html("");
            }
        },
        change: function() {
            phone = $("input[name='phone']").val();

            if (!phoneregex.test(phone)) {
                validphone = false;
                $("#errorphone").html("The phone can only contains numbers and start with 0.");
            } else if (phone.length < 3 || phone.length > 15) {
                validphone = false;
                $("#errorphone").html("The phone must be from 3 to 15 characters.");
            } else {
                validphone = true;
                $("#errorphone").html("");
            }
        }
    });

    $("input[name='registerusername'], input[name='registerpassword'], input[name='fullname'], input[name='birthdate'], input[name='email'], input[name='phone']").on("keyup", function() {
        console.log(validusernameRegister);
        if (validusernameRegister && validpasswordRegister && validfullname && validbirthdate && validemail && validphone) {
            $("input[name='btnsubmitRegister']").removeAttr('disabled');
        } else {
            $("input[name='btnsubmitRegister']").attr('disabled', '');
        }
    });

    $("input[name='registerusername'], input[name='fullname'], input[name='birthdate'], input[name='email'], input[name='phone'], input[name='birthdate'], input[name='genders']").change(function() {
        console.log((validusernameRegister));
        if (validusernameRegister && validpasswordRegister && validfullname && validbirthdate && validemail && validphone) {
            $("input[name='btnsubmitRegister']").removeAttr('disabled');
        } else {
            $("input[name='btnsubmitRegister']").attr('disabled', '');
        }
    });
    $("input[name='btnsubmitRegister']").hover(function (){
        if(usernameRegister === ''){
            $("#errorusername").html("Please type in your username");
        }
        if(fullname === ''){
            $("#errorfullname").html("Please type in your password");
        }
        if(!validbirthdate){
            $("#errorbirthdate").html("Please type in your birthdate");
        }
        if(email === ''){
            $("#erroremail").html("Please type in your email");
        }
        if(phone === ''){
            $("#errorphone").html("Please type in your phone");
        }
    });
});