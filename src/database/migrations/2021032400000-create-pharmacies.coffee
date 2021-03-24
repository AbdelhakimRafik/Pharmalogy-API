
###
	Create pharmacies table migration
###

module.exports =
	up: (queryInterface, Sequelize) ->
		queryInterface.createTable 'Pharmacies',
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
			longitude:
				allowNull: false
				type: Sequelize.DOUBLE
			latitude:
				allowNull: false
				type: Sequelize.DOUBLE
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
		queryInterface.dropTable 'Pharmacies'