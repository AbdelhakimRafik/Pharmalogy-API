###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Mar 2021
###

{ Router } 	= require 'express'
router 		= do Router

authController 		= require '../app/controllers/authController'
pharmacyController 	= require '../app/controllers/pharmacyController'

# export router
module.exports = router

# register route
router.post '/signup', authController.signup

# login route
router.post '/signin', authController.signin

# pharmacies locations
router.post '/pharmacies/location', pharmacyController.getLocations