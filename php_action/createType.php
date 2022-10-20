<?php 	

require_once 'core.php';

$valid['success'] = array('success' => false, 'messages' => array());

if($_POST) {	

	$typeName = $_POST['typeName'];
  $typeStatus = $_POST['typeStatus']; 

	$sql = "INSERT INTO Type (type_name, type_active, type_status) 
	VALUES ('$typeName', '$typeStatus', 1)";

	if($connect->query($sql) === TRUE) {
	 	$valid['success'] = true;
		$valid['messages'] = "Successfully Added";	
	} else {
	 	$valid['success'] = false;
	 	$valid['messages'] = "Error while adding the members";
	}

	$connect->close();

	echo json_encode($valid);
 
} // /if $_POST