<?php 
require'config.php';

$result=$conn->query("SELECT * FROM rem_table ORDER BY id");
$data=array();
while($row=$result->fetch_assoc()){
	$data[]=$row;
}
echo json_encode($data);
$conn->close();
	return;

?>