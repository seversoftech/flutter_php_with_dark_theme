<?php

require('config.php');

    $name = $_POST['name'];
	$phone = $_POST['phone'];
	$gender = $_POST['gender'];
	$city = $_POST['city'];
    $id = $_POST['id'];

	$insert = $conn->query("UPDATE rem_table SET name='$name',phone='$phone',gender='$gender',city='$city' WHERE id='$id',");
	if ($insert){
		echo "Success";
	}
	$conn->close();
	return;
