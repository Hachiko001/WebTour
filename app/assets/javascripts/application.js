// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require_tree .
//= require bootstrap-sprockets
//= require jquery.raty
//= require ratyrate

function readURL(input){
  debugger
   if(input.files && input.files[0]){
     var reader = new FileReader();
     reader.onload = function(e){
       $('#blah').attr('src',e.target.result);
     }
     reader.readAsDataURL(input.files[0]);
   }

 }

 $("#imgInp").change(function(){
   readURL(this);
 });

 jQuery(document).ready(function($) {

       $('#myCarousel').carousel({
               interval: 5000
       });

       $('#carousel-text').html($('#slide-content-0').html());

       //Handles the carousel thumbnails
       $('[id^=carousel-selector-]').click( function(){
               var id_selector = $(this).attr("id");
               var id = id_selector.substr(id_selector.length -1);
               var id = parseInt(id);
               $('#myCarousel').carousel(id);
       });


       // When the carousel slides, auto update the text
       $('#myCarousel').on('slid', function (e) {
               var id = $('.item.active').data('slide-number');
               $('#carousel-text').html($('#slide-content-'+id).html());
       });
});
