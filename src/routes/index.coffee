###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Mar 2021
###

# routes that can be accessed publicly
module.exports.publicRouter = require './publicRouter'

# routes that requires to be authenticated
module.exports.privateRouter= require './privateRouter'