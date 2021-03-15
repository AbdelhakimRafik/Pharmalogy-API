Validator	=require 'validatorjs'
Client		=require '../models/client'

module.exports.getAllClient = (req, res) ->
	client = await Client.findAll where: id_pharma:req.user.id_pharma
	if client.length 
		res.status(200).json client
	else 
		res.status(401).json
			message: "no clients have been found"

module.exports.getClientByCIN = (req, res) ->
	client = await Client.findOne 
		where:
			CIN: req.params.CIN
			id_pharma: req.user.id_pharma
	res.status(200).json client

module.exports.getClientByFirstName = (req, res) ->
	client = await Client.findAll 
		where: 
			firstName: req.params.firstName
			id_pharma: req.user.id_pharma
	res.status(200).json client

module.exports.getClientByLastName = (req, res) ->
	client = await Client.findAll
		where: 
			lastName: req.params.lastName
			id_pharma: req.user.id_pharma
	res.status(200).json client
module.exports.getClientByEmail = (req, res) ->
	client = await Client.findAll
		where: 
			email: req.params.email
			id_pharma: req.user.id_pharma
	res.status(200).json client
module.exports.getClientByPhone = (req, res) ->
	client = await Client.findAll 
		where: 
			lastName: req.params.phone
			id_pharma: req.user.id_pharma
	res.status(200).json client
			
module.exports.addClient = (req, res) ->
	clientRules=
		firstName: 'required|string'
		lastName: 'required|string'
		CIN: 'required'
		phone: 'size:10'
		id_pharma: 'required'
	
	#validate request data
	validation = new Validator req.body, clientRules
	
	#when data is not validated
	unless do validation.passes
		res.status(400).json
			message: "Data errors"
			errors: do validation.errors.all
			errorCount: validation.errorCount

	#data are validated
	else
		#check if client already exist
		client = await Client.findOne where: CIN: req.body.CIN
		#client is not found
		unless client
			client = await Client.create req.body
			if client
				res.status(200).json
					message: "client created successfully"

		else res.status(401).json
			message: "CIN Client already exists "
	return