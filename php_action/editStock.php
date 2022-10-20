<?php 	

require_once 'core.php';

$valid['success'] = array('success' => false, 'messages' => array());

if($_POST) {	
	$stockId = $_POST['stockId'];

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
				
	$sql = "UPDATE stocks SET stocks_date = '$stockDate', emp_name = '$empName', emp_contact = '$empContact', sub_total = '$subTotalValue', vat = '$vatValue', total_amount = '$totalAmountValue', discount = '$discount', grand_total = '$grandTotalValue', paid = '$paid', due = '$dueValue', payment_type = '$paymentType', payment_status = '$paymentStatus', stock_status = 1 ,user_id = '$userid',payment_place = '$paymentPlace' , gstn = '$gstn' WHERE stocks_id = {$stockId}";	
	$connect->query($sql);
	
	$readyToUpdateStockItem = false;
	// add the quantity from the stcck item to product table
	for($x = 0; $x < count($_POST['productName']); $x++) {		
		//  product table
		$updateProductQuantitySql = "SELECT product.quantity FROM product WHERE product.product_id = ".$_POST['productName'][$x]."";
		$updateProductQuantityData = $connect->query($updateProductQuantitySql);			
			
		while ($updateProductQuantityResult = $updateProductQuantityData->fetch_row()) {
			// stock item table add product quantity
			$stockItemTableSql = "SELECT stock_item.quantity FROM stock_item WHERE stock_item.stock_id = {$stockId}";
			$stockItemResult = $connect->query($stockItemTableSql);
			$stockItemData = $stockItemResult->fetch_row();

			$editQuantity = $updateProductQuantityResult[0] - $stockItemData[0];							

			$updateQuantitySql = "UPDATE product SET quantity = $editQuantity WHERE product_id = ".$_POST['productName'][$x]."";
			$connect->query($updateQuantitySql);		
		} // while	
		
		if(count($_POST['productName']) == count($_POST['productName'])) {
			$readyToUpdateStockItem = true;			
		}
	} // /for quantity

	// remove the stock item data from stock item table
	for($x = 0; $x < count($_POST['productName']); $x++) {			
		$removeStockSql = "DELETE FROM stock_item WHERE stock_id = {$stockId}";
		$connect->query($removeStockSql);	
	} // /for quantity

	if($readyToUpdateStockItem) {
			// insert the stock item data 
		for($x = 0; $x < count($_POST['productName']); $x++) {			
			$updateProductQuantitySql = "SELECT product.quantity FROM product WHERE product.product_id = ".$_POST['productName'][$x]."";
			$updateProductQuantityData = $connect->query($updateProductQuantitySql);
			
			while ($updateProductQuantityResult = $updateProductQuantityData->fetch_row()) {
				$updateQuantity[$x] = $updateProductQuantityResult[0] - $_POST['quantity'][$x];							
					// update product table
					$updateProductTable = "UPDATE product SET quantity = '".$updateQuantity[$x]."' WHERE product_id = ".$_POST['productName'][$x]."";
					$connect->query($updateProductTable);

					// add into stock_item
				$stockItemSql = "INSERT INTO stock_item (stock_id, product_id, quantity, rate, total, stock_item_status) 
				VALUES ({$stockId}, '".$_POST['productName'][$x]."', '".$_POST['quantity'][$x]."', '".$_POST['rateValue'][$x]."', '".$_POST['totalValue'][$x]."', 1)";

				$connect->query($stockItemSql);		
			} // while	
		} // /for quantity
	}

	

	$valid['success'] = true;
	$valid['messages'] = "Successfully Updated";		
	
	$connect->close();

	echo json_encode($valid);
 
} // /if $_POST
// echo json_encode($valid);