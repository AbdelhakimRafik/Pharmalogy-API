###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Jan 2021
###

db 	= require '../db/db'
jwt = require 'jsonwebtoken'

module.exports = (req, res, next) ->

	# get toen from headers
	token =  req.headers.token

	# check token
	jwt.verify token, 'this is sercret', (err, decoded) ->
		if err
			# failed to authenticate token
			res.status(403).send
				status: false
				message: 'You don\'t have permission to access this section'
		else
			# get user data
			db.query
				sql: 'select * from users where id = ?'
				values: decoded.id
				(err, [user], fields) ->
					if err
						res.status(500).send
							message: 'Server error occured'
					else if user
						# get user permissions
						db.query
							sql: 'select p.name from permissions p inner join `role-permissions` rp on p.id = rp.permission where role = ?'
							values: user.role
							(err, permissions, fields) ->
								if err
									res.status(500).send
										message: 'Server error occured'
								else
									# create user object and add it to request
									req.user = Object.create 
										data: user
										permissions: permissions.map (p) -> p.name
										hasPermission: (permission) ->
											return @permissions.includes permission

								# call next
								do next
								return
					else
						res.status(404).send
							message: 'No user found'
					return
		return
	return