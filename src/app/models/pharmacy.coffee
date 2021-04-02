###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Mar 2021
###

{ DataTypes, Model } 	= require 'sequelize'
{ sequelize } 			= require '../../database'

User 					= require './user'

###
	Pharmacy model
###

module.exports = Pharmacy = sequelize.define 'Pharmacy',
	name:
		allowNull: false
		type: DataTypes.STRING
	addresse:
		type: DataTypes.STRING
	email:
		type: DataTypes.STRING
	webSite:
		type: DataTypes.STRING
	phone:
		type: DataTypes.STRING 10
	city:
		allowNull: false,
		type: DataTypes.STRING
	country:
		allowNull: false,
		type: DataTypes.STRING
	longitude:
		allowNull: false
		type: DataTypes.DOUBLE
	latitude:
		allowNull: false
		type: DataTypes.DOUBLE
	status:
		allowNull: false
		type: DataTypes.BOOLEAN
		defaultValue: false
	createdAt:
		allowNull: false
		type: DataTypes.DATE
	updatedAt:
		allowNull: false
		type: DataTypes.DATE
,
	# define table name in database
	tableName: 'pharmacies'

# create pharmacy - users association
Pharmacy.hasMany User,
	foreignKey: 'pharmacy'