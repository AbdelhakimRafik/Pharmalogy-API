###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Mar 2021
###

###
	Create sale medicines table migration
###

module.exports =
	up: (queryInterface, Sequelize) ->
		queryInterface.createTable 'Sale-medicines',
			id:
				allowNull: false
				autoIncrement: true
				primaryKey: true
				type: Sequelize.INTEGER
			sale:
				allowNull: false
				type: Sequelize.INTEGER
				references:
					model: 'sales'
					key: 'id'
			medicine:
				allowNull: false
				type: Sequelize.INTEGER
				references:
					model: 'medicines'
					key: 'id'
			quantity:
				allowNull: false
				type: Sequelize.INTEGER.UNSIGNED
				defaultValue: 1
			createdAt:
				allowNull: false
				type: Sequelize.DATE
			updatedAt:
				allowNull: false
				type: Sequelize.DATE

	down: (queryInterface, Sequelize) ->
		queryInterface.dropTable 'Sale-medicines'