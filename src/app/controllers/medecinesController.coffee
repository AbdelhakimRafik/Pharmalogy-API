
auth 	= require '../../utils/auth'

getMedicinesList = () ->
	# get data from server side
	$('#datatable-medecines').DataTable
		ajax:
			url: 'http://localhost:3000/pharma/medecines'
			headers:
				token: do auth.getToken
		rowId: 'id'
		columns: [
				data: 'name'
			,
				data: 'labo'
			,
				data: 'quantity'
			,
				data: 'price'
			,
				render: (data, type, row) ->
					return '<a class="action-icon" href=""><i class="mdi mdi-square-edit-outline" ></i></a><a class="action-icon" onclick="deleteMedicine('+row['id']+')"><i class="mdi mdi-delete"></i></a>'
		]
		language:
			paginate:
				previous: '<i class=\'mdi mdi-chevron-left\'>'
				next: '<i class=\'mdi mdi-chevron-right\'>'

deleteMedicine = (id) ->
	delete medicine
	$.ajax
		url: "http://localhost:3000/pharma/medecine/#{id}"
		headers:
			token: do auth.getToken
		type: 'delete'
		success: (res) ->
			console.log 'hihi', res
			# remove medicine row
			$("#datatable-medecines").find("##{id}").remove()
			return
	return

$(document).ready () ->

	# get medicines list from server
	do getMedicinesList

	return


	