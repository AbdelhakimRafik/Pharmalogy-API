###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Jan 2021
###

mysql = require 'mysql'

# create database connection
cnx = mysql.createConnection
	host: 'localhost'
	user: 'root'
	password: ''
	database: 'pharmalogy'
	multipleStatements: true

# export connection
module.exports = cnx
