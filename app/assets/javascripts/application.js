// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require bootsy
//= require twitter/bootstrap
//= require_tree .


jQuery(document).ready(function() {
	
    /*
        Fullscreen background
    */
    $.backstretch("assets/img/backgrounds/1.jpg");
    
    /*
	    Modals
	*/
	$('.launch-modal').on('click', function(e){
		e.preventDefault();
		$( '#' + $(this).data('modal-id') ).modal();
	});
    
    /*
        Form validation
    */
	$('.login-form input[type="text"], .login-form input[type="password"], .login-form textarea').on('focus', function() {
    	$(this).removeClass('input-error');
    });
    
    $('.login-form').on('submit', function(e) {
    	
    	$(this).find('input[type="text"], input[type="password"], textarea').each(function(){
    		if( $(this).val() == "" ) {
    			e.preventDefault();
    			$(this).addClass('input-error');
    		}
    		else {
    			$(this).removeClass('input-error');
    		}
    	});
    	
    });

});

$(document).ready(function(){
	setTimeout(function(){
		$('#notices_wrap').fadeOut("slow", function() {
			$(this).remove();
		})
	}, 4500);
});

$(document).ready(function(){
	/* global Bootsy */
    Bootsy.options = $.extend(true, Bootsy.options, {
    parserRules: {
      classes: {
        "img-responsive": 1
      },
      tags: {
        img: {
          set_class: "img-responsive"
        }
      }
    }
  });
});


// $(document).ready(function(){
// 	$('#background-vid').tubular({
// 		videoId: 'qxCJ6QMfMe8',
// 	   // ratio: 16/9, // usually either 4/3 or 16/9 -- tweak as needed
//     	mute: true,
//     	repeat: true,
//     	wrapperZIndex: 1,
// 	    start: 0, // starting position in seconds
// 	}); // where idOfYourVideo is the YouTube ID. }); 
// });

$( document ).ready(function (){
/* global wow */
var wow = new WOW(
  {
    boxClass:     'wow',      // animated element css class (default is wow)
    animateClass: 'animated', // animation css class (default is animated)
    offset:       0,          // distance to the element when triggering the animation (default is 0)
    mobile:       true,       // trigger animations on mobile devices (default is true)
    live:         true,       // act on asynchronously loaded content (default is true)
    callback:     function(box) {
      // the callback is fired every time an animation is started
      // the argument that is passed in is the DOM node being animated
    },
    scrollContainer: null // optional scroll container selector, otherwise use window
  }
);
wow.init();
 });