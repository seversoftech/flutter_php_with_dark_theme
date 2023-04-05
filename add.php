<?php

	require('config.php');

	 // $name=$phone=$gender=$city='';

	$name = $_POST['name'];
	$phone = $_POST['phone'];
	$gender = $_POST['gender'];
	$city = $_POST['city'];

	$insert = $conn->query("INSERT INTO rem_table(name,phone,gender,city)VALUES('$name','$phone','$gender','$city')");
	if ($insert){
		echo "Success";
	}
	$conn->close();
	return;
