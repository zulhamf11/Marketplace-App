SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


-- Create Table Structure

-- Table structure for table `admin`

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Table structure for table `brands`

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Table structure for table `cart`

CREATE TABLE `cart` (
  `id` int(10) NOT NULL ,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Table structure for table `categories`

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL ,
  `cat_title` text NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;


-- Table structure for table `orders`

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL ,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;


-- Table structure for table `products`

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL ,
  `product_cat` int(11) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Table structure for table `user_info`

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL ,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Table structure for table `contact_us`

CREATE TABLE `contact_us`(
	`contact_id` int(10) NOT NULL ,
	`user_id` int(10) NOT NULL,
	`name` varchar(300) NOT NULL,
	`email` varchar(300) NOT NULL,
	`phone` varchar(15) NOT NULL,
	`address` varchar(100) NOT NULL,
	`message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Indexes 

-- Indexes for table `admin`

ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);


-- Indexes for table `brands`

ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);


-- Indexes for table `cart`

ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

-- Indexes for table `categories`

ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);


-- Indexes for table `orders`

ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`, `trx_id`);

-- Indexes for table `products`

ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);


-- Indexes for table `user_info`

ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);


-- Indexes for table `contact_us`

ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`contact_id`);



-- AUTO_INCREMENT for tables

-- AUTO_INCREMENT for table `admin`

ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for table `brands`

ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for table `cart`

ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for table `categories`

ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for table `orders`

ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for table `products`

ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for table `user_info`

ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for table `contact_us`

ALTER TABLE `contact_us`
  MODIFY `contact_id` int(10) NOT NULL AUTO_INCREMENT;


-- Indexes for Foreign Key

-- FK for table `products`

ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_cat` FOREIGN KEY (`product_cat`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`product_brand`) REFERENCES `categories` (`cat_id`);

-- FK for table `contact_us`

ALTER TABLE `contact_us`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

-- FK for table `orders`
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_order_user` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`),
  ADD CONSTRAINT `fk_order_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

-- FK for table `cart`
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_user` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`),
  ADD CONSTRAINT `fk_cart_product` FOREIGN KEY (`p_id`) REFERENCES `products` (`product_id`);






  
