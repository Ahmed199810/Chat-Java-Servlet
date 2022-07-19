-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2022 at 10:49 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `msg` text NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `session` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `from_id`, `to_id`, `msg`, `date_time`, `session`) VALUES
(3401, 1, 2, 'dasdas', '2022-02-15 19:35:58', 228495),
(3402, 2, 1, 'vvvvvvv', '2022-02-15 19:36:40', 228495),
(3403, 3, 4, 'rrrrrrrrr', '2022-02-15 19:37:13', 220947),
(3404, 2, 1, 'vfvfvfvfvfvfv', '2022-02-15 21:58:37', 228495),
(3405, 1, 2, 'vvvvvvvvvvvv', '2022-02-15 21:58:42', 228495),
(3406, 1, 3, 'swwsws', '2022-02-16 00:04:01', 946097),
(3407, 1, 2, 'vgggvvg', '2022-02-16 02:26:40', 228495),
(3408, 2, 1, 'cdddccddccd', '2022-02-16 02:30:25', 228495),
(3409, 1, 2, 'egrneeeeg', '2022-02-16 02:44:02', 228495),
(3410, 1, 2, 'sfddfsfsdss', '2022-02-16 03:02:55', 228495),
(3411, 2, 1, 'vddv', '2022-02-16 03:03:03', 228495),
(3412, 1, 2, 'dsdsdsd', '2022-02-16 03:08:12', 228495),
(3413, 1, 2, 'xaasassax', '2022-02-16 03:08:21', 228495),
(3414, 2, 1, 'cd', '2022-02-16 03:08:34', 228495),
(3415, 1, 2, 'dsdsda', '2022-02-16 03:11:45', 228495),
(3416, 1, 2, 'dasdsad', '2022-02-16 03:12:27', 228495),
(3417, 1, 2, 'dasdsad', '2022-02-16 03:13:28', 228495),
(3418, 1, 2, '546456', '2022-02-16 03:13:32', 228495),
(3419, 2, 1, 'fdsfsdfdsfsdf43353254', '2022-02-16 03:13:42', 228495),
(3420, 1, 2, 'nhg678', '2022-02-16 03:13:50', 228495),
(3421, 2, 1, 'ert', '2022-02-16 03:23:45', 228495),
(3422, 1, 2, 'grdf', '2022-02-16 03:25:55', 228495),
(3423, 1, 2, 'nghnghnhgn', '2022-02-16 03:58:08', 228495),
(3424, 2, 1, 'gggggggggg', '2022-02-16 03:58:24', 228495),
(3425, 1, 2, '123', '2022-02-16 04:08:14', 228495),
(3426, 1, 2, '654321', '2022-02-16 04:08:46', 228495),
(3427, 1, 4, 'السلام عليكم', '2022-02-16 14:15:33', 186638),
(3428, 1, 2, 'dsdsdsd', '2022-02-16 14:47:44', 228495),
(3429, 1, 2, 'vvcvvvvvvv', '2022-02-16 14:47:47', 228495),
(3430, 1, 4, 'dasdasd', '2022-02-16 15:03:00', 186638),
(3431, 1, 4, 'يبسيشبشسبسيب', '2022-02-16 15:03:04', 186638),
(3432, 1, 2, 'asdasdasdssss', '2022-06-28 17:35:22', 228495),
(3433, 1, 2, 'سيبسيبسيبسي', '2022-06-28 17:35:28', 228495),
(3434, 1, 2, 'ربيليبليبليبليبل', '2022-06-28 17:35:34', 228495);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `session` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `from_id`, `to_id`, `session`) VALUES
(1, 3, 1, 946097),
(2, 2, 4, 832009),
(3, 2, 1, 228495),
(4, 3, 4, 220947),
(5, 1, 4, 186638),
(6, 1, 6, 953709),
(7, 1, 7, 967058);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `img` text DEFAULT NULL,
  `type` int(1) NOT NULL DEFAULT 1,
  `state` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user`, `full_name`, `email`, `password`, `img`, `type`, `state`) VALUES
(1, 'admin', 'Ahmed Mostafa', 'admin@admin.com', '12345', 'C:\\xampp\\tomcat\\bin_DT_1648222422992logo-white.png', 0, 1),
(2, 'tamer', 'Tamer Sayed', 'tamer@gmail.com', '12345', 'https://cdn.thetealmango.com/wp-content/uploads/2021/06/Joe-Biden-1.jpg', 1, 1),
(3, 'Timor', 'Timor Osama', 'timor@gmail.com', '12345', 'http://funlava.com/wp-content/uploads/2013/05/obama_660x.jpg', 1, 1),
(4, 'Gamal', 'Gamal Mohamed', 'gamal@gmail.com', '12345', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFvtjH7Qlhs6GVcutgn7cRvTxq-zHtUxdPhhmj45eprsXn3Om4KGWBCFIyF4Y0qCUnL-8&usqp=CAU', 1, 1),
(6, 'ahmed', 'Donald Trumb', '1600194@eng.asu.edu.eg', '12345', 'https://www.newidea.com.au/media/104673/untitled-design-16.jpg?width=720&center=0.0,0.0', 1, 1),
(7, 'desel', 'Van Desel', 'ahmed.a199810@gmail.com', '12345', 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dwayne-johnson-attends-the-premiere-of-universal-pictures-news-photo-1161880409-1566504158.jpg?crop=0.762xw:0.654xh;0.0698xw,0.0141xh&resize=480:*', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3435;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
