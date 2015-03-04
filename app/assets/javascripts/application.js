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

	$('#box1').hover(function() {
	   $("#first-circle").hide(500);
	 }, function() {
	   $("#first-circle").show(500);
	 });

	$('#box2').hover(function() {
	   $("#second-circle").hide(500);
	 }, function() {
	   $("#second-circle").show(500);
	 });

	$('#box3').hover(function() {
	   $("#third-circle").hide(500);
	 }, function() {
	   $("#third-circle").show(500);
	 });

 
});
