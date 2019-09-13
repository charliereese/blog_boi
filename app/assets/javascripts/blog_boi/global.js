// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
    adjustMainPadding();
});

function adjustMainPadding() {
	var footerHeight = +$('footer.blog-boi-blog').css('height').slice(0,-2);
	footerHeight += 10;

	$('main.blog-boi').css('padding-bottom', footerHeight + 'px');
}