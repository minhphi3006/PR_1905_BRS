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
//= require activestorage
//= require jquery3
//= require jquery_ujs
//= require turbolinks
//= require popper
//= require bootstrap
//= require_tree .

$( document ).on('turbolinks:load', function(){

  function activeTab(obj){
    $('.user-tabs li ').removeClass('active');
    $(obj).addClass('active');
    var id = $(obj).find('a').attr('href')
    $('.user-images').hide();
    $(id).fadeIn();
  };

  // Sự kiện click đổi tab
  $('ul.user-tabs li').click(function(){
    activeTab(this);
    return false;
  });
  // Active tab đầu tiên khi trang web được chạy
  activeTab($('.user-tabs li:first-child'));
});