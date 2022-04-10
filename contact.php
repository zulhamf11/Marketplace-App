<?php
session_start();
include "db.php";
if (isset($_POST["submit"])) {

	$names = $_POST["names"];
	$email = $_POST['email'];
	$phone = $_POST['phone'];
	$address = $_POST['address'];
    $message = $_POST['message'];
	$name = "/^[a-zA-Z ]+$/";
	$emailValidation = "/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9]+(\.[a-z]{2,4})$/";
	$number = "/^[0-9]+$/";

if(empty($names) || empty($email) || empty($phone) || empty($address)){
		
		echo "
			<div class='alert alert-warning'>
				<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><b>PLease Fill all fields..!</b>
			</div>
		";
		exit();
	} else {
		if(!preg_match($name,$names)){
		echo "
			<div class='alert alert-warning'>
				<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
				<b>this $names is not valid..!</b>
			</div>
		";
		exit();
	}

	if(!preg_match($emailValidation,$email)){
		echo "
			<div class='alert alert-warning'>
				<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
				<b>this $email is not valid..!</b>
			</div>
		";
		exit();
	}

	if(!preg_match($number,$phone)){
		echo "
			<div class='alert alert-warning'>
				<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
				<b>Mobile number $phone is not valid</b>
			</div>
		";
		exit();
	}
	if(!(strlen($phone) == 12)){
		echo "
			<div class='alert alert-warning'>
				<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
				<b>Mobile number must be 12 digit</b>
			</div>
		";
		exit();
	}
	//existing email address in our database
	$sql = "SELECT user_id FROM contact_us WHERE email = '$email' LIMIT 1" ;
	$check_query = mysqli_query($con,$sql);
	$count_email = mysqli_num_rows($check_query);
	if($count_email > 0){
		echo "
			<div class='alert alert-danger'>
				<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
				<b>Email Address is already available Try Another email address</b>
			</div>
		";
		exit();
	} else {
		$sql = "INSERT INTO `contact_us` (`user_id`, 'names', `email`, `phone`, `address`, 'message') 
		VALUES (NULL, '$names', '$email','$phone', '$address', '$message')";
		$run_query = mysqli_query($con,$sql);
		$_SESSION["uid"] = mysqli_insert_id($con);
		$_SESSION["submit"] = $submit;
		$ip_add = getenv("REMOTE_ADDR");
        header('location: contact_us.php');
        exit();
	}

	}
  
	
}



?>
