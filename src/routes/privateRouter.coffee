###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Mar 2021
###

{ Router }	= require 'express'
router 		= do Router

authMiddleware = require '../app/middlewares/authMiddleware'

clientController = require '../app/controllers/clientController'

pharmacyController= require '../app/controllers/pharmacyController'

# protect router with authentication middleware
router.use authMiddleware

# export router
module.exports = router

router.get '/users', (req, res) ->
	console.log req.user
	res.send "ok"

router.get '/getClient', clientController.getClient

router.get '/getAllClient', clientController.getAllClient
	

router.post '/addClient', clientController.addClient

router.post '/addPharmacy', pharmacyController.addPharmacy