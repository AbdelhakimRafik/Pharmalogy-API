###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Mar 2021
###

Validator 	= require 'validatorjs'
bcrypt		= require 'bcrypt'
jwt			= require 'jsonwebtoken'
config 		= require '../../config'
User 		= require '../models/user'

###
	@api {post} /api/signup Registration
	@apiName SignUp
	@apiGroup User
	@apiPermission public
	@apiDescription
		Register new given user if not exist.

	@apiParam {String} firstName User first name.
	@apiParam {String} lastName User last name.
	@apiParam {String} email User email addresse.
	@apiParam {String} password User password.
	@apiParam {String{10}} [phone] User number phone.
	@apiParam {String} [city] User city name.
	@apiParam {String} [country] User country name.

	@apiSuccessExample {json} Success-Response
		HTTP/1.1 200
		{
		    "message": "User created successfully"
		}
	@apiErrorExample {json} Error-Email-exists
		HTTP/1.1 401
		{
		    "message": "Email already exists"
		}
	@apiErrorExample {json} Error-Data
		HTTP/1.1 400
		{
		    "message": "Data errors"
		    "errors": errors list
		    "errorCount": number of errors
		}
###
module.exports.signup = (req, res) ->

	# user validation rules
	userRules =
		firstName: 'required|string'
		lastName: 'required|string'
		email: 'required|email'
		password: 'required|min:5'
		phone: 'size:10'
		city: 'string'
		country: 'string'

	# validate request data
	validation = new Validator req.body, userRules

	# when data not validated
	unless do validation.passes
		res.status(400).json
			message: "Data errors"
			errors: do validation.errors.all
			errorCount: validation.errorCount

	# data are validated
	else
		# check if user already registred
		user = await User.findOne where: email: req.body.email
		# user not found
		unless user
			# hash given password
			req.body.password = bcrypt.hashSync req.body.password, config.bcrypt.salt
			# add user to database
			user = await User.create req.body
			# check if user created
			if user
				res.status(200).json
					message: "User created successfully"
		# user found
		else
			res.status(401).json
				message: "Email already exists"	
	return

###
	@api {post} /api/signin Authentification
	@apiName SignIn
	@apiGroup User
	@apiPermission public
	@apiDescription
		Authentify a user with his email and password, and return a token.

	@apiParam {String} email User email addresse.
	@apiParam {String} password User password.

	@apiSuccessExample {json} Success-Response
		HTTP/1.1 200
		{
		    "auth": true
		    "message": "User authenticated successfully"
		    "token": token
		    "user":
		        "firstName": user firstName
		        "lastName": user lastName
		}
	@apiErrorExample {json} Error-Response
		HTTP/1.1 401
		{
		    "auth": false
		    "message": "Email or password incorrect"
		}
###
module.exports.signin = (req, res) ->

	# find user
	user = await User.findOne where: email: req.body.email
	# user found
	if user
		# check user password
		if bcrypt.compareSync req.body.password, user.password
			# create token
			token = jwt.sign id:user.id, config.jwt.secret
			# send response
			res.status(200).json
				auth: true
				message: "User authenticated successfully"
				token: token
				user:
					firstName: user.firstName
					lastName: user.lastName
			return
	# if error occured
	res.status(401).json
		auth: false
		message: "Email or password incorrect"