<?php 	

require_once 'core.php';

$stockId = $_POST['stockId'];

$valid = array('stock' => array(), 'stock_item' => array());

$sql = "SELECT stocks.stocks_id, stocks.stocks_date, stocks.client_name, stocks.client_contact, stocks.sub_total, stocks.vat, stocks.total_amount, stocks.discount, stocks.grand_total, stocks.paid, stocks.due, stocks.payment_type, stocks.payment_status FROM stocks 	
	WHERE stocks.stocks_id = {$orderId}";

$result = $connect->query($sql);
$data = $result->fetch_row();
$valid['stock'] = $data;


$connect->close();

echo json_encode($valid);