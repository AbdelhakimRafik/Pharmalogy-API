###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Jan 2021
###

got 		= require 'got'
auth 		= require '../../utils/auth'

# on login form submit
$('#loginForm').submit (e) ->
	# make request to server for authentication
	got.post 'http://localhost:3000/login',
		responseType: 'json'
		json:
			email: e.target.elements[0].value
			password: e.target.elements[1].value
	.then (res) ->
		# save token as global variable
		auth.saveToken res.body.token
		# save token if remember me is checked
		if e.target.elements[2].checked
			console.log 'save'
		# show success message
		$('#login-status')
				.addClass 'alert-success'
				.removeClass 'alert-danger'
				.html '<i class="mdi mdi-check-all mr-2"></i>You have <strong>logged successfully</strong>'
				.show()
		# redirect to index
		location.href = '../index.pug'
		return
	.catch (err) ->
		console.log err
		if err.response.statusCode is 403
			# access denied
			$('#login-status')
				.addClass 'alert-danger'
				.removeClass 'alert-success'
				.html '<i class="mdi mdi-alert-outline mr-2"></i>Your <strong>email or password</strong> is incorrect!'
				.show()
		else if err.response.statusCode is 500
			# server error
			$('#login-status')
				.addClass 'alert-danger'
				.removeClass 'alert-success'
				.html '<i class="mdi mdi-alert-circle-outline mr-2"></i><strong>Server error</strong> occured, please try again!'
				.show()
		return
	return false
	