-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2024 at 05:22 AM
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `name`, `phone_number`, `num_of_guests`, `checkin_date`, `destination`, `status`, `city_id`, `user_id`, `created_at`, `payment`) VALUES
(15, 'ibrahim', '01096613552', 3, '2024-05-22 21:00:00', 'Sadat City', 'Pending', 1, 5, '2024-05-19 03:13:17', 0),
(16, 'ibrahim', '01096613552', 4, '2024-05-19 03:20:14', 'Berlin', 'Pending', 3, 15, '2024-05-19 03:20:14', 0),
(17, 'ibrahim', '01096613552', 12, '2024-05-19 03:20:14', 'Luxor', 'Pending', 7, 15, '2024-05-19 03:20:14', 0),
(18, 'ibrahim', '01096613552', 2, '2024-05-19 03:20:14', 'Munich', 'Pending', 10, 15, '2024-05-19 03:20:14', 0),
(19, 'ibrahim', '01096613552', 3, '2024-05-19 03:20:14', 'Frankfurt', 'Pending', 11, 15, '2024-05-19 03:20:14', 0),
(20, 'ibrahim', '01096613552', 3, '2024-05-19 03:20:14', 'Bonn', 'Pending', 13, 15, '2024-05-19 03:20:14', 0),
(21, 'ibrahim', '01096613552', 2, '2024-05-19 03:20:14', 'Moscow', 'Pending', 14, 15, '2024-05-19 03:20:14', 0),
(22, 'ibrahim', '01096613552', 1, '2024-05-19 03:20:14', 'Samara', 'Pending', 17, 15, '2024-05-19 03:20:14', 0);

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
  `offer_image` varchar(30) NOT NULL,
  `deal_image` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `image`, `trip_days`, `price`, `country_id`, `created_at`, `offer_image`, `deal_image`) VALUES
(1, 'Sadat City', 'cities-01.jpg', 4, '200', 1, '2024-05-13 15:07:10', 'offers-01.jpg', 'deals-01.jpg'),
(2, 'Alex', 'cities-02.jpg', 5, '300', 1, '2024-05-13 15:07:51', 'offers-02.jpg', 'deals-02.jpg'),
(3, 'Berlin', 'cities-03.jpg', 3, '980', 2, '2024-05-15 09:10:48', 'offers-03.jpg', 'deals-03.jpg'),
(4, 'Bastrah', 'cities-04.jpg', 5, '10', 3, '2024-05-19 02:54:31', 'offers-02.jpg', 'deals-04.jpg'),
(5, 'Cairo', 'cities-03.jpg', 4, '25', 1, '2024-05-19 03:01:20', 'offers-02.jpg', 'deals-04.jpg'),
(6, 'Alexandria', 'cities-04.jpg', 6, '100', 1, '2024-05-19 03:01:20', 'offers-02.jpg', 'deals-01.jpg'),
(7, 'Luxor', 'cities-03.jpg', 9, '650', 1, '2024-05-19 03:01:20', 'offers-02.jpg', 'deals-03.jpg'),
(8, 'Faiyum', 'cities-03.jpg', 12, '550', 1, '2024-05-19 03:01:20', 'offers-02.jpg', 'deals-04.jpg'),
(9, 'Hamburg', 'cities-03.jpg', 16, '1199', 2, '2024-05-19 03:05:00', 'offers-03.jpg', 'deals-02.jpg'),
(10, 'Munich', 'cities-02.jpg', 10, '600', 2, '2024-05-19 03:05:00', 'offers-01.jpg', 'deals-01.jpg'),
(11, 'Frankfurt', 'cities-01.jpg', 2, '200', 2, '2024-05-19 03:05:00', 'offers-03.jpg', 'deals-02.jpg'),
(12, 'Cologne', 'cities-02.jpg', 3, '500', 2, '2024-05-19 03:05:00', 'offers-02.jpg', 'deals-03.jpg'),
(13, 'Bonn', 'cities-02.jpg', 12, '2000', 2, '2024-05-19 03:05:00', 'offers-01.jpg', 'deals-02.jpg'),
(14, 'Moscow', 'cities-02.jpg', 10, '1500', 4, '2024-05-19 03:08:49', 'offers-01.jpg', 'deals-02.jpg'),
(15, 'Saint Petersburg', 'cities-01.jpg', 7, '230', 4, '2024-05-19 03:08:49', 'offers-02.jpg', 'deals-01.jpg'),
(16, 'Kazan', 'cities-01.jpg', 5, '1900', 4, '2024-05-19 03:08:49', 'offers-03.jpg', 'deals-01.jpg'),
(17, 'Samara', 'cities-02.jpg', 9, '300', 4, '2024-05-19 03:08:49', 'offers-02.jpg', 'deals-04.jpg'),
(18, 'Veliky Novgorod', 'cities-02.jpg', 9, '4999', 4, '2024-05-19 03:08:49', 'offers-02.jpg', 'deals-01.jpg');

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
(2, 'Germany', 'country-02.jpg', 'Europe', '23', '276.323', 'Synergistically initiate real-time e-markets rather than future-proof markets. Interactively iterate holistic meta-services through client-focused quality vectors. Dynamically administrate visionary value vis-a-vis customer directed meta-services. Intrinsicly target inexpensive portals vis-a-vis high standards in metrics. Distinctively impact superior mindshare for an expanded array of portals.\r\n\r\nQuickly formulate high-payoff platforms before proactive technologies. Synergistically transform state of.', '2024-05-13'),
(3, 'Damanhour', 'country-03.jpg', 'Masr', '20', '12.200', 'Intrinsicly administrate interoperable ideas through just in time strategic theme areas. Phosfluorescently procrastinate world-class data through dynamic vortals. Authoritatively target team driven models without professional initiatives. Synergistically unleash B2B vortals via highly efficient intellectual capital. Collaboratively embrace world-class.', '2024-05-19'),
(4, 'Russia', 'country-03.jpg', 'Asia', '52', '32.021', 'Continually implement ubiquitous ideas whereas pandemic systems. Authoritatively matrix enterprise-wide convergence without multidisciplinary portals. Quickly architect future-proof ROI without market positioning opportunities. Enthusiastically communicate adaptive intellectual capital rather than effective leadership. Credibly envisioneer out-of-the-box process improvements vis-a-vis interdependent best practices.\r\n\r\nHolisticly incentivize impactful value vis-a-vis global opportunities.', '2024-05-19');

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
(5, 'ibrahim', 'ibrahim@gmail.com', '123'),
(12, 'ahmed', 'ahmed@gmail.com', '123');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
