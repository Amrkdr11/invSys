<?php 	
//ALTER TABLE `orders` ADD `payment_place` INT NOT NULL AFTER `payment_status`;
//TER TABLE `orders` ADD `gstn` VARCHAR(255) NOT NULL AFTER `payment_place`;
require_once 'core.php';

$valid['success'] = array('success' => false, 'messages' => array(), 'stock_id' => '');
// print_r($valid);
if($_POST) {	

	$stockDate 						= date('Y-m-d', strtotime($_POST['stockDate']));	
  $empName 					= $_POST['empName'];
  $empContact 				= $_POST['empContact'];
  $subTotalValue 				= $_POST['subTotalValue'];
  $vatValue 						=	$_POST['vatValue'];
  $totalAmountValue     = $_POST['totalAmountValue'];
  $discount 						= $_POST['discount'];
  $grandTotalValue 			= $_POST['grandTotalValue'];
  $paid 								= $_POST['paid'];
  $dueValue 						= $_POST['dueValue'];
  $paymentType 					= $_POST['paymentType'];
  $paymentStatus 				= $_POST['paymentStatus'];
  $paymentPlace 				= $_POST['paymentPlace'];
  $gstn 				= $_POST['gstn'];
  $userid 				= $_SESSION['userId'];

				
	$sql = "INSERT INTO stocks (stocks_date, emp_name, emp_contact, sub_total, vat, total_amount, discount, grand_total, paid, due, payment_type, payment_status,payment_place, gstn,stock_status,user_id) VALUES ('$stockDate', '$empName', '$empContact', '$subTotalValue', '$vatValue', '$totalAmountValue', '$discount', '$grandTotalValue', '$paid', '$dueValue', $paymentType, $paymentStatus,$paymentPlace,$gstn, 1,$userid)";
	
	$stock_id;
	$stockStatus = false;
	if($connect->query($sql) === true) {
		$stock_id = $connect->insert_id;
		$valid['stock_id'] = $stock_id;	

		$stockStatus = true;
	}

		
	// echo $_POST['productName'];
	$stockItemStatus = false;

	for($x = 0; $x < count($_POST['productName']); $x++) {			
		$updateProductQuantitySql = "SELECT product.quantity FROM product WHERE product.product_id = ".$_POST['productName'][$x]."";
		$updateProductQuantityData = $connect->query($updateProductQuantitySql);
		
		
		while ($updateProductQuantityResult = $updateProductQuantityData->fetch_row()) {
			$updateQuantity[$x] = $updateProductQuantityResult[0] + $_POST['quantity'][$x];							
				// update product table
				$updateProductTable = "UPDATE product SET quantity = '".$updateQuantity[$x]."' WHERE product_id = ".$_POST['productName'][$x]."";
				$connect->query($updateProductTable);

				// add into stock_item
				$stockItemSql = "INSERT INTO stock_item (stock_id, product_id, quantity, rate, total, stock_item_status) 
				VALUES ('$stock_id', '".$_POST['productName'][$x]."', '".$_POST['quantity'][$x]."', '".$_POST['rateValue'][$x]."', '".$_POST['totalValue'][$x]."', 1)";

				$connect->query($stockItemSql);		

				if($x == count($_POST['productName'])) {
					$stockItemStatus = true;
				}		
		} // while	
	} // /for quantity

	$valid['success'] = true;
	$valid['messages'] = "Successfully Added";		
	
	$connect->close();

	echo json_encode($valid);
 
} // /if $_POST
// echo json_encode($valid);