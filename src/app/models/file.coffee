###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Mar 2021
###

{ DataTypes, Model } 	= require 'sequelize'
{ sequelize } 			= require '../../database'

###
	Files model
###

module.exports = File = sequelize.define 'File',
	name:
		allowNull: false
		type: DataTypes.STRING
	extension:
		allowNull: false
		type: DataTypes.STRING 10
	path:
		allowNull: false
		type: DataTypes.STRING 500
	createdAt:
		allowNull: false
		type: DataTypes.DATE
	updatedAt:
		allowNull: false
		type: DataTypes.DATE