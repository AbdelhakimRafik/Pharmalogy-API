###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Mar 2021
###

{ DataTypes } 	= require 'sequelize'
{ sequelize } 	= require '../../database'

module.exports = User = sequelize.define 'User',

	firstName:
		type: DataTypes.STRING
		allowNull: false
	lastName:
		type: DataTypes.STRING
		allowNull: false
	email:
		type: DataTypes.STRING
		allowNull: false
	password:
		type: DataTypes.STRING
		allowNull: false
	phone:
		type: DataTypes.STRING 10
	city:
		type: DataTypes.STRING
	country:
		type: DataTypes.STRING
	avatar:
		type: DataTypes.STRING
	role:
		type: DataTypes.BIGINT
	pharmacy:
		type: DataTypes.BIGINT