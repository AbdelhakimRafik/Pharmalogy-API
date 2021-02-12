###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Jan 2021
###

db 		= require '../db/db'

module.exports.getAllPharmaMedecines = (req, res) ->

	db.query
		sql: 'select m.*, pm.*, p.name as provider from medecines m inner join `pharma-medecines` pm on m.id = pm.medecine inner join providers p on pm.provider = p.id where pm.pharmacy = ?'
		values: req.user.data.pharmacy
		(err, results) ->
			if err
				res.status(500).send
					message: 'Server error occured'
			else
				res.status(200).send
					data: results
			return
	return

module.exports.getPharmaMedecineById = (req, res) ->
	db.query
		sql: 'select * from medecines m inner join `pharma-medecines` pm on m.id = pm.medecine where pm.pharmacy = ?'
		values: req.user.data.pharmacy
		(err, results) ->
			if err
				res.status(500).send
					message: 'Server error occured'
			else
				res.status(200).send
					data: results
			return
	return

module.exports.updatePharmaMedecineById = (req, res) ->

	if req.params.id
		# update medicine
	else
		# add new medicine
		console.log req.body
		data = req.body
		db.query
			sql: 'insert into `pharma-medecines` (pharmacy, medecine, provider, quantity, exp_date) values (?, ?, ?, ?, ?)'
			values: [
				req.user.data.pharmacy
				data.medicine
				data.provider
				data.quantity
				data.exp_date
			]
			(err, results) ->
				if err
					console.log err
					res.status(500).send
						message: 'Server error occured'
				else
					res.status(200).send
						data: 'Medicine added successfully'

	return

module.exports.deletePharmaMedecineById = (req, res) ->
	unless req.params.id
		res.status(413).send
			message: 'Id required'
	else
		db.query
			sql: 'delete from `pharma-medecines` where id = ?'
			values: req.params.id
			(err, results) ->
				if err
					res.status(500).send
						message: 'Server error occured'
				else
					res.status(200).send
						message: 'Deleted successfully'
				return
	return

module.exports.getAllProviders = (req, res) ->

	db.query
		sql: 'select * from providers; select * from medecines'
		(err, results) ->
			if err
				res.status(500).send
					message: 'Server error occured'
			else
				res.status(200).send
					data: results
