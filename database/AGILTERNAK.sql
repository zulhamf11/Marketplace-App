-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2019 at 06:46 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


--- CREATE TABLE

-- Table structure for table `admin`

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL UNIQUE KEY,
  `password` varchar(255) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  CONSTRAINT `CHK_admin_id_positive` CHECK (`id` > 0)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;


-- Table structure for table `brands`

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL AUTO_INCREMENT,
  `brand_title` text NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `CHK_brand_id_positive` CHECK (`brand_id` > 0)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;


-- Table structure for table `cart`

CREATE TABLE `cart` (
  `id` int(10) NOT NULL  AUTO_INCREMENT,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `CHK_cart_id_positive` CHECK (`id` LIKE > 0)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;


-- Table structure for table `categories`

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL AUTO_INCREMENT,
  `cat_title` text NOT NULL,
  PRIMARY KEY (`cat_id`),
  CONSTRAINT `CHK_cat_id_positive` CHECK (`cat_id` LIKE > 0)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;


-- Table structure for table `orders`

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `CHK_ord_id_positive` CHECK (`order_id` > 0)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;


-- Table structure for table `products`

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL AUTO_INCREMENT,
  `product_cat` int(11) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL,
  PRIMARY KEY (`product_id`),
  CONSTRAINT `CHK_prod_id_positive` CHECK (`product_id` > 0),
  CONSTRAINT `fk_product_brand` FOREIGN KEY (`product_brand`) REFERENCES `brands` (`brand_id`),
  CONSTRAINT `fk_product_cat` FOREIGN KEY (`product_cat`) REFERENCES `categories` (`cat_id`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;


-- Table structure for table `user_info`

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL  AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `CHK_user_id_positive` CHECK (`user_id` > 0)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;


-- Table structure for table `contact_us`

CREATE TABLE `contact_us`(
	`contact_id` int(10) NOT NULL AUTO_INCREMENT,
	`user_id` int(10) NOT NULL,
	`name` varchar(300) NOT NULL,
	`email` varchar(300) NOT NULL,
	`phone` varchar(15) NOT NULL,
	`address` varchar(100) NOT NULL,
	`message` varchar(500) NOT NULL,
  PRIMARY KEY (`contact_id`),
	CONSTRAINT `CHK_cnt_id_positive` CHECK (`contact_id` > 0),
	CONSTRAINT `fk_user_id`FOREIGN KEY (`user_id`) REFERENCES `user_info`(`user_id`) 
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

