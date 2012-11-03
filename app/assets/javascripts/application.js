// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

function cycleImages(){
  var $active = $('#slider .active');
  var $next = ($active.next().length > 0) ? $active.next() : $('#slider img:first');

  $next.css('z-index',2);//move the next image up the pile

  $active.fadeOut(1500,function(){//fade out the top image
    $active.css('z-index',1).show().removeClass('active');//reset the z-index and unhide the image
    $next.css('z-index',3).addClass('active');//make the next image the top one
  });
}

function blah() {
  var images = $('#slider').children(),
      currentImage = images.filter('.active'),
      nextImage = null,
      slider = null,
      topPos = null,
      leftPos = null;

  topPos = currentImage.position().top;
  leftPos = currentImage.position().left;

  zindex = 0;
  images.parent().css({position: 'relative'});
  images.each(function(){
    var image = $(this);
    if(!image.hasClass('active'))
      image.css({opacity: 0})
    image.css({
      'z-index': zindex,
      position: 'absolute',
      top: '0px',
      left: '0px'
    });
    zindex -= 1;
    console.log(image.position());
  });

  var slider = setInterval(function(){
    console.log('Transitioning images...');
    currentImage = images.filter('.active');
    console.log(currentImage);
    if(currentImage.next().length == 0)
      nextImage = images.first();
    else
      nextImage = currentImage.next();

    nextImage.css({opacity: 1, 'z-index': -1});
    currentImage.animate({opacity: 0}, 500, function(){
      currentImage.css({'z-index': -1}).toggleClass('active');
      nextImage.css({'z-index': 0}).toggleClass('active');
    });
  }, 4000);
}

$(document).ready(function(){
  setInterval('cycleImages()', 4000);
});
