auth 	= require '../../utils/auth'

list = {}

removeMedicine = (id) ->
	tr = $("#cart #"+id)[0]
	$('#total').text(parseFloat($('#total').text()) - $(tr).data('price'))
	$(tr).remove()
	delete list[id]
	return

getMedicines = () ->
	console.log 'hihi'
	$.ajax
		url: 'http://localhost:3000/pharma/medecines'
		headers:
			token: do auth.getToken
		method: "GET"
		success: (res) ->
			console.log res
			for m in res.data
				$('#medicine').append('<option data-price="'+m.price+'" data-id="'+m.medecine+'" data-provider="'+m.provider+'">'+m.name+'</option>')
		error: (err) ->
			console.log err

$(document).ready () ->

	# get medicinces from server
	do getMedicines

	# set add medicine to list listener
	$('#add-btn').click (e) ->
		# add selected medicine to list
		medicine = $('#medicine').find(':selected')[0];
		quantity = $('#quantity').val();

		id = 'm' + Math.floor(Math.random() * Math.floor(1000))

		$('#cart').append('<tr id="'+id+'"><td>'+$(medicine).text()+'</td><td>'+$(medicine).data('provider')+'</td><td><input class="form-control" type="number" min="1" value="'+quantity+'" placeholder="Qty" style="width: 90px;" /></td><td><a class="action-icon" href="#" onclick="removeMedicine(\''+id+'\')"><i class="mdi mdi-delete"></i></a></td></tr>')
		$('#total').text(parseFloat($('#total').text()) + ($(medicine).data('price') * quantity))

		list[id] =
			id: $(medicine).data('id')
			quantity: quantity

		console.log list
		return

	$('#validate-btn').click (e) ->
		$.ajax
			url: 'http://localhost:3000/orders'
			headers:
				token: do auth.getToken
			method: "POST"
			data: list
			success: (res) ->
				$('#success-alert-modal').modal 'show'
			error: (err) ->
				console.log err
	return
