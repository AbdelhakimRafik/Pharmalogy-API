###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Jan 2021
###

auth 		= require '../../utils/auth'

setChart = (data) ->
	colors = [
		'#1abc9c'
		'#4a81d4'
	]
	(dataColors = $('#sales-analytics').data('colors')) and (colors = dataColors.split(','))
	options =
		series: [
				name: 'Number of Sales'
				type: 'column'
				data: [
					0
					1
					0
					0
					2
					5
					0
					1
					3
					4
					data[1].count
					data[0].count
				]
		]
		chart:
			height: 378
			type: 'line'
		stroke:
			width: [2, 3]
		plotOptions:
			bar:
				columnWidth: '50%'
		colors: colors
		dataLabels:
			enabled: !0
			enabledOnSeries: [ 1 ]
		labels: [
			'01 Feb'
			'02 Feb'
			'03 Feb'
			'04 Feb'
			'05 Feb'
			'06 Feb'
			'07 Feb'
			'08 Feb'
			'09 Feb'
			'10 Feb'
			'11 Feb'
			'12 Feb'
		]
		xaxis:
			type: 'datetime'
		legend:
			offsetY: 7
		grid:
			padding:
				bottom: 20
		fill:
			type: 'gradient'
			gradient:
				shade: 'light'
				type: 'horizontal'
				shadeIntensity: .25
				gradientToColors: undefined
				inverseColors: !0
				opacityFrom: .75
				opacityTo: .75
				stops: [0, 0, 0]
		yaxis: [
				title:
					text: 'Number of Sales'
			,
				opposite: !0
				title:
					text: 'Number of Sales'
		]
	(chart = new ApexCharts(document.querySelector('#sales-analytics'), options)).render()
	$('#dash-daterange').flatpickr
		altInput: !0
		mode: 'range'
		altFormat: 'F j, y'
		defaultDate: 'today'

	return

setRadialChart = (percentage) ->
	colors = [ '#f1556c' ]
	(dataColors = $('#total-revenue').data('colors')) and (colors = dataColors.split(','))
	options =
		series: [ percentage.toFixed 2 ]
		chart:
			height: 220
			type: 'radialBar'
		plotOptions:
			radialBar:
				hollow:
					size: '65%'
		colors: colors
		labels: [ 'Revenue' ]

	(chart = new ApexCharts(document.querySelector('#total-revenue'), options)).render()


$(document).ready () ->
	# get sales
	$.ajax
		url: 'http://localhost:3000/dashboard/info'
		headers:
			token: do auth.getToken
		method: 'GET'
		success: (res) ->
			todayDate = new Date()
			date = new Date(res.data[0].date)
			todaySales = if todayDate.getDate == date.getDate then res.data[0].count else 0
			$('#today-sales').text(todaySales)
			setChart res.data
			return
		error: (err) ->
			console.log err
			return

	$.ajax
		url: 'http://localhost:3000/dashboard/salesTotal'
		headers:
			token: do auth.getToken
		method: 'GET'
		success: (res) ->
			$('#total-r').text("#{res.data[0].total} Dh")
			setRadialChart (res.data[0].total / 8500) * 100
			return
		error: (err) ->
			console.log err
			return

	$.ajax
		url: 'http://localhost:3000/order/status'
		headers:
			token: do auth.getToken
		method: 'GET'
		success: (res) ->
			$('#waiting-orders').text(res.data[0].count)
			return
		error: (err) ->
			console.log err
			return

	$('#datatable-history').DataTable
		ajax:
			url: 'http://localhost:3000/sales'
			method: 'GET'
			headers:
				token: do auth.getToken
		columns: [
				data: 'name'
			,
				data: 'quantity'
			,
				render: (data, type, row) ->
					return "#{row['quantity'] * row['price']} Dh"
			,
				render: (data, type, row) ->
					return row['date'].split('T')[0]
		]
		paging: false
		ordering: false
		info: false
		filter: false

	$('#datatable-orders').DataTable
		ajax:
			url: 'http://localhost:3000/orders'
			method: 'GET'
			headers:
				token: do auth.getToken
		columns: [
				data: 'name'
			,
				data: 'labo'
			,
				data: 'quantity'
			,
				render: (data, type, row) ->

					if row['status'] == 1
						return '<span class="badge bg-soft-warning text-warning">Waiting for ordering</span>'
					else if row['status'] == 2
						return '<span class="badge" style="color:#4d7cff;background:#1048ff40">Waiting for receiving</span>'
					else if row['status'] == 3
						return '<span class="badge bg-soft-success text-success">Received</span>'
		]
		paging: false
		ordering: false
		info: false
		filter: false
	return
