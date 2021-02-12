auth 	= require '../../utils/auth'

$(document).ready () ->
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
						return '<span class="badge bg-soft-success text-success">Waiting for receiving</span>'
					else if row['status'] == 3
						return '<span class="badge bg-soft-warning text-warning">Received</span>'
			,
				render: (data, type, row) ->
					return '<select class="form-control select-action" data-id="'+row['id']+'"><option>Select action</option><option value="2">Ordered</option><option value="3">Received</option></select>'
		]
		language:
			paginate:
				previous: '<i class=\'mdi mdi-chevron-left\'>'
				next: '<i class=\'mdi mdi-chevron-right\'>'

		drawCallback: () ->
			$('.select-action').change (e) ->
				order = $(e.currentTarget).data('id')
				status = $(e.currentTarget).val()

				$.ajax
					url: 'http://localhost:3000/order/status'
					method: 'POST'
					headers:
						token: do auth.getToken
					data:
						id: order
						status: status
					success: (res) ->
						console.log res
					error: (err) ->
						console.log err
