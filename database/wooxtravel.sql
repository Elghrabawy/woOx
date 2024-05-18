-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2024 at 12:17 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wooxtravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `num_of_guests` int(10) NOT NULL,
  `checkin_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `destination` varchar(200) NOT NULL,
  `status` varchar(10) NOT NULL,
  `city_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `name`, `phone_number`, `num_of_guests`, `checkin_date`, `destination`, `status`, `city_id`, `user_id`, `created_at`) VALUES
(1, 'Ibrahim Elghrbawy', '01096613552', 4, '2024-05-16 13:51:43', 'Berlin', 'Pending', 3, 1, '2024-05-15 13:53:15'),
(2, 'Ahmed Elghrbawy', '01061930382', 3, '2024-05-15 13:53:15', 'Berlin', 'Pending', 3, 2, '2024-05-15 13:53:15'),
(3, 'Khaled Mousa', '01102355241', 12, '2024-05-15 21:22:06', 'Alex', 'pending', 2, 2, '2024-05-15 21:22:06'),
(4, '3bood 3al7dod', '010101010101', 123, '2021-05-15 21:30:26', 'quala', 'pending', 1, 1, '2024-05-15 21:30:26'),
(5, 'mahmoud', '01010101', 2, '2024-05-16 17:46:52', 'masr', 'pending', 2, 1, '2024-05-16 17:46:52'),
(6, 'ahmed', '1010101', 4, '2024-05-16 18:12:54', 'masr', 'pending', 2, 1, '2024-05-16 18:12:54'),
(7, 'moooo2132137sn', '1010101', 4, '2024-05-16 18:14:23', 'masr', 'pending', 2, 1, '2024-05-16 18:14:23'),
(8, 'borhom', '1096613552', 2, '2024-05-29 21:00:00', 'Alex', 'Pending', 2, 5, '2024-05-16 18:27:56'),
(9, 'borhom', '1096613552', 1, '2024-05-27 21:00:00', 'Alex', 'Pending', 2, 5, '2024-05-16 18:28:12');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(3) NOT NULL,
  `name` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `trip_days` int(4) NOT NULL,
  `price` varchar(4) NOT NULL,
  `country_id` int(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `offer_image` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `image`, `trip_days`, `price`, `country_id`, `created_at`, `offer_image`) VALUES
(1, 'Sadat City', 'cities-01.jpg', 4, '200', 1, '2024-05-13 15:07:10', 'offers-01.jpg'),
(2, 'Alex', 'cities-02.jpg', 5, '300', 1, '2024-05-13 15:07:51', 'offers-02.jpg'),
(3, 'Berlin', 'cities-03.jpg', 3, '980', 2, '2024-05-15 09:10:48', 'offers-03.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `continent` varchar(30) NOT NULL,
  `population` varchar(30) NOT NULL,
  `territory` varchar(30) NOT NULL,
  `description` text NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `image`, `continent`, `population`, `territory`, `description`, `created_at`) VALUES
(1, 'Egypt', 'country-01.jpg', 'Africa', '100', '41.290', 'Rapidiously matrix enterprise-wide experiences and one-to-one interfaces. Interactively synergize go forward alignments without backward-compatible functionalities. Conveniently generate adaptive deliverables whereas visionary products. Quickly build client-centric best practices for interactive scenarios. Intrinsicly transform multifunctional intellectual.', '2024-05-13'),
(2, 'Germany', 'country-02.jpg', 'Europe', '23', '276.323', 'Synergistically initiate real-time e-markets rather than future-proof markets. Interactively iterate holistic meta-services through client-focused quality vectors. Dynamically administrate visionary value vis-a-vis customer directed meta-services. Intrinsicly target inexpensive portals vis-a-vis high standards in metrics. Distinctively impact superior mindshare for an expanded array of portals.\r\n\r\nQuickly formulate high-payoff platforms before proactive technologies. Synergistically transform state of.', '2024-05-13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'Borhom', 'hima132004@gmail.com', '123'),
(5, 'ibrahim', 'ibrahim@gmail.com', '123'),
(6, 'Borhom', 'hima1312004@gmail.com', '123'),
(7, 'mohamedshawky676676@gmail.com', 'hima13112004@gmail.com', '123'),
(8, 'ahmed', 'ahmed@gmail.com', '123'),
(9, 'mohamedshawky676676@gmail.com', 'hima132004@gmail.com', '$2y$10$FASkgAYAvVLfh0LIE/ZG8u9nA87tNIQqjqHZ0TYh.Ki'),
(10, 'Borhom', 'hima132004@gmail.com123', '$2y$10$N0VVp6Um9vHin8t.TtMmpe09CA4qq5jyu9LnWo8q..5'),
(11, 'Borhom', 'hima11232132004@gmail.com', '$2y$10$YqKUOQNrjIJf.ZOu42gZBuyw5OXbfX3aJjUU3HNdQ/m');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
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
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
