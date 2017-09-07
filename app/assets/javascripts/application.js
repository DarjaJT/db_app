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
//= require bootstrap
//= require turbolinks
//= require_tree .


$(document).on('turbolinks:load', function () {

    // If the checkbox > 0 is selected, the button is visible otherwise invisible
    $('input[type=checkbox]').bind('click' , function() {
        if ($('.span6').find('input.checkboxes:checked').length > 0) {
            document.getElementById('btn_create_account').style.display = 'block';
        } else {
            document.getElementById('btn_create_account').style.display = 'none';
        }
    });

    // if the checkbox trainer is selected
    $('#trainer').on("click", function () {
      if($(this).attr('id')==$('input:checkbox:checked').attr('id')){
        $.ajax({
            type: "get",
            url: "/trainer_form"
         });
      }else $('#checked').html('');
    });

});