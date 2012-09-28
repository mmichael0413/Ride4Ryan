$(document).ready(function(){

  $('.modal-link').click(function(){
    fee = $('.products ul').attr("data-fee");
    content = $(this).attr("data-target");
    day = $(this).attr("data-day");
    period = $(this).attr("data-period");
    length = $(this).attr("data-length");
    spin_time = $(this).attr("data-time");
    $('.modal_content').hide();
    amount = $('input.pledge_amount').val();
    if(content === "modal_donate"){
      title = "Almost there!";
      $('.donate_only').show();
      $('.register_only').hide();
      $('.good_karma_button_modal').val("Donate");
    }else{
      title = "Spin to win!";
      $('.donate_only').hide();
      $('.register_only').show();      
      $('.good_karma_button_modal').val("Register");
    }
    $('.modal_title h2').text(title);
    $('.selected_spin_time').text(spin_time);
    $('.spin_length').text(length);
    if(amount > 0){
      $('input.p_amt').val(amount);
      $('.donation_amount_text').text(amount);      
    }else{
      $('input.p_amt').val(fee);
      $('.donation_amount_text').text(fee);      
    }
    $('input.period_num').val(period);
    $('input.day_id').val(day);
    $('.modal_content').show();
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
