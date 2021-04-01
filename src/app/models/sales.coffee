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
	Sale model
###

class Sale extends Model

# initialize model
Sale.init
	client:
		allowNull: false
		type: DataTypes.INTEGER
	pharmacy:
		allowNull: false
		type: DataTypes.INTEGER
	discount:
		type: DataTypes.INTEGER 3
	totalPaid:
		allowNull: false
		type: DataTypes.FLOAT 11, 2
	notes:
		type: DataTypes.TEXT
	status:
		allowNull: false
		type: DataTypes.BOOLEAN
		defaultValue: 1
	createdAt:
		allowNull: false
		type: DataTypes.DATE
	updatedAt:
		allowNull: false
		type: DataTypes.DATE