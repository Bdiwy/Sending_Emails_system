-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 27, 2024 at 02:44 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emails`
--

-- --------------------------------------------------------

--
-- Table structure for table `email`
--

CREATE TABLE `email` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `send` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `email`
--

INSERT INTO `email` (`id`, `email`, `send`, `created_at`, `updated_at`) VALUES
(1, 'info@gmail.com', 0, '2022-03-22 11:42:43', '2022-03-22 11:42:43'),
(2, 'sayed@gmail.com', 0, '2022-03-22 11:42:43', '2022-03-22 11:42:43'),
(3, 'info@gmail.com', 0, '2022-03-22 11:42:47', '2022-03-22 11:42:47'),
(4, 'sayed@gmail.com', 0, '2022-03-22 11:42:47', '2022-03-22 11:42:47');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `template`
--

CREATE TABLE `template` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `template`
--

INSERT INTO `template` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(2, '30% discount', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n  <meta charset=\"UTF-8\">\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title>Eaalim</title>\r\n\r\n  <link rel=\"stylesheet\" href=\"https://pro.fontawesome.com/releases/v5.10.0/css/all.css\"\r\n    integrity=\"sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p\" crossorigin=\"anonymous\" />\r\n  <style>\r\n    /* url(\'https://eaalim.com/sayed_Dont_delete/\') */\r\n\r\n.wipper {\r\n  position: relative;\r\n  width: 450px;\r\n  height: 1124px;\r\n  margin: auto;\r\n  /* overflow: hidden; */\r\n}\r\n@media (max-width: 450px) {\r\n  .wipper {\r\n    width: 100%;\r\n  }\r\n}\r\n.container-wid {\r\n  position: absolute;\r\n  z-index: 5;\r\n  background: #221e1a;\r\n  /* background-image: url(\'https://eaalim.com/sayed_Dont_delete/masjid-pogung-dalangan-kUzYKihcK9I-unsplash.png\'); */\r\n  width: 100%;\r\n  height: 100%;\r\n  background-size: cover;\r\n  background-position: 66%;\r\n  filter: brightness(0.4) blur(2px);\r\n\r\n}\r\n\r\n.conent {\r\n  position:absolute;\r\n  width: 100%;\r\n  height: 100%;\r\n  z-index: 10 ;\r\n}\r\n.conent header {\r\n  text-align: right;\r\n}\r\n.conent header img {\r\n  width: 60px;\r\n  margin: 7px;\r\n}\r\n.conent .learnQuran {\r\n  /* float: right; */\r\n  /* width:  ; */\r\n  width: 50%;\r\n  margin-left: auto;\r\n}\r\n.conent .learnQuran p.s1{\r\n  text-transform: uppercase;\r\n  color: #fff;\r\n  font-weight: bold;\r\n  margin-bottom: 0;\r\n  font-size: 12px;\r\n\r\n}\r\n.conent .learnQuran p.s2{\r\n  margin-top: 0;\r\n  color: #FFC562;\r\n  font-size: 12px;\r\n  line-height: 20px;\r\n}\r\n.conent .onlineQuran {\r\n      text-transform: uppercase;\r\n      position: relative;\r\n      font-family: system-ui;\r\n      color: #fff;\r\n}\r\n.conent .onlineQuran span.s1 {\r\n     position: absolute;\r\n     font-size: 18px;\r\n     left: -115px;\r\n     top: -83px;\r\n}\r\n.conent .onlineQuran span.s2 {\r\n  font-weight: 700;\r\n  font-size: 51px;\r\n  margin: 0;\r\n  font-family: system-ui;\r\n  margin-top: -200px;\r\n  display: inline-block;\r\n  margin-left: -175px;\r\n  margin-bottom: 0;\r\n}\r\n.conent .onlineQuran span.s2 span{\r\n      color: #FFC562;\r\n      font-size: 234px;\r\n      z-index: 10;\r\n      /* margin-top: -149px; */\r\n      font-weight: bold;\r\n\r\n}\r\n.conent .onlineQuran span.s3 {\r\n      display: block;\r\n      margin-top: -48px;\r\n      text-align: right;\r\n      font-size: 20px;\r\n      margin-right: 78px;\r\n}\r\n.img-offer {\r\n  padding: 15px;\r\n  margin-top: -100px;\r\n  z-index: 15;\r\n  position: relative;\r\n}\r\n.mr{\r\n  margin-bottom: -7px;\r\n}\r\n.img-offer .img {\r\n  width: 150px;\r\n}\r\n.img-offer .offer-image {\r\n  width: 115px;\r\n}\r\n.img-offer .offer-image-last {\r\n  width: 280px;\r\n  margin-left: 20px;\r\n  border-radius: 7px;\r\n  \r\n}\r\n.text-div>span {\r\n  color: #FFC562;\r\n  font-family: system-ui;\r\n  padding: 15px;\r\n  display: block;\r\n}\r\n.text-div .adults {\r\n  font-family: system-ui;\r\n  display: block;\r\n  color: #B2DBE8;\r\n  font-size: 18px;\r\n}\r\n.links-services {\r\n  height: auto;\r\n}\r\n.links-services a {\r\n  width: 80%;\r\n  margin: 0 auto;\r\n  display: block;\r\n}\r\n.contact {\r\n  padding: 15px;\r\n  margin-top: -20px;\r\n  margin-left: 20px;\r\n  color: #fff;\r\n  font-family: system-ui;\r\n  font-size: 10px;\r\n}\r\n\r\n.contact  img {\r\n  width: 50px;\r\n  /* display: inline-block; */\r\n}\r\n.soical-media {\r\n    background: #fff;\r\n    padding: 24px;\r\n    margin: auto;\r\n    margin-top: -11px;\r\n    width: 87%;\r\n    border-radius: 5px;\r\n    text-align: center;\r\n\r\n}\r\n.soical-media a {\r\n  text-decoration: none;\r\n}\r\n.soical-media i {\r\n      display: inline-block;\r\n      width: 35px;\r\n      font-size: 20px;\r\n      height: 35px;\r\n      border-radius: 50%;\r\n      background-color: #000;\r\n      color: #fff;\r\n      line-height: 34px;\r\n      margin-right: 32px;\r\n}\r\n  </style>\r\n</head>\r\n<body>\r\n  <div class=\"wipper\">\r\n    <div class=\"container-wid\"></div>\r\n    <div class=\"conent\">\r\n      <header>\r\n        <img src=\"https://eaalim.com/sayed_Dont_delete/fdrreere.png\" alt=\"\">\r\n      </header>\r\n      <div class=\"learnQuran\">\r\n        <p class=\"s1\">About eaalim institute</p>\r\n        <p class=\"s2\">Eaalim has the best live Quran Teachers to teach Quran, Tajweed, memorization recitation &amp; Arabic language for kids,\r\n        adults, male & females they are from Egypt.</p>\r\n        <div class=\"onlineQuran\">\r\n          <span class=\"s1\">learn</span>\r\n          <span class=\"s2\"><span>Q</span>uran</span>\r\n          <span class=\"s3\">Online  </span>\r\n        </div>\r\n      </div>\r\n      <div class=\"img-offer\">\r\n        <img class=\"img mr\" src=\"https://eaalim.com/sayed_Dont_delete/azharyboy.png\" alt=\"\">\r\n        <img class=\"offer-image\" src=\"https://eaalim.com/sayed_Dont_delete/30.png\" alt=\"\">\r\n        <img class=\"offer-image\" src=\"https://eaalim.com/sayed_Dont_delete/per.png\" alt=\"\">\r\n        <div class=\"offer\">\r\n        <img class=\"offer-image-last\" src=\"https://eaalim.com/sayed_Dont_delete/offer.png\" alt=\"\">\r\n\r\n        </div>\r\n        <div class=\"text-div\">\r\n          <span>You can also attend an Islamic studies course for free and you can attend tow free Trial with us for</span>\r\n          <span class=\"adults\">adults and children</span>\r\n        </div>\r\n      </div>\r\n      <div class=\"links-services\">\r\n        <a href=\"https://eaalim.com/syllabus\" target=\"_blank\">\r\n          <img width=\"100%\" src=\"https://eaalim.com/sayed_Dont_delete/group3.png\" alt=\"\">\r\n        </a>\r\n        <a href=\"https://eaalim.com/eaalim-games/\" target=\"_blank\">\r\n          <img width=\"100%\" src=\"https://eaalim.com/sayed_Dont_delete/group9.png\" alt=\"\">\r\n        </a>\r\n        <table class=\"contact\">\r\n         <tr>\r\n          <td>\r\n             <img src=\"https://eaalim.com/sayed_Dont_delete/011424254.png\" alt=\"\">\r\n          </td>\r\n          <td>\r\n            <span>+442081233611</span>\r\n          </td>\r\n          \r\n          <td>\r\n            <img src=\"https://eaalim.com/sayed_Dont_delete/bg434354.png\" alt=\"\">\r\n          </td>\r\n          <td>\r\n            <span>+201148362722</span>\r\n          </td>\r\n         </tr>\r\n\r\n            \r\n          \r\n            \r\n          \r\n        </table>\r\n      </div>\r\n      <footer class=\"soical-media\">\r\n        <a href=\"https://www.facebook.com/Eaaliminstitute/\">\r\n          <i class=\"fab fa-facebook-f\"></i>\r\n        </a>\r\n        <a href=\"https://youtube.com/c/EaalimInstitutelearnQuranonline\">\r\n          <i class=\"fab fa-youtube\"></i>\r\n        </a>\r\n        <a href=\"https://eaalim.com\">\r\n          <i class=\"fas fa-globe\"></i>\r\n        </a>\r\n        <a href=\"https://www.linkedin.com/company/eaalim-institute\">\r\n          <i class=\"fab fa-linkedin-in\"></i>\r\n        </a>\r\n      </footer>\r\n    </div>\r\n  </div>\r\n</body>\r\n</html>', '2022-01-23 14:00:54', '2022-01-23 14:00:54'),
(4, 'Books offer', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n\r\n<head>\r\n  <meta charset=\"UTF-8\">\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title>Eaalim</title>\r\n  <style>\r\n    .wipper {\r\n      position: relative;\r\n      width: 450px;\r\n      /* height: 1224px; */\r\n      margin: auto;\r\n    }\r\n    .conent {\r\n      background:#262727; \r\n      width: 100%;\r\n      height: 100%;\r\n      z-index: 10;\r\n    }\r\n    .links-services {\r\n      height: auto;\r\n    }\r\n    .links-services a {\r\n      width: 80%;\r\n      margin: 0 auto;\r\n      display: block;\r\n    }\r\n    .contact {\r\n      padding: 15px;\r\n      margin-top: -20px;\r\n      margin-left: 20px;\r\n      color: #fff;\r\n      font-family: system-ui;\r\n      font-size: 10px;\r\n    }\r\n    .contact img {\r\n      width: 50px;\r\n    }\r\n    .soical-media {\r\n      background: #fff;\r\n      padding: 24px;\r\n      margin: auto;\r\n      margin-top: -11px;\r\n      width: 87%;\r\n      border-radius: 5px;\r\n      text-align: center;\r\n    }\r\n    .soical-media a {\r\n      text-decoration: none;\r\n    }\r\n  </style>\r\n</head>\r\n\r\n<body>\r\n  <div class=\"wipper\">\r\n    <div class=\"container-wid\"></div>\r\n    <div class=\"conent\">\r\n      \r\n      <div>\r\n       \r\n        <a href=\'https://eaalim.com/shop/\'>\r\n        <img width=\"100%\" src=\"https://eaalim.com/sayed_Dont_delete/testi.png\" alt=\"\">    \r\n        </a>\r\n        \r\n      </div>\r\n      \r\n      <div class=\"links-services\">\r\n        <a href=\"https://eaalim.com/syllabus\" target=\"_blank\">\r\n          <img width=\"100%\" src=\"https://eaalim.com/sayed_Dont_delete/group3.png\" alt=\"\">\r\n        </a>\r\n        <a href=\"https://eaalim.com/eaalim-games/\" target=\"_blank\">\r\n          <img width=\"100%\" src=\"https://eaalim.com/sayed_Dont_delete/group9.png\" alt=\"\">\r\n        </a>\r\n        <table class=\"contact\">\r\n          <tr>\r\n            <td>\r\n              <img src=\"https://eaalim.com/sayed_Dont_delete/011424254.png\" alt=\"\">\r\n            </td>\r\n            <td>\r\n              <span>+442081233611</span>\r\n            </td>\r\n\r\n            <td>\r\n              <img src=\"https://eaalim.com/sayed_Dont_delete/bg434354.png\" alt=\"\">\r\n            </td>\r\n            <td>\r\n              <span>+201148362722</span>\r\n            </td>\r\n          </tr>\r\n\r\n\r\n\r\n\r\n\r\n        </table>\r\n      </div>\r\n      <footer class=\"soical-media\">\r\n        <a href=\"https://www.facebook.com/Eaaliminstitute/\">\r\n          <img src=\"https://eaalim.com/sayed_Dont_delete/fb.png\" alt=\"\">\r\n        </a>\r\n        <a href=\"https://youtube.com/c/EaalimInstitutelearnQuranonline\">\r\n          <img src=\"https://eaalim.com/sayed_Dont_delete/you.png\" alt=\"\">\r\n        </a>\r\n        <a href=\"https://eaalim.com\">\r\n          <img src=\"https://eaalim.com/sayed_Dont_delete/web.png\" alt=\"\">\r\n        </a>\r\n        <a href=\"https://www.linkedin.com/company/eaalim-institute\">\r\n          <img src=\"https://eaalim.com/sayed_Dont_delete/lin.png\" alt=\"\">\r\n        </a>\r\n      </footer>\r\n    </div>\r\n  </div>\r\n</body>\r\n\r\n</html>', '2022-01-23 14:27:28', '2022-01-23 14:27:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Sayed Khaled', 'sayed.khaled7123@gmail.com', NULL, '$2y$10$FD7/nMWsCG48BwLBizxEzO7zWzueEdVw/IPcHS1p2prPaj4Oeaw6m', 'TykEHPLfzQ4p4dZqKB2Efa1FoKu6V7UOVQ9ag6SCfWitZXpUlHE9hwHDdEd8', '2022-03-21 10:14:06', '2022-03-21 10:14:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `template`
--
ALTER TABLE `template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `email`
--
ALTER TABLE `email`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `template`
--
ALTER TABLE `template`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
