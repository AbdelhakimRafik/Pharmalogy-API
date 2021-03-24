
path = require 'path'

module.exports =

	development:
		username: 'root'
		password: ''
		database: 'pharmalogy'
		host: '127.0.0.1'
		port: 3306
		dialect: 'mysql'
		dialectOptions:
			bigNumberStrings: true
		# Use a different storage type. Default: sequelize
		migrationStorage: 'json',
		# Use a different file name. Default: sequelize-meta.json
		migrationStoragePath: path.join __dirname, '../database/sequelize-meta.json',

	production:
		username: 'root'
		password: ''
		database: 'pharmalogy'
		host: '127.0.0.1'
		port: 3306
		dialect: 'mysql'
		dialectOptions:
			bigNumberStrings: true