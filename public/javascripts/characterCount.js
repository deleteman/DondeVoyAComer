

var __MAX_CHAR_SIZE = 400;

$(document).ready(function() {
	$("#review_body").keyup(function() {
		var contador = $("#review_body_maxlength", $(this).next());
		contador.html(__MAX_CHAR_SIZE - $("#review_body").val().length)
		var cnt = $("#review_body").val();
		if(cnt.length >= __MAX_CHAR_SIZE) {
			$("#review_body").val(cnt.substring(0, __MAX_CHAR_SIZE))
		}
	});
});