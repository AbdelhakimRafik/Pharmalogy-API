
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

			createdAt:
				allowNull: false
				type: Sequelize.DATE

			updatedAt:
				allowNull: false
				type: Sequelize.DATE

	down: (queryInterface, Sequelize) ->
		queryInterface.dropTable 'Clients'