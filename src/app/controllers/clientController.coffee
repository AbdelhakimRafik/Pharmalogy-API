Validator	=require 'validatorjs'
Client		=require '../models/client'

module.exports.getAllClient = (req, res) ->
	if req.body.id_pharma
		client = await Client.findAll where: id_pharma:req.body.id_pharma
		if client 
			res.status(200).json client
		else 
			res.status(401).json
				message: "no clients have been found"
	else 
		res.status(401).json 
			message: "specify id pharmacy"


module.exports.getClient = (req, res) ->
	if req.body.id_pharma
		if req.body.CIN
			client = await Client.findOne 
				where:
					CIN: req.body.CIN
					id_pharma: req.body.id_pharma

		else if req.body.firstName
			client = await Client.findAll 
				where: 
					firstName: req.body.firstName
					id_pharma: req.body.id_pharma

		else if req.body.lastName
			client = await Client.findAll 
				where: 
					lastName: req.body.lastName
					id_pharma: req.body.id_pharma
			

		else if req.body.lastName
			client = await Client.findAll
				where: 
					email: req.body.email
					id_pharma: req.body.id_pharma
			

		else if req.body.lastName
			client = await Client.findAll 
				where: 
					lastName: req.body.phone
					id_pharma: req.body.id_pharma
			
		if client 
			res.status(200).json client
		else res.status(401).json
			message: "no clients have been found"

	else res.status(401).json
		message: "specify id pharmacy"

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