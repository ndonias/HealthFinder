// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on("page:change", function(){

	$('#first-circle').hover(function() {
	   $("#second-circle").hide(500);
	   $("#third-circle").hide(500);
	 });

	$('#first-circle').mouseleave(function() {
	   $("#second-circle").show(500);
	   $("#third-circle").show(500);
	 });

	$('#second-circle').hover(function() {
	   $("#first-circle").hide(500);
	   $("#third-circle").hide(500);
	 });

	$('#second-circle').mouseleave(function() {
	   $("#first-circle").show(500);
	   $("#third-circle").show(500);
	 });

	$('#third-circle').hover(function() {
	   $("#second-circle").hide(500);
	   $("#first-circle").hide(500);
	 });

	$('#third-circle').mouseleave(function() {
	   $("#second-circle").show(500);
	   $("#first-circle").show(500);
	 });
 
});

// function initialize() {
//         var mapOptions = {
//           center: { lat: -34.397, lng: 150.644},
//           zoom: 8
//         };
//         var map = new google.maps.Map(document.getElementById('map-canvas'),
//             mapOptions);
//       }
//       google.maps.event.addDomListener(window, 'load', initialize);