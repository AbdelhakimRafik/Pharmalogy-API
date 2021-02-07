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
		db.query
			sql: 'insert into `pharma-medecines` values (?)'
			values:
			(err, results) ->
				if err
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