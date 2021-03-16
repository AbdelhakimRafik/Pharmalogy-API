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

userController = require '../app/controllers/userController'

# protect router with authentication middleware
router.use authMiddleware

# export router
module.exports = router

router.get '/user/:id', userController.getUserById