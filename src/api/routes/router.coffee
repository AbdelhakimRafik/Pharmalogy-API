###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Jan 2021
###

openRouter 			= require('express').Router()
authRouter 			= require('express').Router()

# middlewares
authMiddleware 		= require '../middlewares/authMiddleware'

# controllers
authController 		= require '../controllers/authController'
usersController 	= require '../controllers/usersController'
medecinesController = require '../controllers/medecinesController'
salesController 	= require '../controllers/salesController'
infoController 		= require '../controllers/infoController'

# open routes
openRouter.post '/register', authController.register
openRouter.post '/login', authController.login

# protect authRouter with a middleware
authRouter.use authMiddleware

# protected routes
authRouter.route '/users'
	.get usersController.getAllUsers

authRouter.route '/user'
	.get usersController.getUser
	.post usersController.updateUser
	.delete usersController.deleteUser

# medicines routes
authRouter.route '/pharma/medecines'
	.get medecinesController.getAllPharmaMedecines

authRouter.route '/pharma/medecine/:id?'
	.get medecinesController.getPharmaMedecineById
	.post medecinesController.updatePharmaMedecineById
	.delete medecinesController.deletePharmaMedecineById

authRouter.route '/provider/all'
	.get medecinesController.getAllProviders

authRouter.route '/sales'
	.get salesController.salesHistory
	.post salesController.addSale

authRouter.route '/dashboard/info'
	.get infoController.getDashboardInfo

authRouter.route '/dashboard/salesTotal'
	.get infoController.getTodaySalesTotal

# export the module
module.exports.openRouter = openRouter
module.exports.authRouter = authRouter
