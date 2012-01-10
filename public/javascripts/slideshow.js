
/**
 * Simple Slideshow plugin for jQuery
 *
 * Configuration options:
 *
 * - autoStart: 	 Default value TRUE
 * - delay: 			 The miliseconds delay between slides. Default: 3000 (3 seconds)
 * - progressPoss: The CSS class that will take care of posisionnig the progress tracker. Default: "bottom-right"
 *
 * Author: deleteman@gmail.com
 *
 * */
(function($) {
	$.fn.simpleSlideshow = function(options) {
		options = options || {};
		
		var auto_start 	 		= (typeof options.autoStart != "undefined")?options.autoStart:true;
		var delay 			 	= (typeof options.delay 		 != "undefined")?options.delay:3000;
		var progressPoss 		= (typeof options.progressPoss != "undefined")?options.progressPoss:"bottom-right";
		var showDirectionArrows = (typeof options.showDirectionArrows != "undefined")?options.showDirectionArrows:false;

		var currentSlide = 0;
		var totalSlides  = 0;
		var running = false;
		var main_container = this;

		return this.each(function(i, elem){
			var slides = $(".slide", $(elem));	
			$(this).data("slides", slides);
			$(this).data("timer", null);

			slides.hide();
			$(slides[0]).show();
			totalSlides = slides.length;

			setUpProgressTracker(elem, totalSlides);
	
			if(auto_start) {
				updateDOM();
				running = true;
				moveSlide(slides);
			}

		});
	
		/** Makes the slideshow move in "delay" miliseconds */
		function moveSlide(slides) {
			if(running) {
				clearTimeout($(main_container).data("timer"));
				var t = setTimeout(function () {
					advanceSlidePointer(slides);
				}, delay);
				$(main_container).data("timer", t);
			}	
		}

		function setUpProgressTracker(container, n_slides) {
			var progress_container = $('<div class="slideshow-progress"></div>');
			if(showDirectionArrows) {
				progress_container.append('<a href="#" class="prev-link"><img src="images/pix.gif"  /></a>');
			}
			for(var i = 0; i < n_slides; i++) {
				progress_container.append('<div class="step step' + i + '"><img src="images/pix.gif"  /></div>');	
			}

			if(showDirectionArrows) {
				progress_container.append('<a href="#" class="next-link"><img src="images/pix.gif"  /></a>');
			}

			progress_container.addClass(progressPoss);
			$(".next-link", progress_container).click(function() {
				advanceSlidePointer($(main_container).data("slides"));
				return false;
			});

			$(".prev-link", progress_container).click(function() {
				backSlidePointer($(main_container).data("slides"));
				return false;
			});

			
			$(container).append(progress_container);
		}

		/** public: Advances the slide pointer to the next one, or the first one if the current slide is the 
 		 *	last one.
 		 *
 		 *	@param Array slides The list of slides
 		 *	*/
		function advanceSlidePointer(slides) {
			var nextSlide = (currentSlide + 1 < totalSlides)?currentSlide + 1:0;
			$(slides[currentSlide]).fadeOut('slow',function() { $(slides[nextSlide]).fadeIn('slow'); });
			currentSlide = (nextSlide < totalSlides)?nextSlide:0;
			updateDOM();
			moveSlide(slides);
		}

		/** public: Moves the slide pointer to the previous position, or to the last one if the current slide is the 
 		 *	first one.
 		 *
 		 *	@param Array slides The list of slides
 		 *	*/

		function backSlidePointer(slides) {
			var nextSlide = (currentSlide - 1 < 0)?totalSlides - 1:currentSlide - 1;
			$(slides[currentSlide]).fadeOut('slow',function() { $(slides[nextSlide]).fadeIn('slow'); });
			currentSlide = (nextSlide < 0)?totalSlides:nextSlide;
			updateDOM();
			moveSlide(slides);
		}


		/**
 		 * private:
 		 * Updates all DOM elements
 		 */
		function updateDOM() {
			$(".slideshow-progress .step", main_container).removeClass("active");
			$(".slideshow-progress .step" + currentSlide, main_container).addClass("active");
		}

	};

})(jQuery);
