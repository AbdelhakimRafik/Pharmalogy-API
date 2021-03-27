###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Mar 2021
###

###
	Create files table migration
###

module.exports =
	up: (queryInterface, Sequelize) ->
		queryInterface.createTable 'files',
			id:
				allowNull: false
				autoIncrement: true
				primaryKey: true
				type: Sequelize.INTEGER
			name:
				allowNull: false
				type: Sequelize.STRING
			extension:
				allowNull: false
				type: Sequelize.STRING 10
			path:
				allowNull: false
				type: Sequelize.STRING 500
			createdAt:
				allowNull: false
				type: Sequelize.DATE
			updatedAt:
				allowNull: false
				type: Sequelize.DATE

	down: (queryInterface, Sequelize) ->
		queryInterface.dropTable 'files'