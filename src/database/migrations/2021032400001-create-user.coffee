
###
	Create users table migration
###

module.exports =
	up: (queryInterface, Sequelize) ->
		queryInterface.createTable 'Users',
			id:
				allowNull: false
				autoIncrement: true
				primaryKey: true
				type: Sequelize.INTEGER
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
				type: Sequelize.STRING
			role:
				allowNull: false
				type: Sequelize.INTEGER
			pharmacy:
				type: Sequelize.INTEGER
				references:
					model: 'pharmacies'
					key: 'id'
			createdAt:
				allowNull: false
				type: Sequelize.DATE
			updatedAt:
				allowNull: false
				type: Sequelize.DATE

	down: (queryInterface, Sequelize) ->
		queryInterface.dropTable 'Users'