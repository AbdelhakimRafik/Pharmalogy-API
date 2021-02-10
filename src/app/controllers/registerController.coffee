auth 	= require '../../utils/auth'

$(document).ready () ->
	# set register form submit event listener
	$('#register-form').submit (e) ->
		do e.preventDefault
		formData = new FormData(e.currentTarget)

		data = new Object

		formData.forEach (value, key) ->
			data[key] = value
			return

		$.ajax
			url: "http://localhost:3000/register"
			method: 'POST'
			data: data
			datatype: 'json'
			success: (res) ->
				
			error: (err) ->
				console.log 'error', err
				return

		# addNewMedicine data
		return false
