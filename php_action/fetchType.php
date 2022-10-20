<?php 	

require_once 'core.php';

$sql = "SELECT type_id, type_name, type_active, type_status FROM type WHERE type_status = 1";
$result = $connect->query($sql);

$output = array('data' => array());

if($result->num_rows > 0) { 

 // $row = $result->fetch_array();
 $activeTYPE = ""; 

 while($row = $result->fetch_array()) {
 	$typeId = $row[0];
 	// active 
 	if($row[2] == 1) {
 		// activate member
 		$activeType= "<label class='label label-success'>Available</label>";
 	} else {
 		// deactivate member
 		$activeType = "<label class='label label-danger'>Not Available</label>";
 	}

 	$button = '<!-- Single button -->
	<div class="btn-group">
	  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    Action <span class="caret"></span>
	  </button>
	  <ul class="dropdown-menu">
	    <li><a type="button" data-toggle="modal" id="editTypeModalBtn" data-target="#editTypeModal" onclick="editType('.$typeId.')"> <i class="glyphicon glyphicon-edit"></i> Edit</a></li>
	    <li><a type="button" data-toggle="modal" data-target="#removeTypeModal" id="removeTypeModalBtn" onclick="removeType('.$typeId.')"> <i class="glyphicon glyphicon-trash"></i> Remove</a></li>       
	  </ul>
	</div>';

 	$output['data'][] = array( 		
 		$row[1], 		
 		$activeType,
 		$button 		
 		); 	
 } // /while 

}// if num_rows

$connect->close();

echo json_encode($output);