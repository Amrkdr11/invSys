<?php 	

require_once 'core.php';

$sql = "SELECT stocks_id, stocks_date, emp_name, emp_contact, payment_status FROM stocks WHERE stock_status = 1";
$result = $connect->query($sql);



$output = array('data' => array());

if($result->num_rows > 0) { 
 
 $paymentStatus = ""; 
 $x = 1;

 while($row = $result->fetch_array()) {
 	$stockId = $row[0];

 	$countStockItemSql = "SELECT count(*) FROM stock_item WHERE stock_id = $stockId";
 	$itemCountResult = $connect->query($countStockItemSql);
 	$itemCountRow = $itemCountResult->fetch_row();


 	// active 
 	if($row[4] == 1) { 		
 		$paymentStatus = "<label class='label label-success'>Full Payment</label>";
 	} else if($row[4] == 2) { 		
 		$paymentStatus = "<label class='label label-info'>Advance Payment</label>";
 	} else { 		
 		$paymentStatus = "<label class='label label-warning'>No Payment</label>";
 	} // /else

 	$button = '<!-- Single button -->
	<div class="btn-group">
	  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    Action <span class="caret"></span>
	  </button>
	  <ul class="dropdown-menu">
	    <li><a href="stocks.php?s=editSto&i='.$stockId.'" id="editStockModalBtn"> <i class="glyphicon glyphicon-edit"></i> Edit</a></li>
	    
	    <li><a type="button" data-toggle="modal" id="paymentStockModalBtn" data-target="#paymentStockModal" onclick="paymentStock('.$stockId.')"> <i class="glyphicon glyphicon-save"></i> Payment</a></li>

	    <li><a type="button" onclick="printStock('.$stockId.')"> <i class="glyphicon glyphicon-print"></i> Print </a></li>
	    
	    <li><a type="button" data-toggle="modal" data-target="#removeStockModal" id="removeStockModalBtn" onclick="removeStock('.$stockId.')"> <i class="glyphicon glyphicon-trash"></i> Remove</a></li>       
	  </ul>
	</div>';		

 	$output['data'][] = array( 		
 		// image
 		$x,
 		// stock date
 		$row[1],
 		// client name
 		$row[2], 
 		// client contact
 		$row[3], 		 	
 		$itemCountRow, 		 	
 		$paymentStatus,
 		// button
 		$button 		
 		); 	
 	$x++;
 } // /while 

}// if num_rows

$connect->close();

echo json_encode($output);