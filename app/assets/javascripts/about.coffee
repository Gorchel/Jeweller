# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'page:change', ()->
	if window.location.pathname.slice(1) == 'about'
		ymaps.ready init ;



init = ()-> 
	myMap = new (ymaps.Map)("map",
		center: [
			55.76
			37.64
		]
		zoom: 7)
	myPlacemark = new (ymaps.Placemark)([
		55.76
		37.64
	])
	myMap.geoObjects.add myPlacemark