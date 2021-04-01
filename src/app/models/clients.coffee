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
	Client model
###

class Client extends Model

# initialize model
Client.init
	firstName:
		type: Sequelize.STRING
	lastName:
		type: Sequelize.STRING
	email:
		type: Sequelize.STRING
	phone:
		type: Sequelize.STRING 10
	city:
		type: Sequelize.STRING
	country:
		type: Sequelize.STRING
	createdAt:
		allowNull: false
		type: Sequelize.DATE
	updatedAt:
		allowNull: false
		type: Sequelize.DATE