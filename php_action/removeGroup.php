<?php 	

require_once 'core.php';


$valid['success'] = array('success' => false, 'messages' => array());

$groupId = $_POST['groupId'];

if($groupId) { 

 $sql = "UPDATE state SET state_status = 2 WHERE state_id = {$stateId}";

 if($connect->query($sql) === TRUE) {
 	$valid['success'] = true;
	$valid['messages'] = "Successfully Removed";		
 } else {
 	$valid['success'] = false;
 	$valid['messages'] = "Error while remove the group";
 }
 
 $connect->close();

 echo json_encode($valid);
 
} // /if $_POST