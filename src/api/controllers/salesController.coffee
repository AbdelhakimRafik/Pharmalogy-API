###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Jan 2021
###

db 		= require '../db/db'

module.exports.addSale = (req, res) ->

	data = req.body
	console.log data
	db.query
		sql: 'insert into `sales` (pharmacy) values (?)'
		values: req.user.data.pharmacy
		(err, results) ->
			if(err)
				console.log err
			values = []
			console.log results
			for m of data
				console.log m
				values.push [results.insertId, data[m].id, data[m].quantity]
			console.log values
			db.query
				sql: 'insert into `sale-medecines` (sale, medecine, quantity) values ?'
				values: [values]
				(err, result) ->
					if(err)
						console.log err
						res.status(500).send
							message: 'Server error occured'
					else
						res.status(200).send
							message: 'Sale added successfully'
	return
