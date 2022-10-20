<?php 	

$localhost = "localhost:3305";
$username = "root";
$password = "";
$dbname = "invsystem";
$store_url = "http://192.168.1.132/InventorySystem/";
// db connection
$connect = new mysqli($localhost, $username, $password, $dbname);
// check connection
if($connect->connect_error) {
  die("Connection Failed : " . $connect->connect_error);
} else {
  // echo "Successfully connected";
}

?>