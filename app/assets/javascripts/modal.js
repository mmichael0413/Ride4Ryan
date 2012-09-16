$(document).ready(function(){

  $('.modal-link').click(function(){
    $('.modal_bg').fadeIn(100);
    $('.modal_box').delay(100).fadeIn(100);
  });

  $('.modal-link-close').click(function(){
    $('.modal_bg').delay(100).fadeOut(100);
    $('.modal_box').fadeOut(100);
  });

  $('.modal_bg').click(function(){
    $('.modal_bg').delay(100).fadeOut(100);
    $('.modal_box').fadeOut(100);
  });
  
});
