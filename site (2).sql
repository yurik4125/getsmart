-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2019 at 06:24 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `site`
--

-- --------------------------------------------------------

--
-- Table structure for table `cont`
--

CREATE TABLE `cont` (
  `id` int(15) UNSIGNED NOT NULL,
  `title` varchar(1000) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `text` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cont`
--

INSERT INTO `cont` (`id`, `title`, `image`, `text`) VALUES
(1, 'Lviv', 'img/Lviv.png', 'Text1'),
(2, 'Lviv', 'img/Lviv2.png', 'text2'),
(4, 'Boruslav', 'img/2tur.jpg', 'Boruslav'),
(5, 'Lviv2', 'img/1tur.jpg', 'lviv image2'),
(6, 'Boruslav', 'img/2tur.jpg', 'text3');

-- --------------------------------------------------------

--
-- Table structure for table `navmenu`
--

CREATE TABLE `navmenu` (
  `navMenuId` int(10) UNSIGNED NOT NULL,
  `pageId` int(10) UNSIGNED NOT NULL,
  `label` varchar(32) NOT NULL,
  `menuOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `navmenu`
--

INSERT INTO `navmenu` (`navMenuId`, `pageId`, `label`, `menuOrder`) VALUES
(1, 2, 'About Us', 0),
(2, 3, 'Our Products', 1),
(4, 4, 'Create Account', 0),
(5, 5, 'Login', 0);

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `pageId` int(10) UNSIGNED NOT NULL,
  `pageKey` varchar(15) NOT NULL,
  `title` varchar(32) NOT NULL,
  `content` text NOT NULL,
  `filename` varchar(32) NOT NULL,
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`pageId`, `pageKey`, `title`, `content`, `filename`, `dateModified`) VALUES
(1, 'home', 'Home', '<p>Welcome home</p>', 'home.php', '2019-03-22 20:45:20'),
(2, 'about', 'About Us', '', 'about.php', '2019-03-22 18:47:25'),
(3, 'products', 'Products', '<a href=\"https://www.google.com\">Google</a>', 'products.php', '2019-03-22 18:47:25'),
(4, 'create_account', 'Create Account', '', 'create_account.php', '2019-03-26 13:38:53'),
(5, 'login', 'Login', 'Enter your username/password', 'login.php', '2019-03-26 13:38:53'),
(6, 'olga', 'olha romanivna', '', '', '2019-03-27 14:32:34'),
(7, 'olga', 'olha romanivna', '', '', '2019-03-27 14:32:46');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(10) UNSIGNED NOT NULL,
  `username` varchar(32) NOT NULL,
  `passHash` varchar(60) NOT NULL,
  `cookieHash` varchar(60) NOT NULL,
  `deteModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `username`, `passHash`, `cookieHash`, `deteModified`) VALUES
(1, 'Bob', '$2y$10$MbDSj8h3pL8NCPHP/xa2LOo/jiCh1XHhGGJHXGpBcpfP7x3diYqZC', '$2y$10$e1YKfIAIL0E6YZ9ZccNxPes7J7JgyTjM3PFfLgklKGa.7Ke3hmCgW', '2019-03-26 14:48:31'),
(2, 'Maria', '$2y$10$4jTyZtYzKlL3YDWSiRvnr.iryByCNZuX3JpEueMoqMfTSUHWTlAVO', '', '2019-03-26 14:48:46'),
(3, 'Bob123', '$2y$10$ttgZPqXxmBAqeCDh03uXb.uUy8c6Y6y2gPAr23llQrf8QUl5jAdWq', '', '2019-03-26 14:56:18'),
(4, '1696016', '$2y$10$CPAcWM6r6SQESK6EQyaUPuWGmh9tMkNRvikiq8Zm7kj5TVLaH2kne', '', '2019-03-26 15:03:05'),
(5, '123', '$2y$10$EI2GE4gKOAAXsB5HM8JWZup/sClIBz1/CJhPfw3.cDn1S9SLOdV5y', '$2y$10$b4ZTAe5BhiDxJVEMLMJUF.2/xqeXr/APqDObnwhAh.ewTBKfuS9I.', '2019-03-26 16:16:10'),
(6, 'Mila', '$2y$10$ZhPFTeVMyvtrCs2bTVf2c.0aPW1OdRP5x8qtUueMpBHdJqwnJ5UxS', '$2y$10$zsDDoe.a.UO58fyMdomtf.FlzUdbtN05uT4vviOvbyzHjKAXo6jvG', '2019-03-29 15:48:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cont`
--
ALTER TABLE `cont`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `navmenu`
--
ALTER TABLE `navmenu`
  ADD PRIMARY KEY (`navMenuId`),
  ADD KEY `pageId` (`pageId`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`pageId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cont`
--
ALTER TABLE `cont`
  MODIFY `id` int(15) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `navmenu`
--
ALTER TABLE `navmenu`
  MODIFY `navMenuId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `pageId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `navmenu`
--
ALTER TABLE `navmenu`
  ADD CONSTRAINT `navmenu_ibfk_1` FOREIGN KEY (`pageId`) REFERENCES `page` (`pageId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
