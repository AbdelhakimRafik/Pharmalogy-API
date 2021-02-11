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
			'01 Feb 2021'
			'02 Feb 2021'
			'03 Feb 2021'
			'04 Feb 2021'
			'05 Feb 2021'
			'06 Feb 2021'
			'07 Feb 2021'
			'08 Feb 2021'
			'09 Feb 2021'
			'10 Feb 2021'
			'11 Feb 2021'
			'12 Feb 2021'
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


$(document).ready () ->
	# get sales
	$.ajax
		url: 'http://localhost:3000/dashboard/info'
		headers:
			token: do auth.getToken
		method: 'GET'
		success: (res) ->
			console.log res
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

	return
