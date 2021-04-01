###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Mar 2021
###

Validator 	= require 'validatorjs'

Pharmacy 	= require '../models/pharmacy'

module.exports.createNew = (req, res) ->

	# pharmacy data validation rules
	validationRules =
		name: 'required|string|min:5'
		addresse: 'string'
		email: 'string|email'
		webSite: 'string|'
		phone: 'string|size:10'
		city: 'required|string'
		country: 'required|string'
		longitude: 'required|string'
		latitude: 'required|string'
	
	# validate request data
	validation = new Validator req.body, validationRules

	# when data not validated
	unless do validation.passes
		res.status(400).json
			message: "Data errors"
			errors: do validation.errors.all
			errorCount: validation.errorCount

	# data are validated
	else
		# check if pharmacy name already registred
		pharmacy = await Pharmacy.findOne where: name: req.body.name
		# pharmacy not found with same name 
		unless pharmacy
			# add pharmacy to database
			pharmacy = await Pharmacy.create req.body
			# check if pharmacy created
			if pharmacy
				res.status(200).json
					message: "Pharmacy created successfully"
					id: pharmacy.id
		# pharmacy with same name found
		else
			res.status(401).json
				message: "Pharmacy name already exists"
	return

module.exports.nameValidation = (req, res) ->
	# pharmacy name validation rule
	validationRule =
		name: 'required|string|min:5'
	
	# validate request data
	validation = new Validator req.body, validationRule

	# when name not validated
	unless do validation.passes
		res.status(400).json
			message: "Data errors"
			errors: do validation.errors.all
			errorCount: validation.errorCount

	# name format are validated
	else
		# check if pharmacy name already registred
		pharmacy = await Pharmacy.findOne where: name: req.body.name
		# pharmacy not found with same name 
		unless pharmacy
			res.status(200).json
				message: "Pharmacy name available"
		# pharmacy with same name found
		else
			res.status(401).json
				message: "Pharmacy name already exists"
	return