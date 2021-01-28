db = require '../db/db'

###
 * get all users for pharmacy
###
module.exports.getAllUsers = (req, res) ->
	# check permission
	unless req.user.hasPermission 'get_users'
		return res.status(403).send
			message: 'Access denied'

	# get users list
	db.query
		sql: 'select * from users where pharmacy = ?'
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

module.exports.getUser = (req, res) ->

	unless req.query.id
		res.status(200).send
			data: req.user.data
	else

		# check permission
		unless req.user.hasPermission 'get_users'
			return res.status(403).send
				message: 'Access denied'

		# get users list
		db.query
			sql: 'select * from users where id = ? and pharmacy = ?'
			values: [req.query.id, req.user.data.pharmacy]
			(err, results) ->
				if err
					res.status(500).send
						message: 'Server error occured'
				else
					res.status(200).send
						data: results
				return
	return

###
 * update user by id
###
module.exports.updateUser = (req, res) ->
	# check permission
	unless req.user.hasPermission 'update_user'
		return res.status(403).send
			message: 'Access denied'

	# create query
	qwr = 'update users set'
	for key, value of req.body.data
		qwr += " #{key} = ?,"
	# remove last coma and add where clause
	qwr = qwr.slice 0, -1
	qwr += ' where id = ?'

	# get data
	values = Object.values req.body.data
	values.push req.query.id

	db.query
		sql: qwr
		values: values
		(err, results, fields) ->
			if err
				res.status(500).send
					message: 'Server error occured'
			else
				res.status(200).send
					message: 'User updated successfully'
			return
	return

###
 * [deleteUser description]
###
module.exports.deleteUser = (req, res) ->
	# check permission
	unless req.user.hasPermission 'delete_user'
		return res.status(403).send
			message: 'Access denied'

	# update user
	db.query
		sql: 'delete from users where id = ?'
		values: req.body.id
		(err, results, fields) ->
			if err
				res.status(500).send
					message: 'Server error occured'
			else
				res.status(200).send
					message: 'User deleted successfully'
			return
	return
