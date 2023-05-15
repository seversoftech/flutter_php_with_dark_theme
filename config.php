<?php
$servername="localhost";
$username="root";
$password="";
$dbname="rem";

$conn=new mysqli($servername,$username,$password,$dbname);

if($conn->connect_error){
	// Connection Error;
	die("Connection Failed".$conn->connect_error);
	return;
}else{
	// echo('Connected!');
}
?>
