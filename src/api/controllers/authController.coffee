###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Jan 2021
###

bcrypt 	= require 'bcryptjs'
jwt 	= require 'jsonwebtoken'
db 		= require '../db/db'

module.exports.register = (req, res) ->

	# crypt the password
	password = bcrypt.hashSync req.body.password, 8

	# save user
	db.query
		sql: 'insert into users (first_name, last_name, email, password, phone, city, country, role, pharmacy) values (?,?,?,?,?,?,?,?,?)'
		values: [
			req.body.first_name
			req.body.last_name
			req.body.email
			password
			req.body.phone
			req.body.city
			req.body.country
			req.body.role
			req.body.pharmacy
		]
		(err, results, fields) ->
			if err
				res.status(500).send
					message: 'Server error occured'
			else
				res.status(200).send
					status: true
					message: 'User registred successfully'
			return
	return

module.exports.login = (req, res) ->
	# get user by email
	db.query
		sql: 'select id, password from users where email = ? limit 1'
		values: req.body.email
		(err, [user], fields) ->
			# if error occured
			if err
				res.status(500).send
					auth: false
					message: 'Server error occured'
			else if user

				# check the password is valide
				if bcrypt.compareSync req.body.password, user.password
					# create token
					token = jwt.sign id: user.id, 'this is sercret'

					# send token
					res.status(200).send
						auth: true
						token: token
				else
					# password incorrect
					res.status(403).send
						auth:false
			else
				# email incorrect
				res.status(403).send
					auth: false
			return
	return