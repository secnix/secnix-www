function submitToAPI(e) {
   e.preventDefault();
   var URL = "https://kz7uhwyctl.execute-api.eu-west-1.amazonaws.com/production/submit";

        //validate name
        if ($("#name-input").val()=="") {
           alert ("Please enter your name");
           $( "#name-label, #user-icon" ).addClass( "form-error-highlight" );
           $( "#phone-label, #phone-icon, #email-label, #email-icon, #msg-label, #msg-icon, #captcha-label" ).removeClass( "form-error-highlight" );
           return;
        }
        var Namere = /[A-Za-z]{2}[A-Za-z]/;
        if (!Namere.test($("#name-input").val())) {
            alert ("Name must be more than 3 characters");
            $( "#name-label, #user-icon" ).addClass( "form-error-highlight" );
            $( "#phone-label, #phone-icon, #email-label, #email-icon, #msg-label, #msg-icon, #captcha-label" ).removeClass( "form-error-highlight" );
            return;
        }
        //validate phone
        if ($("#phone").val()=="") {
           alert ("Please enter your phone number");
           $( "#name-label, #user-icon, #email-label, #email-icon, #msg-label, #msg-icon, #captcha-label" ).removeClass( "form-error-highlight" );
           $( "#phone-label, #phone-icon" ).addClass( "form-error-highlight" );
           return;
        }
        var mobilere = /[0-9]{8,15}/;
        if (!mobilere.test($("#phone").val())) {
            alert ("Please enter a valid phone number");
            $( "#name-label, #user-icon, #email-label, #email-icon, #msg-label, #msg-icon, #captcha-label" ).removeClass( "form-error-highlight" );
            $( "#phone-label, #phone-icon" ).addClass( "form-error-highlight" );
            return;
        }
        //validate email
        if ($("#email-input").val()=="") {
            alert ("Please enter your email address");
            $( "#name-label, #user-icon, #phone-label, #phone-icon, #msg-label, #msg-icon, #captcha-label" ).removeClass( "form-error-highlight" );
            $( "#email-label, #email-icon" ).addClass( "form-error-highlight" );
            return;
        }
        var reeamil = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,6})?$/;
        if (!reeamil.test($("#email-input").val())) {
            alert ("Please enter a valid email address");
            $( "#name-label, #user-icon, #phone-label, #phone-icon, #msg-label, #msg-icon, #captcha-label" ).removeClass( "form-error-highlight" );
            $( "#email-label, #email-icon" ).addClass( "form-error-highlight" );
            return;
        }
        //validate message
        if ($("#description-input").val()=="") {
           alert ("Please enter your message");
           $( "#name-label, #user-icon, #phone-label, #phone-icon, #email-label, #email-icon, #captcha-label" ).removeClass( "form-error-highlight" );
           $( "#msg-label, #msg-icon" ).addClass( "form-error-highlight" );
           return;
        }
        // var Descre = /^[\r\n!@#$£%^*()-+={}|"'?<>.,/~;:a-zA-Z0-9_ ]{20,}$/;
        var Descre = /(.|\n){20,}/;
        if (!Descre.test($("#description-input").val())) {
            alert ("Message must be more than 20 characters");
            $( "#name-label, #user-icon, #phone-label, #phone-icon, #email-label, #email-icon, #captcha-label" ).removeClass( "form-error-highlight" );
            $( "#msg-label, #msg-icon" ).addClass( "form-error-highlight" );
            return;
        }
        //validate reCaptcha
        var response = grecaptcha.getResponse();
        if(response.length == 0) {
            //reCaptcha not verified
            alert ("Please verify reCaptcha");
            $( "#name-label, #user-icon, #phone-label, #phone-icon, #email-label, #email-icon, #msg-label, #msg-icon" ).removeClass( "form-error-highlight" );
            $( "#captcha-label" ).addClass( "form-error-highlight" );
            return;
            //reCaptch verified
        }

   var name = $("#name-input").val();
   var phone = $("#phone").val();
   var email = $("#email-input").val();
   var desc = $("#description-input").val();
   var data = {
      name : name,
      phone : phone,
      email : email,
      desc : desc
    };

   $.ajax({
     type: "POST",
     url : "https://kz7uhwyctl.execute-api.eu-west-1.amazonaws.com/production/submit",
     dataType: "json",
     crossDomain: "true",
     contentType: "application/json; charset=utf-8",
     data: JSON.stringify(data),


     success: function () {
       // clear form and show a success message
       alert("Successfull! Your message has been sent.");
       document.getElementById("contact-form").reset();
       location.reload();
       grecaptcha.reset();
     },
     error: function () {
       // show an error message
       alert("UnSuccessfull! Please try again.");
     }});
 }
