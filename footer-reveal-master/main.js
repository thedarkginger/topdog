$(function() {
	$('footer').footerReveal();
});

$(document).ready(function() {
	$('.reveal').delay(500).animate({top:'-100%'}, 1000);
});

$(function() {
	$('section.about a').click(function() {
	    $('html, body').animate({scrollTop: $(document).height()}, 2000);
	    return false;
	});
});