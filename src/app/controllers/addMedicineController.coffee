auth 	= require '../../utils/auth'

formInit = () ->
	$.ajax
		url: "http://localhost:3000/provider/all"
		method: "GET"
		headers:
			token: do auth.getToken
		success: (res) ->
			# add providers to list
			for provider in res.data[0]
				$('#medicine-provider').append "<option value=\"#{provider.id}\">#{provider.name}</option>"
			# add medicines to list
			for medicine in res.data[1]
				$('#medicine-name').append "<option value=\"#{medicine.id}\">#{medicine.name}</option>"
		error: (err) ->
			console.log 'error', err


$(document).ready ()->

	# get medicines list and providers list
	do formInit

	# add event listener to add medicine form
	$('#add-medicne-form').submit (e) ->
		do e.preventDefault
		formData = new FormData(e.currentTarget)

		data = new Object

		formData.forEach (value, key) ->
			data[key] = value
			return

		$.ajax
			url: "http://localhost:3000/pharma/medecine/"
			method: 'POST'
			headers:
				token: do auth.getToken
			data: data
			datatype: 'json'
			success: (res) ->
				if res
					$('#success-alert-modal').modal 'show'
					do e.currentTarget.reset
				return
			error: (err) ->
				console.log 'error', err
				return

		# addNewMedicine data
		return false
