jQuery(function($){

// Prevent "Uncaught TypeError: $ is not a function" in WordPress by placing code in "jQuery(function($){ --CODE GOES HERE    });


//Script Start
  $("#phone").intlTelInput({
    utilsScript: "assets/intl-tel-input/js/utils.js"
  }).done(function() {
    // analytics
    $('.selected-flag').one('click', function() {
      ga('send', 'event', 'demo', 'clicked selected country');
    });
    $('#phone').one('keyup', function() {
      ga('send', 'event', 'demo', 'typed something in input');
    });
  });
  //Script End

   });
