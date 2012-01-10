/*
 * inFieldLabel - jQuery Plugin
 * The ultimate in-field-label for input text fields
 *
 * Examples and documentation at: http://gertonscorner.wordpress.com
 * See for more examples the demo at: 
 * http://gertonscorner.googlecode.com/svn/trunk/jquery/demo.html
 *
 * Version: 0.3 (03/04/2011)
 *
 * Dual licensed under the MIT and GPL licenses:
 *   http://www.opensource.org/licenses/mit-license.php
 *   http://www.gnu.org/licenses/gpl.html
 */
(function($){
	$.fn.inFieldLabel = function(options) {
		var defaults = { 
			labelText: "Enter Name Here",
			useAttribute: false,
			onHideLabel: function(elem){},
			onShowLabel: function(elem){}
	  	};  
	 	var opts = $.extend(defaults, options);
		
		var input = $(this);
		var inlineLabel = opts.labelText;
		if (opts.useAttribute && (typeof opts.useAttribute == "string")) {
			inlineLabel = input.attr(opts.useAttribute);
			// Override default browser behaviour for useAttribute "title"
			if (opts.useAttribute == "title") {
				input.hover(function(e){											 							   
					input.attr("title","");									  				
				},
				function(){	
					input.attr("title",inlineLabel);
				});	
			}
		}
		var fieldContainer = $('<div class="field"></div>');
		var labelContainer = $('<span class="inline-label">'+inlineLabel+'</span>');
		
		// Modify the DOM by adding placeholder label
		input.wrap(fieldContainer).before(labelContainer);
		
		labelContainer.click(function() {
			input.focus();
		});
		
		showInlineLabel();
		
		input
			.focus(function(){
                showInlineLabel();
            })
            .blur(function(){
				showInlineLabel();
            })
			.keydown(function(e) {
				if( (e.keyCode >= 48 || e.keyCode == 40 || e.keyCode == 32) ) { // all keys except [shift], [ctrl] etc.
					labelContainer.hide();
					opts.onHideLabel.call(this,input);
				}
				// Check on del key, if no data left, force show label
				if (e.keyCode == 46 && input.val().length <= getSelectionRange(this) ) {
					showInlineLabel(true);
				}
				// Check on backspace key, if no data left, force show label
				if (e.keyCode == 8 && (input.val().length <= 1 || input.val().length <= getSelectionRange(this))) {
					showInlineLabel(true);
				}
				
			})
			.change(function(){
                showInlineLabel();
            })
            ;
		
		function getSelectionRange(inputbox) {
			var startPos = 0;
			var endPos = 0;
			var length = 0;
			var tmpText = "";
			
			if (inputbox.setSelectionRange) { // W3C/Gecko
				startPos = inputbox.selectionStart;
				endPos = inputbox.selectionEnd;
				tmpText = (startPos != endPos) ? inputbox.value.substring(startPos, endPos): "";
			}
			else if (document.selection) { // IE
				var oText = document.selection.createRange().duplicate();
				tmpText = oText.text;
				for (; oText.moveStart("character", -1) !== 0; startPos++);
				endPos = tmpText.length + startPos;
			}
			length = tmpText.length;
			return length;
		}
		
		function showInlineLabel(force) {
			if ( force || input.val() === '') {
				labelContainer.show();
				opts.onShowLabel.call(this,input);
			} else {
				labelContainer.hide();
				opts.onHideLabel.call(this,input);
			}
		}
		
	};
	
})(jQuery); 