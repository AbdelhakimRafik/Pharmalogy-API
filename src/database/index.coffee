###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Mar 2021
###

Sequelize   = require 'sequelize'

###
# establish a connection with given database
# @param config     object contains needed configuration for connection
###
module.exports.connect = (config, cb)->
    # export sequelize instance
    module.exports.sequelize = sequelize = new Sequelize config.dbName, config.username, config.password,
        host: config.host
        dialect: config.dialect
    
    # run callback and passe created sequelize instance
    cb sequelize

    return
