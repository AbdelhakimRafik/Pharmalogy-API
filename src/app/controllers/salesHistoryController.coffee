auth 	= require '../../utils/auth'

getSales = () ->

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
		language:
			paginate:
				previous: '<i class=\'mdi mdi-chevron-left\'>'
				next: '<i class=\'mdi mdi-chevron-right\'>'

		ordering: false

$(document).ready () ->

	do getSales

	return
