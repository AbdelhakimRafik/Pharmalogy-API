Validator	=require 'validatorjs'
Client		=require '../models/client'

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

		else res.stats(401).json
			message: "CIN Client already exists "
	return