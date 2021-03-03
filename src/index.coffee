###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Mar 2021
###

express	= require 'express'
app		= do express

config	= require './config'
db		= require('./database')(config.db)
routes	= require './routes'

# use bodyParser for requests params
app.use express.urlencoded extended:true

# use bodyParser for JSON
app.use do express.json

# set public routes
app.use '/api', routes.publicRouter
# set private routes
app.use '/api', routes.privateRouter

# start server
app.listen config.server.port, ->
	console.log "Server started on #{config.server.host}:#{config.server.port}"
	return