$(document).ready(function(){

  $('.modal-link').click(function(){
    content = $(this).attr("data-target");
    day = $(this).attr("data-day");
    period = $(this).attr("data-period");
    length = $(this).attr("data-length");
    spin_time = $(this).attr("data-time");
    $('.modal_content').hide();
    amount = $('input.pledge_amount').val();
    if(content === "modal_donate"){
      title = "Almost there!";
    }else{
      title = "Spin to win!";
    }
    $('.modal_title h2').text(title);
    $('.selected_spin_time').text(spin_time);
    $('.spin_length').text(length);
    $('.donation_amount_text').text(amount);
    $('input.p_amt').val(amount);
    $('input.period_num').val(period);
    $('input.day_id').val(day);
    $('.'+content).show();
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
