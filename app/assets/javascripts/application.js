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
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function(){
	$('#production-btn').click(function(){
		giveHtml('production',1);
	})
	$('#social-btn').click(function(){
		giveHtml('social',2);
	})
	$('#about-btn').click(function(){
		giveHtml('about',3);
	})
	
	$('#siteMusic').click(function(){
		var oAudio = document.getElementById('background-audio');

		if ($(this).hasClass('activeMusic')){
			oAudio.pause();
			$(this).removeClass('activeMusic');
		}else{
			oAudio.play();
			$(this).addClass('activeMusic');
		}	
	})
})

function giveHtml(handler,bool){
	var height;
	var preloader = '<div class="container" id="preloader"><i class="fa fa-spinner fa-pulse fa-3x"></i></div>';
	$('#wrapper-content').html(preloader);
	$.ajax({
	  url: "/"+ handler,
	}).done(function(html) {
	  $('#wrapper-content').html(html);
	  if (bool === 3){
	  	ymaps.ready(init());
	  }
	  if (bool === 2){
	  	height = $('.social-img-wrapper').width();
	  	$('.social-img-wrapper').height(height);
	  }  
	});
}

init = function() {
  var myMap, myPlacemark;
  myMap = new ymaps.Map("map", {
    center: [55.76, 37.64],
    zoom: 7
  });
  myPlacemark = new ymaps.Placemark([55.76, 37.64]);
  return myMap.geoObjects.add(myPlacemark);
};