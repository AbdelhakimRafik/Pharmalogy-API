###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Mar 2021
###

Validator 		= require 'validatorjs'
Pharmacy 		= require '../models/pharmacy'
{ sequelize } 	= require '../../database'

module.exports.create = (req, res) ->

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

module.exports.getLocations = (req, res) ->
	# "SELECT *, ( 3959 * acos( cos( radians(" . $lat . ") ) * cos( radians( lat ) ) * cos( radians( lng ) - radians(" . $lng . ") ) + sin( radians(" . $lat . ") ) * sin( radians( lat ) ) ) ) AS distance FROM your_table HAVING distance < 5";
	#  data validation rules
	validationRules =
		city: 'string|required_without:location'
		location:
			latitude: 'numeric|required_with:longitude'
			longitude: 'numeric|required_with:latitude'
			range: 'numeric'

	# validate request data
	validation = new Validator req.body, validationRules

	# when data error validation occured
	unless do validation.passes
		res.status(400).json
			message: "Data errors"
			errors: do validation.errors.all
			errorCount: validation.errorCount
	else
		# get data from database by city name
		if req.body.city
			pharmacies = await Pharmacy.findAll where: city: req.body.city
		
		# get data from database by location range
		else if req.body.location
			req.body.range ?= 5 # set default value if undefined
			pharmacies = await sequelize.query "SELECT *, ( 6371 * acos( cos( radians(#{req.body.location.latitude}) ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians(#{req.body.location.longitude}) ) + sin( radians(#{req.body.location.latitude}) ) * sin( radians( latitude ) ) ) ) AS distance FROM pharmacies HAVING distance < #{req.body.location.range}"

		if pharmacies
			res.status(200).json pharmacies
		else
			res.status(400).json
				message: 'An error occured while fetching data'
		return