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

# protect router with authentication middleware
router.use authMiddleware

# export router
module.exports = router

router.get '/users', (req, res) ->
	console.log req.user
	res.send "ok"
