
validator   =require 'validatorjs'
Pharmacy    =require '../models/pharmacy'

module.exports.addPharmacy = (req, res) ->

	pharmacyRules=
		id_pharma : 'required'
		name : 'required|string'

	#validate request data
	validation = new validator req.body, pharmacyRules

	#when data is not validated
	unless do validation.passes
		res.status(400).json
			message: "Data errors"
			errors: do validation.errors.all
			errorCount: validation.errorCount

	#data are validated
	else
		#check if client already exist
		pharmacy = await Pharmacy.findOne where: id_pharma: req.body.id_pharma
		#pharmacy is not found
		unless pharmacy
			pharmacy = await Pharmacy.create req.body
			if pharmacy
				res.status(200).json
					message: "pharmacy created successfully"

		else res.status(401).json
			message: "id pharmacy already exists "
	return