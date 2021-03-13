
{ DataTypes } 	= require 'sequelize'
{ sequelize } 	= require '../../database'

module.exports = Client = sequelize.define 'Client',
{
	idclt:
		type :DataTypes.BIGINT
		primaryKey:true
	firstName:
		type: DataTypes.STRING
		allowNull: false
	lastName:
		type: DataTypes.STRING
		allowNull: false
	CIN:
		type: DataTypes.STRING
		allowNull: false
	email:
		type: DataTypes.STRING
	phone:
		type: DataTypes.STRING 10
	id_pharma:
		type: DataTypes.BIGINT
	sexe:
		type: DataTypes.STRING
	MI_type:
		type: DataTypes.STRING
	MI_number:
		type: DataTypes.DECIMAL 15, 0
	adresse:
		type :DataTypes.STRING
	autres:
		type: DataTypes.STRING
},
{updatedAt : false}