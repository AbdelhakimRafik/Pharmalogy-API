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
	Sale medicine model
###

class SaleMedicine extends Model

# initialize model
SaleMedicine.init
	sale:
		allowNull: false
		type: Sequelize.INTEGER
	medicine:
		allowNull: false
		type: Sequelize.INTEGER
	quantity:
		allowNull: false
		type: Sequelize.INTEGER.UNSIGNED
		defaultValue: 1
	createdAt:
		allowNull: false
		type: Sequelize.DATE
	updatedAt:
		allowNull: false
		type: Sequelize.DATE