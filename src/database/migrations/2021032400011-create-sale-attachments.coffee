###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Mar 2021
###

###
	Create sale attachments table migration
###

module.exports =
	up: (queryInterface, Sequelize) ->
		queryInterface.createTable 'Sale-attachments',
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
			file:
				allowNull: false
				type: Sequelize.INTEGER
				references:
					model: 'files'
					key: 'id'
			createdAt:
				allowNull: false
				type: Sequelize.DATE
			updatedAt:
				allowNull: false
				type: Sequelize.DATE

	down: (queryInterface, Sequelize) ->
		queryInterface.dropTable 'Sale-attachments'