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
	Order model 
###

class Order extends Model

# initialize model
Order.init
	user:
		allowNull: false
		type: Sequelize.INTEGER
	pharmacy:
		allowNull: false,
		type: Sequelize.INTEGER
	status:
		allowNull: false,
		type: Sequelize.BOOLEAN
		defaultValue: 0
	createdAt:
		allowNull: false
		type: Sequelize.DATE
	updatedAt:
		allowNull: false
		type: Sequelize.DATE