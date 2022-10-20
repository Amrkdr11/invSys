<?php 	

require_once 'core.php';

$typeId = $_POST['typeId'];

$sql = "SELECT type_id, type_name, type_active, type_status FROM type WHERE type_id = $typeId";
$result = $connect->query($sql);

if($result->num_rows > 0) { 
 $row = $result->fetch_array();
} // if num_rows

$connect->close();

echo json_encode($row);