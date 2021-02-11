###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Jan 2021
###

db 		= require '../db/db'

module.exports.getDashboardInfo = (req, res) ->

	db.query
		sql: "select count(*) as `count`, date(`date`) as `date` from sales group by pharmacy,date(`date`) having pharmacy = ? order by date desc"
		values: req.user.data.pharmacy
		(err, results) ->
			if err
				console.log err
				res.status(500).send
					message: 'Server Error Occured'
			else
				res.status(200).send
					data: results

module.exports.getTodaySalesTotal = (req, res) ->
	db.query
		sql: "select sum(m.price * ms.quantity) as `total`, date(sa.date) as `sadate` from `sales` as sa inner join `sale-medecines` ms on sa.id = ms.sale inner join `medecines` m on m.id = ms.medecine group by sa.pharmacy, `sadate` having `sadate` = CURDATE() and sa.pharmacy = ?"
		values: req.user.data.pharmacy
		(err, results) ->
			if err
				console.log err
				res.status(500).send
					message: 'Server Error Occured'
			else
				res.status(200).send
					data: results
