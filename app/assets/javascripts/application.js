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
//
$(function() {
    $('#datepicker1').datetimepicker({
      language: 'en',
      pickTime: false
    });
    $('#datepicker2').datetimepicker({
      language: 'en',
      pickTime: false
    });
    $('#timepicker1').datetimepicker({
      language: 'en',
      pickDate: false,
      pickSeconds: true
    });
    $('#timepicker2').datetimepicker({
      language: 'en',
      pickDate: false,
      pickSeconds: true
    });
});

function searchFired(){

  var start = $("#startplace option:selected").val();
  var dest = $("#destination option:selected").val();

  $.ajax({
    url: "/find",
    type: "POST",
    data: {start:start, dest:dest },
    success: function(data) {
    },
    error: function(XMLHttpRequest, textStatus, errorThrown) { 
    }   
  });

}