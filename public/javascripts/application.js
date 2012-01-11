// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
	$("#add-link").hover(function(){
		$(this).stop().animate({backgroundPosition:"105px 0px" },'fast');
	}, function() {
		$(this).stop().animate({backgroundPosition:"118px 0px" },'fast');
	});

	$("#search-link").hover(function(){
		$(this).stop().animate({backgroundPosition:"120px 0px" },'fast');
	}, function() {
		$(this).stop().animate({backgroundPosition:"120px 19px" },'fast');

	});

	$("#home-link").hover(function(){
		$(this).stop().animate({backgroundPosition:"70px 0px" },'fast');
	}, function() {
		$(this).stop().animate({backgroundPosition:"90px 0px" },'fast');

	});


	$("#help-link").hover(function(){
		$(this).stop().animate({backgroundPosition:"50px 0px" },'fast');
	}, function() {
		$(this).stop().animate({backgroundPosition:"50px 19px" },'fast');

	});

	$(".search-btn, .guardar-btn").click(function() {
		$(this).parents("form").submit();
		return false;
	});

	$.each($(".notifications li"), function(i, elem) {
		$(elem).fadeIn();
		/*
		setTimeout(function() {
			$(elem).fadeOut();
		},5000);
		*/
	});

	$(".time-picker").timePicker({
		step:15,
		show24Hours:true
	});

	$('#address').inFieldLabel({
		useAttribute:"title"
	});

	$('#name').inFieldLabel({
		useAttribute:"title"
	});

	$('#highlighted_food').inFieldLabel({
		useAttribute:"title"
	});

	$('#login-email').inFieldLabel({
		useAttribute:"title"
	});

	$('#login-pass').inFieldLabel({
		useAttribute:"title"
	});


	$('input[type="text"], input[type="email"], input[type="password"]').focus(function() {
		$(this).prev("span.inline-label").addClass("focused");
	});

	$('input[type="text"], input[type="email"], input[type="password"]').blur(function() {
		$(this).prev("span.inline-label").removeClass("focused");
	});
	
	$(".recommended-places").simpleSlideshow({delay:10000});
	

	as = new activityShower();
	as.getLastestActivity();

	$(".close-link").click(function() {
		$(this).parent().fadeOut();
		return false;
	});

	$("#place_address").blur(function () {
		codeAddress();
	});
	
	$(".search-box h2 a").click(function() {
		$(this).parents(".home-box").animate({height:"478px"});
		$(this).parents(".home-box").children().show();
		return false;
	});


	$("#fecha_nacimiento").datepicker({
		changeMonth:true,
		changeYear:true,
		showOn:"button",
		buttonImage:"/images/calendar.png",
		buttonImageOnly:true,
		minDate:"-80Y",
		maxDate:"-10Y",
		constrainInput:true,
		yearRange:'-80,-10'
	});

	$("a.detalles_puntuacion").fancybox({
			'transitionIn':'fade',
			'transitionOut':'fade'
	});
		
});

var activityShower = function() {
	this.latest_id = 0;
}

activityShower.prototype.getLastestActivity = function () {
	var path = "/actions";
	var self = this;
	$.getJSON(path, function(json) {
		if(json == null) {
			return null;
		}
		if(self.latest_id != json.action.id) {
			self.latest_id = json.action.id;
			$("#current-activity").html(json.action.description);
		}
		setTimeout(function() {
			self.getLastestActivity();
		}, 5000);
	});
};
