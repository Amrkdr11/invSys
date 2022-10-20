<?php 	

require_once 'core.php';

$sql = "SELECT state_id, state_name, state_active, state_status FROM state WHERE state_status = 1";
$result = $connect->query($sql);

$output = array('data' => array());

if($result->num_rows > 0) { 

 // $row = $result->fetch_array();
 $activeGroups = ""; 

 while($row = $result->fetch_array()) {
 	$groupId = $row[0];
 	// active 
 	if($row[2] == 1) {
 		// activate member
 		$activeGroups = "<label class='label label-success'>Available</label>";
 	} else {
 		// deactivate member
 		$activeGroups = "<label class='label label-danger'>Not Available</label>";
 	}

 	$button = '<!-- Single button -->
	<div class="btn-group">
	  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    Action <span class="caret"></span>
	  </button>
	  <ul class="dropdown-menu">
	    <li><a type="button" data-toggle="modal" data-target="#editGroupModel" onclick="editGroups('.$groupId.')"> <i class="glyphicon glyphicon-edit"></i> Edit</a></li>
	    <li><a type="button" data-toggle="modal" data-target="#removeMemberModal" onclick="removeGroups('.$groupId.')"> <i class="glyphicon glyphicon-trash"></i> Remove</a></li>       
	  </ul>
	</div>';

 	$output['data'][] = array( 		
 		$row[1], 		
 		$activeGroups,
 		$button
 		); 	
 } // /while 

} // if num_rows

$connect->close();

echo json_encode($output);