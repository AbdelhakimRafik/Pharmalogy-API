###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Mar 2021
###

###
	Create pharmacy medicines table migration
###

module.exports =
	up: (queryInterface, Sequelize) ->
		queryInterface.createTable 'Pharma-medicines',
			id:
				allowNull: false
				autoIncrement: true
				primaryKey: true
				type: Sequelize.INTEGER
			pharmacy:
				allowNull: false
				type: Sequelize.INTEGER
				references:
					model: 'pharmacies'
					key: 'id'
			medicine:
				allowNull: false
				type: Sequelize.INTEGER
				references:
					model: 'medicines'
					key: 'id'
			provider:
				allowNull: false
				type: Sequelize.INTEGER
				references:
					model: 'providers'
					key: 'id'
			quantity:
				allowNull: false
				type: Sequelize.INTEGER.UNSIGNED
				defaultValue: 1
			purchasePrice:
				allowNull: false
				type: Sequelize.FLOAT 11, 2
			salePrice:
				allowNull: false
				type: Sequelize.FLOAT 11, 2
			prodDate:
				type: Sequelize.DATEONLY
			expDate:
				allowNull: false
				type: Sequelize.DATEONLY
			createdAt:
				allowNull: false
				type: Sequelize.DATE
			updatedAt:
				allowNull: false
				type: Sequelize.DATE

	down: (queryInterface, Sequelize) ->
		queryInterface.dropTable 'Pharma-medicines'