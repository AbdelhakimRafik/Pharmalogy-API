###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Mar 2021
###

express = require 'express'
app     = do express

config  = require './config'
db      = require './database'

# use bodyParser for requests params
app.use express.urlencoded extended:true

# use bodyParser for JSON
app.use do express.json

# connect to database
db.connect config.db, (sequelize) ->
    # start server
    app.listen config.server.port, ->
        console.log "Server started on #{config.server.host}:#{config.server.port}"
        return