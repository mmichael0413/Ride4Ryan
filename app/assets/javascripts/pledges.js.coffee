# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
	pledge.setupForm()
	
pledge =
	setupForm: ->
		$('#new_pledge').submit ->
			$('input[type=submit]').attr('disable', true)
			pledge.processCard()
			false
			
	processCard: ->
		card =
			number: $('#card_number').val()
			cvc: $('#card_code').val()
			expMonth: $('#card_month').val()
			expYear: $('#card_year').val()
		Stripe.createToken(card, pledge.handleStripeResponse)
			
	handleStripeResponse: (status, response) ->
		if status == 200
			$('#pledge_stripe_card_token').val(response.id)
			$('#new_pledge')[0].submit()
		else
			$('#stripe_error').text(response.error.message)
			$('input[type=submit]').attr('disable', false)