###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Mar 2021
###

###
	Create orders table migration
###

module.exports =
	up: (queryInterface, Sequelize) ->
		queryInterface.createTable 'Orders',
			id:
				allowNull: false
				autoIncrement: true
				primaryKey: true
				type: Sequelize.INTEGER
			user:
				allowNull: false
				type: Sequelize.INTEGER
				references:
					model: 'users'
					key: 'id'
			pharmacy:
				allowNull: false,
				type: Sequelize.INTEGER
				references:
					model: 'pharmacies'
					key: 'id'
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

	down: (queryInterface, Sequelize) ->
		queryInterface.dropTable 'Orders'