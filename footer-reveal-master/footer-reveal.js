/**
 * footer-reveal.js
 * 
 * Licensed under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 * 
 * Copyright 2014 Iain Andrew
 * https://github.com/IainAndrew
 */

(function($) {

	$.fn.footerReveal = function(options) {

		var $this = $(this),
		    $prev = $this.prev(),
		    $win = $(window),

		defaults = $.extend ({
            shadow : true,
            shadowOpacity: 0.8,
            zIndex : -100
        }, options );

        if (defaults.zIndex) {
			$this.css({
				'z-index' : defaults.zIndex
			});
		} else {
			$this.css({
				'z-index' : options.zIndex
			});
		}

        $this.css({
		   position : 'fixed',
		   bottom : 0,
		});

		if (defaults.shadow) {
			if (defaults.shadowOpacity) {
				$prev.css({
					'-moz-box-shadow' : '0 20px 30px -20px rgba(0,0,0,' + defaults.shadowOpacity + ')',
					'-webkit-box-shadow' : '0 20px 30px -20px rgba(0,0,0,' + defaults.shadowOpacity +')',
					'box-shadow' : '0 20px 30px -20px rgba(0,0,0,' + defaults.shadowOpacity + ')'
				});
			} else {
				$prev.css({
					'-moz-box-shadow' : '0 20px 30px -20px rgba(0,0,0,' + options.shadowOpacity + ')',
					'-webkit-box-shadow' : '0 20px 30px -20px rgba(0,0,0,' + options.shadowOpacity + ')',
					'box-shadow' : '0 20px 30px -20px rgba(0,0,0,' + options.shadowOpacity + ')'
				});
			}
		}

		var footerRevealResize = function() {

			$this.css({
				'width' : $prev.outerWidth()
			});

			$prev.css({
				'margin-bottom' : $this.outerHeight()
			});
		};

		$win.load(function() {
		    footerRevealResize();
		});
		$win.resize(function() {
		    footerRevealResize();
		});

	}

}) (jQuery);