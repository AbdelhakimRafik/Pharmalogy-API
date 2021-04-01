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
	Order medicine
###

module.exports =
	up: (queryInterface, Sequelize) ->
		queryInterface.createTable 'Order-medicines',
			id:
				allowNull: false
				autoIncrement: true
				primaryKey: true
				type: Sequelize.INTEGER
			order:
				allowNull: false
				type: Sequelize.INTEGER
				references:
					model: 'orders'
					key: 'id'
			medicine:
				allowNull: false,
				type: Sequelize.INTEGER
				references:
					model: 'medicines'
					key: 'id'
			quantity:
				allowNull: false,
				type: Sequelize.INTEGER.UNSIGNED
				defaultValue: 1
			createdAt:
				allowNull: false
				type: Sequelize.DATE
			updatedAt:
				allowNull: false
				type: Sequelize.DATE

	down: (queryInterface, Sequelize) ->
		queryInterface.dropTable 'Order-medicines'