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
	Sale attachment model
###

class SaleAttachment extends Model

# initialize model
SaleAttachment.init
	sale:
		allowNull: false
		type: Sequelize.INTEGER
	file:
		allowNull: false
		type: Sequelize.INTEGER
	createdAt:
		allowNull: false
		type: Sequelize.DATE
	updatedAt:
		allowNull: false
		type: Sequelize.DATE