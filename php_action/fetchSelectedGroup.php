<?php 	

require_once 'core.php';

$groupId = $_POST['groupId'];

$sql = "SELECT state_id, state_name, state_active, state_status FROM state WHERE state_id = $groupId";
$result = $connect->query($sql);

if($result->num_rows > 0) { 
 $row = $result->fetch_array();
} // if num_rows

$connect->close();

echo json_encode($row);