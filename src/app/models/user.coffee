###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Mar 2021
###

{ DataTypes, Model } 	= require 'sequelize'
{ sequelize } 	= require '../../database'

# create user model
class User extends Model

# initialize user model fields
User.init
	firstName:
		type: Sequelize.STRING
		allowNull: false
	lastName:
		type: Sequelize.STRING
		allowNull: false
	email:
		type: Sequelize.STRING
		allowNull: false
	password:
		type: Sequelize.STRING
		allowNull: false
	phone:
		type: Sequelize.STRING 10
	city:
		type: Sequelize.STRING
	country:
		type: Sequelize.STRING
	avatar:
		type: Sequelize.INTEGER
	role:
		allowNull: false
		type: Sequelize.STRING
	pharmacy:
		type: Sequelize.INTEGER
	createdAt:
		allowNull: false
		type: Sequelize.DATE
	updatedAt:
		allowNull: false
		type: Sequelize.DATE