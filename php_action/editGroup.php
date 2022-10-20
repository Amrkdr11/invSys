<?php 	

require_once 'core.php';

$valid['success'] = array('success' => false, 'messages' => array());

if($_POST) {	

	$groupName = $_POST['editGroupName'];
  $groupStatus = $_POST['editGroupStatus']; 
  $groupId = $_POST['groupId'];

	$sql = "UPDATE state SET state_name = '$groupName', state_active = '$groupStatus' WHERE state_id = '$groupId'";

	if($connect->query($sql) === TRUE) {
	 	$valid['success'] = true;
		$valid['messages'] = "Successfully Updated";	
	} else {
	 	$valid['success'] = false;
	 	$valid['messages'] = "Error while adding the members";
	}
	 
	$connect->close();

	echo json_encode($valid);
 
} // /if $_POST