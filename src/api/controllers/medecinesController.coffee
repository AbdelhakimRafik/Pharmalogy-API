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
	return

module.exports.deletePharmaMedecineById = (req, res) ->
	return