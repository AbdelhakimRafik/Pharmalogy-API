###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Jan 2021
###

auth 	= require '../../utils/auth'
got 	= require 'got'

$(document).ready () ->
	got.get 'http://localhost:3000/user',
		headers:
			token: do auth.getToken
		responseType: 'json'
	.then (res) ->
		user = res.body.data
		$('#username').html "#{user.first_name} #{user.last_name}"
		return
	.catch (err) ->
		console.log err
		return
	return


$('.logout').click ()->
	console.log 'logout'
	do auth.clearToken
	location.href = 'auth/login.pug'