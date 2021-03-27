###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Mar 2021
###

###
	Create providers table migration
###

module.exports =
	up: (queryInterface, Sequelize) ->
		queryInterface.createTable 'Providers',
			id:
				allowNull: false
				autoIncrement: true
				primaryKey: true
				type: Sequelize.INTEGER
			name:
				allowNull: false
				type: Sequelize.STRING
			addresse:
				type: Sequelize.STRING
			email:
				type: Sequelize.STRING
			webSite:
				type: Sequelize.STRING
			phone:
				type: Sequelize.STRING 10
			city:
				allowNull: false,
				type: Sequelize.STRING
			country:
				allowNull: false,
				type: Sequelize.STRING
			status:
				allowNull: false
				type: Sequelize.BOOLEAN
				defaultValue: false
			createdAt:
				allowNull: false
				type: Sequelize.DATE
			updatedAt:
				allowNull: false
				type: Sequelize.DATE

	down: (queryInterface, Sequelize) ->
		queryInterface.dropTable 'Providers'