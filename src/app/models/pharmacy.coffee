
{ DataTypes }	=require 'sequelize'
{ sequelize }	=require '../../database'

module.exports = Pharmacy = sequelize.define 'pharmacy',
{
	id_pharma: 
		type : DataTypes.INTEGER
		allowNull :false
		primaryKey:true
	name:
		type : DataTypes.INTEGER
		allowNull : false	
},
	{updatedAt: false}
