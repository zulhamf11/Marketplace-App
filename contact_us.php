<?php
    session_start();
 ?>

<html>

    <head>
		<meta charset="UTF-8">
		<title>Hofladen</title>
		<link rel = "icon" href = "product_images/logo.png">
		<link rel="stylesheet" href="css/contact.css"/>
        <link rel="stylesheet" href="css/bootstraps.css"/>
		<script src="js/jquery2.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="mains.js"></script>
		<link rel="stylesheet" type="text/css" href="style.css">
		<style></style>
	</head>

    <h4 style="margin-left: 50px; ">Contact Us</h4>

    
    <div class="contact_container">
  
   
    <form id="contact_form" action="contact.php" method="POST">

    <label for="names">First Name</label>
    <input type="text" id="names" name="names" placeholder="Your name..">

    <label for="email">Email</label>
    <input type="text" id="email" name="email" placeholder="Your email..">

    <label for="phone">Phone</label>
    <input type="text" id="phone" name="phone" placeholder="Your phone number..">

    <label for="address">Address</label>
    <input type="text" id="address" name="address" placeholder="Your address..">

    <label for="message">Message</label>
    <textarea id="message" name="message" placeholder="Write something.." style="height:200px"></textarea>

    <input type="submit" value="Submit" name="submit">

  </form>
</div>


</html>
