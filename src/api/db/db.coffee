mysql = require 'mysql'

# create database connection
cnx = mysql.createConnection
	host: 'localhost'
	user: 'root'
	password: ''
	database: 'pharmalogy'

# export connection
module.exports = cnx