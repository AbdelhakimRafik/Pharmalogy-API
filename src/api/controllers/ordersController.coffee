###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Jan 2021
###

db 		= require '../db/db'

module.exports.addOrders = (req, res) ->
	data = req.body
	values = []
	for i of data
		values.push [req.user.data.id, data[i].id, data[i].quantity]
	db.query
		sql: 'insert into `commandes` (user, medecine, quantity) values ?'
		values: [values]
		(err, results) ->
			if(err)
				console.log err
				res.status(500).send
					message: 'Server error occured'
			else
				res.status(200).send
					message: 'Order added successfully'
			return

module.exports.getAllOrders = (req, res) ->

	db.query
		sql: 'select *, c.id from commandes c inner join medecines m on c.medecine = m.id order by c.created_at desc'
		(err, results) ->
			if(err)
				console.log err
				res.status(500).send
					message: 'Server error occured'
			else
				res.status(200).send
					data: results
			return

module.exports.setOrderStatus = (req, res) ->
	console.log req.body
	db.query
		sql: 'update commandes set status = ? where id = ?'
		values: [req.body.status, req.body.id]
		(err, results) ->
			if(err)
				console.log err
				res.status(500).send
					message: 'Server error occured'
			else
				res.status(200).send
					data: 'Order status has been updated successfully'
			return
