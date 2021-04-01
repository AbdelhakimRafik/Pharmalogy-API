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
	pharmacy medicine model
###

class PharmacyMedicine extends Model

# initialize model
PharmacyMedicine.init
	pharmacy:
		allowNull: false
		type: Sequelize.INTEGER
	medicine:
		allowNull: false
		type: Sequelize.INTEGER
	provider:
		allowNull: false
		type: Sequelize.INTEGER
	quantity:
		allowNull: false
		type: Sequelize.INTEGER.UNSIGNED
		defaultValue: 1
	purchasePrice:
		allowNull: false
		type: Sequelize.FLOAT 11, 2
	salePrice:
		allowNull: false
		type: Sequelize.FLOAT 11, 2
	prodDate:
		type: Sequelize.DATEONLY
	expDate:
		allowNull: false
		type: Sequelize.DATEONLY
	createdAt:
		allowNull: false
		type: Sequelize.DATE
	updatedAt:
		allowNull: false
		type: Sequelize.DATE