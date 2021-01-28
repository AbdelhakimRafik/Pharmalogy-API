###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Jan 2021
###

express 	= require 'express'
app 		= do express
db 			= require './db/db'
router 		= require './routes/router'

# use body parser for urls
app.use express.urlencoded extended:true

# use body parser for json
app.use do express.json

# set routers
app.use router.openRouter
app.use router.authRouter

# connect to database
db.connect (err) ->
	if err
		throw 'Error occured while connecting to database'

	# start server
	app.listen 3000, ->
		console.log 'Server start on port 3000'
		return

	return