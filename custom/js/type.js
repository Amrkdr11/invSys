var manageTypeTable;

$(document).ready(function() {
	// active top navbar categories
	$('#navType').addClass('active');	

	manageTypeTable = $('#manageTypeTable').DataTable({
		'ajax' : 'php_action/fetchType.php',
		'order': []
	}); // manage Type Data Table

	// on click on submit Type form modal
	$('#addTypesModalBtn').unbind('click').bind('click', function() {
		// reset the form text
		$("#submitTypeForm")[0].reset();
		// remove the error text
		$(".text-danger").remove();
		// remove the form error
		$('.form-group').removeClass('has-error').removeClass('has-success');

		// submit type form function
		$("#submitTypeForm").unbind('submit').bind('submit', function() {

			var TypeName = $("#typeName").val();
			var TypeStatus = $("#typeStatus").val();

			if(typeName == "") {
				$("#typeName").after('<p class="text-danger">Brand Name field is required</p>');
				$('#typeName').closest('.form-group').addClass('has-error');
			} else {
				// remov error text field
				$("#typeName").find('.text-danger').remove();
				// success out for form 
				$("#typeName").closest('.form-group').addClass('has-success');	  	
			}

			if(typeStatus == "") {
				$("#typeStatus").after('<p class="text-danger">Brand Name field is required</p>');
				$('#typeStatus').closest('.form-group').addClass('has-error');
			} else {
				// remov error text field
				$("#typeStatus").find('.text-danger').remove();
				// success out for form 
				$("#typeStatus").closest('.form-group').addClass('has-success');	  	
			}

			if(typeName && typeStatus) {
				var form = $(this);
				// button loading
				$("#createTypeBtn").button('loading');

				$.ajax({
					url : form.attr('action'),
					type: form.attr('method'),
					data: form.serialize(),
					dataType: 'json',
					success:function(response) {
						// button loading
						$("#createTypeBtn").button('reset');

						if(response.success == true) {
							// reload the manage member table 
							manageTypeTable.ajax.reload(null, false);						

	  	  			// reset the form text
							$("#submitTypeForm")[0].reset();
							// remove the error text
							$(".text-danger").remove();
							// remove the form error
							$('.form-group').removeClass('has-error').removeClass('has-success');
	  	  			
	  	  			$('#add-type-messages').html('<div class="alert alert-success">'+
	            '<button type="button" class="close" data-dismiss="alert">&times;</button>'+
	            '<strong><i class="glyphicon glyphicon-ok-sign"></i></strong> '+ response.messages +
		          '</div>');

	  	  			$(".alert-success").delay(500).show(10, function() {
								$(this).delay(3000).hide(10, function() {
									$(this).remove();
								});
							}); // /.alert
						}  // if

					} // /success
				}); // /ajax	
			} // if

			return false;
		}); // submit type form function
	}); // /on click on submit type form modal	

}); // /document

// edit type function
function editType(typeId = null) {
	if(typeId) {
		// remove the added type id 
		$('#editTypeId').remove();
		// reset the form text
		$("#editTypeForm")[0].reset();
		// reset the form text-error
		$(".text-danger").remove();
		// reset the form group errro		
		$('.form-group').removeClass('has-error').removeClass('has-success');

		// edit type messages
		$("#edit-type-messages").html("");
		// modal spinner
		$('.modal-loading').removeClass('div-hide');
		// modal result
		$('.edit-type-result').addClass('div-hide');
		//modal footer
		$(".editTypeFooter").addClass('div-hide');		

		$.ajax({
			url: 'php_action/fetchSelectedType.php',
			type: 'post',
			data: {typeId: typeId},
			dataType: 'json',
			success:function(response) {

				// modal spinner
				$('.modal-loading').addClass('div-hide');
				// modal result
				$('.edit-type-result').removeClass('div-hide');
				//modal footer
				$(".editTypeFooter").removeClass('div-hide');	

				// set the type name
				$("#editTypeName").val(response.type_name);
				// set the type status
				$("#editTypeStatus").val(response.type_active);
				// add the type id 
				$(".editTypeFooter").after('<input type="hidden" name="editTypeId" id="editTypeId" value="'+response.type_id+'" />');


				// submit of edit type form
				$("#editTypeForm").unbind('submit').bind('submit', function() {
					var typeName = $("#editTypeName").val();
					var typeStatus = $("#editTypeStatus").val();

					if(typeName == "") {
						$("#editTypeName").after('<p class="text-danger">Brand Name field is required</p>');
						$('#editTypeName').closest('.form-group').addClass('has-error');
					} else {
						// remov error text field
						$("#editTypeName").find('.text-danger').remove();
						// success out for form 
						$("#editTypeName").closest('.form-group').addClass('has-success');	  	
					}

					if(typeStatus == "") {
						$("#editTypeStatus").after('<p class="text-danger">Brand Name field is required</p>');
						$('#editTypeStatus').closest('.form-group').addClass('has-error');
					} else {
						// remov error text field
						$("#editTypeStatus").find('.text-danger').remove();
						// success out for form 
						$("#editTypeStatus").closest('.form-group').addClass('has-success');	  	
					}

					if(typeName && typeStatus) {
						var form = $(this);
						// button loading
						$("#editTypeBtn").button('loading');

						$.ajax({
							url : form.attr('action'),
							type: form.attr('method'),
							data: form.serialize(),
							dataType: 'json',
							success:function(response) {
								// button loading
								$("#editTypeBtn").button('reset');

								if(response.success == true) {
									// reload the manage member table 
									manageTypeTable.ajax.reload(null, false);									  	  			
									
									// remove the error text
									$(".text-danger").remove();
									// remove the form error
									$('.form-group').removeClass('has-error').removeClass('has-success');
			  	  			
			  	  			$('#edit-type-messages').html('<div class="alert alert-success">'+
			            '<button type="button" class="close" data-dismiss="alert">&times;</button>'+
			            '<strong><i class="glyphicon glyphicon-ok-sign"></i></strong> '+ response.messages +
				          '</div>');

			  	  			$(".alert-success").delay(500).show(10, function() {
										$(this).delay(3000).hide(10, function() {
											$(this).remove();
										});
									}); // /.alert
								}  // if

							} // /success
						}); // /ajax	
					} // if


					return false;
				}); // /submit of edit type form

			} // /success
		}); // /fetch the selected type data

	} else {
		alert('Oops!! Refresh the page');
	}
} // /edit type function

// remove type function
function removeType(typeId = null) {
		
	$.ajax({
		url: 'php_action/fetchSelectedType.php',
		type: 'post',
		data: {typeId: typeId},
		dataType: 'json',
		success:function(response) {			

			// remove type btn clicked to remove the type function
			$("#removeTypeBtn").unbind('click').bind('click', function() {
				// remove categories btn
				$("#removeTypeBtn").button('loading');

				$.ajax({
					url: 'php_action/removeType.php',
					type: 'post',
					data: {typeId: typeId},
					dataType: 'json',
					success:function(response) {
						if(response.success == true) {
 							// remove type btn
							$("#removeTypeBtn").button('reset');
							// close the modal 
							$("#removeTypeModal").modal('hide');
							// update the manage type table
							manageTypeTable.ajax.reload(null, false);
							// udpate the messages
							$('.remove-messages').html('<div class="alert alert-success">'+
	            '<button type="button" class="close" data-dismiss="alert">&times;</button>'+
	            '<strong><i class="glyphicon glyphicon-ok-sign"></i></strong> '+ response.messages +
		          '</div>');

	  	  			$(".alert-success").delay(500).show(10, function() {
								$(this).delay(3000).hide(10, function() {
									$(this).remove();
								});
							}); // /.alert
 						} else {
 							// close the modal 
							$("#removeTypeModal").modal('hide');

 							// udpate the messages
							$('.remove-messages').html('<div class="alert alert-success">'+
	            '<button type="button" class="close" data-dismiss="alert">&times;</button>'+
	            '<strong><i class="glyphicon glyphicon-ok-sign"></i></strong> '+ response.messages +
		          '</div>');

	  	  			$(".alert-success").delay(500).show(10, function() {
								$(this).delay(3000).hide(10, function() {
									$(this).remove();
								});
							}); // /.alert
 						} // /else
						
						
					} // /success function
				}); // /ajax function request server to remove the categories data
			}); // /remove categories btn clicked to remove the categories function

		} // /response
	}); // /ajax function to fetch the categories data
} // remove categories function