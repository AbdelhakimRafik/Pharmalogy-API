fs 		= require 'fs'
path 	= require 'path'

# global token
token 	= null

module.exports.saveToken = (token) ->
	filename = path.join __dirname, 'env.json'
	fs.writeFileSync filename, JSON.stringify token:token

module.exports.getToken = getToken = ->
	unless token
		try
			data = fs.readFileSync path.join __dirname, 'env.json'
			data = JSON.parse data
			token = data.token
		catch e
			token = null
	return token

module.exports.clearToken = () ->
	token = null
	filename = path.join __dirname, 'env.json'
	fs.writeFileSync filename, JSON.stringify token:null

module.exports.isAuthenticated = ->
	return getToken()?