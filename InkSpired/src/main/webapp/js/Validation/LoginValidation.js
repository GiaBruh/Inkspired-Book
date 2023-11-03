let username = '';
let password = '';

let validusername = false;
let validpassword = false;

const usernameregex = /[\s0-9!@#\$%\^\&*\)\(+=._-]+/;
const passwordregex = /\s+/;

$(document).ready(function () {
    $("input[name='username']").on({
        keyup: function () {
            username = $("input[name='username']").val();

            if (username.length < 1 || username.length > 100) {
                validusername = false;
                $("#errorusernameLogin").html("The username can only be from 1 to 100 characters.");
            } else if (usernameregex.test(username)) {
                validusername = false;
                $("#errorusernameLogin").html("The username cannot contains special characters.");
            } else {
                validusername = true;
                $("#errorusernameLogin").html("");
            }
        },
        change: function () {
            username = $("input[name='username']").val();

            if (username.length < 1 || username.length > 100) {
                validusername = false;
                $("#errorusernameLogin").html("The username can only be from 1 to 100 characters.");
            } else if (usernameregex.test(username)) {
                validusername = false;
                $("#errorusernameLogin").html("The username cannot contains special characters.");
            } else {
                validusername = true;
                $("#errorusernameLogin").html("");
            }
        }
    });

    $("input[name='password']").on({
        keyup: function () {
            password = $("input[name='password']").val();

            if (passwordregex.test(password)) {
                validpassword = false;
                $("#errorpasswordLogin").html("The password cannot contains space characters.");
            } else if (password.length < 3) {
                validpassword = false;
                $("#errorpasswordLogin").html("The password must be greater than 3 characters.");
            } else {
                validpassword = true;
                $("#errorpasswordLogin").html("");
            }
        }
    });

    $("input[name='username'], input[name='password']").on("keyup", function() {
        if (validusername && validpassword) {
            $("input[name='btnSubmit']").removeAttr('disabled');
        } else {
            $("input[name='btnSubmit']").attr('disabled', '');
        }
    });

    $("input[name='username'], input[name='fullname']").change(function() {
        if (validusername && validpassword) {
            $("input[name='btnSubmit']").removeAttr('disabled');
        } else {
            $("input[name='btnSubmit']").attr('disabled', '');
        }
    });
    $("input[name='btnSubmit']").hover(function (){
       if(username === ''){
           $("#errorusernameLogin").html("Please type in your username");
       } if(password === ''){
            $("#errorpasswordLogin").html("Please type in your password");
        }
    });
});