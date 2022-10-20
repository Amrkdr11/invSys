<?php 	

require_once 'core.php';

$valid['success'] = array('success' => false, 'messages' => array());

if($_POST) {	

	$brandName = $_POST['editTypeName'];
  $brandStatus = $_POST['editTypeStatus']; 
  $typeId = $_POST['editTypeId'];

	$sql = "UPDATE type SET type_name = '$brandName', type_active = '$brandStatus' WHERE type_id = '$typeId'";

	if($connect->query($sql) === TRUE) {
	 	$valid['success'] = true;
		$valid['messages'] = "Successfully Updated";	
	} else {
	 	$valid['success'] = false;
	 	$valid['messages'] = "Error while updating the type";
	}
	 
	$connect->close();

	echo json_encode($valid);
 
} // /if $_POST