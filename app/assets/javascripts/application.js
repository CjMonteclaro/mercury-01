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
//= require rails-ujs
//= require jquery
//= require jquery-ui
//= require jquery-ui/datepicker
//= require turbolinks
//= require_tree.
//

$(function() {
    $( "#loss_date_from" ).datepicker({ dateFormat: 'yy-mm-dd' });
    $( "#loss_date_to" ).datepicker({ dateFormat: 'yy-mm-dd' });
    $( "#release_date_from" ).datepicker({ dateFormat: 'yy-mm-dd' });
    $( "#release_date_to" ).datepicker({ dateFormat: 'yy-mm-dd' });
    $( "#cod" ).datepicker({ dateFormat: 'yy-mm-dd' });
    $( "#ata" ).datepicker({ dateFormat: 'yy-mm-dd' });
    $( "#far" ).datepicker({ dateFormat: 'yy-mm-dd' });
    $( "#apprvd" ).datepicker({ dateFormat: 'yy-mm-dd' });
    $( "#loa" ).datepicker({ dateFormat: 'yy-mm-dd' });
    $( "#ofs" ).datepicker({ dateFormat: 'yy-mm-dd' });
    $( "#rec_invoice" ).datepicker({ dateFormat: 'yy-mm-dd' });
    $( "#payment_req" ).datepicker({ dateFormat: 'yy-mm-dd' });
    $( "#to_audit" ).datepicker({ dateFormat: 'yy-mm-dd' });
    $( "#to_treasury" ).datepicker({ dateFormat: 'yy-mm-dd' });
});
