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
				data: 'date'
		]
		language:
			paginate:
				previous: '<i class=\'mdi mdi-chevron-left\'>'
				next: '<i class=\'mdi mdi-chevron-right\'>'

$(document).ready () ->

	do getSales

	return
