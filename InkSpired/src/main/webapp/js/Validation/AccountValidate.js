let fullname = '';
let gender = '';
let birthdate = new Date();
let phonenumber = '';
let image = '';

let validfullname = true;
let validgender = true;
let validbirthdate = true;
let validphonenumber = true;
let validimage = true;

const fullnameregex = /[0-9!@#\$%\^\&*\)\(+=._-]+/
const phoneregex = /^0[\d]+$/

$(document).ready(function() {
    $(".edit").click(function() {
        $(".submit").removeAttr('disabled');
    });

    $(".cancel").click(function() {
        $(".submit").attr('disabled', 'true');
        $("#errorfullname").html("");
        $("#errorgender").html("");
        $("#errorbirthdate").html("");
        $("#errorphone").html("");
        $("#errorimage").html("");
    });

    $("input[name='fullname'], input[name='birthdate'], input[name='phone']").on("keyup", function() {
        let recentdate = new Date().setHours(7, 0, 0, 0);
        fullname = $("input[name='fullname']").val().trim();
        birthdate = new Date($("input[name='birthdate']").val()).setHours(7, 0, 0, 0);
        phonenumber = $("input[name='phone']").val().trim();
        image = $("input[name='upload']").val().trim();

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

        if (phonenumber.length < 3 || phonenumber.length > 15) {
            validphonenumber = false;
            $("#errorphone").html("The phone must be from 3 to 15 characters.");
        } else if (!phoneregex.test(phonenumber)) {
            validphonenumber = false;
            $("#errorphone").html("The phone can only contains numbers and start with 0.");
        } else {
            validphonenumber = true;
            $("#errorphone").html("");
        }

        if (birthdate > recentdate) {
            validbirthdate = false;
            $("#errorbirthdate").html("The birthdate is invalid.");
        } else {
            validbirthdate = true;
            $("#errorbirthdate").html("");
        }

        if (validbirthdate && validimage && validfullname && validphonenumber) {
            $(".submit").removeAttr('disabled');
        } else {
            $(".submit").attr('disabled', 'true');
        }
    });

    $("input[name='upload'], input[name='birthdate'], input[name='gender']").change(function() {
        let recentdate = new Date().setHours(7, 0, 0, 0);
        fullname = $("input[name='fullname']").val().trim();
        birthdate = new Date($("input[name='birthdate']").val()).setHours(7, 0, 0, 0);
        phonenumber = $("input[name='phone']").val().trim();
        image = $("input[name='upload']").val();

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

        if (phonenumber.length < 3 || phonenumber.length > 15) {
            validphonenumber = false;
            $("#errorphone").html("The phone can only be at most 15 characters.");
        } else if (!phoneregex.test(phonenumber)) {
            validphonenumber = false;
            $("#errorphone").html("The phone can only contains numbers and start with 0.");
        } else {
            validphonenumber = true;
            $("#errorphone").html("");
        }

        if (birthdate > recentdate) {
            validbirthdate = false;
            $("#errorbirthdate").html("The birthdate is invalid.");
        } else {
            validbirthdate = true;
            $("#errorbirthdate").html("");
        }

        if (image.endsWith(".jpg") || image.endsWith(".jpeg") || image.endsWith(".png") || image.endsWith(".jfif") || image.endsWith(".gif") || image === '') {
            validbirthdate = true;
            $("#errorimage").html("");
        } else {
            validbirthdate = false;
            $("#errorimage").html("Photos only support format .jpeg, jpg, .png, .jfif, .gif");
        }

        if (validbirthdate && validimage && validfullname && validphonenumber) {
            $(".submit").removeAttr('disabled');
        } else {
            $(".submit").attr('disabled', 'true');
        }
    })
});