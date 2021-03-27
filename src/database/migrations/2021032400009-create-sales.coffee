###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Mar 2021
###

###
	Create sales table migration
###

module.exports =
	up: (queryInterface, Sequelize) ->
		queryInterface.createTable 'Sales',
			id:
				allowNull: false
				autoIncrement: true
				primaryKey: true
				type: Sequelize.INTEGER
			client:
				allowNull: false
				type: Sequelize.INTEGER
				references:
					model: 'clients'
					key: 'id'
			pharmacy:
				allowNull: false
				type: Sequelize.INTEGER
				references:
					model: 'pharmacies'
					key: 'id'
			discount:
				type: Sequelize.INTEGER 3
			totalPaid:
				allowNull: false
				type: Sequelize.FLOAT 11, 2
			notes:
				type: Sequelize.TEXT
			status:
				allowNull: false
				type: Sequelize.BOOLEAN
				defaultValue: 1
			createdAt:
				allowNull: false
				type: Sequelize.DATE
			updatedAt:
				allowNull: false
				type: Sequelize.DATE

	down: (queryInterface, Sequelize) ->
		queryInterface.dropTable 'Sales'