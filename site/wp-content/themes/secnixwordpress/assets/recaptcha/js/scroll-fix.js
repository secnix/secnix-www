// reCAPTCHA div container ID is hard coded below
window.scrollCaptcha = false;
document.getElementById('captcha').setAttribute('data-callback','scrollFixCaptcha');
function scrollFixCaptcha(a) { if(window.scrollCaptcha) { jQuery("html, body").scrollTop(window.scrollCaptcha); } }
document.addEventListener("scroll", function() {
	var el = document.getElementById('captcha');
	var theTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;
	var elemTop = el.getBoundingClientRect().top;
	var elemBottom = el.getBoundingClientRect().bottom;
	var isVisible = (elemTop >= 0) && (elemBottom <= window.innerHeight);
	if(isVisible) { window.scrollCaptcha = theTop;  }
});
