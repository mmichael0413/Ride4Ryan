$(document).ready(function(){

  $('.modal-link').click(function(){
    content = $(this).attr("data-target");
    $('.modal_content').hide();
    amount = $('input.pledge_amount').val();
    if(content === "modal_donate"){
      title = "Almost there!";
    }else{
      title = "Spin to win!";
    }
    $('.modal_title h2').text(title);
    $('.donation_amount_text').text(amount);
    $('input.p_amt').val(amount);
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
