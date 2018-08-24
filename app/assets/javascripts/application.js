// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require cocoon
//= require_tree .


$(function() {
  $(".select-peril").on("change", function() {
    var select_val = $(this).val();
    console.log(select_val); // this just displays the selected value in the browser console (if you have the browser console open)

    if (select_val === '7' || select_val === '8' ) {
      // if the 'Declined' option is chosen
      // we remove the 'hidden' class from the textarea
      $(".premium").removeClass("hidden");
    } else {
      // if any other option is chosen
      // we put back the 'hidden' class to the textarea
      // also, we update the textarea value to BLANK (this part is optional, it depends if you want to keep the value of the textarea)
      $(".premium").addClass("hidden");
      $(".premium").val("");
    }
  });
});
