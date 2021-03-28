###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Mar 2021
###

###
	Create clients table migration
###

module.exports =
	up: (queryInterface, Sequelize) ->
		queryInterface.createTable 'Clients',
			id:
				allowNull: false
				autoIncrement: true
				primaryKey: true
				type: Sequelize.INTEGER
			firstName:
				type: Sequelize.STRING
			lastName:
				type: Sequelize.STRING
			email:
				type: Sequelize.STRING
			phone:
				type: Sequelize.STRING 10
			city:
				type: Sequelize.STRING
			country:
				type: Sequelize.STRING
			createdAt:
				allowNull: false
				type: Sequelize.DATE
			updatedAt:
				allowNull: false
				type: Sequelize.DATE

	down: (queryInterface, Sequelize) ->
		queryInterface.dropTable 'Clients'