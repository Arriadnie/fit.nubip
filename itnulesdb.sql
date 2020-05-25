-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Час створення: Трв 26 2020 р., 00:14
-- Версія сервера: 10.3.13-MariaDB
-- Версія PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `itnulesdb`
--

-- --------------------------------------------------------

--
-- Структура таблиці `audiences`
--

CREATE TABLE `audiences` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(11) DEFAULT NULL,
  `audience_type_id` int(10) UNSIGNED DEFAULT NULL,
  `building_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `audiences`
--

INSERT INTO `audiences` (`id`, `name`, `number`, `audience_type_id`, `building_id`, `created_at`, `updated_at`) VALUES
(1, '231 аудиторія 15 корпус', 231, 1, 1, '2020-05-25 14:29:38', '2020-05-25 14:40:09'),
(2, '223 аудиторія 15 корпус', 223, 3, 1, '2020-05-25 14:30:12', '2020-05-25 14:39:58'),
(3, '224 аудиторія 15 корпус', 224, 3, 1, '2020-05-25 14:30:31', '2020-05-25 14:39:46'),
(4, '206 аудиторія 15 корпус', 206, 2, 1, '2020-05-25 14:33:33', '2020-05-25 14:39:35'),
(5, '135 аудиторія 11 корпус', 135, 2, 3, '2020-05-25 14:33:59', '2020-05-25 14:39:24'),
(6, '20 аудиторія 4 корпус', 20, 2, 2, '2020-05-25 14:34:36', '2020-05-25 14:39:06'),
(7, '230 аудиторія 15 корпус', 230, 1, 1, '2020-05-25 14:34:58', '2020-05-25 14:38:50'),
(8, '360 аудиторія 11 корпус', 360, 2, 3, '2020-05-25 14:40:32', '2020-05-25 14:40:32');

-- --------------------------------------------------------

--
-- Структура таблиці `audience_lesson_types`
--

CREATE TABLE `audience_lesson_types` (
  `audience_type_id` int(10) UNSIGNED NOT NULL,
  `lesson_type_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `audience_lesson_types`
--

INSERT INTO `audience_lesson_types` (`audience_type_id`, `lesson_type_id`) VALUES
(1, 1),
(2, 2),
(3, 2);

-- --------------------------------------------------------

--
-- Структура таблиці `audience_types`
--

CREATE TABLE `audience_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `audience_types`
--

INSERT INTO `audience_types` (`id`, `name`, `description`) VALUES
(1, 'Лекційна аудиторія', NULL),
(2, 'Аудиторія для практичних занять', NULL),
(3, 'Комп\'ютерна лабораторія', NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `buildings`
--

CREATE TABLE `buildings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(11) DEFAULT NULL,
  `faculty_owner_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `buildings`
--

INSERT INTO `buildings` (`id`, `name`, `number`, `faculty_owner_id`) VALUES
(1, '15 корпус', 15, 1),
(2, '4 корпус', 4, 2),
(3, '11 корпус', 11, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(2, NULL, 1, 'Category 2', 'category-2', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(3, 1, 1, 'Category 3', 'category-3', '2020-01-10 19:23:57', '2020-01-10 19:23:57'),
(4, 3, 1, 'Category 4', 'category-4', '2020-01-19 17:17:51', '2020-01-19 17:17:51');

-- --------------------------------------------------------

--
-- Структура таблиці `category_post`
--

CREATE TABLE `category_post` (
  `category_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `category_post`
--

INSERT INTO `category_post` (`category_id`, `post_id`) VALUES
(1, 5),
(3, 5);

-- --------------------------------------------------------

--
-- Структура таблиці `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Ім\'я', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Пароль', 0, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Створено', 0, 0, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Роль', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Ролі', 0, 0, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Налаштування', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(17, 3, 'name', 'text', 'Код', 1, 1, 1, 1, 1, 1, '{}', 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(20, 3, 'display_name', 'text', 'Назва', 1, 1, 1, 1, 1, 1, '{}', 5),
(21, 1, 'role_id', 'text', 'ІД Роль', 0, 0, 1, 1, 1, 1, '{}', 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 1, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, '{}', 2),
(31, 5, 'category_id', 'text', 'Category', 0, 0, 1, 1, 1, 0, '{}', 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 0, 0, 1, 1, 1, 1, '{}', 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '{}', 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, '{}', 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, '{}', 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, '{}', 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 0, 0, 1, 1, 1, 1, '{}', 6),
(48, 6, 'body', 'rich_text_box', 'Body', 0, 0, 1, 1, 1, 1, '{}', 5),
(49, 6, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 4),
(50, 6, 'meta_description', 'text', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, '{}', 12),
(56, 8, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 8, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(58, 8, 'blade_path', 'text', 'Blade Path', 1, 1, 1, 1, 1, 1, '{}', 3),
(60, 8, 'public', 'checkbox', 'Public', 1, 1, 1, 1, 1, 1, '{}', 4),
(61, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 7),
(62, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(63, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(64, 9, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(65, 9, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"},\"validation\":{\"rule\":\"unique:infoblocks,slug\"}}', 4),
(66, 9, 'type_id', 'select_dropdown', 'Type Id', 0, 0, 1, 1, 1, 0, '{}', 2),
(67, 9, 'title', 'text', 'Title', 0, 0, 1, 1, 1, 0, '{}', 5),
(68, 9, 'sub_title', 'text', 'Sub Title', 0, 0, 1, 1, 1, 0, '{}', 6),
(69, 9, 'button_title', 'text', 'Button Title', 0, 0, 1, 1, 1, 0, '{}', 8),
(70, 9, 'button_link', 'text', 'Button Link', 0, 0, 1, 1, 1, 0, '{}', 9),
(71, 9, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 11),
(72, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12),
(73, 9, 'infoblock_belongsto_infoblock_type_relationship', 'relationship', 'Type', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Infoblocks\\\\InfoblockType\",\"table\":\"infoblock_types\",\"type\":\"belongsTo\",\"column\":\"type_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(74, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(75, 10, 'infoblock_id', 'select_dropdown', 'Infoblock Id', 1, 0, 1, 0, 0, 1, '{}', 2),
(76, 10, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 3),
(77, 10, 'sub_title', 'text', 'Sub Title', 0, 0, 1, 1, 1, 0, '{}', 4),
(78, 10, 'image', 'file', 'Image', 0, 1, 1, 1, 1, 0, '{}', 5),
(79, 10, 'button_title', 'text', 'Button Title', 0, 0, 1, 1, 1, 0, '{}', 6),
(80, 10, 'button_link', 'text', 'Button Link', 0, 0, 1, 1, 1, 0, '{}', 7),
(81, 10, 'body', 'text_area', 'Body', 0, 0, 1, 1, 1, 1, '{}', 8),
(82, 10, 'order', 'text', 'Order', 0, 0, 0, 0, 0, 0, '{}', 9),
(83, 10, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 10),
(84, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(85, 10, 'infoblock_item_belongsto_infoblock_relationship', 'relationship', 'Infoblock', 0, 1, 1, 0, 0, 0, '{\"isItemsParent\":true,\"parentDataTypeSlug\":\"infoblocks\",\"model\":\"App\\\\Models\\\\Infoblocks\\\\Infoblock\",\"table\":\"infoblocks\",\"type\":\"belongsTo\",\"column\":\"infoblock_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(86, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(87, 11, 'svg', 'file', 'Svg', 1, 1, 1, 1, 1, 1, '{}', 3),
(88, 11, 'link', 'text', 'Посилання факультету', 1, 1, 1, 1, 1, 1, '{}', 4),
(96, 11, 'created_at', 'timestamp', 'Створено', 0, 0, 1, 0, 0, 1, '{}', 5),
(97, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(98, 11, 'name', 'text', 'Назва', 1, 1, 1, 1, 1, 1, '{}', 2),
(99, 8, 'with_items', 'checkbox', 'With Items', 1, 1, 1, 1, 1, 0, '{}', 5),
(100, 8, 'with_item_parent', 'checkbox', 'With Item Parent', 1, 0, 1, 1, 1, 0, '{}', 6),
(101, 9, 'body', 'rich_text_box', 'Body', 0, 0, 1, 1, 1, 1, '{}', 7),
(102, 9, 'image', 'image', 'Image', 0, 0, 1, 1, 1, 0, '{}', 10),
(103, 10, 'parent_id', 'text', 'Parent Id', 0, 0, 0, 0, 0, 0, '{}', 12),
(104, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(105, 13, 'user_id', 'text', 'User Id', 0, 0, 1, 1, 1, 1, '{}', 2),
(106, 13, 'name', 'text', 'Ім\'я', 1, 1, 1, 1, 1, 1, '{}', 4),
(107, 13, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:people_infos,slug\"}}', 5),
(108, 13, 'phone', 'text', 'Телефон', 0, 0, 1, 1, 1, 0, '{}', 6),
(109, 13, 'email', 'text', 'Email', 0, 0, 1, 1, 1, 0, '{}', 7),
(110, 13, 'position', 'text', 'Position', 0, 0, 0, 0, 0, 0, '{}', 8),
(111, 13, 'description', 'rich_text_box', 'Опис', 0, 0, 1, 1, 1, 0, '{}', 9),
(112, 13, 'image', 'image', 'Фото', 0, 1, 1, 1, 1, 0, '{}', 10),
(113, 13, 'link', 'text', 'Посилання', 0, 0, 1, 1, 1, 0, '{}', 11),
(114, 13, 'status', 'select_dropdown', 'Статус', 1, 1, 1, 1, 1, 1, '{\"default\":\"CHANGED\",\"options\":{\"PUBLISHED\":\"PUBLISHED\",\"NOT_PUBLISHED\":\"NOT_PUBLISHED\",\"CHANGED\":\"CHANGED\"}}', 12),
(115, 13, 'created_at', 'timestamp', 'Створено', 0, 1, 1, 0, 0, 1, '{}', 13),
(116, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
(117, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(118, 14, 'name', 'text', 'Назва', 1, 1, 1, 1, 1, 1, '{}', 2),
(119, 14, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"},\"validation\":{\"rule\":\"unique:galleries,slug\"}}', 3),
(120, 14, 'title', 'text', 'Заголовок', 0, 0, 1, 1, 1, 0, '{}', 4),
(121, 14, 'sub_title', 'text', 'Підзаголовок', 0, 0, 1, 1, 1, 0, '{}', 5),
(122, 14, 'created_at', 'timestamp', 'Створено', 0, 1, 1, 1, 0, 1, '{}', 6),
(123, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(124, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(125, 15, 'gallery_id', 'text', 'Gallery Id', 1, 0, 1, 0, 0, 1, '{}', 2),
(126, 15, 'image', 'image', 'Картинка', 0, 1, 1, 1, 1, 0, '{}', 3),
(127, 15, 'caption', 'text', 'Заголовок', 0, 1, 1, 1, 1, 0, '{}', 4),
(128, 15, 'order', 'text', 'Порядок', 1, 0, 0, 0, 0, 0, '{}', 5),
(129, 15, 'created_at', 'timestamp', 'Створено', 0, 1, 1, 0, 0, 1, '{}', 6),
(130, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(131, 15, 'gallery_image_belongsto_gallery_relationship', 'relationship', 'Галерея', 0, 1, 1, 1, 1, 1, '{\"isItemsParent\":true,\"parentDataTypeSlug\":\"galleries\",\"model\":\"App\\\\Models\\\\Galleries\\\\Gallery\",\"table\":\"galleries\",\"type\":\"belongsTo\",\"column\":\"gallery_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(132, 14, 'gallery_hasmany_gallery_image_relationship', 'relationship', 'Картинки/Фото', 0, 0, 1, 1, 0, 0, '{\"isItems\":true,\"dataTypeSlug\":\"gallery-images\",\"itemsProperty\":\"images\",\"model\":\"App\\\\Models\\\\Galleries\\\\GalleryImage\",\"table\":\"gallery_images\",\"type\":\"hasMany\",\"column\":\"gallery_id\",\"key\":\"id\",\"label\":\"image\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(133, 9, 'infoblock_hasmany_infoblock_item_relationship', 'relationship', 'Items', 0, 0, 1, 1, 0, 0, '{\"isItems\":true,\"dataTypeSlug\":\"infoblock-items\",\"itemsProperty\":\"items\",\"itemsVisibleMethod\":\"typeWithItems\",\"model\":\"App\\\\Models\\\\Infoblocks\\\\InfoblockItem\",\"table\":\"infoblock_items\",\"type\":\"hasMany\",\"column\":\"infoblock_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
(134, 10, 'infoblock_item_hasmany_infoblock_item_relationship', 'relationship', 'children', 0, 1, 1, 1, 1, 1, '{\"isChildItems\":true,\"childItemsProperty\":\"children\",\"model\":\"App\\\\Models\\\\Infoblocks\\\\InfoblockItem\",\"table\":\"infoblock_items\",\"type\":\"hasMany\",\"column\":\"parent_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(135, 16, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(136, 16, 'name', 'text', 'Назва', 1, 1, 1, 1, 1, 0, '{}', 2),
(137, 16, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 0, '{\"slugify\":{\"origin\":\"name\"},\"validation\":{\"rule\":\"unique:education_degrees,slug\"}}', 3),
(138, 16, 'description', 'text_area', 'Опис', 0, 0, 1, 1, 1, 0, '{}', 4),
(139, 16, 'image', 'image', 'Картинка', 0, 1, 1, 1, 1, 0, '{}', 5),
(140, 16, 'order', 'number', 'Order', 1, 0, 0, 0, 0, 0, '{}', 6),
(141, 16, 'created_at', 'timestamp', 'Створено', 0, 0, 1, 0, 0, 0, '{}', 7),
(142, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(143, 17, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(144, 17, 'name', 'text', 'Назва', 1, 1, 1, 1, 1, 1, '{}', 4),
(145, 17, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"},\"validation\":{\"rule\":\"unique:education_programs,slug\"}}', 5),
(146, 17, 'description', 'text_area', 'Опис', 0, 0, 1, 1, 1, 0, '{}', 6),
(147, 17, 'info_body', 'rich_text_box', 'Контент сторінки', 0, 0, 1, 1, 1, 0, '{}', 7),
(148, 17, 'image', 'image', 'Картинка', 0, 1, 1, 1, 1, 0, '{}', 8),
(149, 17, 'order', 'number', 'Order', 1, 0, 0, 0, 0, 0, '{}', 9),
(150, 17, 'education_degree_id', 'number', 'Education Degree Id', 0, 0, 1, 1, 1, 1, '{}', 2),
(151, 17, 'education_specialty_id', 'number', 'Education Specialty Id', 0, 0, 1, 1, 1, 1, '{}', 3),
(153, 17, 'created_at', 'timestamp', 'Створено', 0, 0, 1, 0, 0, 1, '{}', 11),
(154, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12),
(155, 18, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(156, 18, 'name', 'text', 'Назва', 1, 1, 1, 1, 1, 1, '{}', 2),
(157, 18, 'code', 'text', 'Код', 1, 1, 1, 1, 1, 1, '{}', 3),
(158, 18, 'description', 'text_area', 'Опис', 0, 0, 1, 1, 1, 0, '{}', 4),
(159, 18, 'created_at', 'timestamp', 'Створено', 0, 1, 1, 0, 0, 1, '{}', 5),
(160, 18, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(161, 17, 'education_program_belongsto_education_degree_relationship', 'relationship', 'Освітній ступінь', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Education\\\\EducationDegree\",\"table\":\"education_degrees\",\"type\":\"belongsTo\",\"column\":\"education_degree_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(162, 17, 'education_program_belongsto_education_specialty_relationship', 'relationship', 'Спеціальність', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Education\\\\EducationSpecialty\",\"table\":\"education_specialties\",\"type\":\"belongsTo\",\"column\":\"education_specialty_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
(163, 19, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(164, 19, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(165, 19, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"},\"validation\":{\"rule\":\"unique:people_info_groups,slug\"}}', 3),
(166, 19, 'description', 'text_area', 'Description', 0, 0, 1, 1, 1, 0, '{}', 4),
(167, 19, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 1, '{}', 5),
(168, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(169, 19, 'people_info_group_belongstomany_people_info_relationship', 'relationship', 'Infos', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\PeopleInfo\\\\PeopleInfo\",\"table\":\"people_infos\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"people_info_in_group\",\"pivot\":\"1\",\"taggable\":\"on\"}', 7),
(171, 23, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(172, 23, 'name', 'text', 'Назва', 1, 1, 1, 1, 1, 1, '{}', 2),
(173, 23, 'description', 'text', 'Опис', 0, 1, 1, 1, 1, 1, '{}', 3),
(174, 23, 'created_at', 'timestamp', 'Створено', 0, 0, 0, 0, 0, 1, '{}', 4),
(175, 23, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(176, 25, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(177, 25, 'datetime', 'text', 'Дата-час', 1, 1, 1, 1, 1, 1, '{}', 2),
(178, 25, 'status', 'select_dropdown', 'Статус', 1, 1, 1, 1, 1, 1, '{\"options\":{\"SUCCESS\":\"\\u0423\\u0441\\u043f\\u0456\\u0448\\u043d\\u043e\",\"ERROR\":\"\\u041f\\u043e\\u043c\\u0438\\u043b\\u043a\\u0430\"}}', 3),
(179, 25, 'message', 'text', 'Повідомлення', 1, 1, 1, 1, 1, 1, '{}', 4),
(180, 1, 'email_verified_at', 'timestamp', 'Підтверджено', 0, 0, 0, 0, 0, 1, '{}', 7),
(181, 1, 'birthday', 'date', 'Дата народження', 0, 0, 1, 1, 1, 1, '{}', 13),
(182, 1, 'group_id', 'text', 'ID групи', 0, 0, 1, 1, 1, 1, '{}', 3),
(183, 1, 'credit_note_number', 'text', 'Номер залікової книжки', 0, 0, 1, 1, 1, 1, '{}', 14),
(184, 1, 'user_belongsto_group_relationship', 'relationship', 'Група', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Education\\\\Group\",\"table\":\"groups\",\"type\":\"belongsTo\",\"column\":\"group_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
(185, 11, 'is_public', 'checkbox', 'Відображати для студентів', 1, 1, 1, 1, 1, 1, '{}', 7),
(186, 26, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(187, 26, 'name', 'text', 'Назва', 1, 1, 1, 1, 1, 1, '{}', 2),
(188, 26, 'description', 'rich_text_box', 'Опис', 0, 1, 1, 1, 1, 1, '{}', 3),
(189, 27, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(190, 27, 'name', 'text', 'Назва', 1, 1, 1, 1, 1, 1, '{}', 3),
(191, 27, 'period_type_id', 'text', 'Period Type Id', 0, 0, 1, 1, 1, 1, '{}', 2),
(192, 27, 'start_date', 'date', 'Дата початку', 1, 1, 1, 1, 1, 1, '{}', 5),
(193, 27, 'due_date', 'date', 'Дата закінчення', 1, 1, 1, 1, 1, 1, '{}', 6),
(194, 27, 'description', 'text', 'Опис', 0, 0, 1, 1, 1, 1, '{}', 7),
(195, 27, 'period_belongsto_period_type_relationship', 'relationship', 'Тип', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Lookups\\\\PeriodType\",\"table\":\"period_types\",\"type\":\"belongsTo\",\"column\":\"period_type_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(196, 28, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(197, 28, 'name', 'text', 'Назва', 1, 1, 1, 1, 1, 1, '{}', 4),
(198, 28, 'description', 'text_area', 'Опис', 0, 0, 1, 1, 1, 1, '{}', 5),
(199, 28, 'score', 'number', 'Бал', 1, 1, 1, 1, 1, 1, '{}', 6),
(200, 28, 'rating_item_group_id', 'text', 'Rating Item Group Id', 1, 0, 1, 1, 1, 1, '{}', 2),
(201, 28, 'created_at', 'timestamp', 'Створено', 0, 0, 1, 0, 0, 1, '{}', 7),
(202, 28, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(203, 29, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(204, 29, 'name', 'text', 'Назва', 1, 1, 1, 1, 1, 1, '{}', 2),
(205, 29, 'description', 'text_area', 'Опис', 0, 0, 1, 1, 1, 1, '{}', 3),
(206, 29, 'parent_id', 'text', 'Parent Id', 0, 0, 1, 1, 1, 1, '{}', 5),
(207, 29, 'created_at', 'timestamp', 'Створено', 0, 0, 1, 0, 0, 1, '{}', 6),
(208, 29, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(209, 29, 'rating_item_group_belongsto_rating_item_group_relationship', 'relationship', 'Батьківський блок', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Rating\\\\RatingItemGroup\",\"table\":\"rating_item_groups\",\"type\":\"belongsTo\",\"column\":\"parent_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(210, 28, 'rating_item_belongsto_rating_item_group_relationship', 'relationship', 'Блок', 0, 1, 1, 1, 1, 1, '{\"isItemsParent\":true,\"model\":\"App\\\\Models\\\\Rating\\\\RatingItemGroup\",\"table\":\"rating_item_groups\",\"type\":\"belongsTo\",\"column\":\"rating_item_group_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(211, 29, 'rating_item_group_hasmany_rating_item_relationship', 'relationship', 'Пункти', 0, 0, 1, 1, 1, 1, '{\"isItems\":true,\"dataTypeSlug\":\"rating-items\",\"itemsProperty\":\"items\",\"titleColumn\":\"name\",\"subTitleColumn\":\"score\",\"model\":\"App\\\\Models\\\\Rating\\\\RatingItem\",\"table\":\"rating_items\",\"type\":\"hasMany\",\"column\":\"rating_item_group_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(212, 29, 'order', 'text', 'Порядковий номер', 1, 0, 0, 0, 0, 1, '{}', 7),
(213, 28, 'order', 'text', 'Порядковий номер', 1, 0, 0, 0, 0, 1, '{}', 8),
(214, 13, 'people_info_belongsto_user_relationship', 'relationship', 'Користувач', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(215, 30, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(216, 30, 'name', 'text', 'Назва', 1, 1, 1, 1, 1, 1, '{}', 4),
(217, 30, 'introduction_year', 'number', 'Рік вступу', 0, 0, 1, 1, 1, 1, '{}', 5),
(218, 30, 'starosta_id', 'text', 'Starosta Id', 0, 0, 1, 1, 1, 1, '{}', 2),
(219, 30, 'education_program_id', 'text', 'Education Program Id', 0, 0, 1, 1, 1, 1, '{}', 3),
(220, 30, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 1, '{}', 6),
(221, 30, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(222, 30, 'group_belongsto_user_relationship', 'relationship', 'Староста', 0, 1, 1, 1, 0, 1, '{\"scopeWithMaster\":\"studentsForStarosta\",\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"starosta_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(223, 30, 'group_belongsto_education_program_relationship', 'relationship', 'Навчальна програма', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Education\\\\EducationProgram\",\"table\":\"education_programs\",\"type\":\"belongsTo\",\"column\":\"education_program_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(224, 31, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(225, 31, 'date', 'date', 'Дата', 1, 1, 1, 1, 1, 1, '{}', 7),
(226, 31, 'status', 'select_dropdown', 'Статус', 1, 1, 1, 1, 1, 1, '{\"default\":\"IN_PROCESS\",\"options\":{\"IN_PROCESS\":\"\\u0412 \\u043e\\u0431\\u0440\\u043e\\u0431\\u0446\\u0456\",\"EDITED\":\"\\u0412\\u0456\\u0434\\u0440\\u0435\\u0434\\u0430\\u0433\\u043e\\u0432\\u0430\\u043d\\u043e\",\"REJECTED\":\"\\u0412\\u0456\\u0434\\u0445\\u0438\\u043b\\u0435\\u043d\\u043e\",\"CONFIRMED\":\"\\u041f\\u0456\\u0434\\u0442\\u0432\\u0435\\u0440\\u0434\\u0436\\u0435\\u043d\\u043e\"}}', 8),
(227, 31, 'rating_item_id', 'text', 'Rating Item Id', 0, 0, 1, 1, 1, 1, '{}', 4),
(228, 31, 'user_id', 'text', 'User Id', 1, 0, 1, 1, 1, 1, '{}', 5),
(229, 31, 'created_at', 'timestamp', 'Створено', 0, 0, 1, 0, 0, 1, '{}', 9),
(230, 31, 'updated_at', 'timestamp', 'Змінено', 0, 1, 1, 0, 0, 0, '{}', 10),
(231, 31, 'name', 'text', 'Назва', 1, 1, 1, 1, 1, 1, '{}', 6),
(232, 31, 'comment', 'text_area', 'Коментар', 0, 1, 1, 1, 1, 1, '{}', 11),
(233, 31, 'user_rating_item_belongsto_rating_item_relationship', 'relationship', 'Пункт рейтингу', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Rating\\\\RatingItem\",\"table\":\"rating_items\",\"type\":\"belongsTo\",\"column\":\"rating_item_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(234, 31, 'user_rating_item_belongsto_user_relationship', 'relationship', 'Студент', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(235, 32, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(236, 32, 'name', 'text', 'Назва', 1, 1, 1, 1, 1, 1, '{}', 2),
(237, 32, 'created_at', 'timestamp', 'Створено', 0, 0, 1, 0, 0, 1, '{}', 3),
(238, 32, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(239, 33, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(240, 33, 'name', 'text', 'Назва', 1, 1, 1, 1, 1, 1, '{}', 2),
(241, 33, 'description', 'text_area', 'Опис', 0, 0, 1, 1, 1, 1, '{}', 3),
(242, 34, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(243, 34, 'name', 'text', 'Назва', 1, 1, 1, 1, 1, 1, '{}', 2),
(244, 34, 'description', 'text', 'Опис', 0, 0, 1, 1, 1, 1, '{}', 3),
(245, 35, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(246, 35, 'name', 'text', 'Назва', 1, 1, 1, 1, 1, 1, '{}', 2),
(247, 35, 'order', 'text', 'Порядковий номер', 1, 1, 1, 0, 0, 1, '{}', 3),
(248, 36, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(249, 36, 'name', 'text', 'Назва', 1, 1, 1, 1, 1, 1, '{}', 3),
(250, 36, 'number', 'text', 'Номер', 0, 1, 1, 1, 1, 1, '{}', 4),
(251, 36, 'faculty_owner_id', 'text', 'Faculty Owner Id', 0, 0, 1, 1, 1, 1, '{}', 2),
(252, 36, 'building_belongsto_faculty_relationship', 'relationship', 'Факультет, за яким закріплено', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Education\\\\Faculty\",\"table\":\"faculties\",\"type\":\"belongsTo\",\"column\":\"faculty_owner_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"audience_lesson_types\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(253, 37, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(254, 37, 'name', 'text', 'Назва', 1, 1, 1, 1, 1, 1, '{}', 5),
(255, 37, 'number', 'text', 'Номер', 0, 1, 1, 1, 1, 1, '{}', 6),
(256, 37, 'audience_type_id', 'text', 'Audience Type Id', 0, 0, 1, 1, 1, 1, '{}', 2),
(257, 37, 'building_id', 'text', 'Building Id', 0, 0, 1, 1, 1, 1, '{}', 3),
(258, 37, 'created_at', 'timestamp', 'Створено', 0, 0, 1, 0, 0, 1, '{}', 8),
(259, 37, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(260, 37, 'audience_belongsto_building_relationship', 'relationship', 'Корпус', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Schedule\\\\Building\",\"table\":\"buildings\",\"type\":\"belongsTo\",\"column\":\"building_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"audience_lesson_types\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(261, 37, 'audience_belongsto_audience_type_relationship', 'relationship', 'Тип аудиторії', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Schedule\\\\Lookups\\\\AudienceType\",\"table\":\"audience_types\",\"type\":\"belongsTo\",\"column\":\"audience_type_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"audience_lesson_types\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(262, 38, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(263, 38, 'name', 'text', 'Назва', 0, 0, 0, 0, 0, 0, '{}', 10),
(264, 38, 'position', 'number', 'Номер', 1, 1, 1, 1, 1, 1, '{}', 11),
(265, 38, 'frequency', 'select_dropdown', 'Частота', 1, 1, 1, 1, 1, 1, '{\"default\":\"FULL\",\"options\":{\"FULL\":\"\\u0429\\u043e\\u0442\\u0438\\u0436\\u043d\\u044f\",\"NUMERATOR\":\"\\u0427\\u0438\\u0441\\u0435\\u043b\\u044c\\u043d\\u0438\\u043a\",\"DENOMINATOR\":\"\\u0417\\u043d\\u0430\\u043c\\u0435\\u043d\\u043d\\u0438\\u043a\"}}', 15),
(266, 38, 'day_id', 'text', 'Day Id', 1, 0, 1, 1, 1, 1, '{}', 2),
(267, 38, 'discipline_id', 'text', 'Discipline Id', 1, 0, 1, 1, 1, 1, '{}', 3),
(268, 38, 'audience_id', 'text', 'Audience Id', 0, 0, 1, 1, 1, 1, '{}', 4),
(269, 38, 'lesson_type_id', 'text', 'Lesson Type Id', 0, 0, 1, 1, 1, 1, '{}', 5),
(270, 38, 'period_id', 'text', 'Period Id', 1, 0, 1, 1, 1, 1, '{}', 6),
(271, 38, 'created_at', 'timestamp', 'Створено', 0, 0, 1, 0, 0, 1, '{}', 17),
(272, 38, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 18),
(273, 38, 'lesson_belongsto_day_relationship', 'relationship', 'День', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Schedule\\\\Lookups\\\\Day\",\"table\":\"days\",\"type\":\"belongsTo\",\"column\":\"day_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"audience_lesson_types\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(274, 38, 'lesson_belongsto_audience_relationship', 'relationship', 'Аудиторія', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Schedule\\\\Audience\",\"table\":\"audiences\",\"type\":\"belongsTo\",\"column\":\"audience_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"audience_lesson_types\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(275, 38, 'lesson_belongsto_discipline_relationship', 'relationship', 'Дисципліна', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Education\\\\Discipline\",\"table\":\"disciplines\",\"type\":\"belongsTo\",\"column\":\"discipline_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"audience_lesson_types\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(276, 38, 'lesson_belongsto_lesson_type_relationship', 'relationship', 'Тип заняття', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Schedule\\\\Lookups\\\\LessonType\",\"table\":\"lesson_types\",\"type\":\"belongsTo\",\"column\":\"lesson_type_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"audience_lesson_types\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(277, 38, 'lesson_belongsto_period_relationship', 'relationship', 'Семестр', 0, 0, 1, 1, 1, 1, '{\"scope\":\"semesters\",\"model\":\"App\\\\Models\\\\Lookups\\\\Period\",\"table\":\"periods\",\"type\":\"belongsTo\",\"column\":\"period_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"audience_lesson_types\",\"pivot\":\"0\",\"taggable\":\"0\"}', 16),
(278, 38, 'lesson_belongstomany_group_relationship', 'relationship', 'Групи', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Education\\\\Group\",\"table\":\"groups\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"group_in_lessons\",\"pivot\":\"1\",\"taggable\":\"0\"}', 9),
(279, 38, 'lesson_belongstomany_user_relationship', 'relationship', 'Викладачі', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"professor_in_lessons\",\"pivot\":\"1\",\"taggable\":\"0\"}', 14),
(280, 33, 'audience_type_belongstomany_lesson_type_relationship', 'relationship', 'Типи занять, які можна проводити', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Schedule\\\\Lookups\\\\LessonType\",\"table\":\"lesson_types\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"audience_lesson_types\",\"pivot\":\"1\",\"taggable\":\"0\"}', 4),
(281, 34, 'lesson_type_belongstomany_audience_type_relationship', 'relationship', 'Типи аудиторій, в яких можна проводити заняття', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Schedule\\\\Lookups\\\\AudienceType\",\"table\":\"audience_types\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"audience_lesson_types\",\"pivot\":\"1\",\"taggable\":\"0\"}', 4);

-- --------------------------------------------------------

--
-- Структура таблиці `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'Користувач', 'Користувачі', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-09-04 16:52:48', '2020-05-19 15:48:12'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(3, 'roles', 'roles', 'Роль', 'Ролі', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-09-04 16:52:48', '2020-05-24 08:52:23'),
(4, 'categories', 'categories', 'Категорія новини', 'Категорії новин', 'voyager-categories', 'App\\Models\\Posts\\Category', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-09-06 03:13:33', '2020-05-18 14:50:07'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'App\\Models\\Posts\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', 'App\\Http\\Controllers\\Posts\\PostController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-09-06 03:13:33', '2020-01-19 17:32:40'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'App\\Models\\Pages\\Page', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-09-06 03:13:33', '2020-05-10 10:44:16'),
(8, 'infoblock_types', 'infoblock-types', 'Infoblock Type', 'Infoblock Types', 'voyager-belt', 'App\\Models\\Infoblocks\\InfoblockType', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-01-22 19:07:45', '2020-02-10 19:33:37'),
(9, 'infoblocks', 'infoblocks', 'Infoblock', 'Infoblocks', NULL, 'App\\Models\\Infoblocks\\Infoblock', NULL, 'App\\Http\\Controllers\\WithItemsBase\\BaseWithItemsController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-01-29 17:14:12', '2020-02-18 20:50:45'),
(10, 'infoblock_items', 'infoblock-items', 'Infoblock Item', 'Infoblock Items', NULL, 'App\\Models\\Infoblocks\\InfoblockItem', NULL, 'App\\Http\\Controllers\\WithItemsBase\\BaseItemController', NULL, 1, 0, '{\"order_column\":\"order\",\"order_display_column\":\"title\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-01-30 14:18:22', '2020-02-18 20:56:50'),
(11, 'social_networks', 'social-networks', 'Social Network', 'Social Networks', 'voyager-facebook', 'App\\Models\\SocialNetwork', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-01-30 19:20:36', '2020-05-19 18:09:47'),
(13, 'people_infos', 'people-infos', 'Інформація користувача', 'Інформація користувачів', 'voyager-people', 'App\\Models\\PeopleInfo\\PeopleInfo', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-11 21:05:30', '2020-05-20 16:15:22'),
(14, 'galleries', 'galleries', 'Галерея', 'Галереї', 'voyager-photos', 'App\\Models\\Galleries\\Gallery', NULL, 'App\\Http\\Controllers\\WithItemsBase\\BaseWithItemsController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-12 19:24:14', '2020-05-18 14:53:08'),
(15, 'gallery_images', 'gallery-images', 'Фото галереї', 'Фото галереї', 'voyager-photo', 'App\\Models\\Galleries\\GalleryImage', NULL, 'App\\Http\\Controllers\\WithItemsBase\\BaseItemController', NULL, 1, 0, '{\"order_column\":\"order\",\"order_display_column\":\"caption\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-12 19:27:44', '2020-05-19 15:49:58'),
(16, 'education_degrees', 'education-degrees', 'Освітній ступінь', 'Освітні ступені', 'voyager-file-text', 'App\\Models\\Education\\EducationDegree', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"order\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-28 14:39:45', '2020-05-18 14:50:48'),
(17, 'education_programs', 'education-programs', 'Освітня програма', 'Освітні програми', 'voyager-file-text', 'App\\Models\\Education\\EducationProgram', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"order\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-28 14:44:06', '2020-05-18 14:51:58'),
(18, 'education_specialties', 'education-specialties', 'Освітня спеціальність', 'Освітні спеціальності', 'voyager-file-text', 'App\\Models\\Education\\EducationSpecialty', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-28 14:46:00', '2020-05-18 14:52:23'),
(19, 'people_info_groups', 'people-info-groups', 'Група інформації користувачів', 'Групи інформації користувачів', 'voyager-people', 'App\\Models\\PeopleInfo\\PeopleInfoGroup', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-03-02 19:35:39', '2020-03-02 19:40:35'),
(23, 'disciplines', 'disciplines', 'Дисципліна', 'Дисципліни', 'voyager-book', 'App\\Models\\Education\\Discipline', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-05-18 14:32:50', '2020-05-18 14:32:50'),
(25, 'integration_logs', 'integration-logs', 'Лог інтеграції', 'Логи інтеграції', 'voyager-logbook', 'App\\Integration\\Base\\Models\\IntegrationLog', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-05-18 14:38:20', '2020-05-18 14:38:20'),
(26, 'period_types', 'period-types', 'Тип періоду', 'Типи періодів', 'voyager-alarm-clock', 'App\\Models\\Lookups\\PeriodType', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-05-19 18:11:24', '2020-05-19 18:11:24'),
(27, 'periods', 'periods', 'Період', 'Періоди', 'voyager-alarm-clock', 'App\\Models\\Lookups\\Period', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-05-19 18:12:32', '2020-05-19 18:13:36'),
(28, 'rating_items', 'rating-items', 'Пункт рейтингу', 'Пункти рейтингу', 'voyager-bar-chart', 'App\\Models\\Rating\\RatingItem', NULL, 'App\\Http\\Controllers\\WithItemsBase\\BaseItemController', NULL, 1, 0, '{\"order_column\":\"order\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-05-19 18:15:59', '2020-05-19 18:46:23'),
(29, 'rating_item_groups', 'rating-item-groups', 'Блок пункту рейтингу', 'Блоки пунктів рейтингу', 'voyager-bar-chart', 'App\\Models\\Rating\\RatingItemGroup', NULL, 'App\\Http\\Controllers\\WithItemsBase\\BaseWithItemsController', NULL, 1, 0, '{\"order_column\":\"order\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-05-19 18:17:11', '2020-05-19 18:58:05'),
(30, 'groups', 'groups', 'Навчальна група', 'Навчальні групи', 'voyager-wallet', 'App\\Models\\Education\\Group', NULL, 'App\\Http\\Controllers\\FiltrationVoyagerController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-05-23 17:27:29', '2020-05-24 16:12:03'),
(31, 'user_rating_items', 'user-rating-items', 'Рейтинг студента', 'Рейтинг студентів', 'voyager-bar-chart', 'App\\Models\\Rating\\UserRatingItem', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-05-24 09:55:04', '2020-05-24 10:38:13'),
(32, 'faculties', 'faculties', 'Факультут', 'Факультети', 'voyager-study', 'App\\Models\\Education\\Faculty', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-05-25 13:24:54', '2020-05-25 13:25:33'),
(33, 'audience_types', 'audience-types', 'Тип аудиторії', 'Типи аудиторій', 'voyager-company', 'App\\Models\\Schedule\\Lookups\\AudienceType', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-05-25 13:26:51', '2020-05-25 14:07:46'),
(34, 'lesson_types', 'lesson-types', 'Тип заняття', 'Типи занять', 'voyager-pen', 'App\\Models\\Schedule\\Lookups\\LessonType', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-05-25 13:27:57', '2020-05-25 14:08:41'),
(35, 'days', 'days', 'День', 'Дні', 'voyager-calendar', 'App\\Models\\Schedule\\Lookups\\Day', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"order\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-05-25 13:29:54', '2020-05-25 14:24:59'),
(36, 'buildings', 'buildings', 'Корпус', 'Корпуси', 'voyager-company', 'App\\Models\\Schedule\\Building', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-05-25 13:30:58', '2020-05-25 14:32:35'),
(37, 'audiences', 'audiences', 'Аудиторія', 'Аудиторії', 'voyager-company', 'App\\Models\\Schedule\\Audience', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-05-25 13:33:10', '2020-05-25 13:36:16'),
(38, 'lessons', 'lessons', 'Заняття', 'Заняття', 'voyager-book', 'App\\Models\\Schedule\\Lesson', NULL, 'App\\Http\\Controllers\\FiltrationVoyagerController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-05-25 13:51:18', '2020-05-25 16:08:30');

-- --------------------------------------------------------

--
-- Структура таблиці `days`
--

CREATE TABLE `days` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `days`
--

INSERT INTO `days` (`id`, `name`, `order`) VALUES
(1, 'Понеділок', 1),
(2, 'Вівторок', 2),
(3, 'Середа', 3),
(4, 'Четвер', 4),
(5, 'П\'ятниця', 5),
(6, 'Субота', 6);

-- --------------------------------------------------------

--
-- Структура таблиці `disciplines`
--

CREATE TABLE `disciplines` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `disciplines`
--

INSERT INTO `disciplines` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(2, 'Математичний аналіз', NULL, '2020-05-18 14:45:51', '2020-05-18 14:45:51'),
(3, 'Фізика', NULL, '2020-05-18 14:45:51', '2020-05-18 14:45:51'),
(4, 'Лінійна алгебра та аналітична геометрія', NULL, '2020-05-18 14:45:51', '2020-05-18 14:45:51'),
(5, 'Архітектура комп’ютерів', NULL, '2020-05-18 14:45:51', '2020-05-18 14:45:51'),
(6, 'Іноземна мова', NULL, '2020-05-18 14:45:51', '2020-05-18 14:45:51'),
(7, 'Бази даних', NULL, '2020-05-18 14:45:51', '2020-05-18 14:45:51'),
(8, 'Основи програмної інженерії', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(9, 'Основи програмування', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(10, 'Історія  української державності', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(11, 'Фізичне виховання', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(12, 'Інформаційні технології', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(13, 'Аналіз вимог до ПЗ', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(14, 'Дискретні структури', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(15, 'Теорія ймовірностей', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(16, 'Математична статистика', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(17, 'Алгоритми і структури даних', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(18, 'Архітектура та проектування ПЗ', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(19, 'Безпека програм та даних', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(20, 'Групова динаміка і комунікації', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(21, 'Економіка програмного забезпечення', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(22, 'Емпіричні методи програмної інженерії', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(23, 'Комп\'ютерна дискретна математика', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(24, 'Конструювання програмного забезпечення', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(25, 'Людино-машинна взаємодія', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(26, 'Менеджмент проектів ПЗ', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(27, 'Моделювання та аналіз предметної області', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(28, 'Об\'єктно-орієнтоване програмування', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(29, 'Операційні системи', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(30, 'Організація комп\'ютерних мереж', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(31, 'Технології веб-програмування', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(32, 'Проектний практикум', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(33, 'Професійна практика програмної інженерії', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(34, 'Якість програмного забезпечення та тестування', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(35, 'Навчальна технологічна практика', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(36, 'Переддипломна практика', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(37, 'Етнокультурологія', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(38, 'Програмування мікропроцесорів', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(39, 'Українська мова', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(40, 'Філософія', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(41, 'Безпека життєдіяльності та основи охорони праці', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(42, 'Комп\'ютерна графіка', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(43, 'Логічне програмування', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(44, 'Логіка', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(45, 'Інтелектуальні системи', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(46, 'Крос-платформне програмування', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(47, 'Менеджмент', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(48, 'Програмування мобільних пристроїв', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(49, 'Технології програмування баз даних', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(50, 'Програмування', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(51, 'Історія та культура України', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(52, 'Українська мова (за професійним спрямуванням)', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(53, 'Програмна технологія dot.net', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(54, 'Методи об\'єктно-орієнтованого проектування програмних систем', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(55, 'Технології розподіленого програмування', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(56, 'Безпека праці та життєдіяльності', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(57, 'Правова культура особистості', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(58, 'Організація баз даних', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(59, 'Теорія ймовірностей, ймовірнісних процесів і математична статистика', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(60, 'Захист бакалаврської роботи', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(61, 'Підготовка та захист бакалаврської роботи', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(62, 'Моделювання та прогнозування в сфері природокористування', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(63, 'Об\'єктне моделювання та проектування складних систем', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(64, 'Організація сховищ даних', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(65, 'Математичні методи в системах штучного інтелекту', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(66, 'Розробка веб-застосувань', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(67, 'Робототехнічні системи керування', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(68, 'Надійність функціонування комп\'ютерних систем', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(69, 'Проектування інформаційно-управляючих та інтелектуальних систем', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(70, 'Безпека інформаційно-комунікаційних систем', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(71, 'Ділова іноземна мова', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(72, 'Аграрна політика', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(73, 'Методологія та організація наукових досліджень з основами інтелектуальної власності', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(74, 'Стандартизація та сертифікація інформаційних технологій', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(75, 'Технології Data Mining', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(76, 'Управління інформаційними сервісами', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(77, 'Шаблони об\'єктно-орієнтованого моделювання і програмування', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(78, 'Світові інформаційні ресурси', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(79, 'ГІС та технології в природокористуванні', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(80, 'Управління проектами', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(81, 'Принципи розподіленого і мережевого програмування', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(82, 'Інтелектуальні системи моніторингу довкілля', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(83, 'Мобільні комп\'ютерно інтегровані системи', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(84, 'Методи та інформаційні технології оцінювання ризиків', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(85, 'Науково-виробнича практика', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(86, 'Підготовка та захист магістерської роботи', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(87, 'Апаратно-програмні засоби збору та обробки екологічної інформації', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(88, 'Інформаційні технології моніторингу екологічних і соціально-економічних процесів', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(89, 'Управління контентом та інтеграція інформації у еко-агро системах', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(90, 'Безпека і надійність комп\'ютерних систем', NULL, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(91, 'Освітні технології', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(92, 'Філософія науки', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(93, 'Методи побудови експертних систем', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(94, 'Управління ІТ-інфраструктурою систем моніторингу', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(95, 'Екологічний контроль і безпека', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(96, 'Екологічний менеджмент та аудит', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(97, 'Дослідницька практика', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(98, 'Науково-педагогічна практика', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(99, 'Захист магістерської роботи', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(100, 'Технології BigData', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(101, 'Дипломне проектування', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(102, 'Аерокосмічний моніторинг геосистем', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(103, 'Імітаційне моделювання екологічних процесів', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(104, 'ГІС і технології в екології та природокористуванні', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(105, 'Методи та системи підтримки прийняття рішень в управлінні еколого-економічними процесами', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(106, 'Управління ІТ-інфраструктурою', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(107, 'Моделювання в управлінні виробничими системами', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(108, 'Глобальна економіка', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(109, 'Управлінська економіка', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(110, 'Прикладна економетрика', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(111, 'Інтелектуальний аналіз даних', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(112, 'Моделі раціонального природокористування', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(113, 'Електронна комерція', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(114, 'Аналітика великих даних', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(115, 'Моделі ризик-менеджменту', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(116, 'Моделювання з R', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(117, 'Моделі фінансового менеджменту', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(118, 'Аграрний консалтинг', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(119, 'Статистика в природокористуванні', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(120, 'Управління інвестиційним портфелем', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(121, 'Виробнича практика', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(122, 'Еколого-економічні ризики', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(123, 'Актуарні розрахунки', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(124, 'Державна атестація', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(125, 'Спеціальні розділи математики', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(126, 'ДЗЗ та технології обробки геопросторових даних', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(127, 'Моделювання бізнес-процесів', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(128, 'Еколого-економічне моделювання', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(129, 'Ризики інновацій в аграрному виробництві', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(130, 'Математичні методи дослідження операцій', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(131, 'Технологія створення програмних продуктів', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(132, 'Системний аналіз', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(133, 'Веб-технології та Веб-дизайн', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(134, 'Комп’ютерні мережі', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(135, 'Економіка та бізнес', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(136, 'Методи та системи  штучного інтелекту', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(137, 'Навчальна ознайомча практика з інформаційних систем', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(138, 'Вища математика', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(139, 'Історія України', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(140, 'Електротехніка та електроніка', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(141, 'Комп\'ютерна схемотехніка та архітектура комп\'ютерів', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(142, 'Навчальна практика з технології виробництва та переробки сільськогосподарської продукції', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(143, 'Навчальна ознайомча практика з інформаційних технологій', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(144, 'Дискретна математика', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(145, 'Чисельні методи', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(146, 'Теорія алгоритмів', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(147, 'Моделювання систем', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(148, 'Технічні засоби передачі інформації', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(149, 'Екологія', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(150, 'Статистичні методи, теорія потоків, подій', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(151, 'Технології розподілених систем та паралельних обчислень', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(152, 'Теорія прийняття рішень', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(153, 'Проектування інформаційних систем', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(154, 'Управління ІТ-проектами', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(155, 'Теорія розпізнавання образів та класифікації в системах штучного інтелекту', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(156, 'Технології захисту інформації', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(157, 'Мікропроцесорні системи управління', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(158, 'Системи комп\'ютерного еколого-економічного моніторингу', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(159, 'Технології комп\'ютерного проектування', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(160, 'Програмування мобільних додатків', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(161, 'Засоби мультимедіа в інформаційних технологіях', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(162, 'Технології розробки інформаційних управляючих систем', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(163, 'Сучасна теорія управління', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(164, 'Інформаційні  технології моніторингу довкілля', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(165, 'Вступ до фаху', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(166, 'Типові технологічні об\'єкти, технології і процеси сільськогосподарського виробництва', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(167, 'Безпека життєдіяльності', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(168, 'Алгоритмізація і програмування', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(169, 'Комп\'ютерна схемотехніка (елементи і схеми комп\'ютерних систем)', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(170, 'Організація баз даних та знань', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(171, 'Системи  і технології управління базами даних', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(172, 'Електрифіковані технології у сільськогосподарському виробництві', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(173, 'Теорія ймовірностей, ймовірнісних процесів і математичної статистики', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(174, 'Комп\'ютерні мережі (локальні, корпоративні, глобальні)', NULL, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(175, 'Політологія', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(176, 'Теорія інформації', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(177, 'Інформаційні управляючі системи та технології АПК', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(178, 'Правознавство', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(179, 'Основи охорони праці', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(180, 'Дипломне проектування', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(181, 'Методи та засоби комп\'ютерних  інформаційних технологій', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(182, 'Історія української культури', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(183, 'Релігієзнавство', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(184, 'Інформаційне право', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(185, 'Алгоритми та методи обчислень', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(186, 'Комп\'ютерна логіка', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(187, 'Системне програмування', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(188, 'Комп’ютерна схемотехніка', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(189, 'Комп’ютерна електроніка', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(190, 'Системне програмне забезпечення', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(191, 'Комп’ютерні системи', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(192, 'Інженерія програмного забезпечення', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(193, 'Психологія', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(194, 'Паралельні та розподілені обчислення', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(195, 'Технології проектування комп’ютерних систем', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(196, 'Захист інформації у комп’ютерних системах', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(197, 'Вбудовані комп’ютерні системи в АПК', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(198, 'Апаратно-програмні засоби ГІС', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(199, 'Програмування в середовищі сучасних ОС', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(200, 'Мобільні комп’ютерні системи', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(201, 'Історія української державності', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(202, 'Лінійна алгебра', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(203, 'Навчальна ознайомча з комп`ютерних технологій', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(204, 'Навчальна технологічна практика з баз даних та об\'єктно-орієнтованого програмування', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(205, 'Сучасна економічна теорія', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(206, 'Математика для економістів: вища математика', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(207, 'Інформатика', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(208, 'Сучасні інформаційні комунікації', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(209, 'Технологія зберігання, переробки тa стандартизація сільськогосподарської продукції', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(210, 'Економічна кібернетика', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(211, 'Навчальна практика з інформатики', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(212, 'Навчальна практика з технологій виробництва продукції тваринництва', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(213, 'Навчальна практика з технологій виробництва продукції рослинництва', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(214, 'Навчальна  практика із сучасних інформаційних комунікацій', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(215, 'Технологія виробництва продукції тваринництва', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(216, 'Мікроекономіка', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(217, 'Теорія ймовірностей і математична статистика', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(218, 'Оптимізаційні методи та моделі', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(219, 'Гроші і кредит', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(220, 'Макроекономіка', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(221, 'Статистика', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(222, 'Бухгалтерський облік', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(223, 'Дослідження операцій-І', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(224, 'Навчальна практика з технологій створення програмних продуктів', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(225, 'Дослідження операцій-ІІ', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(226, 'Ризикологія', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(227, 'Економетрика', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(228, 'Аналітика з R', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(229, 'Маркетинг', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(230, 'Технологія проектування та адміністрування БД і СД', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(231, 'Веб-програмування', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(232, 'Математичні моделі аграрного сектору', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(233, 'Дослідження операцій-ІІІ', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(234, 'Економіка праці і соціально-трудові відносини', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(235, 'Економіка підприємства', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(236, 'Моделювання економіки', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(237, 'Навчальна практика з технологій проектування та адміністрування БД та СД', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(238, 'Навчальна практика з веб-програмування', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(239, 'Навчальна практика з математичних  моделей аграрного сектору', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(240, 'Комп\'ютерне програмування', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(241, 'Регіональна економіка', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(242, 'Дослідження операцій', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(243, 'Навчальна практика з ІТ', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(244, 'Навчальна практика з комп\'ютерного програмування', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(245, 'Технологія проектування та адміністрування БД та СП', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(246, 'Економіко-математичні моделі в АПК', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(247, 'Навчальна практика з економіко-математичних моделей в АПК', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(248, 'Прогнозування соціально-економічних процесів', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(249, 'Фінанси', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(250, 'Інформаційні системи і технології в управлінні', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(251, 'Моделі економічної динаміки', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(252, 'Управління проектами інформатизації', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(253, 'Міжнародна економіка', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(254, 'Системний аналіз і проектування ІС', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(255, 'Системи прийняття рішень', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(256, 'Комп\'ютерні мережі', NULL, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(257, 'Психологія і педагогіка', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(258, 'Організація і планування виробництва в аграрних формуваннях', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(259, 'Інструментальні засоби IBM SPSS', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(260, 'Навчальна практика з програмування', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(261, 'Навчальна ознайомча практика з автоматизованих технологій в АПК', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(262, 'Навчальна практика з техніки і технологій в АПК', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(263, 'Спеціалізовані комп\'ютери', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(264, 'Цифрова схемотехніка спеціалізованих пристроїв', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(265, 'Теорія електричних та магнітних кіл', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(266, 'Техніка і технології в АПК', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(267, 'Філософiя', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(268, 'Навчальна технологічна практика з комп\'ютерної електроніки', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(269, 'Навчальна технологічна практика з інженерії програмного забезпечення', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(270, 'Технології програмування комп\'ютерних систем', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(271, 'Навчальна ознайомча практика з програмування', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(272, 'Комп\'ютерні системи об\'єктів сільськогосподарського виробництва', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(273, 'Мікроцесорні системи керування', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(274, 'Основи ГІС та ДЗЗ', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(275, 'Навчальна технологічна практика з інформаційних технологій', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(276, 'Імітаційне моделювання', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(277, 'Основи біржової діяльності', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(278, 'Кількісні методи в економіці', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(279, 'Психологія та педагогіка', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(280, 'Політична економія', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(281, 'Університетська освіта', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(282, 'Історія економіки та економічної думки', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(283, 'Суспільні комунікації', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(284, 'Технологія виробництва продукції рослинництва', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(285, 'Навчальна практика з суспільних комунікацій', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(286, 'Соціологія', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(287, 'Комплексна курсова робота з економіки підприємства та статистики', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(288, 'Державний екзамен з фахових дисциплін', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(289, 'Економіко-математичні моделі в управлінні та економіці', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(290, 'Теорія випадкових процесів', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(291, 'Навчальна практика з економіко-математичних моделей в управлінні та економіці', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(292, 'Економічний аналіз', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(293, 'Організація виробництва', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(294, 'Автоматизовані системи  опрацювання інформації', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(295, 'Програмування Java', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(296, 'Системи масового обслуговування', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(297, 'Інформаційні системи і  технології в управлінській діяльності', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(298, 'Методи агроекологічної оцінки земель', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(299, 'Проектно-технологічна практика', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(300, 'Безпека праці і життєдіяльності', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(301, 'Інформаційні системи і технології на підприємствах', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(302, 'Теорія і проектування комп\'ютерних систем і мереж', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(303, 'Інформаційні технології моніторингу довкілля', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(304, 'Економічна теорія', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(305, 'Діловий протокол та етика спілкування', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(306, 'Технології виробництва продукції рослинництва і тваринництва', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(307, 'Інтелектуальний аналіз даних на основі методів штучного інтелекту', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(308, 'Дослідницька практика  за темою магістерської роботи', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(309, 'Цифрова економіка', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(310, 'Технологія виробництва, переробки та зберігання сільськогосподарської продукції', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(311, 'Теорія ймовірності і математична статистика', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(312, 'Захист інформації в комп\'ютерних системах і кібербезпека (частина 1)', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(313, 'Робототехнічні операційні системи', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(314, 'Захист інформації в комп\'ютерних системах і кібербезпека (частина 2)', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(315, 'Системи візуалізації та розпізнавання образів', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(316, 'Комп\'ютерні системи штучного інтелекту', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(317, 'Технології проектування систем ІоТ', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(318, 'Протоколи передачі даних в ІоТ системах', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(319, 'Інформаційні технології моніторингу та моделювання довкілля', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(320, 'Економіка та менеджмент проектів програмного забезпечення', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(321, 'Цифрова обробка сигналів та зображень', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(322, 'Високопродуктивні комп’ютерні системи', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(323, 'Програмне забезпечення вбудованих систем', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(324, 'Управління програмними проектами', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(325, 'Теорія формальних мов і компіляція', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(326, 'Програмування систем штучного інтелекту', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(327, 'Правовий захист програмних засобів', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(328, 'Управління контентом', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(329, 'Якість програмного забезпечення', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(330, 'Основи ГІС', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(331, 'Електротехніка і електромеханіка', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(332, 'Комп\'ютерні технології в АПК', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(333, 'Захист інформації', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(334, 'Соцiологiя', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(335, 'АРМ бухгалтера', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(336, 'Технологія виробництва, переробки та зберігання с.г. продукції', NULL, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(337, 'Психологія успіху', NULL, '2020-05-18 14:45:56', '2020-05-18 14:45:56'),
(338, 'Інформаційна безпека держави', NULL, '2020-05-18 14:45:56', '2020-05-18 14:45:56'),
(339, 'Сучасні технології програмування', NULL, '2020-05-18 14:45:56', '2020-05-18 14:45:56'),
(340, 'Мікроконтролерні системи', NULL, '2020-05-18 14:45:56', '2020-05-18 14:45:56'),
(341, 'Методологія наукових досліджень з основами інтелектуальної власності', NULL, '2020-05-18 14:45:56', '2020-05-18 14:45:56'),
(342, 'Технології блок-чейн', NULL, '2020-05-18 14:45:56', '2020-05-18 14:45:56'),
(343, 'Методологія та організація наукових досліджень', NULL, '2020-05-18 14:45:56', '2020-05-18 14:45:56');

-- --------------------------------------------------------

--
-- Структура таблиці `education_degrees`
--

CREATE TABLE `education_degrees` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `education_degrees`
--

INSERT INTO `education_degrees` (`id`, `name`, `slug`, `description`, `image`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Бакалавр', 'bakalavr', NULL, 'education-degrees\\February2020\\2VVii0l3esXa6fD0uZ10.jpg', 0, '2020-02-29 08:12:34', '2020-02-29 08:12:34'),
(2, 'Магістр', 'magistr', NULL, 'education-degrees\\February2020\\rCHSKAKlokOl4wjYmhqY.png', 0, '2020-02-29 08:13:07', '2020-02-29 08:13:07');

-- --------------------------------------------------------

--
-- Структура таблиці `education_programs`
--

CREATE TABLE `education_programs` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `education_degree_id` int(10) UNSIGNED DEFAULT NULL,
  `education_specialty_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `education_programs`
--

INSERT INTO `education_programs` (`id`, `name`, `slug`, `description`, `info_body`, `image`, `order`, `education_degree_id`, `education_specialty_id`, `created_at`, `updated_at`) VALUES
(1, 'Інженерія програмного забезпечення', 'inzheneriya-programnogo-zabezpechennya', NULL, '<p style=\"text-align: center;\"><strong>Програмні результати навчання</strong></p>\r\n<ol>\r\n<li>Знати і системно застосовувати методи аналізу та моделювання прикладної області, виявлення інформаційних потреб і збору вихідних даних для проектування програмного забезпечення.</li>\r\n<li>Обґрунтовувати вибір методів формування вимог до програмної системи, розробляти, аналізувати та систематизувати вимоги.</li>\r\n<li>Знати і застосовувати базові концепції і методології моделювання інформаційних процесів.</li>\r\n<li>Розробляти і оцінювати стратегії проектування програмних засобів; обґрунтовувати, аналізувати і оцінювати прийняті проектні рішення з точки зору якості кінцевого програмного продукту.</li>\r\n<li>Аналізувати, оцінювати і вибирати методи, сучасні програмно-апаратні інструментальні та обчислювальні засоби, технології, алгоритмічні та програмні рішення для ефективного виконання конкретних виробничих задач з програмної інженерії.</li>\r\n<li>Обґрунтовано вибирати парадигми і мови програмування для вирішення прикладних завдань; застосовувати на практиці системні та спеціалізовані засоби, компонентні технології (платформи) та інтегровані середовища розробки програмного забезпечення.</li>\r\n<li>Проводити аналітичне дослідження параметрів функціонування програмних систем для їх валідації та верифікації, а також проводити аналіз обраних методів, засобів автоматизованого проектування та реалізації програмного забезпечення.</li>\r\n<li>Знати і застосовувати сучасні професійні стандарти і інші нормативно-правові документи з інженерії програмного забезпечення.</li>\r\n<li>Вміти приймати організаційно-управлінські рішення в умовах невизначеності.</li>\r\n<li>Застосовувати моделі і методи оцінювання та забезпечення якості на всіх стадіях життєвого циклу програмного забезпечення.</li>\r\n<li>Керувати якістю процесу розробки програмних продуктів з урахуванням умов виробництва та загальноприйнятих міжнародних стандартів.</li>\r\n<li>Застосо вувати прикладні методи аналізу вимог, проектування та реалізації складних програмних систем.</li>\r\n<li>Проводити теоретичні та експериментальні досліджень щодо тестування, верифікації й валідації програмних продуктів.</li>\r\n<li>Виконувати підтримку корпоративних інформаційних систем на всіх етапах їх життєвого циклу.</li>\r\n<li>Застосовувати знання та вміння з фізичного виховання</li>\r\n</ol>', 'education-programs\\February2020\\pIuf2ndx6Kttn5VAoUFR.jpg', 0, 1, 4, '2020-02-29 08:28:12', '2020-02-29 08:29:25'),
(2, 'Комп’ютерні науки', 'komp-yuterni-nauki', NULL, '<p style=\"text-align: center;\"><strong>Програмні результати навчання</strong></p>\r\n<ul>\r\n<li>ПР1. Застосовувати знання основних форм і законів абстрактно-логічного мислення, основ методології наукового пізнання, форм і методів вилучення, аналізу, обробки та синтезу інформації в предметній області комп\'ютерних наук.</li>\r\n<li>ПР2. Використовувати сучасний математичний апарат неперервного та дискретного аналізу, лінійної алгебри, аналітичної геометрії, в професійній діяльності для розв&rsquo;язання задач теоретичного та прикладного характеру в процесі проектування та реалізації об&rsquo;єктів інформатизації.</li>\r\n<li>ПР3. Використовувати знання закономірностей випадкових явищ, їх властивостей та операцій над ними, моделей випадкових процесів та сучасних програмних середовищ для розв&rsquo;язування задач статистичної обробки даних і побудови прогнозних моделей.</li>\r\n<li>ПР4. Використовувати методи обчислювального інтелекту, машинного навчання, нейромережевої та нечіткої обробки даних, генетичного та еволюційного програмування для розв&rsquo;язання задач розпізнавання, прогнозування, класифікації, ідентифікації об&rsquo;єктів керування тощо.</li>\r\n<li>ПР5. Проектувати, розробляти та аналізувати алгоритми розв&rsquo;язання обчислювальних та логічних задач, оцінювати ефективність та складність алгоритмів на основі застосування формальних моделей алгоритмів та обчислюваних функцій.</li>\r\n<li>ПР6. Використовувати методи чисельного диференціювання та інтегрування функцій, розв\'язання звичайних диференціальних та інтегральних рівнянь, особливостей чисельних методів та можливостей їх адаптації до інженерних задач, мати навички програмної реалізації чисельних методів.</li>\r\n<li>ПР7. Розуміти принципи моделювання організаційнотехнічних систем і операцій; використовувати методи дослідження операцій, розв&rsquo;язання одно&ndash; та багатокритеріальних оптимізаційних задач лінійного, цілочисельного, нелінійного, стохастичного програмування.</li>\r\n<li>ПР8. Використовувати методологію системного аналізу об&rsquo;єктів, процесів і систем для задач аналізу, прогнозування, управління та проектування динамічних процесів в макроекономічних, технічних, технологічних і фінансових об&rsquo;єктах.</li>\r\n<li>ПР9. Розробляти програмні моделі предметних середовищ, вибирати парадигму програмування з позицій зручності та якості застосування для реалізації методів та алгоритмів розв&rsquo;язання задач в галузі комп&rsquo;ютерних наук.</li>\r\n<li>ПР10. Використовувати інструментальні засоби розробки клієнт-серверних застосувань, проектувати концептуальні, логічні та фізичні моделі баз даних, розробляти та оптимізувати запити до них, створювати розподілені бази даних, сховища та вітрини даних, бази знань, у тому числі на хмарних сервісах, із застосуванням мов веб-програмування.</li>\r\n<li>ПР11. Володіти навичками управління життєвим циклом програмного забезпечення, продуктів і сервісів інформаційних технологій відповідно до вимог і обмежень замовника, вміти розробляти проектну документацію (техніко-економічне обґрунтування, технічне завдання, бізнес-план, угоду, договір, контракт).</li>\r\n<li>ПР12. Застосовувати методи та алгоритми обчислювального інтелекту та інтелектуального аналізу даних в задачах класифікації, прогнозування, кластерного аналізу, пошуку асоціативних правил з використаннямпрограмних інструментів підтримки багатовимірного аналізу даних на основі технологій DataMining, TextMining, WebMining.</li>\r\n<li>ПР13. Володіти мовами системного програмування та методами розробки програм, що взаємодіють з компонентами комп&rsquo;ютерних систем.</li>\r\n<li>ПР14. Знати мережні технології, архітектури комп&rsquo;ютерних мереж, мати практичні навички технології адміністрування комп&rsquo;ютерних мереж та їх програмного забезпечення</li>\r\n<li>ПР15. Застосовувати знання методології та CASE-засобів проектування складних систем, методів структурного аналізу систем, об\'єктно-орієнтованої методології проектування при розробці і дослідженні функціональних моделей організаційно-економічних і виробничотехнічних систем.</li>\r\n<li>ПР16. Розуміти концепцію інформаційної безпеки, принципи безпечного проектування програмного забезпечення, забезпечувати безпеку комп&rsquo;ютерних мереж в умовах неповноти та невизначеності вихідних даних.</li>\r\n<li>ПР17. Виконувати паралельні та розподілені обчислення, застосовувати чисельні методи та алгоритми для паралельних структур, мови паралельного програмування при розробці та експлуатації паралельного та розподіленого програмного забезпечення.</li>\r\n</ul>', 'education-programs\\February2020\\GhTE5LpC1d7OCjiZZCzw.jpg', 0, 1, 3, '2020-02-29 08:32:21', '2020-02-29 08:32:21'),
(3, 'Комп’ютерна інженерія', 'komp-yuterna-inzheneriya', NULL, '<p style=\"text-align: center;\"><strong>Програмні результати навчання</strong></p>\r\n<ol>\r\n<li>Знати і розуміти наукові і математичні положення, що лежать в основі функціонування комп&rsquo;ютерних засобів, систем та мереж.</li>\r\n<li>Знати основи професійно-орієнтованих дисциплін спеціальності.</li>\r\n<li>Мати знання та навички щодо проведення експериментів, збору даних та моделювання в комп&rsquo;ютерних системах.</li>\r\n<li>Мати знання з новітніх технологій в галузі комп&rsquo;ютерної інженерії.</li>\r\n<li>Знати та розуміти вплив технічних рішень в суспільному, економічному, соціальному і екологічному контексті.</li>\r\n<li>Вміти застосовувати знання для ідентифікації, формулювання і розв&rsquo;язування технічних задач спеціальності, використовуючи відомі методи.</li>\r\n<li>Вміти застосовувати знання для розв&rsquo;язування задач аналізу та синтезу засобів, характерних для спеціальності.</li>\r\n<li>Вміти системно мислити та застосовувати творчі здібності до формування принципово нових ідей.</li>\r\n<li>Вміти застосовувати знання технічних характеристик, конструктивних особливостей, призначення і правил експлуатації програмно-технічних засобів комп&rsquo;ютерних систем та мереж для вирішення технічних задач спеціальності.</li>\r\n<li>Вміти розробляти системне і прикладне програмне забезпечення для вбудованих і розподілених застосувань, мобільних систем, розраховувати, експлуатувати, типове для спеціальності обладнання.</li>\r\n<li>Вміти здійснювати пошук інформації в різних джерелах для розв&rsquo;язання задач комп&rsquo;ютерної інженерії.</li>\r\n<li>Вміти ефективно працювати як самостійно, так і у складі команди.</li>\r\n<li>Вміти ідентифікувати, класифікувати та описувати роботу комп&rsquo;ютерних систем та їх компонентів.</li>\r\n<li>Вміти поєднувати теорію і практику, а також приймати рішення та виробляти стратегію діяльності для вирішення завдань спеціальності з урахуванням загальнолюдських цінностей, суспільних, державних та виробничих інтересів.</li>\r\n<li>Вміти виконувати експериментальні дослідження за професійною тематикою.</li>\r\n<li>Вміти оцінювати отримані результати та аргументовано захищати прийняті рішення.</li>\r\n<li>Вміння спілкуватись, включаючи усну та письмову комунікацію українською мовою та однією з іноземних мов (англійською, німецькою, італійською, французькою, іспанською).</li>\r\n<li>Вміння використовувати інформаційні технології та інші методи для ефективного спілкування на професійному та соціальному рівнях.</li>\r\n<li>Здатність адаптуватись до нових ситуацій, обґрунтовувати, приймати та реалізовувати у межах компетенції рішення.</li>\r\n<li>Усвідомлювати необхідність навчання впродовж усього життя з метою поглиблення набутих та здобуття нових фахових знань, удосконалення креативного мислення, усвідомлювати необхідність ведення здорового способу життя.</li>\r\n<li>Відповідально ставитись до виконуваної роботи та досягати поставленої мети з дотриманням вимог професійної етики.&nbsp;</li>\r\n</ol>', 'education-programs\\February2020\\nfToNbcgI244mOTr3EQh.jpg', 0, 1, 5, '2020-02-29 08:35:01', '2020-02-29 08:35:01'),
(4, 'Економічна кібернетика', 'ekonomichna-kibernetika', NULL, '<p style=\"text-align: center;\"><strong>Програмні результати навчання</strong></p>\r\n<ol>\r\n<li>Знати та використовувати економічну термінологію, пояснювати базові концепції мікро- та макроекономіки.</li>\r\n<li>Демонструвати стійке розуміння принципів економічної науки, особливостей функціонування економічних систем.</li>\r\n<li>Використовувати аналітичний та методичний інструментарій для розуміння логіки прийняття господарчих рішень різними економічними агентами (індивідуумами, домогосподарствами, підприємствами та органами дер жавної влади).</li>\r\n<li>Використовувати професійну аргументацію для донесення інформації, ідей, проблем та способів їх вирішення до фахівців і нефахівців у сфері економічної діяльності.</li>\r\n<li>Пояснювати моделі соціально-економічних явищ з погляду фундаментальних принципів і знань на основі розуміння основних напрямів розвитку економічної науки.</li>\r\n<li>Застосовувати відповідні економіко-математичні методи та моделі для вирішення економічних задач.</li>\r\n<li>Проводити аналіз функціонування та розвитку суб&rsquo;єктів господарювання, визначати функціональні сфери, розраховувати відповідні показники які характеризують результативність їх діяльності.</li>\r\n<li>Вміти аналізувати процеси державного та ринкового регулювання соціально-економічних і трудових відносин</li>\r\n<li>Спроможність розробляти та впроваджувати оптимальні рішення щодо управління розвитком суб\'єктів економічної діяльності мікро та макрорівнів на основі використання сучасного економіко-математичного інструментарію.</li>\r\n<li>Вміти працювати як самостійно, так і в команді.</li>\r\n<li>Розуміти та планувати можливості особистого професійного розвитку.</li>\r\n<li>Демонструвати базові навички креативного та критичного мислення у дослідженнях та професійному спілкуванні.</li>\r\n<li>Розуміти та самостійно формувати зміст, структуру і висновки наукових та аналітичних текстів з економіки.</li>\r\n<li>Виконувати міждисциплінарний аналіз соціально-економічних явищ і проблем в однієї або декількох професійних сферах.</li>\r\n<li>Використовувати нормативні та правові акти, що регламентують професійну діяльність.</li>\r\n<li>Володіти іноземною мовою, використовувати інформаційні та комунікаційні технології для вирішення соціально-економічних завдань, підготовки та представлення аналітичних звітів.</li>\r\n<li>Демонструвати вміння абстрактно мислити застосовувати аналіз тасинтез для виявлення ключових характеристик економічних систем різного рівня, а також особливостей поведінки їх суб&rsquo;єктів.</li>\r\n<li>Демонструвати гнучкість та адаптивність у нових ситуаціях, у роботі із новими об&rsquo;єктами, та у невизначених умовах.</li>\r\n<li>Демонструвати здатність діяти соціально відповідально та свідомо на основі етичних мотивів, поваги до різноманіття думок, індивідуальних та міжкультурних відмінностей людей.</li>\r\n<li>Розробляти та впроваджувати оптимальні рішення щодо управління розвитком суб\'єктів економічної діяльності мікро та макрорівнів на основі використання сучасного економікоматематичного інструментарію</li>\r\n</ol>', 'education-programs\\February2020\\YCkyvkhVbeNaaDEPDux5.jpg', 0, 1, 1, '2020-02-29 08:37:39', '2020-02-29 08:37:39'),
(5, 'Комп’ютерні науки 2', 'komp-yuterni-nauki-2', NULL, '<p style=\"text-align: center;\"><strong>Програмні результати навчання</strong></p>\r\n<ul>\r\n<li>ПР1. Застосовувати знання основних форм і законів абстрактно-логічного мислення, основ методології наукового пізнання, форм і методів вилучення, аналізу, обробки та синтезу інформації в предметній області комп\'ютерних наук.</li>\r\n<li>ПР2. Використовувати сучасний математичний апарат неперервного та дискретного аналізу, лінійної алгебри, аналітичної геометрії, в професійній діяльності для розв&rsquo;язання задач теоретичного та прикладного характеру в процесі проектування та реалізації об&rsquo;єктів інформатизації.</li>\r\n<li>ПР3. Використовувати знання закономірностей випадкових явищ, їх властивостей та операцій над ними, моделей випадкових процесів та сучасних програмних середовищ для розв&rsquo;язування задач статистичної обробки даних і побудови прогнозних моделей.</li>\r\n<li>ПР4. Використовувати методи обчислювального інтелекту, машинного навчання, нейромережевої та нечіткої обробки даних, генетичного та еволюційного програмування для розв&rsquo;язання задач розпізнавання, прогнозування, класифікації, ідентифікації об&rsquo;єктів керування тощо.</li>\r\n<li>ПР5. Проектувати, розробляти та аналізувати алгоритми розв&rsquo;язання обчислювальних та логічних задач, оцінювати ефективність та складність алгоритмів на основі застосування формальних моделей алгоритмів та обчислюваних функцій.</li>\r\n<li>ПР6. Використовувати методи чисельного диференціювання та інтегрування функцій, розв\'язання звичайних диференціальних та інтегральних рівнянь, особливостей чисельних методів та можливостей їх адаптації до інженерних задач, мати навички програмної реалізації чисельних методів.</li>\r\n<li>ПР7. Розуміти принципи моделювання організаційнотехнічних систем і операцій; використовувати методи дослідження операцій, розв&rsquo;язання одно&ndash; та багатокритеріальних оптимізаційних задач лінійного, цілочисельного, нелінійного, стохастичного програмування.</li>\r\n<li>ПР8. Використовувати методологію системного аналізу об&rsquo;єктів, процесів і систем для задач аналізу, прогнозування, управління та проектування динамічних процесів в макроекономічних, технічних, технологічних і фінансових об&rsquo;єктах.</li>\r\n<li>ПР9. Розробляти програмні моделі предметних середовищ, вибирати парадигму програмування з позицій зручності та якості застосування для реалізації методів та алгоритмів розв&rsquo;язання задач в галузі комп&rsquo;ютерних наук.</li>\r\n<li>ПР10. Використовувати інструментальні засоби розробки клієнт-серверних застосувань, проектувати концептуальні, логічні та фізичні моделі баз даних, розробляти та оптимізувати запити до них, створювати розподілені бази даних, сховища та вітрини даних, бази знань, у тому числі на хмарних сервісах, із застосуванням мов веб-програмування.</li>\r\n<li>ПР11. Володіти навичками управління життєвим циклом програмного забезпечення, продуктів і сервісів інформаційних технологій відповідно до вимог і обмежень замовника, вміти розробляти проектну документацію (техніко-економічне обґрунтування, технічне завдання, бізнес-план, угоду, договір, контракт).</li>\r\n<li>ПР12. Застосовувати методи та алгоритми обчислювального інтелекту та інтелектуального аналізу даних в задачах класифікації, прогнозування, кластерного аналізу, пошуку асоціативних правил з використаннямпрограмних інструментів підтримки багатовимірного аналізу даних на основі технологій DataMining, TextMining, WebMining.</li>\r\n<li>ПР13. Володіти мовами системного програмування та методами розробки програм, що взаємодіють з компонентами комп&rsquo;ютерних систем.</li>\r\n<li>ПР14. Знати мережні технології, архітектури комп&rsquo;ютерних мереж, мати практичні навички технології адміністрування комп&rsquo;ютерних мереж та їх програмного забезпечення</li>\r\n<li>ПР15. Застосовувати знання методології та CASE-засобів проектування складних систем, методів структурного аналізу систем, об\'єктно-орієнтованої методології проектування при розробці і дослідженні функціональних моделей організаційно-економічних і виробничотехнічних систем.</li>\r\n<li>ПР16. Розуміти концепцію інформаційної безпеки, принципи безпечного проектування програмного забезпечення, забезпечувати безпеку комп&rsquo;ютерних мереж в умовах неповноти та невизначеності вихідних даних.</li>\r\n<li>ПР17. Виконувати паралельні та розподілені обчислення, застосовувати чисельні методи та алгоритми для паралельних структур, мови паралельного програмування при розробці та експлуатації паралельного та розподіленого програмного забезпечення.</li>\r\n</ul>', 'education-programs\\March2020\\MyqUNdG5nL6Cam6MVK5k.jpg', 0, 1, 3, '2020-03-01 13:20:59', '2020-03-01 13:20:59');

-- --------------------------------------------------------

--
-- Структура таблиці `education_specialties`
--

CREATE TABLE `education_specialties` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `education_specialties`
--

INSERT INTO `education_specialties` (`id`, `name`, `code`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Економіка (Економічна кібернетика)', '051', 'Економіка з нахилом на бізнес аналітику', '2020-02-29 07:38:20', '2020-02-29 07:38:30'),
(2, 'Економіка (Цифрова економіка)', '051', 'Економіка з нахилом на інформаційні технології', '2020-02-29 07:39:00', '2020-02-29 07:40:34'),
(3, 'Комп’ютерні науки', '122', 'Фахівець з інформаційних технологій', '2020-02-29 07:39:21', '2020-02-29 07:39:21'),
(4, 'Інженерія програмного забезпечення', '121', 'Фахівець з розробки та тестування програмного забезпечення', '2020-02-29 07:39:47', '2020-02-29 07:39:47'),
(5, 'Комп’ютерна інженерія', '123', 'Фахівець з інформаційних технологій', '2020-02-29 07:40:05', '2020-02-29 07:40:05'),
(6, 'Кібербезпека', '125', 'Фахівець з організації інформаційної безпеки', '2020-02-29 07:40:24', '2020-02-29 07:40:24');

-- --------------------------------------------------------

--
-- Структура таблиці `faculties`
--

CREATE TABLE `faculties` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `faculties`
--

INSERT INTO `faculties` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Факультет інформаційних технологій', '2020-05-25 14:12:43', '2020-05-25 14:12:43'),
(2, 'Факультет захисту рослин, екології і біотехнологій', '2020-05-25 14:13:07', '2020-05-25 14:13:07');

-- --------------------------------------------------------

--
-- Структура таблиці `galleries`
--

CREATE TABLE `galleries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `galleries`
--

INSERT INTO `galleries` (`id`, `name`, `slug`, `title`, `sub_title`, `created_at`, `updated_at`) VALUES
(1, 'Кафедра інформаційних систем', 'kafedra-informacijnih-sistem', 'Галерея', '', '2020-02-12 19:33:00', '2020-02-18 20:40:19');

-- --------------------------------------------------------

--
-- Структура таблиці `gallery_images`
--

CREATE TABLE `gallery_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gallery_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `gallery_images`
--

INSERT INTO `gallery_images` (`id`, `gallery_id`, `image`, `caption`, `order`, `created_at`, `updated_at`) VALUES
(1, 1, 'gallery-images\\February2020\\pEfOURHazK4fVmWank06.jpg', '1', 1, '2020-02-18 19:44:26', '2020-03-28 12:27:10'),
(2, 1, 'gallery-images\\February2020\\xouDymoKrMCpUNeTWf7B.jpg', '2', 2, '2020-02-18 19:59:41', '2020-03-28 12:27:10'),
(3, 1, 'gallery-images\\February2020\\DxVMO34Mxi1mfGM5TNON.jpg', '3', 3, '2020-02-18 20:07:14', '2020-02-18 20:23:17'),
(4, 1, 'gallery-images\\February2020\\rbzUczjSNgbfMemube1C.jpg', '4', 4, '2020-02-18 20:12:42', '2020-02-18 20:23:17');

-- --------------------------------------------------------

--
-- Структура таблиці `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `introduction_year` int(10) UNSIGNED DEFAULT NULL,
  `starosta_id` bigint(20) UNSIGNED DEFAULT NULL,
  `education_program_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Дамп даних таблиці `groups`
--

INSERT INTO `groups` (`id`, `name`, `introduction_year`, `starosta_id`, `education_program_id`, `created_at`, `updated_at`) VALUES
(1, 'ІПЗ-16006б', 2016, NULL, NULL, '2020-05-18 09:11:18', '2020-05-24 09:49:02'),
(2, 'ІПЗ-16007ск', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(3, 'ІУСТ-16001мОН', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(4, 'ІУСТ-16001мОП', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(5, 'ІУСТ-17001мОП', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(6, 'ЕкК-1403-англ', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(7, 'ЕКК-1403-З-інд', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(8, 'ЕкК-1403-укр', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(9, 'ЕкК-1507-англ', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(10, 'ЕКК-1507-З-інд', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(11, 'ЕкК-1507-укр', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(12, 'ЕкК-16003мОН', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(13, 'ЕкК-16003мОП', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(14, 'ЕкК-16004б', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(15, 'ЕкК-17003б', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(16, 'ЕКК-17003мОП', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(17, 'КІ-1502бск-З', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(18, 'КІ-1503', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(19, 'КІ-1504ск', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(20, 'КІ-16007б', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(21, 'КІ-16008ск', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(22, 'КІ-17006б-1', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(23, 'КІ-17006б-2', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(24, 'КІ-17007бск', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(25, 'КЕЕМ-16002мОП', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(26, 'КЕЕМ-17002м', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(27, 'КЕЕМ-17002мОП', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(28, 'КН-1301-З', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(29, 'КН-1401', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(30, 'КН-1402', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(31, 'КН-1402-З', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(32, 'КН-1501-1', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(33, 'КН-1501-2', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(34, 'КН-1501ск-З', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(35, 'КН-1502ск', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(36, 'КН-16001б', NULL, 37, 2, '2020-05-18 09:11:18', '2020-05-24 15:34:43'),
(37, 'КН-16002б', NULL, 23, 2, '2020-05-18 09:11:18', '2020-05-24 15:35:11'),
(38, 'КН-16002бск-З', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(39, 'КН-16003ск', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(40, 'КН-17001б-1', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(41, 'КН-17001б-2', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(42, 'КН-17002бск', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(43, 'ПІ-1505', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(44, 'ПІ-1506ск', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(45, 'ПІ-16004б-З', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(46, 'ПІ-17004б-1', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(47, 'ПІ-17004б-2', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(48, 'ПІ-17005бск', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(49, 'ЕкК-17-З-інд', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(50, 'КЕЕМ-16002мОП+', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(51, 'КН-1402+', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(52, 'ЕкК-18004б', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(53, 'КІ-18007б', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(54, 'КІ-18007б (2 підгрупа)', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(55, 'КІ-18008бск', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(56, 'ІПЗ-18005б', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(57, 'ІПЗ-18007бск', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(58, 'КН-18001б', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(59, 'КН-18002б', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(60, 'ЕкК-18003м', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(61, 'КН-18003бск', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(62, 'ІУСТ-18001м', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(63, 'КЕЕМ-18002м', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(64, 'ІПЗ-18004м', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(65, 'ІПЗ-18006б', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(66, 'КІ-18005м', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(67, 'КН-18001бск(з)', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(68, 'КН-18006б(з)і', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(69, 'ІПЗ-18003бск(з)МНЛ', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(70, 'КІ-18005бск(з)МНЛ', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(71, 'ІПЗ-18002бск(з)', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(72, 'КІ-18004бск(з)', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(73, 'ІПЗ-18007б(з)і', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(74, 'ІПЗ-17-інд(з)', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(75, 'ІПЗ-17003б ск(з)', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(76, 'КН-17001бск(з)', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(77, 'ІПЗ-17004бМНЛ', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(78, 'КН-17б(з)і', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(79, 'КІ-17002бск(з)', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(80, 'ТЕСТ', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(81, 'ІПЗ-16ск інд(з)', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(82, 'КН-16б(з)і', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(83, 'КН-15б(з)і', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(84, 'КН-19001б', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(85, 'КН-19002б', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(86, 'КН-19003бск', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(87, 'ІУСТ-19001м', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(88, 'КЕЕМ-19002м', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(89, 'КІ-18-З-інд', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(90, 'ІПЗ-19006б', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(91, 'ІПЗ-19007б', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(92, 'ІПЗ-19008бск', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(93, 'ІПЗ-19004м', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(94, 'ЕкК-19003м', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(95, 'КІ-19005м', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(96, 'КІ-19009б', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(97, 'КІ-19010бск(1)', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(98, 'КІ-19010бск(2)', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(99, 'КІБ-19011б', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(100, 'КІ-19003бск(з) МНЛ', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(101, 'ЕкК-19004б', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(102, 'ЦЕ-19005б', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(103, 'ІПЗ-19002бск(з)МНЛ', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(104, 'КН-19001бск(з)', NULL, NULL, NULL, '2020-05-18 09:11:18', '2020-05-18 09:11:18');

-- --------------------------------------------------------

--
-- Структура таблиці `group_in_lessons`
--

CREATE TABLE `group_in_lessons` (
  `group_id` int(10) UNSIGNED NOT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `group_in_lessons`
--

INSERT INTO `group_in_lessons` (`group_id`, `lesson_id`) VALUES
(36, 1),
(37, 1),
(36, 2),
(36, 3),
(37, 3),
(36, 4),
(37, 4),
(37, 5),
(36, 6);

-- --------------------------------------------------------

--
-- Структура таблиці `infoblocks`
--

CREATE TABLE `infoblocks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `infoblocks`
--

INSERT INTO `infoblocks` (`id`, `name`, `slug`, `type_id`, `title`, `sub_title`, `button_title`, `button_link`, `created_at`, `updated_at`, `body`, `image`) VALUES
(1, 'Slider Main', 'slider-main', 1, NULL, NULL, NULL, NULL, '2020-01-30 14:13:44', '2020-01-30 14:13:44', NULL, NULL),
(2, 'ДЕКІЛЬКА СЛІВ ПРО НАС', 'dekil-ka-sliv-pro-nas', 2, 'ДЕКІЛЬКА СЛІВ ПРО НАС', '', 'Читати далі', '', '2020-02-08 17:01:00', '2020-02-08 17:10:31', '<p><span style=\"color: rgba(0, 4, 57, 0.75); font-family: Raleway, sans-serif; font-size: 14.2292px; letter-spacing: 0.711458px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</span></p>', 'infoblocks\\February2020\\GsDM7CPsiITRjHpHPYFw.jpg'),
(3, 'Швидкий доступ', 'shvidkij-dostup', 3, '', '', '', '', '2020-02-08 18:29:58', '2020-02-08 18:29:58', NULL, 'infoblocks\\February2020\\TWnTYzNxeqRozNgULOUX.jpg'),
(5, 'Статистика (головна)', 'statistika-golovna', 5, '', '', '', '', '2020-02-09 13:20:51', '2020-02-09 13:20:51', NULL, 'infoblocks\\February2020\\hQSpee24teMluooaWY3S.jpg'),
(8, 'Кафедри факультету', 'kafedri-fakul-tetu', 8, 'КАФЕДРИ ФАКУЛЬТЕТУ', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias animi dolorum inve', 'Переглянути всі кафедри', 'departments', '2020-02-10 18:42:00', '2020-02-10 19:23:32', NULL, NULL),
(11, 'Партнери', 'partneri', 10, 'Партнери', '', '', '', '2020-02-18 20:54:33', '2020-02-18 20:54:33', NULL, NULL),
(12, 'Випускникам шкіл. посилання', 'vipusknikam-shkil-posilannya', 11, '', '', '', NULL, '2020-05-10 10:19:39', '2020-05-10 10:19:39', '', NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `infoblock_items`
--

CREATE TABLE `infoblock_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `infoblock_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `infoblock_items`
--

INSERT INTO `infoblock_items` (`id`, `infoblock_id`, `title`, `sub_title`, `image`, `button_title`, `button_link`, `body`, `order`, `created_at`, `updated_at`, `parent_id`) VALUES
(1, 1, 'Розпочни свою кар\'єру в ІТ з нами!', '', 'infoblock-items\\January2020\\yXF91pw5QgoDBpUv8bF6.jpg', 'Детальніше', 'vipusknikam-shkil', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam dolor optio provident temporibus tenetur? Ad, alias commodi corporis ea eos hic id ipsa iure molestiae natus nobis sint suscipit voluptas.', 2, '2020-01-30 15:36:00', '2020-05-10 13:01:29', NULL),
(2, 1, 'Міжнародні програми навчання відкриті для реєстрації!', NULL, 'infoblock-items\\January2020\\ghFmoiC4spN7lfczeKK6.jpg', 'Дізнатись більше', NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam dolor optio provident temporibus tenetur? Ad, alias commodi corporis ea eos hic id ipsa iure molestiae natus nobis sint suscipit voluptas.', 4, '2020-01-30 15:46:18', '2020-05-10 12:57:04', NULL),
(3, 1, 'Вступну кампанію 2020 розпочато!', NULL, 'infoblock-items\\January2020\\MlIIjGPfwW58IRQz1raX.jpg', 'Дізнатись більше', NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam dolor optio provident temporibus tenetur? Ad, alias commodi corporis ea eos hic id ipsa iure molestiae natus nobis sint suscipit voluptas.', 3, '2020-01-30 15:47:04', '2020-05-10 12:57:04', NULL),
(4, 1, 'Відкрита лекція від Cisco Networking Academy', NULL, 'infoblock-items\\January2020\\LFnj5zenjagWaJZmrxZ7.jpg', 'Дізнатись більше', NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam dolor optio provident temporibus tenetur? Ad, alias commodi corporis ea eos hic id ipsa iure molestiae natus nobis sint suscipit voluptas.', 5, '2020-01-30 15:47:48', '2020-05-10 12:57:04', NULL),
(12, 3, 'Інформація', NULL, '[{\"download_link\":\"infoblock-items\\\\February2020\\\\QLcjGFtgcLlGdCPDWHCY.svg\",\"original_name\":\"info.svg\"}]', NULL, NULL, NULL, 1, '2020-02-09 10:52:00', '2020-02-09 12:10:14', NULL),
(13, 3, 'Діяльність', NULL, '[{\"download_link\":\"infoblock-items\\\\February2020\\\\4Vkj4VgsapGlBbDxntzo.svg\",\"original_name\":\"activity.svg\"}]', NULL, NULL, NULL, 2, '2020-02-09 12:08:00', '2020-02-09 12:30:37', NULL),
(14, 3, 'Про факультет', NULL, '[{\"download_link\":\"infoblock-items\\\\February2020\\\\Te3QGGHigASvJdSQFbAQ.svg\",\"original_name\":\"about.svg\"}]', NULL, NULL, NULL, 3, '2020-02-09 12:08:00', '2020-02-09 12:32:49', NULL),
(15, 3, 'Вступникам', NULL, '[]', NULL, NULL, NULL, 1, '2020-02-09 12:09:00', '2020-02-09 12:30:21', 12),
(16, 3, 'Студентам', NULL, '[]', NULL, NULL, NULL, 2, '2020-02-09 12:09:00', '2020-02-09 12:30:21', 12),
(17, 3, 'Розклад занять', NULL, '[]', NULL, NULL, NULL, 3, '2020-02-09 12:09:00', '2020-02-09 12:30:21', 12),
(18, 3, 'Співробітникам', NULL, '[]', NULL, NULL, NULL, 4, '2020-02-09 12:10:00', '2020-02-09 12:30:21', 12),
(19, 3, 'Наукова', NULL, '[]', NULL, NULL, NULL, 1, '2020-02-09 12:30:00', '2020-02-09 12:31:53', 13),
(20, 3, 'Міжнародна', NULL, '[]', NULL, NULL, NULL, 2, '2020-02-09 12:31:00', '2020-02-09 12:31:55', 13),
(21, 3, 'Культура', NULL, '[]', NULL, NULL, NULL, 3, '2020-02-09 12:31:00', '2020-02-09 12:31:55', 13),
(22, 3, 'Школа програмування', NULL, '[]', NULL, NULL, NULL, 4, '2020-02-09 12:31:00', '2020-02-09 12:31:57', 13),
(23, 3, 'Навчальні програми', NULL, '[]', NULL, 'education/courses', NULL, 1, '2020-02-09 12:32:00', '2020-03-12 19:49:55', 14),
(24, 3, 'Кафедри', NULL, '[]', NULL, 'departments', NULL, 2, '2020-02-09 12:33:00', '2020-03-12 19:24:47', 14),
(25, 3, 'Адміністрація', NULL, '[]', NULL, NULL, NULL, 3, '2020-02-09 12:33:00', '2020-02-09 12:33:41', 14),
(26, 3, 'Студентська рада', NULL, '[]', NULL, NULL, NULL, 4, '2020-02-09 12:33:00', '2020-02-09 12:33:42', 14),
(27, 3, 'Ресурси', NULL, '[{\"download_link\":\"infoblock-items\\\\February2020\\\\NneXkskJLEsFdBXvbyE5.svg\",\"original_name\":\"book.svg\"}]', NULL, NULL, NULL, 4, '2020-02-09 12:34:00', '2020-02-09 12:35:39', NULL),
(28, 3, 'Е-навчання', NULL, '[]', NULL, NULL, NULL, 1, '2020-02-09 12:35:00', '2020-02-09 12:35:41', 27),
(29, 3, 'Сервіси', NULL, '[]', NULL, NULL, NULL, 2, '2020-02-09 12:35:00', '2020-02-09 12:35:42', 27),
(30, 3, 'Документи', NULL, '[]', NULL, NULL, NULL, 3, '2020-02-09 12:35:00', '2020-02-09 12:35:43', 27),
(34, 5, '365 студентів', NULL, '[{\"download_link\":\"infoblock-items\\\\February2020\\\\jAdJRF2vnBkVgx75IwAh.svg\",\"original_name\":\"student.svg\"}]', NULL, NULL, NULL, 9, '2020-02-09 13:29:00', '2020-02-09 13:39:02', NULL),
(36, 5, '42 викладачі', NULL, '[{\"download_link\":\"infoblock-items\\\\February2020\\\\77WczPnB1aA0uwRpuxKC.svg\",\"original_name\":\"teacher.svg\"}]', NULL, NULL, NULL, 10, '2020-02-09 13:30:00', '2020-02-09 13:39:19', NULL),
(37, 5, '8 кафедр', NULL, '[{\"download_link\":\"infoblock-items\\\\February2020\\\\Ys3pl6OZuNu3chYCMqAn.svg\",\"original_name\":\"department.svg\"}]', NULL, NULL, NULL, 11, '2020-02-09 13:30:00', '2020-02-09 13:39:37', NULL),
(38, 5, '6 напрямків навчання', '', '[{\"download_link\":\"infoblock-items\\\\May2020\\\\FayXwlcugoSRN2E3V6IW.svg\",\"original_name\":\"courses.svg\"}]', '', NULL, '', 12, '2020-02-09 13:30:00', '2020-05-10 10:05:50', NULL),
(42, 8, 'Кафедра інформаційних і дистанційних технологій', NULL, '[{\"download_link\":\"infoblock-items\\\\February2020\\\\yah5ZY9lPKmoqtn2wH50.jpg\",\"original_name\":\"department1.jpg\"}]', NULL, NULL, NULL, 1, '2020-02-10 18:44:00', '2020-02-16 18:14:53', NULL),
(43, 8, 'Кафедра інформаційних систем', NULL, '[{\"download_link\":\"infoblock-items\\\\February2020\\\\GNvohomVc3JJYG82P8dd.jpg\",\"original_name\":\"department2.jpg\"}]', 'Детальніше', 'kafedra-informacijnih-sistem', NULL, 2, '2020-02-10 18:49:00', '2020-02-16 18:14:53', NULL),
(44, 8, 'Кафедра економічної кібернетики', NULL, '[{\"download_link\":\"infoblock-items\\\\February2020\\\\XnBpNZ6OgX4OitEgjQfY.jpg\",\"original_name\":\"department3.jpg\"}]', NULL, NULL, NULL, 3, '2020-02-10 18:50:00', '2020-02-18 20:22:55', NULL),
(45, 8, 'Кафедра комп\'ютених наук', NULL, '[{\"download_link\":\"infoblock-items\\\\February2020\\\\Ch4Ek4S31FS9VQyIlJag.jpg\",\"original_name\":\"department4.jpg\"}]', NULL, NULL, NULL, 4, '2020-02-10 18:50:00', '2020-02-18 20:22:55', NULL),
(58, 11, '1С', NULL, '[{\"download_link\":\"infoblock-items\\\\February2020\\\\wvP33JiVWlR88fVklFma.png\",\"original_name\":\"partner1.png\"}]', NULL, NULL, NULL, 1, '2020-02-18 20:55:00', '2020-03-28 12:26:49', NULL),
(59, 11, 'Microsoft Imagine', NULL, '[{\"download_link\":\"infoblock-items\\\\February2020\\\\eSmNvoc9h9jRtCQ0dck3.png\",\"original_name\":\"partner2.png\"}]', NULL, NULL, NULL, 2, '2020-02-18 20:57:00', '2020-03-28 12:26:49', NULL),
(60, 11, 'Google', NULL, '[{\"download_link\":\"infoblock-items\\\\February2020\\\\G4de3ddIwLKcTBIV7l0l.png\",\"original_name\":\"partner3.png\"}]', NULL, NULL, NULL, 3, '2020-02-18 20:57:00', '2020-03-01 12:58:01', NULL),
(61, 11, 'Cisco', NULL, '[{\"download_link\":\"infoblock-items\\\\February2020\\\\71OMKoiEMRuRZ8S2MSWI.png\",\"original_name\":\"partner4.png\"}]', NULL, NULL, NULL, 4, '2020-02-18 20:57:00', '2020-03-01 12:58:01', NULL),
(62, 11, 'Google2', NULL, '[{\"download_link\":\"infoblock-items\\\\February2020\\\\mhVmkMWoj83vuDDyGPls.png\",\"original_name\":\"partner3.png\"}]', NULL, NULL, NULL, 5, '2020-02-18 21:00:00', '2020-03-01 12:58:01', NULL),
(63, 1, '8 березня', NULL, '[{\"download_link\":\"infoblock-items\\\\March2020\\\\P56w8nGg2Os5pz1zBJL6.jpg\",\"original_name\":\"523457181-copy1.jpg\"}]', NULL, NULL, NULL, 1, '2020-03-02 18:54:00', '2020-03-02 18:55:46', NULL),
(64, 12, 'Перелік документів', '', '[]', '', 'perelik-dokumentiv', '', 13, '2020-05-10 10:28:00', '2020-05-10 10:28:43', NULL),
(65, 12, 'Перелік спеціальностей', '', '[]', '', 'education/courses/bakalavr', '', 14, '2020-05-10 10:29:00', '2020-05-10 10:30:00', NULL),
(66, 12, 'Термін вступної кампанії', '', '[]', '', 'termini-vstupnoyi-kampaniyi', '', 15, '2020-05-10 10:44:00', '2020-05-10 10:45:06', NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `infoblock_types`
--

CREATE TABLE `infoblock_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blade_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `public` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `with_items` tinyint(1) NOT NULL,
  `with_item_parent` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `infoblock_types`
--

INSERT INTO `infoblock_types` (`id`, `name`, `blade_path`, `public`, `created_at`, `updated_at`, `with_items`, `with_item_parent`) VALUES
(1, 'Слайдер (головний)', 'slider', 0, '2020-01-29 16:18:09', '2020-02-08 18:28:12', 1, 0),
(2, 'About', 'about', 0, '2020-02-08 16:51:02', '2020-02-08 16:51:02', 0, 0),
(3, 'Швидкий доступ', 'quick-access', 0, '2020-02-08 18:26:26', '2020-02-08 18:26:26', 1, 1),
(5, 'Статистика', 'statistic', 0, '2020-02-09 13:19:58', '2020-02-09 13:19:58', 1, 0),
(8, 'Кафедри (список)', 'departments-list', 0, '2020-02-10 18:40:17', '2020-02-10 18:40:17', 1, 0),
(9, 'Слайдер', 'default-slider', 1, '2020-02-10 18:41:07', '2020-02-10 18:41:21', 1, 0),
(10, 'Слайдер (партнери)', 'partners-slider', 1, '2020-02-18 20:53:13', '2020-02-18 20:53:13', 1, 0),
(11, 'Посилання на сторінці', 'links-on-page', 1, '2020-05-10 10:03:43', '2020-05-10 10:28:07', 1, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `integration_logs`
--

CREATE TABLE `integration_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('SUCCESS','ERROR') COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `integration_logs`
--

INSERT INTO `integration_logs` (`id`, `datetime`, `status`, `message`) VALUES
(1, '2020-05-16 21:17:52', 'ERROR', 'Request error: Failed failed. Query execute error!'),
(2, '2020-05-18 20:13:48', 'ERROR', 'Request error: Failed failed. Query execute error!'),
(3, '2020-05-18 20:42:52', 'ERROR', 'Request error: Failed failed. Query execute error!'),
(4, '2020-05-18 21:29:52', 'SUCCESS', 'Integration successful ended'),
(5, '2020-05-18 21:38:21', 'SUCCESS', 'Integration successful ended'),
(6, '2020-05-18 21:40:22', 'SUCCESS', 'Інтеграція закінчилась'),
(7, '2020-05-18 21:41:06', 'SUCCESS', 'Інтеграція закінчилась'),
(8, '2020-05-18 21:41:32', 'SUCCESS', 'Інтеграція закінчилась'),
(9, '2020-05-18 23:58:35', 'ERROR', 'Error on save - SQLSTATE[HY000]: General error: 1364 Field \'email\' doesn\'t have a default value (SQL: insert into `users` (`name`, `birthday`, `credit_note_number`, `role_id`, `group_id`, `updated_at`, `created_at`) values (Баланович Інна Петрівна, , 16426, 3, 1, 2020-05-18 20:58:35, 2020-05-18 20:58:35))'),
(10, '2020-05-18 23:58:35', 'ERROR', 'Error on save - SQLSTATE[HY000]: General error: 1364 Field \'email\' doesn\'t have a default value (SQL: insert into `users` (`name`, `birthday`, `credit_note_number`, `role_id`, `group_id`, `updated_at`, `created_at`) values (Басов Гліб Ігорович, , 16032, 3, 1, 2020-05-18 20:58:35, 2020-05-18 20:58:35))'),
(11, '2020-05-18 23:58:35', 'ERROR', 'Error on save - SQLSTATE[HY000]: General error: 1364 Field \'email\' doesn\'t have a default value (SQL: insert into `users` (`name`, `birthday`, `credit_note_number`, `role_id`, `group_id`, `updated_at`, `created_at`) values (Бурлака Віталій Вікторович, , , 3, 1, 2020-05-18 20:58:35, 2020-05-18 20:58:35))'),
(12, '2020-05-18 23:58:35', 'ERROR', 'Error on save - SQLSTATE[HY000]: General error: 1364 Field \'email\' doesn\'t have a default value (SQL: insert into `users` (`name`, `birthday`, `credit_note_number`, `role_id`, `group_id`, `updated_at`, `created_at`) values (Войт Владислав Віталійович, , 16294, 3, 1, 2020-05-18 20:58:35, 2020-05-18 20:58:35))'),
(13, '2020-05-18 23:58:35', 'ERROR', 'Error on save - SQLSTATE[HY000]: General error: 1364 Field \'email\' doesn\'t have a default value (SQL: insert into `users` (`name`, `birthday`, `credit_note_number`, `role_id`, `group_id`, `updated_at`, `created_at`) values (Волков Богдан Валерійович, , 16159, 3, 45, 2020-05-18 20:58:35, 2020-05-18 20:58:35))'),
(14, '2020-05-18 23:58:35', 'ERROR', 'Error on save - SQLSTATE[HY000]: General error: 1364 Field \'email\' doesn\'t have a default value (SQL: insert into `users` (`name`, `birthday`, `credit_note_number`, `role_id`, `group_id`, `updated_at`, `created_at`) values (Зах Вадим Юрійович, , 16064, 3, 1, 2020-05-18 20:58:35, 2020-05-18 20:58:35))'),
(15, '2020-05-18 23:58:35', 'ERROR', 'Error on save - SQLSTATE[HY000]: General error: 1364 Field \'email\' doesn\'t have a default value (SQL: insert into `users` (`name`, `birthday`, `credit_note_number`, `role_id`, `group_id`, `updated_at`, `created_at`) values (Кавуненко Іван Анатолійович, , 16535, 3, 45, 2020-05-18 20:58:35, 2020-05-18 20:58:35))'),
(16, '2020-05-18 23:58:35', 'ERROR', 'Error on save - SQLSTATE[HY000]: General error: 1364 Field \'email\' doesn\'t have a default value (SQL: insert into `users` (`name`, `birthday`, `credit_note_number`, `role_id`, `group_id`, `updated_at`, `created_at`) values (Кучеренко Дмитро Леонідович, , 16111, 3, 1, 2020-05-18 20:58:35, 2020-05-18 20:58:35))'),
(17, '2020-05-18 23:58:35', 'ERROR', 'Error on save - SQLSTATE[HY000]: General error: 1364 Field \'email\' doesn\'t have a default value (SQL: insert into `users` (`name`, `birthday`, `credit_note_number`, `role_id`, `group_id`, `updated_at`, `created_at`) values (Луцак Владислав Сергійович, , 16441, 3, 1, 2020-05-18 20:58:35, 2020-05-18 20:58:35))'),
(18, '2020-05-18 23:58:35', 'ERROR', 'Error on save - SQLSTATE[HY000]: General error: 1364 Field \'email\' doesn\'t have a default value (SQL: insert into `users` (`name`, `birthday`, `credit_note_number`, `role_id`, `group_id`, `updated_at`, `created_at`) values (Мащенко Микола Олександрович, , 16334, 3, 1, 2020-05-18 20:58:35, 2020-05-18 20:58:35))'),
(19, '2020-05-18 23:58:38', 'SUCCESS', 'Інтеграція закінчилась'),
(20, '2020-05-19 00:03:20', 'ERROR', 'Error on save - SQLSTATE[22007]: Invalid datetime format: 1292 Incorrect date value: \'\' for column `itnulesdb`.`users`.`birthday` at row 1 (SQL: insert into `users` (`name`, `birthday`, `credit_note_number`, `role_id`, `group_id`, `updated_at`, `created_at`) values (Баланович Інна Петрівна, , 16426, 3, 1, 2020-05-18 21:03:20, 2020-05-18 21:03:20))'),
(21, '2020-05-19 00:03:20', 'ERROR', 'Error on save - SQLSTATE[22007]: Invalid datetime format: 1292 Incorrect date value: \'\' for column `itnulesdb`.`users`.`birthday` at row 1 (SQL: insert into `users` (`name`, `birthday`, `credit_note_number`, `role_id`, `group_id`, `updated_at`, `created_at`) values (Басов Гліб Ігорович, , 16032, 3, 1, 2020-05-18 21:03:20, 2020-05-18 21:03:20))'),
(22, '2020-05-19 00:03:20', 'ERROR', 'Error on save - SQLSTATE[22007]: Invalid datetime format: 1292 Incorrect date value: \'\' for column `itnulesdb`.`users`.`birthday` at row 1 (SQL: insert into `users` (`name`, `birthday`, `credit_note_number`, `role_id`, `group_id`, `updated_at`, `created_at`) values (Бурлака Віталій Вікторович, , , 3, 1, 2020-05-18 21:03:20, 2020-05-18 21:03:20))'),
(23, '2020-05-19 00:03:20', 'ERROR', 'Error on save - SQLSTATE[22007]: Invalid datetime format: 1292 Incorrect date value: \'\' for column `itnulesdb`.`users`.`birthday` at row 1 (SQL: insert into `users` (`name`, `birthday`, `credit_note_number`, `role_id`, `group_id`, `updated_at`, `created_at`) values (Войт Владислав Віталійович, , 16294, 3, 1, 2020-05-18 21:03:20, 2020-05-18 21:03:20))'),
(24, '2020-05-19 00:03:20', 'ERROR', 'Error on save - SQLSTATE[22007]: Invalid datetime format: 1292 Incorrect date value: \'\' for column `itnulesdb`.`users`.`birthday` at row 1 (SQL: insert into `users` (`name`, `birthday`, `credit_note_number`, `role_id`, `group_id`, `updated_at`, `created_at`) values (Волков Богдан Валерійович, , 16159, 3, 45, 2020-05-18 21:03:20, 2020-05-18 21:03:20))'),
(25, '2020-05-19 00:03:20', 'ERROR', 'Error on save - SQLSTATE[22007]: Invalid datetime format: 1292 Incorrect date value: \'\' for column `itnulesdb`.`users`.`birthday` at row 1 (SQL: insert into `users` (`name`, `birthday`, `credit_note_number`, `role_id`, `group_id`, `updated_at`, `created_at`) values (Зах Вадим Юрійович, , 16064, 3, 1, 2020-05-18 21:03:20, 2020-05-18 21:03:20))'),
(26, '2020-05-19 00:03:20', 'ERROR', 'Error on save - SQLSTATE[22007]: Invalid datetime format: 1292 Incorrect date value: \'\' for column `itnulesdb`.`users`.`birthday` at row 1 (SQL: insert into `users` (`name`, `birthday`, `credit_note_number`, `role_id`, `group_id`, `updated_at`, `created_at`) values (Кавуненко Іван Анатолійович, , 16535, 3, 45, 2020-05-18 21:03:20, 2020-05-18 21:03:20))'),
(27, '2020-05-19 00:03:20', 'ERROR', 'Error on save - SQLSTATE[22007]: Invalid datetime format: 1292 Incorrect date value: \'\' for column `itnulesdb`.`users`.`birthday` at row 1 (SQL: insert into `users` (`name`, `birthday`, `credit_note_number`, `role_id`, `group_id`, `updated_at`, `created_at`) values (Кучеренко Дмитро Леонідович, , 16111, 3, 1, 2020-05-18 21:03:20, 2020-05-18 21:03:20))'),
(28, '2020-05-19 00:03:20', 'ERROR', 'Error on save - SQLSTATE[22007]: Invalid datetime format: 1292 Incorrect date value: \'\' for column `itnulesdb`.`users`.`birthday` at row 1 (SQL: insert into `users` (`name`, `birthday`, `credit_note_number`, `role_id`, `group_id`, `updated_at`, `created_at`) values (Луцак Владислав Сергійович, , 16441, 3, 1, 2020-05-18 21:03:20, 2020-05-18 21:03:20))'),
(29, '2020-05-19 00:03:20', 'ERROR', 'Error on save - SQLSTATE[22007]: Invalid datetime format: 1292 Incorrect date value: \'\' for column `itnulesdb`.`users`.`birthday` at row 1 (SQL: insert into `users` (`name`, `birthday`, `credit_note_number`, `role_id`, `group_id`, `updated_at`, `created_at`) values (Мащенко Микола Олександрович, , 16334, 3, 1, 2020-05-18 21:03:20, 2020-05-18 21:03:20))'),
(30, '2020-05-19 00:03:23', 'SUCCESS', 'Інтеграція закінчилась'),
(31, '2020-05-19 00:06:29', 'ERROR', 'Error on save - SQLSTATE[22007]: Invalid datetime format: 1292 Incorrect date value: \'\' for column `itnulesdb`.`users`.`birthday` at row 1 (SQL: insert into `users` (`name`, `credit_note_number`, `role_id`, `birthday`, `group_id`, `updated_at`, `created_at`) values (Баланович Інна Петрівна, 16426, 3, , 1, 2020-05-18 21:06:29, 2020-05-18 21:06:29))'),
(32, '2020-05-19 00:06:29', 'ERROR', 'Error on save - SQLSTATE[22007]: Invalid datetime format: 1292 Incorrect date value: \'\' for column `itnulesdb`.`users`.`birthday` at row 1 (SQL: insert into `users` (`name`, `credit_note_number`, `role_id`, `birthday`, `group_id`, `updated_at`, `created_at`) values (Басов Гліб Ігорович, 16032, 3, , 1, 2020-05-18 21:06:29, 2020-05-18 21:06:29))'),
(33, '2020-05-19 00:06:29', 'ERROR', 'Error on save - SQLSTATE[22007]: Invalid datetime format: 1292 Incorrect date value: \'\' for column `itnulesdb`.`users`.`birthday` at row 1 (SQL: insert into `users` (`name`, `credit_note_number`, `role_id`, `birthday`, `group_id`, `updated_at`, `created_at`) values (Бурлака Віталій Вікторович, , 3, , 1, 2020-05-18 21:06:29, 2020-05-18 21:06:29))'),
(34, '2020-05-19 00:06:29', 'ERROR', 'Error on save - SQLSTATE[22007]: Invalid datetime format: 1292 Incorrect date value: \'\' for column `itnulesdb`.`users`.`birthday` at row 1 (SQL: insert into `users` (`name`, `credit_note_number`, `role_id`, `birthday`, `group_id`, `updated_at`, `created_at`) values (Войт Владислав Віталійович, 16294, 3, , 1, 2020-05-18 21:06:29, 2020-05-18 21:06:29))'),
(35, '2020-05-19 00:06:29', 'ERROR', 'Error on save - SQLSTATE[22007]: Invalid datetime format: 1292 Incorrect date value: \'\' for column `itnulesdb`.`users`.`birthday` at row 1 (SQL: insert into `users` (`name`, `credit_note_number`, `role_id`, `birthday`, `group_id`, `updated_at`, `created_at`) values (Волков Богдан Валерійович, 16159, 3, , 45, 2020-05-18 21:06:29, 2020-05-18 21:06:29))'),
(36, '2020-05-19 00:06:29', 'ERROR', 'Error on save - SQLSTATE[22007]: Invalid datetime format: 1292 Incorrect date value: \'\' for column `itnulesdb`.`users`.`birthday` at row 1 (SQL: insert into `users` (`name`, `credit_note_number`, `role_id`, `birthday`, `group_id`, `updated_at`, `created_at`) values (Зах Вадим Юрійович, 16064, 3, , 1, 2020-05-18 21:06:29, 2020-05-18 21:06:29))'),
(37, '2020-05-19 00:06:32', 'SUCCESS', 'Інтеграція закінчилась'),
(38, '2020-05-19 00:07:53', 'SUCCESS', 'Інтеграція закінчилась'),
(39, '2020-05-19 21:43:46', 'ERROR', 'Error on save - SQLSTATE[22007]: Invalid datetime format: 1292 Incorrect date value: \'\' for column `itnulesdb`.`users`.`birthday` at row 1 (SQL: update `users` set `birthday` = , `users`.`updated_at` = 2020-05-19 18:43:46 where `id` = 6)'),
(40, '2020-05-19 21:43:46', 'ERROR', 'Error on save - SQLSTATE[22007]: Invalid datetime format: 1292 Incorrect date value: \'\' for column `itnulesdb`.`users`.`birthday` at row 1 (SQL: update `users` set `birthday` = , `users`.`updated_at` = 2020-05-19 18:43:46 where `id` = 7)'),
(41, '2020-05-19 21:43:46', 'ERROR', 'Error on save - SQLSTATE[22007]: Invalid datetime format: 1292 Incorrect date value: \'\' for column `itnulesdb`.`users`.`birthday` at row 1 (SQL: update `users` set `birthday` = , `users`.`updated_at` = 2020-05-19 18:43:46 where `id` = 8)'),
(42, '2020-05-19 21:43:46', 'ERROR', 'Error on save - SQLSTATE[22007]: Invalid datetime format: 1292 Incorrect date value: \'\' for column `itnulesdb`.`users`.`birthday` at row 1 (SQL: update `users` set `birthday` = , `users`.`updated_at` = 2020-05-19 18:43:46 where `id` = 9)'),
(43, '2020-05-19 21:43:46', 'ERROR', 'Error on save - SQLSTATE[22007]: Invalid datetime format: 1292 Incorrect date value: \'\' for column `itnulesdb`.`users`.`birthday` at row 1 (SQL: update `users` set `birthday` = , `users`.`updated_at` = 2020-05-19 18:43:46 where `id` = 10)'),
(44, '2020-05-19 21:43:46', 'ERROR', 'Error on save - SQLSTATE[22007]: Invalid datetime format: 1292 Incorrect date value: \'\' for column `itnulesdb`.`users`.`birthday` at row 1 (SQL: update `users` set `birthday` = , `users`.`updated_at` = 2020-05-19 18:43:46 where `id` = 11)'),
(45, '2020-05-19 21:43:46', 'ERROR', 'Інтеграція закінчилась з помилками'),
(46, '2020-05-19 21:45:05', 'SUCCESS', 'Інтеграція успішно завершена'),
(47, '2020-05-19 22:41:20', 'SUCCESS', 'Інтеграція успішно завершена'),
(48, '2020-05-23 16:06:38', 'SUCCESS', 'Інтеграція успішно завершена'),
(49, '2020-05-23 16:09:08', 'SUCCESS', 'Інтеграція успішно завершена'),
(50, '2020-05-24 19:57:33', 'ERROR', 'Error on save - Unexpected data found.\r\nUnexpected data found.\r\nData missing'),
(51, '2020-05-24 19:57:33', 'ERROR', 'Error on save - Unexpected data found.\r\nUnexpected data found.\r\nData missing'),
(52, '2020-05-24 19:57:33', 'ERROR', 'Error on save - Unexpected data found.\r\nUnexpected data found.\r\nData missing'),
(53, '2020-05-24 19:57:33', 'ERROR', 'Error on save - Unexpected data found.\r\nUnexpected data found.\r\nData missing'),
(54, '2020-05-24 19:57:33', 'ERROR', 'Error on save - Unexpected data found.\r\nUnexpected data found.\r\nData missing'),
(55, '2020-05-24 19:57:33', 'ERROR', 'Error on save - Unexpected data found.\r\nUnexpected data found.\r\nData missing'),
(56, '2020-05-24 19:57:33', 'ERROR', 'Інтеграція закінчилась з помилками'),
(57, '2020-05-24 20:01:07', 'ERROR', 'Error on save - Unexpected data found.\r\nUnexpected data found.\r\nData missing'),
(58, '2020-05-24 20:01:07', 'ERROR', 'Error on save - Unexpected data found.\r\nUnexpected data found.\r\nData missing'),
(59, '2020-05-24 20:01:07', 'ERROR', 'Error on save - Unexpected data found.\r\nUnexpected data found.\r\nData missing'),
(60, '2020-05-24 20:01:07', 'ERROR', 'Error on save - Unexpected data found.\r\nUnexpected data found.\r\nData missing'),
(61, '2020-05-24 20:01:07', 'ERROR', 'Error on save - Unexpected data found.\r\nUnexpected data found.\r\nData missing'),
(62, '2020-05-24 20:01:07', 'ERROR', 'Error on save - Unexpected data found.\r\nUnexpected data found.\r\nData missing'),
(63, '2020-05-24 20:01:07', 'ERROR', 'Інтеграція закінчилась з помилками'),
(64, '2020-05-24 20:08:41', 'SUCCESS', 'Інтеграція успішно завершена'),
(65, '2020-05-24 20:10:31', 'SUCCESS', 'Інтеграція успішно завершена'),
(66, '2020-05-24 20:17:43', 'SUCCESS', 'Інтеграція успішно завершена'),
(67, '2020-05-24 20:29:11', 'SUCCESS', 'Інтеграція успішно завершена'),
(68, '2020-05-24 20:34:10', 'SUCCESS', 'Інтеграція успішно завершена'),
(69, '2020-05-24 20:35:48', 'ERROR', 'Error on save - SQLSTATE[22007]: Invalid datetime format: 1292 Incorrect date value: \'-0001-11-30 00:00:00\' for column `itnulesdb`.`users`.`birthday` at row 1 (SQL: insert into `users` (`name`, `credit_note_number`, `role_id`, `birthday`, `group_id`, `avatar`, `password`, `updated_at`, `created_at`) values (Кучук Дмитро Павлович, 18002б, 3, -0001-11-30 00:00:00, 36, settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg, $2y$10$1u8cVnVhFb9mx/C4kHo94O.LgB9jXGIcqgopVnIcE1YATRcGGOPCu, 2020-05-24 17:35:48, 2020-05-24 17:35:48))'),
(70, '2020-05-24 20:35:49', 'ERROR', 'Інтеграція закінчилась з помилками'),
(71, '2020-05-24 20:37:54', 'SUCCESS', 'Інтеграція успішно завершена');

-- --------------------------------------------------------

--
-- Структура таблиці `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 1,
  `frequency` enum('FULL','NUMERATOR','DENOMINATOR') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'FULL',
  `day_id` int(10) UNSIGNED NOT NULL,
  `discipline_id` int(10) UNSIGNED NOT NULL,
  `audience_id` int(10) UNSIGNED DEFAULT NULL,
  `lesson_type_id` int(10) UNSIGNED DEFAULT NULL,
  `period_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `lessons`
--

INSERT INTO `lessons` (`id`, `name`, `position`, `frequency`, `day_id`, `discipline_id`, `audience_id`, `lesson_type_id`, `period_id`, `created_at`, `updated_at`) VALUES
(1, NULL, 5, 'FULL', 1, 41, 7, 1, 5, '2020-05-25 14:42:27', '2020-05-25 14:42:41'),
(2, NULL, 6, 'NUMERATOR', 1, 41, 6, 2, 5, '2020-05-25 14:43:22', '2020-05-25 14:43:22'),
(3, NULL, 1, 'FULL', 2, 159, 7, 1, 5, '2020-05-25 16:03:30', '2020-05-25 16:03:30'),
(4, NULL, 2, 'FULL', 2, 160, 7, 1, 5, '2020-05-25 16:10:03', '2020-05-25 16:10:03'),
(5, NULL, 3, 'FULL', 2, 160, 3, 2, 5, '2020-05-25 16:10:49', '2020-05-25 16:10:49'),
(6, NULL, 3, 'FULL', 3, 160, 2, 2, 5, '2020-05-25 16:24:33', '2020-05-25 16:24:33');

-- --------------------------------------------------------

--
-- Структура таблиці `lesson_types`
--

CREATE TABLE `lesson_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `lesson_types`
--

INSERT INTO `lesson_types` (`id`, `name`, `description`) VALUES
(1, 'Лекція', NULL),
(2, 'Практичне заняття', NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(3, 'main', '2020-01-10 17:40:44', '2020-01-10 17:40:44'),
(4, 'main-navigation', '2020-01-16 16:10:27', '2020-02-02 16:54:42');

-- --------------------------------------------------------

--
-- Структура таблиці `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Панель управління', 'admin', '_self', 'voyager-rocket', '#000000', NULL, 1, '2019-09-04 16:52:48', '2020-02-06 18:56:15', NULL, ''),
(2, 1, 'Медіа', '', '_self', 'voyager-images', '#000000', NULL, 3, '2019-09-04 16:52:48', '2020-02-12 17:52:51', 'voyager.media.index', 'null'),
(3, 1, 'Користувачі', '', '_self', 'voyager-person', '#000000', 45, 1, '2019-09-04 16:52:48', '2020-02-12 17:52:45', 'voyager.users.index', 'null'),
(4, 1, 'Ролі', '', '_self', 'voyager-lock', '#000000', 45, 2, '2019-09-04 16:52:48', '2020-02-12 17:52:51', 'voyager.roles.index', 'null'),
(5, 1, 'Налаштування', '', '_self', 'voyager-tools', '#000000', NULL, 9, '2019-09-04 16:52:48', '2020-05-19 18:22:55', NULL, ''),
(6, 1, 'Налаштування Меню', '', '_self', 'voyager-list', '#000000', 5, 1, '2019-09-04 16:52:48', '2019-09-09 10:58:25', 'voyager.menus.index', 'null'),
(7, 1, 'База даних', '', '_self', 'voyager-data', '#000000', 5, 2, '2019-09-04 16:52:48', '2019-09-09 11:00:12', 'voyager.database.index', 'null'),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2019-09-04 16:52:48', '2019-09-04 17:35:44', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2019-09-04 16:52:48', '2019-09-04 17:35:44', 'voyager.bread.index', NULL),
(10, 1, 'Системні налаштування', '', '_self', 'voyager-settings', '#000000', NULL, 10, '2019-09-04 16:52:48', '2020-05-19 18:22:55', 'voyager.settings.index', 'null'),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2019-09-04 16:52:48', '2019-09-04 17:35:44', 'voyager.hooks', NULL),
(13, 1, 'Категорії', '', '_self', 'voyager-categories', '#000000', 22, 1, '2019-09-06 03:13:33', '2020-01-19 16:02:52', 'voyager.categories.index', 'null'),
(14, 1, 'Новини', '', '_self', 'voyager-news', '#000000', 22, 2, '2019-09-06 03:13:33', '2020-01-19 16:06:01', 'voyager.posts.index', 'null'),
(15, 1, 'Сторінки', '', '_self', 'voyager-file-text', '#000000', 58, 1, '2019-09-06 03:13:33', '2020-05-18 15:52:12', 'voyager.pages.index', 'null'),
(16, 3, 'Новини', '', '_self', 'Новини', '#000000', NULL, 1, '2020-01-10 17:41:49', '2020-01-13 19:00:43', 'posts', 'null'),
(21, 4, 'Home 2 2', 'home2-2', '_self', NULL, '#000000', 20, 1, '2020-01-16 16:31:25', '2020-01-16 16:31:35', NULL, ''),
(22, 1, 'Новини', '', '_self', 'voyager-news', '#000000', NULL, 5, '2020-01-19 16:02:42', '2020-05-18 15:52:15', NULL, ''),
(23, 1, 'Типи інфоблоків', '', '_self', 'voyager-categories', '#000000', 59, 1, '2020-01-22 19:07:45', '2020-05-18 15:55:47', 'voyager.infoblock-types.index', 'null'),
(24, 1, 'Інфоблоки', '', '_self', 'voyager-photos', '#000000', 58, 2, '2020-01-29 17:14:13', '2020-05-19 18:21:57', 'voyager.infoblocks.index', 'null'),
(27, 1, 'Соціальні мережі', '', '_self', 'voyager-facebook', '#000000', NULL, 11, '2020-01-30 19:20:37', '2020-05-19 18:22:55', 'voyager.social-networks.index', 'null'),
(29, 4, 'Про факультет', '', '_self', NULL, '#000000', NULL, 1, '2020-02-02 16:54:18', '2020-02-05 06:30:50', NULL, ''),
(30, 4, 'Вступнику', '', '_self', NULL, '#000000', NULL, 2, '2020-02-02 16:55:00', '2020-02-05 06:30:50', NULL, ''),
(31, 4, 'Правила прийому', '', '_self', NULL, '#000000', 30, 1, '2020-02-02 16:57:01', '2020-02-05 06:30:50', NULL, ''),
(32, 4, 'Напрямки навчання', 'education/courses/bakalavr', '_self', NULL, '#000000', 30, 2, '2020-02-02 16:57:08', '2020-03-12 19:50:48', NULL, ''),
(33, 4, 'Випускникам шкіл', 'vipusknikam-shkil', '_self', NULL, '#000000', 30, 3, '2020-02-02 16:57:18', '2020-05-10 10:30:52', NULL, ''),
(34, 4, 'Випускникам коледжів', '', '_self', NULL, '#000000', 30, 4, '2020-02-02 16:57:27', '2020-02-05 06:30:50', NULL, ''),
(35, 4, 'Магістратура', '', '_self', NULL, '#000000', 30, 5, '2020-02-02 16:57:37', '2020-02-05 06:30:50', NULL, ''),
(36, 4, 'Навчальна робота', '', '_self', NULL, '#000000', NULL, 3, '2020-02-02 16:58:05', '2020-02-05 06:30:50', NULL, ''),
(37, 4, 'Розклад занятть', '', '_self', NULL, '#000000', 36, 1, '2020-02-02 16:58:13', '2020-02-02 16:58:35', NULL, ''),
(38, 4, 'Стипендія', '', '_self', NULL, '#000000', 36, 2, '2020-02-02 16:58:21', '2020-02-02 16:58:36', NULL, ''),
(39, 4, 'Школа спотривного програмування', '', '_self', NULL, '#000000', 36, 3, '2020-02-02 16:58:28', '2020-02-02 16:58:38', NULL, ''),
(40, 4, 'Адміністрація', '', '_self', NULL, '#000000', NULL, 4, '2020-02-02 16:58:45', '2020-02-05 06:30:50', NULL, ''),
(41, 4, 'Студентська організація', '', '_self', NULL, '#000000', NULL, 5, '2020-02-02 16:58:54', '2020-02-05 06:30:50', NULL, ''),
(42, 4, 'Наші випускники', 'nashi-vipuskniki', '_self', 'Наші студенти', '#000000', NULL, 6, '2020-02-02 16:59:02', '2020-03-11 20:48:56', NULL, ''),
(43, 4, 'Новини', '', '_self', NULL, '#000000', NULL, 7, '2020-02-02 16:59:53', '2020-02-05 06:30:50', 'posts', NULL),
(44, 1, 'Інформація користувачів', '', '_self', 'voyager-people', '#000000', 45, 4, '2020-02-11 21:05:30', '2020-05-24 09:47:55', 'voyager.people-infos.index', 'null'),
(45, 1, 'Користувачі', '', '_self', 'voyager-person', '#000000', NULL, 2, '2020-02-12 17:52:32', '2020-02-12 17:52:44', NULL, ''),
(46, 1, 'Галереї', '', '_self', 'voyager-photos', '#000000', 58, 3, '2020-02-12 19:24:14', '2020-05-19 18:21:57', 'voyager.galleries.index', 'null'),
(49, 1, 'Освітні ступені', '', '_self', 'voyager-file-text', '#000000', 52, 1, '2020-02-28 14:39:46', '2020-02-29 07:33:49', 'voyager.education-degrees.index', 'null'),
(50, 1, 'Освітні програми', '', '_self', 'voyager-file-text', '#000000', 52, 3, '2020-02-28 14:44:06', '2020-02-29 07:34:23', 'voyager.education-programs.index', NULL),
(51, 1, 'Освітні спеціальності', '', '_self', 'voyager-file-text', NULL, 52, 2, '2020-02-28 14:46:01', '2020-02-29 07:34:23', 'voyager.education-specialties.index', NULL),
(52, 1, 'Освіта', '', '_self', 'voyager-company', '#000000', NULL, 6, '2020-02-29 07:20:47', '2020-05-18 15:52:15', NULL, ''),
(54, 1, 'Групи інформації користувачів', '', '_self', 'voyager-people', NULL, 45, 5, '2020-03-02 19:35:39', '2020-05-24 09:47:55', 'voyager.people-info-groups.index', NULL),
(55, 1, 'Дисципліни', '', '_self', 'voyager-book', NULL, 57, 1, '2020-05-18 14:32:50', '2020-05-18 15:50:31', 'voyager.disciplines.index', NULL),
(56, 1, 'Інтеграція', '', '_self', 'voyager-logbook', '#000000', NULL, 12, '2020-05-18 14:38:21', '2020-05-19 18:22:55', 'voyager.integration-logs.index', 'null'),
(57, 1, 'Розклад', '', '_self', 'voyager-calendar', '#000000', NULL, 7, '2020-05-18 15:50:21', '2020-05-18 15:52:15', NULL, ''),
(58, 1, 'Налаштування сайту', '', '_self', 'voyager-browser', '#000000', NULL, 4, '2020-05-18 15:51:58', '2020-05-18 15:52:11', NULL, ''),
(59, 1, 'Довідники', '', '_self', 'voyager-window-list', '#000000', NULL, 13, '2020-05-18 15:54:30', '2020-05-19 18:22:55', NULL, ''),
(60, 1, 'Типи періодів', '', '_self', 'voyager-alarm-clock', NULL, 59, 2, '2020-05-19 18:11:24', '2020-05-19 18:22:04', 'voyager.period-types.index', NULL),
(61, 1, 'Періоди', '', '_self', 'voyager-alarm-clock', NULL, 59, 3, '2020-05-19 18:12:32', '2020-05-19 18:22:05', 'voyager.periods.index', NULL),
(62, 1, 'Пункти рейтингу', '', '_self', 'voyager-bar-chart', NULL, 64, 2, '2020-05-19 18:16:00', '2020-05-19 18:22:02', 'voyager.rating-items.index', NULL),
(63, 1, 'Блоки пунктів рейтингу', '', '_self', 'voyager-bar-chart', NULL, 64, 1, '2020-05-19 18:17:11', '2020-05-19 18:22:00', 'voyager.rating-item-groups.index', NULL),
(64, 1, 'Рейтинг', '', '_self', 'voyager-bar-chart', '#000000', NULL, 8, '2020-05-19 18:21:47', '2020-05-19 18:22:55', NULL, ''),
(65, 1, 'Навчальні групи', '', '_self', 'voyager-wallet', '#000000', 45, 3, '2020-05-23 17:27:29', '2020-05-24 09:47:55', 'voyager.groups.index', 'null'),
(66, 1, 'Рейтинг студентів', '', '_self', 'voyager-bar-chart', NULL, 64, 3, '2020-05-24 09:55:04', '2020-05-24 09:57:38', 'voyager.user-rating-items.index', NULL),
(67, 1, 'Факультети', '', '_self', 'voyager-study', '#000000', 59, 7, '2020-05-25 13:24:54', '2020-05-25 13:52:40', 'voyager.faculties.index', 'null'),
(68, 1, 'Типи аудиторій', '', '_self', 'voyager-company', '#000000', 59, 5, '2020-05-25 13:26:51', '2020-05-25 13:52:28', 'voyager.audience-types.index', 'null'),
(69, 1, 'Типи занять', '', '_self', 'voyager-pen', NULL, 59, 6, '2020-05-25 13:27:57', '2020-05-25 13:52:28', 'voyager.lesson-types.index', NULL),
(70, 1, 'Дні', '', '_self', 'voyager-calendar', NULL, 59, 4, '2020-05-25 13:29:54', '2020-05-25 13:52:28', 'voyager.days.index', NULL),
(71, 1, 'Корпуси', '', '_self', 'voyager-company', NULL, 57, 2, '2020-05-25 13:30:58', '2020-05-25 13:52:46', 'voyager.buildings.index', NULL),
(72, 1, 'Аудиторії', '', '_self', 'voyager-company', NULL, 57, 3, '2020-05-25 13:33:10', '2020-05-25 13:52:53', 'voyager.audiences.index', NULL),
(73, 1, 'Заняття', '', '_self', 'voyager-book', '#000000', 57, 4, '2020-05-25 13:51:18', '2020-05-25 13:52:59', 'voyager.lessons.index', 'null');

-- --------------------------------------------------------

--
-- Структура таблиці `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2019_08_20_180420_create_contact_table', 2),
(8, '2014_10_12_000000_create_users_table', 3),
(9, '2014_10_12_100000_create_password_resets_table', 3),
(10, '2019_08_20_195106_create_contacts_table', 3),
(11, '2019_09_03_181815_create_courses_table', 3),
(12, '2016_01_01_000000_add_voyager_user_fields', 4),
(13, '2016_01_01_000000_create_data_types_table', 4),
(14, '2016_05_19_173453_create_menu_table', 4),
(15, '2016_10_21_190000_create_roles_table', 4),
(16, '2016_10_21_190000_create_settings_table', 4),
(17, '2016_11_30_135954_create_permission_table', 4),
(18, '2016_11_30_141208_create_permission_role_table', 4),
(19, '2016_12_26_201236_data_types__add__server_side', 4),
(20, '2017_01_13_000000_add_route_to_menu_items_table', 4),
(21, '2017_01_14_005015_create_translations_table', 4),
(22, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 4),
(23, '2017_03_06_000000_add_controller_to_data_types_table', 4),
(24, '2017_04_21_000000_add_order_to_data_rows_table', 4),
(25, '2017_07_05_210000_add_policyname_to_data_types_table', 4),
(26, '2017_08_05_000000_add_group_to_settings_table', 4),
(27, '2017_11_26_013050_add_user_role_relationship', 4),
(28, '2017_11_26_015000_create_user_roles_table', 4),
(29, '2018_03_11_000000_add_user_settings', 4),
(30, '2018_03_14_000000_add_details_to_data_types_table', 4),
(31, '2018_03_16_000000_make_settings_value_nullable', 4),
(32, '2016_01_01_000000_create_pages_table', 5),
(33, '2016_01_01_000000_create_posts_table', 5),
(34, '2016_02_15_204651_create_categories_table', 5),
(35, '2017_04_11_000000_alter_post_nullable_fields_table', 5),
(36, '2020_01_19_172158_create_posts_in_categories_table', 6),
(37, '2020_01_19_180034_create_category_post_table', 7),
(38, '2020_01_22_204541_create_infoblock_types_table', 8),
(39, '2020_01_22_205910_create_infoblock_types_table', 9),
(40, '2020_01_24_155807_create_infoblocks_table', 10),
(41, '2020_01_24_161735_create_infoblock_items_table', 10),
(42, '2020_01_30_202504_create_contact_infos_table', 11),
(43, '2020_01_30_203320_create_social_networks_table', 11),
(50, '2020_02_11_224055_create_people_infos_table', 16),
(51, '2020_02_12_211233_create_galleries_table', 17),
(52, '2020_02_12_211243_create_gallery_images_table', 17),
(53, '2020_02_28_125601_create_education_degrees_table', 18),
(54, '2020_02_28_125611_create_education_specialties_table', 18),
(55, '2020_02_28_125618_create_education_programs_table', 18),
(56, '2020_03_02_211243_create_people_info_groups_table', 19),
(62, '2020_03_02_212727_create_people_info_in_group_table', 20),
(63, '2020_05_16_094800_create_integration_logs_table', 20),
(64, '2020_05_16_094824_create_sys_sync_meta_data_table', 20),
(65, '2020_05_17_180613_create_groups_table', 21),
(66, '2020_05_18_170754_create_disciplines_table', 22),
(67, '2020_05_18_190408_add_education_columns_to_users', 23),
(68, '2020_05_19_203112_create_rating_item_groups_table', 24),
(69, '2020_05_19_203126_create_rating_items_table', 24),
(70, '2020_05_19_203140_create_period_types_table', 24),
(71, '2020_05_19_203149_create_periods_table', 24),
(72, '2020_05_19_203159_create_user_rating_items_table', 25),
(73, '2020_05_19_210622_add_is_public_column_to_social_metworks', 26),
(74, '2020_05_19_212432_add_columns_to_rating_items', 27),
(75, '2020_05_19_212440_add_columns_to_rating_item_groups', 27),
(76, '2020_05_20_192802_create_people_info_social_networks_table', 28),
(77, '2020_05_20_214735_add_column_to_user_rating_items', 29),
(78, '2020_05_24_121754_add_comment_column_to_user_rating_items_table', 30),
(79, '2020_05_25_120444_create_faculties_table', 31),
(80, '2020_05_25_120559_create_audience_types_table', 31),
(81, '2020_05_25_120618_create_lesson_types_table', 31),
(82, '2020_05_25_120640_create_audience_lesson_types_table', 31),
(83, '2020_05_25_120729_create_days_table', 31),
(84, '2020_05_25_120823_create_buildings_table', 31),
(85, '2020_05_25_121405_create_audiences_table', 31),
(86, '2020_05_25_121459_create_lessons_table', 31),
(87, '2020_05_25_121548_create_professor_in_lessons_table', 32),
(88, '2020_05_25_121556_create_group_in_lessons_table', 33),
(89, '2020_05_25_210238_create_user_notifications_table', 34);

-- --------------------------------------------------------

--
-- Структура таблиці `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(2, 1, 'Кафедра інформаційних систем', 'Кафедра інформаційних систем', '<p>[people-info code=\"shvidenko-mihajlo-zinovijovich\" view=\"teacher\"]</p>\n<p>Кафедра інформаційних систем створена в 1997р. Основною метою діяльності кафедри є підготовка спеціалістів, які забезпечують розробку і впровадження інформаційних систем та комп&rsquo;ютерних технологій в агропромисловому комплексі. Кафедра веде підготовку студентів факультету інформаційних технологій, економічного факультету, факультету аграрного менеджменту та навчально-наукового інституту післядипломної освіти.</p>\n<p>&nbsp;</p>\n<p>На кафедрі постійно йде процес поліпшення матеріальної, навчальної і методичної бази, започатковуються нові дисципліни, які відповідають сучасним вимогам. Ще в кінці 90-х років, першою серед аграрних вищих навчальних закладів України, кафедра запровадила елементи дистанційного навчання у навчальний процес. При цьому активно проводились семінари різного рівня, створювались електронні навчальні посібники, велась просвітницька діяльність по впровадженню дистанційного навчання як ефективного напрямку більш повної реалізації прав громадян на освіту. Кафедра інформаційних систем першою адаптувала на українську мову міжнародну систему дистанційного навчання Moodle, яка нині ефективно використовується університетом у навчальному процесі.</p>\n<p>[gallery code=\"kafedra-informacijnih-sistem\"]</p>\n<p>&nbsp;</p>\n<p>[infoblock code=\"kafedri-fakul-tetu\" view=\"default-slider\"]</p>\n<p>[infoblock code=\"partneri\"]</p>', 'pages\\February2020\\jX2vuloV86XZrzwufFPp.jpg', 'kafedra-informacijnih-sistem', 'meta', 'meta', 'ACTIVE', '2020-02-10 18:37:00', '2020-02-18 21:02:47'),
(4, 1, 'Кафедри факультету', NULL, '<p>[infoblock code=\"kafedri-fakul-tetu\"]</p>', NULL, 'departments', NULL, NULL, 'ACTIVE', '2020-02-12 18:37:04', '2020-02-12 18:38:07'),
(6, 1, 'Випускникам шкіл', 'Випускникам шкіл', '<p>Відповідно до <strong>Правил прийому на 2020 рік</strong>&nbsp; вступ на базі повної загальної середньої освіти буде проходити на основі <strong>сертифікатів ЗНО 2020, 2019, 2018 та 2017&nbsp; років. Оцінки з англійської, французької, німецької та іспанської мов приймаються лише із сертифікатів зовнішнього незалежного оцінювання 2018-2020 років.&nbsp;</strong></p>\n<p>Звертаємо Вашу увагу, що цьогоріч можна буде подати <strong>до п\'яти заяв</strong> за спеціальностями, на які передбачено прийом за кошти державного бюджету. Кількість поданих заяв на спеціальності, на яких не передбачається прийому за кошти державного бюджету, не обмежується.</p>\n<p>Під час подання заяв абітурієнт, що претендує на місця державного або регіонального замовлення, має зазначити її пріоритетність, при цьому показник пріоритетності 1 (один) означає найвищу пріоритетність.&nbsp;</p>\n<p><strong>Зазначена вступником пріоритетність заяви не може бути зміненою.</strong></p>\n<p><strong>Прийом заяв і документів на навчання розпочинається з <span style=\"color: #ff0000;\">13 липня 2020 року</span>.</strong></p>\n<p>Мінімальна кількість балів з конкурсних предметів для допуску до участі в конкурсі:</p>\n<ul>\n<li>українська мова і література &ndash; <span style=\"color: #ff0000;\"><strong>100 балів</strong></span>.</li>\n<li>другий предмет &ndash; <span style=\"color: #ff0000;\"><strong>100 балів</strong></span> для усіх спеціальностей, окрім спеціальності <strong>Геодезія та землеустрій</strong> &ndash; <span style=\"color: #ff0000;\"><strong>110 балів</strong></span>.</li>\n<li>третій предмет (на вибір з двох) &ndash; <span style=\"color: #ff0000;\"><strong>100 балів</strong></span>.</li>\n</ul>\n<p>&nbsp;</p>\n<p>[infoblock code=\"vipusknikam-shkil-posilannya\"]</p>', NULL, 'vipusknikam-shkil', '', '', 'ACTIVE', '2020-05-10 09:43:16', '2020-05-10 10:20:40'),
(7, 1, 'Перелік документів', '', '<p><strong>VІ. Порядок прийому заяв та документів для участі у конкурсному відборі до НУБіП України</strong></p>\n<p>1. Вступники на основі повної загальної середньої освіти подають заяви:</p>\n<ul>\n<li>тільки в електронній формі, крім визначених у цьому пункті випадків;</li>\n<li>тільки у паперовій формі:</li>\n<li>для реалізації права на вступ за співбесідою відповідно до цих Правил;</li>\n<li>для реалізації права на повторне безоплатне здобуття освіти за бюджетні кошти відповідно до цих Правил;</li>\n<li>за наявності розбіжностей в даних вступника в ЄДЕБО (прізвище, ім&rsquo;я, по батькові, дата народження, стать, громадянство тощо) і у відповідному документі про здобуття повної загальної середньої освіти та у сертифікаті зовнішнього незалежного оцінювання;</li>\n<li>у разі подання іноземного документа про освіту;</li>\n<li>у разі подання документа про повну загальну середню освіту, виданого до запровадження фотополімерних технологій їх виготовлення;</li>\n<li>у разі подання заяви після завершення строків роботи електронних кабінетів;</li>\n<li>для реалізації права на нарахування додаткових балів, передбачених абзацом восьмим підпункту 1 пункту 8 розділу VII цих Правил;</li>\n<li>у разі неможливості зареєструвати електронний кабінет або подати заяву в електронній формі з інших причин, що підтверджено довідкою приймальної комісії НУБіП України.</li>\n</ul>\n<p>Вступники, зазначені в абзаці четвертому цього пункту, можуть подавати заяви в електронній формі з подальшим поданням документів, що підтверджують право на вступ за співбесідою, які мають бути подані в строки прийому заяв, відповідно до цих Правил.</p>\n<p>Для реалізації права на вступ за результатами вступних іспитів з конкурсних предметів у НУБіП України та/або квотою-1, квотою для іноземців, першочергового зарахування, у разі подання документів іноземцями та особами без громадянства, які постійно проживають в Україні, вступники одночасно з поданням заяви в електронній формі подають копії (сканкопії) підтвердних документів.</p>\n<p>Вступники можуть подати до п&rsquo;яти заяв на місця державного та регіонального замовлення у фіксованих (закритих) та відкритих конкурсних пропозиціях. Подання заяв на конкурсні пропозиції для участі в конкурсі на місця за кошти фізичних та/або юридичних осіб не обмежується.</p>\n<p>2. Вступники для здобуття ступеня магістра (крім спеціальностей галузей знань 01 &laquo;Освіта/Педагогіка&raquo;, 20 &laquo;Аграрні науки та продовольство&raquo;) на основі здобутого ступеня вищої освіти або освітньо-кваліфікаційного рівня спеціаліста подають заяви:</p>\n<ul>\n<li>тільки в електронній формі, крім визначених у цьому пункті випадків;</li>\n<li>тільки у паперовій формі:</li>\n<li>для реалізації права на вступ за результатами вступних іспитів з конкурсних предметів у НУБіП України та/або квотою для іноземців відповідно до цих Правил;</li>\n<li>для реалізації права на повторне безоплатне здобуття освіти за бюджетні кошти відповідно до цих Правил;</li>\n<li>для реалізації права на першочергове зарахування відповідно до цих Правил;</li>\n<li>за наявності розбіжностей у даних вступника в ЄДЕБО (прізвище, ім&rsquo;я, по батькові, дата народження, стать, громадянство тощо) і у відповідному документі про здобуття ступеня (освітньо-кваліфікаційного рівня) вищої освіти на базі якого відбувається вступ;</li>\n<li>у разі подання іноземного документа про освіту;</li>\n<li>у разі подання заяви іноземцями та особами без громадянства, які постійно проживають в Україні;</li>\n<li>у разі подання документа про здобуття ступеня (освітньо-кваліфікаційного рівня) вищої освіти, на базі якого відбувається вступ, інформація про який відсутня в ЄДЕБО;</li>\n<li>у разі подання заяви після завершення строків роботи електронних кабінетів;</li>\n<li>у разі неможливості зареєструвати електронний кабінет або подати заяву в електронній формі з інших причин, що підтверджено довідкою приймальної комісії НУБіП України.</li>\n</ul>\n<p>Вступники можуть подати до п&rsquo;яти заяв на місця державного та регіонального замовлення. Подання заяв на конкурсні пропозиції для участі в конкурсі на місця за кошти фізичних та/або юридичних осіб не обмежується.</p>\n<p>3. Інші категорії вступників, крім зазначених у пункті 1 і 2 цього розділу, подають заяви тільки в паперовій формі.</p>\n<p>4. Заява в електронній формі подається вступником шляхом заповнення електронної форми в режимі он-лайн та розглядається приймальною комісією НУБіП України у Порядком визначеному законодавством.</p>\n<p>В НУБіП України на час вступної кампанії створюються консультаційні центри при приймальній комісії для надання допомоги вступникам під час подання заяв в електронній формі. Вступники можуть звернутися до консультаційного центру з метою створення електронного кабінету, внесення заяв в електронній формі, завантаження додатка до документа про освіту на основі якого відбувається вступ, довідки про реєстрацію місця проживання (за потреби), згідно з додатком 13 до Правил реєстрації місця проживання та Порядку передачі органами реєстрації інформації до Єдиного державного демографічного реєстру, затвердженого постановою Кабінету Міністрів України від 02 березня 2016 року № 207.</p>\n<p>5. Заява в паперовій формі подається вступником особисто до приймальної комісії НУБіП України. Відомості кожної заяви в паперовому вигляді реєструються уповноваженою особою приймальної комісії в ЄДЕБО в день прийняття заяви.</p>\n<p>6. У заяві вступники вказують конкурсну пропозицію із зазначенням спеціальності (предметної спеціальності, спеціалізації, освітньої програми) та форми здобуття освіти.</p>\n<p>Під час подання заяв на відкриті та фіксовані (закриті) конкурсні пропозиції вступники обов&rsquo;язково зазначають один з таких варіантів:</p>\n<p>&laquo;Претендую на участь у конкурсі на місце державного або регіонального замовлення і на участь у конкурсі на місця за кошти фізичних та/або юридичних осіб у разі неотримання рекомендації за цією конкурсною пропозицією за кошти державного або місцевого бюджету (за державним або регіональним замовленням)&raquo;;</p>\n<p>&laquo;Претендую на участь у конкурсі виключно на місця за кошти фізичних та/або юридичних осіб, повідомлений про неможливість переведення в межах вступної кампанії на місця державного або регіонального замовлення&raquo;.</p>\n<p>Під час подання заяв на небюджетну конкурсну пропозицію вступники претендують на участь у конкурсі виключно на місця за кошти фізичних та/або юридичних осіб і попереджаються про неможливість переведення в межах вступної кампанії на місця державного або регіонального замовлення.</p>\n<p>Вступники для здобуття освітнього ступеня бакалавра (магістра ветеринарного спрямування) на основі повної загальної середньої освіти та вступники для здобуття ступеня магістра на основі ступеня бакалавра, магістра (освітньо-кваліфікаційного рівня спеціаліста) за спеціальністю 081 &laquo;Право&raquo;, що претендують на місця державного або регіонального замовлення за денною або заочною формою здобуття освіти, у кожній заяві зазначають її пріоритетність; при цьому показник пріоритетності 1 (один) означає найвищу пріоритетність.</p>\n<p>Зазначена вступником пріоритетність заяв не може бути змінена.</p>\n<p>Для участі у конкурсі для вступу за різними формами здобуття освіти вступники подають окремі заяви.</p>\n<p>7. Під час подання заяви в паперовій формі вступник особисто пред&rsquo;являє оригінали:</p>\n<ul>\n<li>документа (одного з документів), що посвідчує особу передбаченого Законом України &laquo;Про Єдиний державний демографічний реєстр та документи, що підтверджують громадянство, посвідчують особу чи її спеціальний статус&raquo;;</li>\n<li>військового-облікового документа для військовозобов&rsquo;язаних (крім випадків, передбачених законодавством);</li>\n<li>документа державного зразка про раніше здобутий освітній ступінь (освітньо-кваліфікаційний рівень), на основі якого здійснюється вступ, і додаток до нього;</li>\n<li>документи, які підтверджують право вступника на зарахування за співбесідою, на участь у конкурсі за результатами вступних іспитів та/або квотою-1 на основі повної загальної середньої освіти, на участь у конкурсі за іспитами під час вступу для здобуття ступеня магістра на основі ступеня бакалавра, магістра (освітньо-кваліфікаційного рівня спеціаліста) замість єдиного вступного іспиту з іноземної мови та/або єдиного фахового вступного випробування.</li>\n</ul>\n<p>Вступники, які проживають на тимчасово окупованій території України або переселилися з неї після 01 січня 2020 року, а також вступники, які проживають на територіях, де органи державної влади тимчасово не здійснюють свої повноваження, подають документи з урахуванням особливостей, передбачених наказом № 560 та наказом № 697 відповідно.</p>\n<p>Якщо з об&rsquo;єктивних причин документ про здобутий освітній ступінь (освітньо-кваліфікаційний рівень) відсутній, може подаватись довідка державного підприємства &laquo;Інфоресурс&raquo; про його здобуття, у тому числі без подання додатка до документа про здобутий освітній (освітньо-кваліфікаційний) рівень.</p>\n<p>8. До заяви, поданої в паперовій формі, вступник додає:</p>\n<ul>\n<li>копію документа (одного з документів), що посвідчує особу, передбаченого Законом України &laquo;Про Єдиний державний демографічний реєстр та документи, що підтверджують громадянство, посвідчують особу чи її спеціальний статус&raquo;;</li>\n<li>копію військово-облікового документа ‒ для військовозобов&rsquo;язаних (крім випадків, передбачених законодавством);</li>\n<li>копію документа державного зразка про раніше здобутий освітній (освітньо-кваліфікаційний) рівень, на основі якого здійснюється вступ, і копію додатка до нього;</li>\n<li>копію сертифіката (сертифікатів) зовнішнього незалежного оцінювання (для вступників на основі повної загальної середньої освіти та освітньо-кваліфікаційного рівня молодшого спеціаліста) або екзаменаційного листка єдиного фахового вступного випробування/єдиного вступного іспиту (у визначених цими Правилами випадках;</li>\n<li>медичну довідку за формою 086/о;</li>\n<li>чотири кольорові фотокартки розміром 3 х 4 см.</li>\n</ul>\n<p>Інші копії документів подаються вступником, якщо це викликано особливими умовами вступу на відповідні конкурсні пропозиції, установлені законодавством, у строки, визначені для прийому документів.</p>\n<p>9. Копії документів, що засвідчують підстави для отримання спеціальних умов для зарахування за співбесідою, на участь у конкурсі за результатами вступних іспитів та/або квотою-1 на основі повної загальної середньої освіти, спеціальних умов для участі в конкурсі за результатами вступних іспитів під час вступу на здобуття ступеня магістра на основі здобутого ступеня бакалавра, магістра (освітньо-кваліфікаційного рівня спеціаліста) за спеціальністю 081 &laquo;Право&raquo; подаються вступником особисто при поданні документів у паперовій формі у визначені цими Правилами або відповідно до них терміни. Не подані своєчасно документи, що засвідчують підстави для отримання спеціальних умов на зарахування за співбесідою, на участь у конкурсі за результатами вступних іспитів та/або квотою-1 на основі повної загальної середньої освіти, унеможливлюють їх реалізацію.</p>\n<p>10. Копії документів, що засвідчують підстави для отримання спеціальних умов особою, яка зарахована на навчання за кошти фізичних та/або юридичних осіб для здобуття освітнього ступеня бакалавра (магістра ветеринарного спрямування) на основі повної загальної середньої освіти, на переведення на вакантні місця державного замовлення та за рахунок цільових пільгових державних кредитів подаються вступником особисто одночасно з виконанням вимог для зарахування на місця за кошти фізичних та/або юридичних осіб, але не пізніше ніж 06 серпня. Не подані своєчасно документи, що засвідчують підстави для отримання спеціальних умов на переведення на вакантні місця державного замовлення та за рахунок цільових пільгових державних кредитів, унеможливлюють їх реалізацію.</p>\n<p>11. Усі копії документів, які подаються при вступі до НУБіП України, засвідчуються за оригіналами приймальною (відбірковою) комісією. Копії документа, що посвідчує особу, військового квитка (посвідчення про приписку) не підлягають засвідченню. Копії документів без пред&rsquo;явлення оригіналів не приймаються.</p>\n<p>12. Приймальна комісія здійснює перевірку підстав для отримання спеціальних умов для зарахування за співбесідою, на участь у конкурсі за результатами вступних іспитів та/або квотою-1 на основі повної загальної середньої освіти, спеціальних умов для участі в конкурсі за результатами вступних іспитів під час вступу на здобуття ступеня магістра на основі здобутого ступеня бакалавра, магістра (освітньо-кваліфікаційного рівня спеціаліста) за спеціальністю 081 &laquo;Право&raquo; та спеціальних умов для осіб, які зараховані на навчання за кошти фізичних та/або юридичних осіб для здобуття освітнього ступеня бакалавра (магістра ветеринарного спрямування) на основі повної загальної середньої освіти, на переведення на вакантні місця державного замовлення та за рахунок цільових пільгових державних кредитів.</p>\n<p>Приймальна комісія здійснює перевірку середнього бала документа про освіту, поданого в паперовій формі (обчислює в разі відсутності), затверджує його своїм рішенням і вносить інформацію про середній бал документа про освіту до ЄДЕБО. У разі подання вступником заяви в електронній формі приймальна комісія здійснює перевірку середнього бала документа про освіту на підставі його сканованої копії (фотокопії).</p>\n<p>13. Приймальна комісія розглядає заяви та документи вступників і приймає рішення про допуск до участі в конкурсному відборі для вступу на навчання до НУБіП України протягом трьох робочих днів з дати реєстрації заяви в ЄДЕБО або отримання результатів вступних випробувань, але не пізніше наступного дня після завершення прийому документів. Оприлюднення поточних рейтингових списків вступників здійснюється на офіційному веб-сайті НУБіП України на підставі даних, внесених до ЄДЕБО.</p>\n<p>14. Факт ознайомлення вступника з Правилами прийому, наявною ліцензією і сертифікатом про акредитацію відповідної освітньої програми (спеціальності), а також факт наявності/відсутності підстав для участі у конкурсі за результатами вступних іспитів, зарахування за співбесідою, зарахування за квотою-1, квотою-4 фіксуються в заяві вступника та підтверджуються його особистим підписом при поданні заяви у паперовій формі.</p>\n<p>У разі подання документів на неакредитовані освітні програми (спеціальності), вступники особисто підписують окремий документ щодо поінформованості про відсутність акредитації та ознайомлення з частиною 6 статті 7 Закону України &laquo;Про вищу освіту&raquo;.</p>\n<p>Вступник має право до дати закінчення подання електронних заяв скасувати у власному електронному кабінеті подану ним раніше заяву, зареєстровану та допущену до конкурсу у НУБіП України, без права подання нової заяви з такою ж пріоритетністю.</p>\n<p>Паперова заява зареєстрована в ЄДЕБО, може бути скасована НУБіП України на підставі рішення приймальної комісії до дати закінчення прийому документів на навчання для заяв у паперовій формі за умови допущення технічної помилки під час внесення відповідних даних до ЄДЕБО, що підтверджується актом про допущену технічну помилку, який сформовано і роздрукована з ЄДЕБО. Скасована заява вважається не поданою, а факт такого подання анулюється в ЄДЕБО.</p>\n<p>Електронна заява, зареєстрована в ЄДЕБО, може бути скасована Технічним адміністратором ЄДЕБО на підставі офіційного рішення розпорядника ЄДЕБО не пізніше як за день до закінчення подання електронних заяв за умови виявлення технічної помилки під час внесення відповідних даних до ЄДЕБО. Скасована заява вважається не поданою, а факт такого подання анулюється в ЄДЕБО.</p>\n<p>Технічний адміністратор засобами мобільного зв&rsquo;язку або електронного зв&rsquo;язку повідомляє вступникові про скасування заяви в день її скасування, після чого вступник може подати нову заяву з такою самою пріоритетністю.</p>\n<p>15. Під час прийняття на навчання осіб, які подають документ про здобутий за кордоном ступінь (рівень) освіти (далі &ndash; Документ), обов&rsquo;язковою є процедура визнання і встановлення еквівалентності Документа, що здійснюється відповідно до наказу Міністерства освіти і науки України від 05 травня 2015 року № 504 &laquo;Деякі питання визнання в Україні іноземних документів про освіту&raquo;, зареєстрованого в Міністерстві юстиції України 27 травня 2015 року за № 614/27059.</p>\n<p>16. Під час прийняття на навчання осіб, які подають документ про вищу духовну освіту, виданий закладом вищої духовної освіти, обов&rsquo;язковим є подання Свідоцтва про державне визнання документа про вищу духовну освіту або рішення вченої ради закладу вищої освіти (наукової установи) щодо визнання зазначеного документа у встановленому законодавством порядку.</p>\n<p>17. Під час подання заяв та документів для здобуття ступеня бакалавра (магістра ветеринарного спрямування) на основі освітньо-кваліфікаційного рівня молодшого спеціаліста, можуть прийматися як документи про освітньо-кваліфікаційний рівень молодшого спеціаліста, що виготовлені відповідно до постанови Кабінету Міністрів України від 31 березня 2015 р. № 193 &laquo;Про документи про вищу освіту (наукові ступені) державного зразка&raquo;, так і документи про освітньо-кваліфікаційний рівень молодшого спеціаліста, що виготовлені згідно з постановою від 22 липня 2015 року № 645 &laquo;Про документи про загальну середню та професійно-технічну освіту державного зразка і додатки до них&raquo;.</p>', NULL, 'perelik-dokumentiv', '', '', 'ACTIVE', '2020-05-10 10:27:30', '2020-05-10 10:27:30'),
(8, 1, 'Терміни вступної кампанії', 'Строки прийому заяв та документів, конкурсного відбору та зарахування на навчання для здобуття освітнього ступеня бакалавра (магістра ветеринарного спрямування) на основі повної загальної середньої освіти', '<p>Строки прийому заяв та документів, конкурсного відбору та зарахування на навчання для здобуття освітнього ступеня бакалавра (магістра ветеринарного спрямування) на основі повної загальної середньої освіти</p>', NULL, 'termini-vstupnoyi-kampaniyi', '', '', 'INACTIVE', '2020-05-10 10:43:41', '2020-05-10 10:43:41');

-- --------------------------------------------------------

--
-- Структура таблиці `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('vlad_litvinchyk@ukr.net', '$2y$10$tkW9SRy7kFBBzpNQij9NUOdsuam7wMqXAK/2jQprrZ36DK5D/PSgO', '2020-01-16 17:21:45');

-- --------------------------------------------------------

--
-- Структура таблиці `people_infos`
--

CREATE TABLE `people_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','NOT_PUBLISHED','CHANGED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'CHANGED',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `people_infos`
--

INSERT INTO `people_infos` (`id`, `user_id`, `name`, `slug`, `phone`, `email`, `position`, `description`, `image`, `link`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Швиденко Михайло Зіновійович', 'shvidenko-mihajlo-zinovijovich', NULL, NULL, 'Завідувач кафедри', '<p><span style=\"color: rgba(0, 4, 57, 0.75); font-family: Raleway, sans-serif; font-size: 17.075px;\">кандидат економічних наук, доцент, заслужений професор НУБіП України, відмінник аграрної освіти і науки України, заслужений працівник освіти України</span></p>', 'people-infos\\February2020\\BVJzWdD8Yc1KWGE9S3zn.jpg', NULL, 'CHANGED', '2020-02-11 21:07:00', '2020-02-11 21:07:00'),
(2, 1, 'Литвинчук Владислав', 'litvinchuk-vladislav', '380985413495', 'vlad_litvinchyk@ukr.net', '', 'Студент спеціальності \"Комп\'ютерні науки\" 2020 року випуску. SQL / C# / JS deweloper в компанії SalesUp. Розробник Creatio (BPMonline) систем.', 'people-infos\\February2020\\5o6ZYBILUN1X7kxOAyRQ.png', NULL, 'PUBLISHED', '2020-02-27 17:49:27', '2020-05-21 17:18:26'),
(3, 39, 'Чубар Людмила', 'chubar-lyudmila', NULL, 'arriadnie@gmail.com', '', 'Студентка спеціальності \"Комп\'ютерні науки\" 2020 року випуску. Web developer в компанції CF digital', 'people-infos\\February2020\\KeMW8bD9wOH1vNTEQt48.jpg', NULL, 'PUBLISHED', '2020-02-27 17:55:34', '2020-05-24 16:20:14');

-- --------------------------------------------------------

--
-- Структура таблиці `people_info_groups`
--

CREATE TABLE `people_info_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `people_info_groups`
--

INSERT INTO `people_info_groups` (`id`, `name`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Випускники', 'vipuskniki', NULL, '2020-03-02 19:42:30', '2020-03-02 19:42:30'),
(2, 'Випускники (головна)', 'vipuskniki-golovna', NULL, '2020-03-03 05:30:05', '2020-03-03 05:30:05');

-- --------------------------------------------------------

--
-- Структура таблиці `people_info_in_group`
--

CREATE TABLE `people_info_in_group` (
  `people_info_id` bigint(20) UNSIGNED NOT NULL,
  `people_info_group_id` int(10) UNSIGNED NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `people_info_in_group`
--

INSERT INTO `people_info_in_group` (`people_info_id`, `people_info_group_id`, `order`) VALUES
(2, 1, 1),
(3, 1, 0),
(2, 2, 0),
(3, 2, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `people_info_social_networks`
--

CREATE TABLE `people_info_social_networks` (
  `people_info_id` bigint(20) UNSIGNED NOT NULL,
  `social_network_id` int(10) UNSIGNED NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `periods`
--

CREATE TABLE `periods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `period_type_id` int(10) UNSIGNED DEFAULT NULL,
  `start_date` date NOT NULL,
  `due_date` date NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `periods`
--

INSERT INTO `periods` (`id`, `name`, `period_type_id`, `start_date`, `due_date`, `description`) VALUES
(1, 'Травень 2020', 1, '2020-05-01', '2020-05-31', NULL),
(2, 'Квітень 2020', 1, '2020-04-01', '2020-04-30', NULL),
(3, 'Березень 2020', 1, '2020-03-01', '2020-03-31', NULL),
(4, 'Червень 2020', 1, '2020-06-01', '2020-06-30', NULL),
(5, '2 семестр 2019-2020 нр.', 2, '2020-02-03', '2020-07-17', NULL),
(6, '1 семестр 2020-2021 нр.', 2, '2020-09-01', '2020-12-31', NULL),
(7, 'Липень 2020', 1, '2020-07-01', '2020-07-31', NULL),
(8, 'Серпень 2020', 1, '2020-08-01', '2020-08-31', NULL),
(9, 'Грудень 2019', 1, '2019-12-01', '2019-12-31', NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `period_types`
--

CREATE TABLE `period_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `period_types`
--

INSERT INTO `period_types` (`id`, `name`, `description`) VALUES
(1, 'Місяць', NULL),
(2, 'Семестр', NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(2, 'browse_bread', NULL, '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(3, 'browse_database', NULL, '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(4, 'browse_media', NULL, '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(5, 'browse_compass', NULL, '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(6, 'browse_menus', 'menus', '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(7, 'read_menus', 'menus', '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(8, 'edit_menus', 'menus', '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(9, 'add_menus', 'menus', '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(10, 'delete_menus', 'menus', '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(11, 'browse_roles', 'roles', '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(12, 'read_roles', 'roles', '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(13, 'edit_roles', 'roles', '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(14, 'add_roles', 'roles', '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(15, 'delete_roles', 'roles', '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(16, 'browse_users', 'users', '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(17, 'read_users', 'users', '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(18, 'edit_users', 'users', '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(19, 'add_users', 'users', '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(20, 'delete_users', 'users', '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(21, 'browse_settings', 'settings', '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(22, 'read_settings', 'settings', '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(23, 'edit_settings', 'settings', '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(24, 'add_settings', 'settings', '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(25, 'delete_settings', 'settings', '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(26, 'browse_hooks', NULL, '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(27, 'browse_categories', 'categories', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(28, 'read_categories', 'categories', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(29, 'edit_categories', 'categories', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(30, 'add_categories', 'categories', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(31, 'delete_categories', 'categories', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(32, 'browse_posts', 'posts', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(33, 'read_posts', 'posts', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(34, 'edit_posts', 'posts', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(35, 'add_posts', 'posts', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(36, 'delete_posts', 'posts', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(37, 'browse_pages', 'pages', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(38, 'read_pages', 'pages', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(39, 'edit_pages', 'pages', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(40, 'add_pages', 'pages', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(41, 'delete_pages', 'pages', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(42, 'browse_infoblock_types', 'infoblock_types', '2020-01-22 19:22:41', '2020-01-22 19:22:41'),
(43, 'read_infoblock_types', 'infoblock_types', '2020-01-22 19:22:41', '2020-01-22 19:22:41'),
(44, 'edit_infoblock_types', 'infoblock_types', '2020-01-22 19:22:41', '2020-01-22 19:22:41'),
(45, 'add_infoblock_types', 'infoblock_types', '2020-01-22 19:22:41', '2020-01-22 19:22:41'),
(46, 'delete_infoblock_types', 'infoblock_types', '2020-01-22 19:22:41', '2020-01-22 19:22:41'),
(47, 'browse_infoblocks', 'infoblocks', '2020-01-29 17:15:03', '2020-01-29 17:15:03'),
(48, 'read_infoblocks', 'infoblocks', '2020-01-29 17:15:03', '2020-01-29 17:15:03'),
(49, 'edit_infoblocks', 'infoblocks', '2020-01-29 17:15:03', '2020-01-29 17:15:03'),
(50, 'add_infoblocks', 'infoblocks', '2020-01-29 17:15:03', '2020-01-29 17:15:03'),
(51, 'delete_infoblocks', 'infoblocks', '2020-01-29 17:15:03', '2020-01-29 17:15:03'),
(52, 'browse_infoblock_items', 'infoblock_items', '2020-01-30 14:18:22', '2020-01-30 14:18:22'),
(53, 'read_infoblock_items', 'infoblock_items', '2020-01-30 14:18:22', '2020-01-30 14:18:22'),
(54, 'edit_infoblock_items', 'infoblock_items', '2020-01-30 14:18:22', '2020-01-30 14:18:22'),
(55, 'add_infoblock_items', 'infoblock_items', '2020-01-30 14:18:22', '2020-01-30 14:18:22'),
(56, 'delete_infoblock_items', 'infoblock_items', '2020-01-30 14:18:22', '2020-01-30 14:18:22'),
(57, 'browse_social_networks', 'social_networks', '2020-01-30 19:20:37', '2020-01-30 19:20:37'),
(58, 'read_social_networks', 'social_networks', '2020-01-30 19:20:37', '2020-01-30 19:20:37'),
(59, 'edit_social_networks', 'social_networks', '2020-01-30 19:20:37', '2020-01-30 19:20:37'),
(60, 'add_social_networks', 'social_networks', '2020-01-30 19:20:37', '2020-01-30 19:20:37'),
(61, 'delete_social_networks', 'social_networks', '2020-01-30 19:20:37', '2020-01-30 19:20:37'),
(67, 'browse_people_infos', 'people_infos', '2020-02-11 21:05:30', '2020-02-11 21:05:30'),
(68, 'read_people_infos', 'people_infos', '2020-02-11 21:05:30', '2020-02-11 21:05:30'),
(69, 'edit_people_infos', 'people_infos', '2020-02-11 21:05:30', '2020-02-11 21:05:30'),
(70, 'add_people_infos', 'people_infos', '2020-02-11 21:05:30', '2020-02-11 21:05:30'),
(71, 'delete_people_infos', 'people_infos', '2020-02-11 21:05:30', '2020-02-11 21:05:30'),
(72, 'browse_galleries', 'galleries', '2020-02-12 19:24:14', '2020-02-12 19:24:14'),
(73, 'read_galleries', 'galleries', '2020-02-12 19:24:14', '2020-02-12 19:24:14'),
(74, 'edit_galleries', 'galleries', '2020-02-12 19:24:14', '2020-02-12 19:24:14'),
(75, 'add_galleries', 'galleries', '2020-02-12 19:24:14', '2020-02-12 19:24:14'),
(76, 'delete_galleries', 'galleries', '2020-02-12 19:24:14', '2020-02-12 19:24:14'),
(77, 'browse_gallery_images', 'gallery_images', '2020-02-12 19:27:44', '2020-02-12 19:27:44'),
(78, 'read_gallery_images', 'gallery_images', '2020-02-12 19:27:44', '2020-02-12 19:27:44'),
(79, 'edit_gallery_images', 'gallery_images', '2020-02-12 19:27:44', '2020-02-12 19:27:44'),
(80, 'add_gallery_images', 'gallery_images', '2020-02-12 19:27:44', '2020-02-12 19:27:44'),
(81, 'delete_gallery_images', 'gallery_images', '2020-02-12 19:27:44', '2020-02-12 19:27:44'),
(82, 'browse_education_degrees', 'education_degrees', '2020-02-28 14:39:45', '2020-02-28 14:39:45'),
(83, 'read_education_degrees', 'education_degrees', '2020-02-28 14:39:46', '2020-02-28 14:39:46'),
(84, 'edit_education_degrees', 'education_degrees', '2020-02-28 14:39:46', '2020-02-28 14:39:46'),
(85, 'add_education_degrees', 'education_degrees', '2020-02-28 14:39:46', '2020-02-28 14:39:46'),
(86, 'delete_education_degrees', 'education_degrees', '2020-02-28 14:39:46', '2020-02-28 14:39:46'),
(87, 'browse_education_programs', 'education_programs', '2020-02-28 14:44:06', '2020-02-28 14:44:06'),
(88, 'read_education_programs', 'education_programs', '2020-02-28 14:44:06', '2020-02-28 14:44:06'),
(89, 'edit_education_programs', 'education_programs', '2020-02-28 14:44:06', '2020-02-28 14:44:06'),
(90, 'add_education_programs', 'education_programs', '2020-02-28 14:44:06', '2020-02-28 14:44:06'),
(91, 'delete_education_programs', 'education_programs', '2020-02-28 14:44:06', '2020-02-28 14:44:06'),
(92, 'browse_education_specialties', 'education_specialties', '2020-02-28 14:46:01', '2020-02-28 14:46:01'),
(93, 'read_education_specialties', 'education_specialties', '2020-02-28 14:46:01', '2020-02-28 14:46:01'),
(94, 'edit_education_specialties', 'education_specialties', '2020-02-28 14:46:01', '2020-02-28 14:46:01'),
(95, 'add_education_specialties', 'education_specialties', '2020-02-28 14:46:01', '2020-02-28 14:46:01'),
(96, 'delete_education_specialties', 'education_specialties', '2020-02-28 14:46:01', '2020-02-28 14:46:01'),
(97, 'browse_people_info_groups', 'people_info_groups', '2020-03-02 19:35:39', '2020-03-02 19:35:39'),
(98, 'read_people_info_groups', 'people_info_groups', '2020-03-02 19:35:39', '2020-03-02 19:35:39'),
(99, 'edit_people_info_groups', 'people_info_groups', '2020-03-02 19:35:39', '2020-03-02 19:35:39'),
(100, 'add_people_info_groups', 'people_info_groups', '2020-03-02 19:35:39', '2020-03-02 19:35:39'),
(101, 'delete_people_info_groups', 'people_info_groups', '2020-03-02 19:35:39', '2020-03-02 19:35:39'),
(102, 'browse_disciplines', 'disciplines', '2020-05-18 14:32:50', '2020-05-18 14:32:50'),
(103, 'read_disciplines', 'disciplines', '2020-05-18 14:32:50', '2020-05-18 14:32:50'),
(104, 'edit_disciplines', 'disciplines', '2020-05-18 14:32:50', '2020-05-18 14:32:50'),
(105, 'add_disciplines', 'disciplines', '2020-05-18 14:32:50', '2020-05-18 14:32:50'),
(106, 'delete_disciplines', 'disciplines', '2020-05-18 14:32:50', '2020-05-18 14:32:50'),
(107, 'browse_integration_logs', 'integration_logs', '2020-05-18 14:38:21', '2020-05-18 14:38:21'),
(108, 'read_integration_logs', 'integration_logs', '2020-05-18 14:38:21', '2020-05-18 14:38:21'),
(109, 'edit_integration_logs', 'integration_logs', '2020-05-18 14:38:21', '2020-05-18 14:38:21'),
(110, 'add_integration_logs', 'integration_logs', '2020-05-18 14:38:21', '2020-05-18 14:38:21'),
(111, 'delete_integration_logs', 'integration_logs', '2020-05-18 14:38:21', '2020-05-18 14:38:21'),
(112, 'browse_period_types', 'period_types', '2020-05-19 18:11:24', '2020-05-19 18:11:24'),
(113, 'read_period_types', 'period_types', '2020-05-19 18:11:24', '2020-05-19 18:11:24'),
(114, 'edit_period_types', 'period_types', '2020-05-19 18:11:24', '2020-05-19 18:11:24'),
(115, 'add_period_types', 'period_types', '2020-05-19 18:11:24', '2020-05-19 18:11:24'),
(116, 'delete_period_types', 'period_types', '2020-05-19 18:11:24', '2020-05-19 18:11:24'),
(117, 'browse_periods', 'periods', '2020-05-19 18:12:32', '2020-05-19 18:12:32'),
(118, 'read_periods', 'periods', '2020-05-19 18:12:32', '2020-05-19 18:12:32'),
(119, 'edit_periods', 'periods', '2020-05-19 18:12:32', '2020-05-19 18:12:32'),
(120, 'add_periods', 'periods', '2020-05-19 18:12:32', '2020-05-19 18:12:32'),
(121, 'delete_periods', 'periods', '2020-05-19 18:12:32', '2020-05-19 18:12:32'),
(122, 'browse_rating_items', 'rating_items', '2020-05-19 18:16:00', '2020-05-19 18:16:00'),
(123, 'read_rating_items', 'rating_items', '2020-05-19 18:16:00', '2020-05-19 18:16:00'),
(124, 'edit_rating_items', 'rating_items', '2020-05-19 18:16:00', '2020-05-19 18:16:00'),
(125, 'add_rating_items', 'rating_items', '2020-05-19 18:16:00', '2020-05-19 18:16:00'),
(126, 'delete_rating_items', 'rating_items', '2020-05-19 18:16:00', '2020-05-19 18:16:00'),
(127, 'browse_rating_item_groups', 'rating_item_groups', '2020-05-19 18:17:11', '2020-05-19 18:17:11'),
(128, 'read_rating_item_groups', 'rating_item_groups', '2020-05-19 18:17:11', '2020-05-19 18:17:11'),
(129, 'edit_rating_item_groups', 'rating_item_groups', '2020-05-19 18:17:11', '2020-05-19 18:17:11'),
(130, 'add_rating_item_groups', 'rating_item_groups', '2020-05-19 18:17:11', '2020-05-19 18:17:11'),
(131, 'delete_rating_item_groups', 'rating_item_groups', '2020-05-19 18:17:11', '2020-05-19 18:17:11'),
(132, 'browse_groups', 'groups', '2020-05-23 17:27:29', '2020-05-23 17:27:29'),
(133, 'read_groups', 'groups', '2020-05-23 17:27:29', '2020-05-23 17:27:29'),
(134, 'edit_groups', 'groups', '2020-05-23 17:27:29', '2020-05-23 17:27:29'),
(135, 'add_groups', 'groups', '2020-05-23 17:27:29', '2020-05-23 17:27:29'),
(136, 'delete_groups', 'groups', '2020-05-23 17:27:29', '2020-05-23 17:27:29'),
(137, 'browse_user_rating_items', 'user_rating_items', '2020-05-24 09:55:04', '2020-05-24 09:55:04'),
(138, 'read_user_rating_items', 'user_rating_items', '2020-05-24 09:55:04', '2020-05-24 09:55:04'),
(139, 'edit_user_rating_items', 'user_rating_items', '2020-05-24 09:55:04', '2020-05-24 09:55:04'),
(140, 'add_user_rating_items', 'user_rating_items', '2020-05-24 09:55:04', '2020-05-24 09:55:04'),
(141, 'delete_user_rating_items', 'user_rating_items', '2020-05-24 09:55:04', '2020-05-24 09:55:04'),
(142, 'browse_faculties', 'faculties', '2020-05-25 13:24:54', '2020-05-25 13:24:54'),
(143, 'read_faculties', 'faculties', '2020-05-25 13:24:54', '2020-05-25 13:24:54'),
(144, 'edit_faculties', 'faculties', '2020-05-25 13:24:54', '2020-05-25 13:24:54'),
(145, 'add_faculties', 'faculties', '2020-05-25 13:24:54', '2020-05-25 13:24:54'),
(146, 'delete_faculties', 'faculties', '2020-05-25 13:24:54', '2020-05-25 13:24:54'),
(147, 'browse_audience_types', 'audience_types', '2020-05-25 13:26:51', '2020-05-25 13:26:51'),
(148, 'read_audience_types', 'audience_types', '2020-05-25 13:26:51', '2020-05-25 13:26:51'),
(149, 'edit_audience_types', 'audience_types', '2020-05-25 13:26:51', '2020-05-25 13:26:51'),
(150, 'add_audience_types', 'audience_types', '2020-05-25 13:26:51', '2020-05-25 13:26:51'),
(151, 'delete_audience_types', 'audience_types', '2020-05-25 13:26:51', '2020-05-25 13:26:51'),
(152, 'browse_lesson_types', 'lesson_types', '2020-05-25 13:27:57', '2020-05-25 13:27:57'),
(153, 'read_lesson_types', 'lesson_types', '2020-05-25 13:27:57', '2020-05-25 13:27:57'),
(154, 'edit_lesson_types', 'lesson_types', '2020-05-25 13:27:57', '2020-05-25 13:27:57'),
(155, 'add_lesson_types', 'lesson_types', '2020-05-25 13:27:57', '2020-05-25 13:27:57'),
(156, 'delete_lesson_types', 'lesson_types', '2020-05-25 13:27:57', '2020-05-25 13:27:57'),
(157, 'browse_days', 'days', '2020-05-25 13:29:54', '2020-05-25 13:29:54'),
(158, 'read_days', 'days', '2020-05-25 13:29:54', '2020-05-25 13:29:54'),
(159, 'edit_days', 'days', '2020-05-25 13:29:54', '2020-05-25 13:29:54'),
(160, 'add_days', 'days', '2020-05-25 13:29:54', '2020-05-25 13:29:54'),
(161, 'delete_days', 'days', '2020-05-25 13:29:54', '2020-05-25 13:29:54'),
(162, 'browse_buildings', 'buildings', '2020-05-25 13:30:58', '2020-05-25 13:30:58'),
(163, 'read_buildings', 'buildings', '2020-05-25 13:30:58', '2020-05-25 13:30:58'),
(164, 'edit_buildings', 'buildings', '2020-05-25 13:30:58', '2020-05-25 13:30:58'),
(165, 'add_buildings', 'buildings', '2020-05-25 13:30:58', '2020-05-25 13:30:58'),
(166, 'delete_buildings', 'buildings', '2020-05-25 13:30:58', '2020-05-25 13:30:58'),
(167, 'browse_audiences', 'audiences', '2020-05-25 13:33:10', '2020-05-25 13:33:10'),
(168, 'read_audiences', 'audiences', '2020-05-25 13:33:10', '2020-05-25 13:33:10'),
(169, 'edit_audiences', 'audiences', '2020-05-25 13:33:10', '2020-05-25 13:33:10'),
(170, 'add_audiences', 'audiences', '2020-05-25 13:33:10', '2020-05-25 13:33:10'),
(171, 'delete_audiences', 'audiences', '2020-05-25 13:33:10', '2020-05-25 13:33:10'),
(172, 'browse_lessons', 'lessons', '2020-05-25 13:51:18', '2020-05-25 13:51:18'),
(173, 'read_lessons', 'lessons', '2020-05-25 13:51:18', '2020-05-25 13:51:18'),
(174, 'edit_lessons', 'lessons', '2020-05-25 13:51:18', '2020-05-25 13:51:18'),
(175, 'add_lessons', 'lessons', '2020-05-25 13:51:18', '2020-05-25 13:51:18'),
(176, 'delete_lessons', 'lessons', '2020-05-25 13:51:18', '2020-05-25 13:51:18');

-- --------------------------------------------------------

--
-- Структура таблиці `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 4),
(1, 5),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(16, 6),
(17, 1),
(17, 6),
(18, 1),
(18, 6),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(32, 6),
(33, 1),
(33, 6),
(34, 1),
(34, 6),
(35, 1),
(35, 6),
(36, 1),
(36, 6),
(37, 1),
(37, 5),
(37, 6),
(38, 1),
(38, 5),
(38, 6),
(39, 1),
(39, 5),
(39, 6),
(40, 1),
(40, 5),
(40, 6),
(41, 1),
(41, 5),
(41, 6),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(47, 5),
(47, 6),
(48, 1),
(48, 5),
(48, 6),
(49, 1),
(49, 5),
(49, 6),
(50, 1),
(50, 5),
(50, 6),
(51, 1),
(51, 5),
(51, 6),
(52, 1),
(52, 5),
(52, 6),
(53, 1),
(53, 5),
(53, 6),
(54, 1),
(54, 5),
(54, 6),
(55, 1),
(55, 5),
(55, 6),
(56, 1),
(56, 5),
(56, 6),
(57, 1),
(57, 6),
(58, 1),
(58, 6),
(59, 1),
(59, 6),
(60, 1),
(60, 6),
(61, 1),
(67, 1),
(67, 5),
(67, 6),
(68, 1),
(68, 5),
(68, 6),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(72, 5),
(72, 6),
(73, 1),
(73, 5),
(73, 6),
(74, 1),
(74, 5),
(74, 6),
(75, 1),
(75, 5),
(75, 6),
(76, 1),
(76, 5),
(76, 6),
(77, 1),
(77, 5),
(77, 6),
(78, 1),
(78, 5),
(78, 6),
(79, 1),
(79, 5),
(79, 6),
(80, 1),
(80, 5),
(80, 6),
(81, 1),
(81, 5),
(81, 6),
(82, 1),
(82, 5),
(83, 1),
(83, 5),
(84, 1),
(84, 5),
(85, 1),
(85, 5),
(86, 1),
(86, 5),
(87, 1),
(87, 5),
(88, 1),
(88, 5),
(89, 1),
(89, 5),
(90, 1),
(90, 5),
(91, 1),
(91, 5),
(92, 1),
(92, 5),
(93, 1),
(93, 5),
(94, 1),
(94, 5),
(95, 1),
(95, 5),
(96, 1),
(96, 5),
(97, 1),
(97, 5),
(97, 6),
(98, 1),
(98, 5),
(98, 6),
(99, 1),
(99, 5),
(99, 6),
(100, 1),
(100, 5),
(100, 6),
(101, 1),
(101, 5),
(101, 6),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(158, 1),
(159, 1),
(160, 1),
(161, 1),
(162, 1),
(163, 1),
(164, 1),
(165, 1),
(166, 1),
(167, 1),
(168, 1),
(169, 1),
(170, 1),
(171, 1),
(172, 1),
(173, 1),
(174, 1),
(175, 1),
(176, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'Заголовок укр', '', 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'zagolovok-ukr', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-09-06 03:13:33', '2020-01-19 17:19:43'),
(2, 1, 2, 'My Sample Post', '', 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n<h2>We can use all kinds of format!</h2>\n<p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 1, '2019-09-06 03:13:33', '2020-02-04 06:49:07'),
(3, 1, 1, 'Latest Post', '', 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-09-06 03:13:33', '2020-02-04 06:49:18'),
(4, 1, 2, 'Yarr Post', '', 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-09-06 03:13:33', '2020-02-04 06:49:28'),
(5, 1, 1, 'Elearn', '', 'Інфо про ельорн', '<p>Навчальний портал</p>\n<p><a href=\"https://elearn.nubip.edu.ua/login/index.php\">Посилання на сайт</a></p>\n<p>&nbsp;</p>\n<p><img title=\"Назва фото\" src=\"http://localhost:8000/storage/posts/January2020/elearning-banner2-1354x500.png\" alt=\"Опис\" width=\"617\" height=\"228\" /></p>\n<ul>\n<li>1</li>\n<li>2</li>\n<li>3</li>\n</ul>\n<p><span style=\"color: #ff0000;\">красний</span></p>', 'posts\\January2020\\bX7uzVo8AaMXFAqCDZoU.png', 'elearn', '', '', 'PUBLISHED', 0, '2020-01-14 17:59:12', '2020-02-04 06:48:49'),
(6, 1, 3, 'Новина про квіти', '', '', '<p><span style=\"color: #000000; font-family: \'Open Sans\', Arial, sans-serif; text-align: justify;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p>', 'posts\\February2020\\TJpRhsFLLFMMQ9LpybuC.jpg', 'novina-pro-kviti', '', '', 'PUBLISHED', 0, '2020-02-04 18:37:54', '2020-02-04 18:39:55'),
(7, 1, 1, 'Єдиноріг', '', '', '<p><span style=\"color: #000000; font-family: \'Open Sans\', Arial, sans-serif; text-align: justify;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p>', 'posts\\February2020\\tGDPS5488YfZjH1vIwnZ.jpg', 'yedinorig', '', '', 'PUBLISHED', 0, '2020-02-04 18:38:23', '2020-02-04 18:38:23'),
(8, 1, 2, 'Море', '', '', '<p><span style=\"color: #000000; font-family: \'Open Sans\', Arial, sans-serif; text-align: justify;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p>', 'posts\\February2020\\Vb4uU0M1vF7FHDnlxExM.jpg', 'more', '', '', 'PUBLISHED', 0, '2020-02-04 18:39:26', '2020-02-04 18:39:42'),
(9, 1, 2, '14 лютого', '', '', '<p>Всіх зі святом</p>', 'posts\\February2020\\jOu28ryJ4hlumna1xMkN.jpg', '14-lyutogo', '', '', 'PUBLISHED', 1, '2020-02-04 18:42:38', '2020-02-04 18:42:38'),
(10, 1, 1, 'Котик', '', '', '<p>Мемасікі</p>', 'posts\\February2020\\E85hw82vkHNwGldAyL5b.jpg', 'kotik', '', '', 'PUBLISHED', 0, '2020-02-04 18:43:06', '2020-02-04 18:43:06'),
(11, 1, 2, 'Новий 2020', '', 'Про новий рік.\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Mi proin sed libero enim sed faucibus turpis in eu. Venenatis tellus in metus vulputate eu scelerisque felis imperdiet proin. Sodales ut etiam sit amet nisl. Pharetra vel turpis nunc eget lorem dolor sed. ', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Mi proin sed libero enim sed faucibus turpis in eu. Venenatis tellus in metus vulputate eu scelerisque felis imperdiet proin. Sodales ut etiam sit amet nisl. Pharetra vel turpis nunc eget lorem dolor sed. Imperdiet nulla malesuada pellentesque elit eget gravida cum sociis. Est lorem ipsum dolor sit. Id donec ultrices tincidunt arcu non sodales neque sodales ut. Id interdum velit laoreet id donec. Integer vitae justo eget magna. Tellus integer feugiat scelerisque varius morbi. Ultrices neque ornare aenean euismod elementum nisi quis eleifend quam. Nibh tellus molestie nunc non blandit massa enim. Sed augue lacus viverra vitae congue. Cras fermentum odio eu feugiat pretium nibh. Nulla facilisi nullam vehicula ipsum a arcu. Purus non enim praesent elementum facilisis leo vel. Est sit amet facilisis magna etiam tempor orci eu lobortis. Nec tincidunt praesent semper feugiat nibh sed pulvinar proin gravida.</p>\n<figure class=\"image\"><img title=\"Символ року\" src=\"http://localhost:8000/storage/posts/February2020/mouse.jpg\" alt=\"Символ року\" width=\"512\" height=\"288\" />\n<figcaption>Мишка</figcaption>\n</figure>\n<p>&nbsp;</p>\n<p><strong>Molestie at elementum eu facilisis sed odi</strong>o. Ac turpis egestas integer eget aliquet nibh. Dictum non consectetur a erat nam at lectus. Tortor vitae purus faucibus ornare suspendisse sed. Dictum non consectetur a erat. Orci dapibus ultrices in iaculis nunc sed augue lacus viverra. Mattis rhoncus urna neque viverra. Elementum facilisis leo vel fringilla. Vestibulum rhoncus est pellentesque elit ullamcorper dignissim cras tincidunt lobortis. Morbi tincidunt ornare massa eget. At erat pellentesque adipiscing commodo elit at. Sed vulputate mi sit amet mauris commodo quis imperdiet massa. Amet justo donec enim diam vulputate ut pharetra. Id cursus metus aliquam eleifend mi in nulla. Porta nibh venenatis cras sed felis eget velit aliquet sagittis. Bibendum at varius vel pharetra. Massa sed elementum tempus egestas.</p>\n<p><a href=\"https://loremipsum.io/ru/generator/?n=5&amp;t=p\" target=\"_blank\" rel=\"noopener\">Lorem Ipsum Generator</a></p>\n<p><em>At ultrices mi tempus imperdiet nulla malesuada pellentesque elit. Etiam erat velit scelerisque in dictum. Cras sed felis eget velit aliquet sagittis.</em></p>\n<p>&nbsp;</p>\n<p>Mauris a diam maecenas sed enim ut sem viverra aliquet. Ullamcorper a lacus vestibulum sed. Lectus vestibulum mattis ullamcorper velit sed. Nulla porttitor massa id neque aliquam. Aliquet nec ullamcorper sit amet risus nullam eget. Leo integer malesuada nunc vel risus commodo viverra. Est pellentesque elit ullamcorper dignissim cras tincidunt lobortis feugiat. Varius quam quisque id diam vel. Proin sagittis nisl rhoncus mattis rhoncus urna neque. Suspendisse ultrices gravida dictum fusce. Venenatis lectus magna fringilla urna porttitor rhoncus. Adipiscing elit ut aliquam purus sit amet luctus venenatis. Etiam dignissim diam quis enim lobortis. Diam quam nulla porttitor massa.</p>\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://localhost:8000/storage/posts/February2020/ket.jpg\" alt=\"\" /></p>\n<p>Pulvinar etiam non quam lacus suspendisse faucibus interdum. Cursus metus aliquam eleifend mi in nulla posuere. Tempor id eu nisl nunc mi ipsum faucibus. Augue ut lectus arcu bibendum at varius vel. Ut faucibus pulvinar elementum integer enim neque volutpat ac tincidunt. Dis parturient montes nascetur ridiculus mus. Enim blandit volutpat maecenas volutpat blandit aliquam etiam erat. Euismod lacinia at quis risus. Nibh ipsum consequat nisl vel pretium lectus. Faucibus interdum posuere lorem ipsum dolor sit amet consectetur. Eu sem integer vitae justo eget magna fermentum. Nunc aliquet bibendum enim facilisis gravida neque convallis a. Viverra justo nec ultrices dui sapien eget mi proin. Scelerisque felis imperdiet proin fermentum leo vel orci porta non. Quam pellentesque nec nam aliquam sem et. Volutpat ac tincidunt vitae semper. Quis lectus nulla at volutpat diam ut. Eu feugiat pretium nibh ipsum consequat nisl vel.</p>\n<ul>\n<li>Augue ut lectus arcu bibendum at varius ve</li>\n<li>Augue ut lectus arcu</li>\n<li>Dis parturient montes nascetur ridiculus mus. Enim blandit volutpat maecenas volutpat blandit aliquam etiam erat. Euismod lacinia at quis risus. Nibh ipsum consequat nisl vel pretium lectus</li>\n</ul>\n<p>Porttitor massa id neque aliquam vestibulum morbi blandit. Senectus et netus et malesuada fames ac turpis. Nunc non blandit massa enim. <span style=\"color: #ff0000;\">Lorem mollis aliquam ut porttitor leo a diam sollicitudin.</span> Aliquam faucibus purus in massa tempor nec feugiat nisl pretium. Erat velit scelerisque in dictum non. Et tortor at risus viverra adipiscing at in tellus. Euismod nisi porta lorem mollis aliquam ut. Integer vitae justo eget magna fermentum iaculis eu. Purus in massa tempor nec feugiat nisl pretium fusce. Convallis posuere morbi leo urna molestie at elementum. Condimentum mattis pellentesque id nibh tortor id aliquet lectus proin. Egestas congue quisque egestas diam in arcu cursus euismod. Non nisi est sit amet facilisis.</p>\n<ol>\n<li>Кот</li>\n<li>Миша</li>\n<li>Дракон</li>\n<li>Кріль / Зайчик</li>\n<li>Мавпа</li>\n</ol>', 'posts\\February2020\\f8rfJrKE82tgqMTJkzzZ.jpg', 'novij-2020', '', '', 'PUBLISHED', 1, '2020-02-04 19:00:50', '2020-02-04 19:53:18');

-- --------------------------------------------------------

--
-- Структура таблиці `professor_in_lessons`
--

CREATE TABLE `professor_in_lessons` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `rating_items`
--

CREATE TABLE `rating_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `score` double NOT NULL DEFAULT 0,
  `rating_item_group_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `rating_items`
--

INSERT INTO `rating_items` (`id`, `name`, `description`, `score`, `rating_item_group_id`, `created_at`, `updated_at`, `order`) VALUES
(1, 'Голова об’єднаної студентської ради гуртожитків', '', 7, 3, '2020-05-19 18:59:48', '2020-05-23 14:24:08', 1),
(2, 'Голови СР гуртожитків', '', 5, 3, '2020-05-19 19:00:11', '2020-05-23 14:24:01', 2),
(3, 'Голова СО Університету', '', 10, 2, '2020-05-19 19:00:31', '2020-05-23 14:22:50', 3),
(4, 'Заступники голови СО Університету', '', 6, 2, '2020-05-19 19:00:44', '2020-05-23 14:22:57', 4),
(5, 'Голови СО на факультеті (ННІ)', '', 5, 2, '2020-05-23 14:22:36', '2020-05-23 14:22:42', 5),
(6, 'Члени Вченої ради Університету ', '', 3.7, 2, '2020-05-23 14:23:09', '2020-05-23 14:23:15', 6),
(7, 'Заступник голови СР Гуртожитку', '', 3.5, 3, '2020-05-23 14:23:45', '2020-05-23 14:23:54', 7),
(8, '1. Голова профбюро факультету (ННІ)', '', 4, 4, '2020-05-23 14:25:22', '2020-05-23 14:25:28', 8),
(9, '1. Членство у волонтерському зареєстрованому об\'єднанні', '', 2.25, 5, '2020-05-23 14:25:56', '2020-05-23 14:26:03', 9),
(10, '2. Курсант автошколи НУБіП України', '', 3.5, 5, '2020-05-23 14:26:21', '2020-05-23 14:26:27', 10),
(11, '1. Переможці і призери міжнародних олімпіад', '', 10, 7, '2020-05-23 14:29:34', '2020-05-23 14:29:39', 11),
(12, '2. Переможці II етапу Всеукраїнських студентських олімпіад (1 місце)', '', 10, 7, '2020-05-23 14:29:48', '2020-05-23 14:29:54', 12),
(13, '2.1. Переможці II етапу Всеукраїнських студентських олімпіад (2 місце)', '', 9.5, 7, '2020-05-23 14:30:11', '2020-05-23 14:30:17', 13),
(14, '2.2. Переможці II етапу Всеукраїнських студентських олімпіад (3 місце) ', '', 9, 7, '2020-05-23 14:30:28', '2020-05-23 14:30:33', 14),
(15, '1. Виступ на конференціях що проходять за межами території України (на іноземній мові) ', '', 7.5, 8, '2020-05-23 14:31:24', '2020-05-23 14:31:35', 15),
(16, '2. Виступ на конференціях, що проходять в Україні', '', 2.5, 8, '2020-05-23 14:32:05', '2020-05-23 14:32:14', 16),
(17, '3. Виступ на конференціях на рівні Університету', '', 2.5, 8, '2020-05-23 14:32:22', '2020-05-23 14:32:28', 17),
(18, '8. Участь у мистецьких заходах на рівні університету', '', 1.5, 11, '2020-05-24 16:32:22', '2020-05-24 16:33:17', 18),
(19, '9. Участь у мистецьких заходах на рівні факультету (ННІ)', '', 1.25, 11, '2020-05-24 16:32:43', '2020-05-24 16:33:08', 19),
(20, '10. Участь у мистецьких заходах на рівні гуртожитку', '', 1, 11, '2020-05-24 16:33:31', '2020-05-24 16:33:43', 20),
(21, '11. Написання статті на сайт Університету у публіцистичному стилі', '', 0.6, 11, '2020-05-24 16:33:56', '2020-05-24 16:34:06', 21),
(22, '3. Учасник збірної команди Чемпіонату гумору Університету', '', 2.5, 10, '2020-05-24 16:34:35', '2020-05-24 16:34:43', 22),
(23, '4. Учасник збірної команди Чемпіонату гумору факультету (ННІ)', '', 1, 10, '2020-05-24 16:34:50', '2020-05-24 16:34:56', 23);

-- --------------------------------------------------------

--
-- Структура таблиці `rating_item_groups`
--

CREATE TABLE `rating_item_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `rating_item_groups`
--

INSERT INTO `rating_item_groups` (`id`, `name`, `description`, `parent_id`, `created_at`, `updated_at`, `order`) VALUES
(1, '1. Участь у діяльності органів студентського самоврядування та соціальної роботи', '', NULL, '2020-05-19 18:41:49', '2020-05-23 14:20:52', 1),
(2, '1.1. Студентська організація (СО)', NULL, 1, '2020-05-19 18:42:00', '2020-05-19 18:45:12', 2),
(3, '1.2. Студентська рада (СР) гуртожитку', NULL, 1, '2020-05-19 18:42:11', '2020-05-19 18:45:02', 3),
(4, '1.3. Студентське профбюро', '', 1, '2020-05-23 14:21:25', '2020-05-23 14:21:25', 0),
(5, '1.4. Соціальна робота', '', 1, '2020-05-23 14:21:38', '2020-05-23 14:21:55', 0),
(6, '2. Навчально-наукова робота', '', NULL, '2020-05-23 14:28:49', '2020-05-23 14:28:49', 0),
(7, '2.1. Особисті досягнення', '', 6, '2020-05-23 14:29:10', '2020-05-23 14:29:10', 0),
(8, '2.2. Конференції', '', 6, '2020-05-23 14:31:04', '2020-05-23 14:31:04', 0),
(9, '4. Культурно-мистецька робота', '', NULL, '2020-05-24 16:30:52', '2020-05-24 16:30:52', 0),
(10, '4.1. Членство в колективах, командах', '', 9, '2020-05-24 16:31:11', '2020-05-24 16:31:11', 0),
(11, '4.2. Участь в культурно-мистецькому житті Університету', '', 9, '2020-05-24 16:31:51', '2020-05-24 16:31:51', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Адміністратор', '2019-09-04 16:52:48', '2020-05-18 16:44:23'),
(2, 'user', 'Користувач', '2019-09-04 16:52:48', '2020-05-18 16:44:06'),
(3, 'student', 'Студент', '2019-09-04 17:31:04', '2020-05-18 16:43:37'),
(4, 'starosta', 'Староста', '2020-05-18 16:45:14', '2020-05-18 16:45:14'),
(5, 'content-manager', 'Контент менеджер', '2020-05-18 16:47:49', '2020-05-18 16:47:49'),
(6, 'so-member', 'Член студентської організації', '2020-05-18 16:50:54', '2020-05-18 16:50:54');

-- --------------------------------------------------------

--
-- Структура таблиці `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'IT NULES', '', 'text', 7, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 25, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 34, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\May2020\\kPWP6sVaZamCC9lpMAYA.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'IT ADMIN', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to IT ADMIN. The Missing Admin for IT NULES', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', 'settings\\May2020\\FCakpD2u7N5v2KK7RuCW.png', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\May2020\\eJzX9EjgWodrD6tV80Q2.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
(15, 'site.university-name', 'University name', 'Національний Університет Біоресурсів і Природокористування України', NULL, 'text', 1, 'Site'),
(16, 'site.department-name', 'Department name', 'Факультет інформаційних технологій', NULL, 'text', 3, 'Site'),
(17, 'contacts.mobile-phone', 'Mobile phone', '+380 11 11 12 111, +380 11 11 13 111', NULL, 'text', 10, 'Contacts'),
(18, 'contacts.email', 'Email', 'itnules@it.nules.com', NULL, 'text', 11, 'Contacts'),
(21, 'contacts.address', 'Address', 'Київ, вул Героїв Оборони, 16а', NULL, 'text', 14, 'Contacts'),
(22, 'contacts.address-map-link', 'Adress map link', 'https://www.google.com/maps/place/Faculty+of+Information+Technologies/@50.3816406,30.4954718,17.58z/data=!4m5!3m4!1s0x40d4c895581f1195:0x86896fac0eccc12d!8m2!3d50.3814928!4d30.4960386', NULL, 'text', 15, 'Contacts'),
(24, 'posts.page-header-image', 'News page header image', 'settings\\February2020\\7tjzSCRMamlV3Bt6Ktnx.jpg', NULL, 'image', 17, 'Posts'),
(26, 'pages.default-page-image', 'Default page image', 'settings\\February2020\\wRECcdNAscxPCM0oqhso.jpg', NULL, 'image', 19, 'Pages'),
(28, 'posts.preview-title', 'Preview title', 'Новини та події', NULL, 'text', 21, 'Posts'),
(29, 'posts.preview-subtitle', 'Preview subtitle', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodq', NULL, 'text_area', 28, 'Posts'),
(31, 'main-page.courses-slider-title', 'Courses slider title', 'НАВЧАЛЬНІ ПРОГРАМИ', NULL, 'text', 23, 'Main page'),
(32, 'main-page.courses-slider-subtitle', 'Courses slider subtitle', 'Укр Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodq', NULL, 'text_area', 26, 'Main page'),
(33, 'site.logo', 'Site Logo', '[{\"download_link\":\"settings\\\\March2020\\\\xdCxJzPWMmVsGDqAkS54.svg\",\"original_name\":\"logo.svg\"}]', NULL, 'file', 35, 'Site'),
(34, 'main-page.courses-slider-title-en', 'Courses slider title EN', 'Education programs', NULL, 'text', 24, 'Main page'),
(36, 'posts.count-on-main-page', 'News count on main page', '3', NULL, 'text', 20, 'Posts'),
(37, 'posts.preview-title-en', 'Preview title EN', 'News and events', NULL, 'text', 27, 'Posts'),
(38, 'main-page.our-students-preview-title', 'Our students preview title', 'Наші студенти', NULL, 'text', 30, 'Main page'),
(39, 'main-page.our-students-preview-title-en', 'Our students preview title EN', 'Our students', NULL, 'text', 31, 'Main page'),
(40, 'main-page.our-students-preview-description', 'Our students preview description', 'Укр Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL, 'text_area', 32, 'Main page'),
(41, 'main-page.our-students-preview-description-en', 'Our students preview description EN', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL, 'text_area', 33, 'Main page'),
(42, 'main-page.courses-slider-subtitle-en', 'Courses slider subtitle EN', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodq', NULL, 'text_area', 29, 'Main page'),
(43, 'site.university-name-en', 'University name EN', 'National University of Life and Environmental Sciences of Ukraine', NULL, 'text', 2, 'Site'),
(44, 'site.department-name-en', 'Department name EN', 'Faculty of Information Technologies', NULL, 'text', 4, 'Site'),
(45, 'posts.page-title', 'Page title', 'Новини', NULL, 'text', 36, 'Posts'),
(46, 'posts.page-title-en', 'Page title EN', 'News', NULL, 'text', 37, 'Posts'),
(47, 'site.login-page-image', 'Login page image', 'settings\\May2020\\Sc0wqHTs3kg6Vl2yG15O.jpg', NULL, 'image', 38, 'Site'),
(51, 'integration.faculty-id-in-integrated-db', 'Faculty ID in integrated DB', '1', NULL, 'text', 42, 'Integration'),
(52, 'integration.integration-data-service-url', 'Integration data service URL', 'http://dekanat.itnules.ua/Data/GetDataService.php', NULL, 'text', 43, 'Integration'),
(53, 'pages.our-students-page-title', 'Our students page title', 'Наші випускники', NULL, 'text', 44, 'Pages'),
(54, 'users.default-password', 'Default password', 'changeme', NULL, 'text', 45, 'Users'),
(55, 'users.default-avatar', 'Default avatar', 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, 'image', 46, 'Users');

-- --------------------------------------------------------

--
-- Структура таблиці `social_networks`
--

CREATE TABLE `social_networks` (
  `id` int(10) UNSIGNED NOT NULL,
  `svg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_public` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `social_networks`
--

INSERT INTO `social_networks` (`id`, `svg`, `link`, `created_at`, `updated_at`, `name`, `is_public`) VALUES
(1, '[{\"download_link\":\"social-networks\\\\February2020\\\\XoLVDxyUMplCmj7UOpFZ.svg\",\"original_name\":\"instagram.svg\"}]', 'https://www.instagram.com/it_nules', '2020-02-02 14:59:00', '2020-05-20 17:24:20', 'Instagram', 1),
(2, '[{\"download_link\":\"social-networks\\\\February2020\\\\RiLa4rX0ZLnJUG0wfLE2.svg\",\"original_name\":\"facebook.svg\"}]', 'https://www.facebook.com/fitnubip', '2020-02-02 15:37:00', '2020-05-20 16:51:44', 'Facebook', 1),
(3, '[{\"download_link\":\"social-networks\\\\May2020\\\\aVYscGK1U15emBzG1fwZ.svg\",\"original_name\":\"youtube.svg\"}]', 'https://www.youtube.com/channel/UC-U1fqRT0jeRLUUDcMq1uaw', '2020-05-10 10:16:00', '2020-05-20 16:51:34', 'Youtube', 1);

-- --------------------------------------------------------

--
-- Структура таблиці `sys_sync_meta_data`
--

CREATE TABLE `sys_sync_meta_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `local_id` bigint(20) UNSIGNED NOT NULL,
  `remote_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Дамп даних таблиці `sys_sync_meta_data`
--

INSERT INTO `sys_sync_meta_data` (`id`, `model_name`, `local_id`, `remote_id`, `created_at`, `updated_at`) VALUES
(1, 'App\\Integration\\StudentGroupSyncItem', 1, 1, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(2, 'App\\Integration\\StudentGroupSyncItem', 2, 2, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(3, 'App\\Integration\\StudentGroupSyncItem', 3, 4, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(4, 'App\\Integration\\StudentGroupSyncItem', 4, 5, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(5, 'App\\Integration\\StudentGroupSyncItem', 5, 6, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(6, 'App\\Integration\\StudentGroupSyncItem', 6, 7, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(7, 'App\\Integration\\StudentGroupSyncItem', 7, 8, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(8, 'App\\Integration\\StudentGroupSyncItem', 8, 9, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(9, 'App\\Integration\\StudentGroupSyncItem', 9, 10, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(10, 'App\\Integration\\StudentGroupSyncItem', 10, 11, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(11, 'App\\Integration\\StudentGroupSyncItem', 11, 12, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(12, 'App\\Integration\\StudentGroupSyncItem', 12, 13, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(13, 'App\\Integration\\StudentGroupSyncItem', 13, 14, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(14, 'App\\Integration\\StudentGroupSyncItem', 14, 15, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(15, 'App\\Integration\\StudentGroupSyncItem', 15, 16, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(16, 'App\\Integration\\StudentGroupSyncItem', 16, 17, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(17, 'App\\Integration\\StudentGroupSyncItem', 17, 18, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(18, 'App\\Integration\\StudentGroupSyncItem', 18, 19, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(19, 'App\\Integration\\StudentGroupSyncItem', 19, 20, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(20, 'App\\Integration\\StudentGroupSyncItem', 20, 21, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(21, 'App\\Integration\\StudentGroupSyncItem', 21, 22, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(22, 'App\\Integration\\StudentGroupSyncItem', 22, 23, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(23, 'App\\Integration\\StudentGroupSyncItem', 23, 24, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(24, 'App\\Integration\\StudentGroupSyncItem', 24, 25, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(25, 'App\\Integration\\StudentGroupSyncItem', 25, 26, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(26, 'App\\Integration\\StudentGroupSyncItem', 26, 27, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(27, 'App\\Integration\\StudentGroupSyncItem', 27, 28, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(28, 'App\\Integration\\StudentGroupSyncItem', 28, 29, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(29, 'App\\Integration\\StudentGroupSyncItem', 29, 30, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(30, 'App\\Integration\\StudentGroupSyncItem', 30, 31, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(31, 'App\\Integration\\StudentGroupSyncItem', 31, 32, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(32, 'App\\Integration\\StudentGroupSyncItem', 32, 33, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(33, 'App\\Integration\\StudentGroupSyncItem', 33, 34, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(34, 'App\\Integration\\StudentGroupSyncItem', 34, 35, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(35, 'App\\Integration\\StudentGroupSyncItem', 35, 36, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(36, 'App\\Integration\\StudentGroupSyncItem', 36, 37, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(37, 'App\\Integration\\StudentGroupSyncItem', 37, 38, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(38, 'App\\Integration\\StudentGroupSyncItem', 38, 39, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(39, 'App\\Integration\\StudentGroupSyncItem', 39, 40, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(40, 'App\\Integration\\StudentGroupSyncItem', 40, 42, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(41, 'App\\Integration\\StudentGroupSyncItem', 41, 43, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(42, 'App\\Integration\\StudentGroupSyncItem', 42, 44, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(43, 'App\\Integration\\StudentGroupSyncItem', 43, 46, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(44, 'App\\Integration\\StudentGroupSyncItem', 44, 47, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(45, 'App\\Integration\\StudentGroupSyncItem', 45, 48, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(46, 'App\\Integration\\StudentGroupSyncItem', 46, 49, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(47, 'App\\Integration\\StudentGroupSyncItem', 47, 50, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(48, 'App\\Integration\\StudentGroupSyncItem', 48, 51, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(49, 'App\\Integration\\StudentGroupSyncItem', 49, 52, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(50, 'App\\Integration\\StudentGroupSyncItem', 50, 56, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(51, 'App\\Integration\\StudentGroupSyncItem', 51, 58, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(52, 'App\\Integration\\StudentGroupSyncItem', 52, 114, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(53, 'App\\Integration\\StudentGroupSyncItem', 53, 115, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(54, 'App\\Integration\\StudentGroupSyncItem', 54, 116, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(55, 'App\\Integration\\StudentGroupSyncItem', 55, 117, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(56, 'App\\Integration\\StudentGroupSyncItem', 56, 118, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(57, 'App\\Integration\\StudentGroupSyncItem', 57, 119, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(58, 'App\\Integration\\StudentGroupSyncItem', 58, 120, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(59, 'App\\Integration\\StudentGroupSyncItem', 59, 121, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(60, 'App\\Integration\\StudentGroupSyncItem', 60, 122, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(61, 'App\\Integration\\StudentGroupSyncItem', 61, 123, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(62, 'App\\Integration\\StudentGroupSyncItem', 62, 124, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(63, 'App\\Integration\\StudentGroupSyncItem', 63, 125, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(64, 'App\\Integration\\StudentGroupSyncItem', 64, 126, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(65, 'App\\Integration\\StudentGroupSyncItem', 65, 127, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(66, 'App\\Integration\\StudentGroupSyncItem', 66, 128, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(67, 'App\\Integration\\StudentGroupSyncItem', 67, 129, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(68, 'App\\Integration\\StudentGroupSyncItem', 68, 130, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(69, 'App\\Integration\\StudentGroupSyncItem', 69, 131, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(70, 'App\\Integration\\StudentGroupSyncItem', 70, 132, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(71, 'App\\Integration\\StudentGroupSyncItem', 71, 133, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(72, 'App\\Integration\\StudentGroupSyncItem', 72, 134, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(73, 'App\\Integration\\StudentGroupSyncItem', 73, 135, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(74, 'App\\Integration\\StudentGroupSyncItem', 74, 136, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(75, 'App\\Integration\\StudentGroupSyncItem', 75, 137, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(76, 'App\\Integration\\StudentGroupSyncItem', 76, 138, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(77, 'App\\Integration\\StudentGroupSyncItem', 77, 139, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(78, 'App\\Integration\\StudentGroupSyncItem', 78, 140, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(79, 'App\\Integration\\StudentGroupSyncItem', 79, 141, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(80, 'App\\Integration\\StudentGroupSyncItem', 80, 156, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(81, 'App\\Integration\\StudentGroupSyncItem', 81, 168, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(82, 'App\\Integration\\StudentGroupSyncItem', 82, 468, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(83, 'App\\Integration\\StudentGroupSyncItem', 83, 489, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(84, 'App\\Integration\\StudentGroupSyncItem', 84, 597, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(85, 'App\\Integration\\StudentGroupSyncItem', 85, 598, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(86, 'App\\Integration\\StudentGroupSyncItem', 86, 599, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(87, 'App\\Integration\\StudentGroupSyncItem', 87, 600, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(88, 'App\\Integration\\StudentGroupSyncItem', 88, 601, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(89, 'App\\Integration\\StudentGroupSyncItem', 89, 608, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(90, 'App\\Integration\\StudentGroupSyncItem', 90, 609, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(91, 'App\\Integration\\StudentGroupSyncItem', 91, 610, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(92, 'App\\Integration\\StudentGroupSyncItem', 92, 612, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(93, 'App\\Integration\\StudentGroupSyncItem', 93, 616, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(94, 'App\\Integration\\StudentGroupSyncItem', 94, 624, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(95, 'App\\Integration\\StudentGroupSyncItem', 95, 625, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(96, 'App\\Integration\\StudentGroupSyncItem', 96, 626, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(97, 'App\\Integration\\StudentGroupSyncItem', 97, 627, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(98, 'App\\Integration\\StudentGroupSyncItem', 98, 628, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(99, 'App\\Integration\\StudentGroupSyncItem', 99, 629, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(100, 'App\\Integration\\StudentGroupSyncItem', 100, 636, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(101, 'App\\Integration\\StudentGroupSyncItem', 101, 637, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(102, 'App\\Integration\\StudentGroupSyncItem', 102, 638, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(103, 'App\\Integration\\StudentGroupSyncItem', 103, 731, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(104, 'App\\Integration\\StudentGroupSyncItem', 104, 732, '2020-05-18 09:11:18', '2020-05-18 09:11:18'),
(105, 'App\\Integration\\DisciplineSyncItem', 2, 11, '2020-05-18 14:45:51', '2020-05-18 14:45:51'),
(106, 'App\\Integration\\DisciplineSyncItem', 3, 3, '2020-05-18 14:45:51', '2020-05-18 14:45:51'),
(107, 'App\\Integration\\DisciplineSyncItem', 4, 14, '2020-05-18 14:45:51', '2020-05-18 14:45:51'),
(108, 'App\\Integration\\DisciplineSyncItem', 5, 249, '2020-05-18 14:45:51', '2020-05-18 14:45:51'),
(109, 'App\\Integration\\DisciplineSyncItem', 6, 1, '2020-05-18 14:45:51', '2020-05-18 14:45:51'),
(110, 'App\\Integration\\DisciplineSyncItem', 7, 21, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(111, 'App\\Integration\\DisciplineSyncItem', 8, 9, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(112, 'App\\Integration\\DisciplineSyncItem', 9, 18, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(113, 'App\\Integration\\DisciplineSyncItem', 10, 10, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(114, 'App\\Integration\\DisciplineSyncItem', 11, 7, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(115, 'App\\Integration\\DisciplineSyncItem', 12, 17, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(116, 'App\\Integration\\DisciplineSyncItem', 13, 23, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(117, 'App\\Integration\\DisciplineSyncItem', 14, 24, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(118, 'App\\Integration\\DisciplineSyncItem', 15, 25, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(119, 'App\\Integration\\DisciplineSyncItem', 16, 26, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(120, 'App\\Integration\\DisciplineSyncItem', 17, 27, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(121, 'App\\Integration\\DisciplineSyncItem', 18, 28, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(122, 'App\\Integration\\DisciplineSyncItem', 19, 29, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(123, 'App\\Integration\\DisciplineSyncItem', 20, 30, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(124, 'App\\Integration\\DisciplineSyncItem', 21, 31, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(125, 'App\\Integration\\DisciplineSyncItem', 22, 32, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(126, 'App\\Integration\\DisciplineSyncItem', 23, 33, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(127, 'App\\Integration\\DisciplineSyncItem', 24, 34, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(128, 'App\\Integration\\DisciplineSyncItem', 25, 35, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(129, 'App\\Integration\\DisciplineSyncItem', 26, 36, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(130, 'App\\Integration\\DisciplineSyncItem', 27, 37, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(131, 'App\\Integration\\DisciplineSyncItem', 28, 39, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(132, 'App\\Integration\\DisciplineSyncItem', 29, 41, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(133, 'App\\Integration\\DisciplineSyncItem', 30, 42, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(134, 'App\\Integration\\DisciplineSyncItem', 31, 43, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(135, 'App\\Integration\\DisciplineSyncItem', 32, 45, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(136, 'App\\Integration\\DisciplineSyncItem', 33, 47, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(137, 'App\\Integration\\DisciplineSyncItem', 34, 48, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(138, 'App\\Integration\\DisciplineSyncItem', 35, 49, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(139, 'App\\Integration\\DisciplineSyncItem', 36, 50, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(140, 'App\\Integration\\DisciplineSyncItem', 37, 52, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(141, 'App\\Integration\\DisciplineSyncItem', 38, 341, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(142, 'App\\Integration\\DisciplineSyncItem', 39, 16, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(143, 'App\\Integration\\DisciplineSyncItem', 40, 54, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(144, 'App\\Integration\\DisciplineSyncItem', 41, 55, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(145, 'App\\Integration\\DisciplineSyncItem', 42, 56, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(146, 'App\\Integration\\DisciplineSyncItem', 43, 64, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(147, 'App\\Integration\\DisciplineSyncItem', 44, 57, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(148, 'App\\Integration\\DisciplineSyncItem', 45, 197, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(149, 'App\\Integration\\DisciplineSyncItem', 46, 206, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(150, 'App\\Integration\\DisciplineSyncItem', 47, 60, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(151, 'App\\Integration\\DisciplineSyncItem', 48, 265, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(152, 'App\\Integration\\DisciplineSyncItem', 49, 266, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(153, 'App\\Integration\\DisciplineSyncItem', 50, 243, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(154, 'App\\Integration\\DisciplineSyncItem', 51, 263, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(155, 'App\\Integration\\DisciplineSyncItem', 52, 235, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(156, 'App\\Integration\\DisciplineSyncItem', 53, 342, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(157, 'App\\Integration\\DisciplineSyncItem', 54, 293, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(158, 'App\\Integration\\DisciplineSyncItem', 55, 294, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(159, 'App\\Integration\\DisciplineSyncItem', 56, 247, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(160, 'App\\Integration\\DisciplineSyncItem', 57, 53, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(161, 'App\\Integration\\DisciplineSyncItem', 58, 264, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(162, 'App\\Integration\\DisciplineSyncItem', 59, 275, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(163, 'App\\Integration\\DisciplineSyncItem', 60, 139, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(164, 'App\\Integration\\DisciplineSyncItem', 61, 1423, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(165, 'App\\Integration\\DisciplineSyncItem', 62, 96, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(166, 'App\\Integration\\DisciplineSyncItem', 63, 97, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(167, 'App\\Integration\\DisciplineSyncItem', 64, 98, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(168, 'App\\Integration\\DisciplineSyncItem', 65, 99, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(169, 'App\\Integration\\DisciplineSyncItem', 66, 75, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(170, 'App\\Integration\\DisciplineSyncItem', 67, 100, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(171, 'App\\Integration\\DisciplineSyncItem', 68, 120, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(172, 'App\\Integration\\DisciplineSyncItem', 69, 121, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(173, 'App\\Integration\\DisciplineSyncItem', 70, 111, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(174, 'App\\Integration\\DisciplineSyncItem', 71, 72, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(175, 'App\\Integration\\DisciplineSyncItem', 72, 73, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(176, 'App\\Integration\\DisciplineSyncItem', 73, 74, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(177, 'App\\Integration\\DisciplineSyncItem', 74, 104, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(178, 'App\\Integration\\DisciplineSyncItem', 75, 123, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(179, 'App\\Integration\\DisciplineSyncItem', 76, 124, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(180, 'App\\Integration\\DisciplineSyncItem', 77, 125, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(181, 'App\\Integration\\DisciplineSyncItem', 78, 79, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(182, 'App\\Integration\\DisciplineSyncItem', 79, 84, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(183, 'App\\Integration\\DisciplineSyncItem', 80, 127, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(184, 'App\\Integration\\DisciplineSyncItem', 81, 128, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(185, 'App\\Integration\\DisciplineSyncItem', 82, 134, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(186, 'App\\Integration\\DisciplineSyncItem', 83, 110, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(187, 'App\\Integration\\DisciplineSyncItem', 84, 130, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(188, 'App\\Integration\\DisciplineSyncItem', 85, 118, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(189, 'App\\Integration\\DisciplineSyncItem', 86, 88, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(190, 'App\\Integration\\DisciplineSyncItem', 87, 107, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(191, 'App\\Integration\\DisciplineSyncItem', 88, 102, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(192, 'App\\Integration\\DisciplineSyncItem', 89, 108, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(193, 'App\\Integration\\DisciplineSyncItem', 90, 133, '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(194, 'App\\Integration\\DisciplineSyncItem', 91, 90, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(195, 'App\\Integration\\DisciplineSyncItem', 92, 94, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(196, 'App\\Integration\\DisciplineSyncItem', 93, 131, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(197, 'App\\Integration\\DisciplineSyncItem', 94, 132, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(198, 'App\\Integration\\DisciplineSyncItem', 95, 113, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(199, 'App\\Integration\\DisciplineSyncItem', 96, 109, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(200, 'App\\Integration\\DisciplineSyncItem', 97, 87, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(201, 'App\\Integration\\DisciplineSyncItem', 98, 95, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(202, 'App\\Integration\\DisciplineSyncItem', 99, 336, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(203, 'App\\Integration\\DisciplineSyncItem', 100, 153, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(204, 'App\\Integration\\DisciplineSyncItem', 101, 344, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(205, 'App\\Integration\\DisciplineSyncItem', 102, 101, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(206, 'App\\Integration\\DisciplineSyncItem', 103, 103, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(207, 'App\\Integration\\DisciplineSyncItem', 104, 105, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(208, 'App\\Integration\\DisciplineSyncItem', 105, 106, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(209, 'App\\Integration\\DisciplineSyncItem', 106, 112, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(210, 'App\\Integration\\DisciplineSyncItem', 107, 65, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(211, 'App\\Integration\\DisciplineSyncItem', 108, 67, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(212, 'App\\Integration\\DisciplineSyncItem', 109, 68, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(213, 'App\\Integration\\DisciplineSyncItem', 110, 69, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(214, 'App\\Integration\\DisciplineSyncItem', 111, 70, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(215, 'App\\Integration\\DisciplineSyncItem', 112, 71, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(216, 'App\\Integration\\DisciplineSyncItem', 113, 77, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(217, 'App\\Integration\\DisciplineSyncItem', 114, 78, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(218, 'App\\Integration\\DisciplineSyncItem', 115, 80, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(219, 'App\\Integration\\DisciplineSyncItem', 116, 82, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(220, 'App\\Integration\\DisciplineSyncItem', 117, 81, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(221, 'App\\Integration\\DisciplineSyncItem', 118, 91, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(222, 'App\\Integration\\DisciplineSyncItem', 119, 92, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(223, 'App\\Integration\\DisciplineSyncItem', 120, 93, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(224, 'App\\Integration\\DisciplineSyncItem', 121, 86, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(225, 'App\\Integration\\DisciplineSyncItem', 122, 83, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(226, 'App\\Integration\\DisciplineSyncItem', 123, 85, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(227, 'App\\Integration\\DisciplineSyncItem', 124, 89, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(228, 'App\\Integration\\DisciplineSyncItem', 125, 137, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(229, 'App\\Integration\\DisciplineSyncItem', 126, 138, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(230, 'App\\Integration\\DisciplineSyncItem', 127, 154, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(231, 'App\\Integration\\DisciplineSyncItem', 128, 156, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(232, 'App\\Integration\\DisciplineSyncItem', 129, 180, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(233, 'App\\Integration\\DisciplineSyncItem', 130, 207, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(234, 'App\\Integration\\DisciplineSyncItem', 131, 233, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(235, 'App\\Integration\\DisciplineSyncItem', 132, 221, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(236, 'App\\Integration\\DisciplineSyncItem', 133, 186, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(237, 'App\\Integration\\DisciplineSyncItem', 134, 255, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(238, 'App\\Integration\\DisciplineSyncItem', 135, 191, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(239, 'App\\Integration\\DisciplineSyncItem', 136, 210, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(240, 'App\\Integration\\DisciplineSyncItem', 137, 284, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(241, 'App\\Integration\\DisciplineSyncItem', 138, 161, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(242, 'App\\Integration\\DisciplineSyncItem', 139, 200, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(243, 'App\\Integration\\DisciplineSyncItem', 140, 193, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(244, 'App\\Integration\\DisciplineSyncItem', 141, 204, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(245, 'App\\Integration\\DisciplineSyncItem', 142, 279, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(246, 'App\\Integration\\DisciplineSyncItem', 143, 168, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(247, 'App\\Integration\\DisciplineSyncItem', 144, 189, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(248, 'App\\Integration\\DisciplineSyncItem', 145, 239, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(249, 'App\\Integration\\DisciplineSyncItem', 146, 224, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(250, 'App\\Integration\\DisciplineSyncItem', 147, 212, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(251, 'App\\Integration\\DisciplineSyncItem', 148, 229, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(252, 'App\\Integration\\DisciplineSyncItem', 149, 190, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(253, 'App\\Integration\\DisciplineSyncItem', 150, 222, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(254, 'App\\Integration\\DisciplineSyncItem', 151, 232, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(255, 'App\\Integration\\DisciplineSyncItem', 152, 227, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(256, 'App\\Integration\\DisciplineSyncItem', 153, 219, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(257, 'App\\Integration\\DisciplineSyncItem', 154, 236, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(258, 'App\\Integration\\DisciplineSyncItem', 155, 228, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(259, 'App\\Integration\\DisciplineSyncItem', 156, 230, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(260, 'App\\Integration\\DisciplineSyncItem', 157, 211, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(261, 'App\\Integration\\DisciplineSyncItem', 158, 286, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(262, 'App\\Integration\\DisciplineSyncItem', 159, 231, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(263, 'App\\Integration\\DisciplineSyncItem', 160, 288, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(264, 'App\\Integration\\DisciplineSyncItem', 161, 194, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(265, 'App\\Integration\\DisciplineSyncItem', 162, 285, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(266, 'App\\Integration\\DisciplineSyncItem', 163, 223, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(267, 'App\\Integration\\DisciplineSyncItem', 164, 287, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(268, 'App\\Integration\\DisciplineSyncItem', 165, 188, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(269, 'App\\Integration\\DisciplineSyncItem', 166, 234, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(270, 'App\\Integration\\DisciplineSyncItem', 167, 185, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(271, 'App\\Integration\\DisciplineSyncItem', 168, 184, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(272, 'App\\Integration\\DisciplineSyncItem', 169, 203, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(273, 'App\\Integration\\DisciplineSyncItem', 170, 215, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(274, 'App\\Integration\\DisciplineSyncItem', 171, 220, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(275, 'App\\Integration\\DisciplineSyncItem', 172, 192, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(276, 'App\\Integration\\DisciplineSyncItem', 173, 226, '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(277, 'App\\Integration\\DisciplineSyncItem', 174, 205, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(278, 'App\\Integration\\DisciplineSyncItem', 175, 217, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(279, 'App\\Integration\\DisciplineSyncItem', 176, 225, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(280, 'App\\Integration\\DisciplineSyncItem', 177, 199, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(281, 'App\\Integration\\DisciplineSyncItem', 178, 218, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(282, 'App\\Integration\\DisciplineSyncItem', 179, 216, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(283, 'App\\Integration\\DisciplineSyncItem', 180, 51, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(284, 'App\\Integration\\DisciplineSyncItem', 181, 209, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(285, 'App\\Integration\\DisciplineSyncItem', 182, 201, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(286, 'App\\Integration\\DisciplineSyncItem', 183, 240, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(287, 'App\\Integration\\DisciplineSyncItem', 184, 241, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(288, 'App\\Integration\\DisciplineSyncItem', 185, 242, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(289, 'App\\Integration\\DisciplineSyncItem', 186, 244, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(290, 'App\\Integration\\DisciplineSyncItem', 187, 245, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(291, 'App\\Integration\\DisciplineSyncItem', 188, 246, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(292, 'App\\Integration\\DisciplineSyncItem', 189, 248, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(293, 'App\\Integration\\DisciplineSyncItem', 190, 250, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(294, 'App\\Integration\\DisciplineSyncItem', 191, 251, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(295, 'App\\Integration\\DisciplineSyncItem', 192, 252, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(296, 'App\\Integration\\DisciplineSyncItem', 193, 253, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(297, 'App\\Integration\\DisciplineSyncItem', 194, 254, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(298, 'App\\Integration\\DisciplineSyncItem', 195, 256, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(299, 'App\\Integration\\DisciplineSyncItem', 196, 257, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(300, 'App\\Integration\\DisciplineSyncItem', 197, 259, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(301, 'App\\Integration\\DisciplineSyncItem', 198, 258, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(302, 'App\\Integration\\DisciplineSyncItem', 199, 262, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(303, 'App\\Integration\\DisciplineSyncItem', 200, 261, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(304, 'App\\Integration\\DisciplineSyncItem', 201, 1496, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(305, 'App\\Integration\\DisciplineSyncItem', 202, 1393, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(306, 'App\\Integration\\DisciplineSyncItem', 203, 334, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(307, 'App\\Integration\\DisciplineSyncItem', 204, 281, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(308, 'App\\Integration\\DisciplineSyncItem', 205, 158, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(309, 'App\\Integration\\DisciplineSyncItem', 206, 297, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(310, 'App\\Integration\\DisciplineSyncItem', 207, 164, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(311, 'App\\Integration\\DisciplineSyncItem', 208, 268, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(312, 'App\\Integration\\DisciplineSyncItem', 209, 269, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(313, 'App\\Integration\\DisciplineSyncItem', 210, 173, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(314, 'App\\Integration\\DisciplineSyncItem', 211, 270, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(315, 'App\\Integration\\DisciplineSyncItem', 212, 273, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(316, 'App\\Integration\\DisciplineSyncItem', 213, 271, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(317, 'App\\Integration\\DisciplineSyncItem', 214, 298, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(318, 'App\\Integration\\DisciplineSyncItem', 215, 326, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(319, 'App\\Integration\\DisciplineSyncItem', 216, 160, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(320, 'App\\Integration\\DisciplineSyncItem', 217, 330, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(321, 'App\\Integration\\DisciplineSyncItem', 218, 304, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(322, 'App\\Integration\\DisciplineSyncItem', 219, 277, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(323, 'App\\Integration\\DisciplineSyncItem', 220, 159, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(324, 'App\\Integration\\DisciplineSyncItem', 221, 172, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(325, 'App\\Integration\\DisciplineSyncItem', 222, 169, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(326, 'App\\Integration\\DisciplineSyncItem', 223, 467, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(327, 'App\\Integration\\DisciplineSyncItem', 224, 468, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(328, 'App\\Integration\\DisciplineSyncItem', 225, 469, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(329, 'App\\Integration\\DisciplineSyncItem', 226, 331, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(330, 'App\\Integration\\DisciplineSyncItem', 227, 165, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(331, 'App\\Integration\\DisciplineSyncItem', 228, 305, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(332, 'App\\Integration\\DisciplineSyncItem', 229, 62, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(333, 'App\\Integration\\DisciplineSyncItem', 230, 178, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(334, 'App\\Integration\\DisciplineSyncItem', 231, 301, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(335, 'App\\Integration\\DisciplineSyncItem', 232, 2264, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(336, 'App\\Integration\\DisciplineSyncItem', 233, 471, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(337, 'App\\Integration\\DisciplineSyncItem', 234, 309, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(338, 'App\\Integration\\DisciplineSyncItem', 235, 166, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(339, 'App\\Integration\\DisciplineSyncItem', 236, 311, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(340, 'App\\Integration\\DisciplineSyncItem', 237, 312, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(341, 'App\\Integration\\DisciplineSyncItem', 238, 314, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(342, 'App\\Integration\\DisciplineSyncItem', 239, 2268, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(343, 'App\\Integration\\DisciplineSyncItem', 240, 274, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(344, 'App\\Integration\\DisciplineSyncItem', 241, 163, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(345, 'App\\Integration\\DisciplineSyncItem', 242, 174, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(346, 'App\\Integration\\DisciplineSyncItem', 243, 20, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(347, 'App\\Integration\\DisciplineSyncItem', 244, 278, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(348, 'App\\Integration\\DisciplineSyncItem', 245, 306, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(349, 'App\\Integration\\DisciplineSyncItem', 246, 470, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(350, 'App\\Integration\\DisciplineSyncItem', 247, 2137, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(351, 'App\\Integration\\DisciplineSyncItem', 248, 176, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(352, 'App\\Integration\\DisciplineSyncItem', 249, 167, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(353, 'App\\Integration\\DisciplineSyncItem', 250, 179, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(354, 'App\\Integration\\DisciplineSyncItem', 251, 473, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(355, 'App\\Integration\\DisciplineSyncItem', 252, 318, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(356, 'App\\Integration\\DisciplineSyncItem', 253, 171, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(357, 'App\\Integration\\DisciplineSyncItem', 254, 315, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(358, 'App\\Integration\\DisciplineSyncItem', 255, 177, '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(359, 'App\\Integration\\DisciplineSyncItem', 256, 2191, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(360, 'App\\Integration\\DisciplineSyncItem', 257, 1365, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(361, 'App\\Integration\\DisciplineSyncItem', 258, 472, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(362, 'App\\Integration\\DisciplineSyncItem', 259, 2266, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(363, 'App\\Integration\\DisciplineSyncItem', 260, 289, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(364, 'App\\Integration\\DisciplineSyncItem', 261, 1839, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(365, 'App\\Integration\\DisciplineSyncItem', 262, 19, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(366, 'App\\Integration\\DisciplineSyncItem', 263, 291, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(367, 'App\\Integration\\DisciplineSyncItem', 264, 290, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(368, 'App\\Integration\\DisciplineSyncItem', 265, 507, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(369, 'App\\Integration\\DisciplineSyncItem', 266, 1403, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(370, 'App\\Integration\\DisciplineSyncItem', 267, 1370, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(371, 'App\\Integration\\DisciplineSyncItem', 268, 300, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(372, 'App\\Integration\\DisciplineSyncItem', 269, 299, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(373, 'App\\Integration\\DisciplineSyncItem', 270, 498, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(374, 'App\\Integration\\DisciplineSyncItem', 271, 465, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(375, 'App\\Integration\\DisciplineSyncItem', 272, 2260, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(376, 'App\\Integration\\DisciplineSyncItem', 273, 2259, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(377, 'App\\Integration\\DisciplineSyncItem', 274, 280, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(378, 'App\\Integration\\DisciplineSyncItem', 275, 282, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(379, 'App\\Integration\\DisciplineSyncItem', 276, 313, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(380, 'App\\Integration\\DisciplineSyncItem', 277, 319, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(381, 'App\\Integration\\DisciplineSyncItem', 278, 320, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(382, 'App\\Integration\\DisciplineSyncItem', 279, 321, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(383, 'App\\Integration\\DisciplineSyncItem', 280, 322, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(384, 'App\\Integration\\DisciplineSyncItem', 281, 323, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(385, 'App\\Integration\\DisciplineSyncItem', 282, 324, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(386, 'App\\Integration\\DisciplineSyncItem', 283, 325, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(387, 'App\\Integration\\DisciplineSyncItem', 284, 327, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(388, 'App\\Integration\\DisciplineSyncItem', 285, 328, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(389, 'App\\Integration\\DisciplineSyncItem', 286, 329, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(390, 'App\\Integration\\DisciplineSyncItem', 287, 335, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(391, 'App\\Integration\\DisciplineSyncItem', 288, 343, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(392, 'App\\Integration\\DisciplineSyncItem', 289, 303, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(393, 'App\\Integration\\DisciplineSyncItem', 290, 332, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(394, 'App\\Integration\\DisciplineSyncItem', 291, 316, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(395, 'App\\Integration\\DisciplineSyncItem', 292, 310, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(396, 'App\\Integration\\DisciplineSyncItem', 293, 333, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(397, 'App\\Integration\\DisciplineSyncItem', 294, 175, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(398, 'App\\Integration\\DisciplineSyncItem', 295, 302, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(399, 'App\\Integration\\DisciplineSyncItem', 296, 307, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(400, 'App\\Integration\\DisciplineSyncItem', 297, 458, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(401, 'App\\Integration\\DisciplineSyncItem', 298, 338, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(402, 'App\\Integration\\DisciplineSyncItem', 299, 267, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(403, 'App\\Integration\\DisciplineSyncItem', 300, 1652, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(404, 'App\\Integration\\DisciplineSyncItem', 301, 1518, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(405, 'App\\Integration\\DisciplineSyncItem', 302, 497, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(406, 'App\\Integration\\DisciplineSyncItem', 303, 2152, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(407, 'App\\Integration\\DisciplineSyncItem', 304, 339, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(408, 'App\\Integration\\DisciplineSyncItem', 305, 464, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(409, 'App\\Integration\\DisciplineSyncItem', 306, 2144, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(410, 'App\\Integration\\DisciplineSyncItem', 307, 2151, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(411, 'App\\Integration\\DisciplineSyncItem', 308, 295, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(412, 'App\\Integration\\DisciplineSyncItem', 309, 466, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(413, 'App\\Integration\\DisciplineSyncItem', 310, 1622, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(414, 'App\\Integration\\DisciplineSyncItem', 311, 1367, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(415, 'App\\Integration\\DisciplineSyncItem', 312, 499, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(416, 'App\\Integration\\DisciplineSyncItem', 313, 500, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(417, 'App\\Integration\\DisciplineSyncItem', 314, 501, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(418, 'App\\Integration\\DisciplineSyncItem', 315, 502, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(419, 'App\\Integration\\DisciplineSyncItem', 316, 503, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(420, 'App\\Integration\\DisciplineSyncItem', 317, 504, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(421, 'App\\Integration\\DisciplineSyncItem', 318, 505, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(422, 'App\\Integration\\DisciplineSyncItem', 319, 506, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(423, 'App\\Integration\\DisciplineSyncItem', 320, 2192, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(424, 'App\\Integration\\DisciplineSyncItem', 321, 510, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(425, 'App\\Integration\\DisciplineSyncItem', 322, 511, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(426, 'App\\Integration\\DisciplineSyncItem', 323, 512, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(427, 'App\\Integration\\DisciplineSyncItem', 324, 508, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(428, 'App\\Integration\\DisciplineSyncItem', 325, 513, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(429, 'App\\Integration\\DisciplineSyncItem', 326, 514, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(430, 'App\\Integration\\DisciplineSyncItem', 327, 509, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(431, 'App\\Integration\\DisciplineSyncItem', 328, 515, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(432, 'App\\Integration\\DisciplineSyncItem', 329, 2277, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(433, 'App\\Integration\\DisciplineSyncItem', 330, 517, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(434, 'App\\Integration\\DisciplineSyncItem', 331, 1689, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(435, 'App\\Integration\\DisciplineSyncItem', 332, 2210, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(436, 'App\\Integration\\DisciplineSyncItem', 333, 2270, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(437, 'App\\Integration\\DisciplineSyncItem', 334, 1366, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(438, 'App\\Integration\\DisciplineSyncItem', 335, 1213, '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(439, 'App\\Integration\\DisciplineSyncItem', 336, 2156, '2020-05-18 14:45:56', '2020-05-18 14:45:56'),
(440, 'App\\Integration\\DisciplineSyncItem', 337, 2132, '2020-05-18 14:45:56', '2020-05-18 14:45:56'),
(441, 'App\\Integration\\DisciplineSyncItem', 338, 2157, '2020-05-18 14:45:56', '2020-05-18 14:45:56'),
(442, 'App\\Integration\\DisciplineSyncItem', 339, 2158, '2020-05-18 14:45:56', '2020-05-18 14:45:56'),
(443, 'App\\Integration\\DisciplineSyncItem', 340, 2159, '2020-05-18 14:45:56', '2020-05-18 14:45:56'),
(444, 'App\\Integration\\DisciplineSyncItem', 341, 637, '2020-05-18 14:45:56', '2020-05-18 14:45:56'),
(445, 'App\\Integration\\DisciplineSyncItem', 342, 2212, '2020-05-18 14:45:56', '2020-05-18 14:45:56'),
(446, 'App\\Integration\\DisciplineSyncItem', 343, 711, '2020-05-18 14:45:56', '2020-05-18 14:45:56'),
(453, 'App\\Integration\\StudentUserSyncItem', 12, 305, '2020-05-24 14:08:41', '2020-05-24 14:08:41'),
(454, 'App\\Integration\\StudentUserSyncItem', 13, 306, '2020-05-24 14:08:41', '2020-05-24 14:08:41'),
(455, 'App\\Integration\\StudentUserSyncItem', 14, 308, '2020-05-24 14:08:41', '2020-05-24 14:08:41'),
(456, 'App\\Integration\\StudentUserSyncItem', 15, 309, '2020-05-24 14:08:41', '2020-05-24 14:08:41'),
(457, 'App\\Integration\\StudentUserSyncItem', 16, 310, '2020-05-24 14:08:41', '2020-05-24 14:08:41'),
(458, 'App\\Integration\\StudentUserSyncItem', 17, 312, '2020-05-24 14:08:41', '2020-05-24 14:08:41'),
(459, 'App\\Integration\\StudentUserSyncItem', 18, 314, '2020-05-24 14:10:31', '2020-05-24 14:10:31'),
(460, 'App\\Integration\\StudentUserSyncItem', 19, 315, '2020-05-24 14:17:43', '2020-05-24 14:17:43'),
(461, 'App\\Integration\\StudentUserSyncItem', 20, 317, '2020-05-24 14:29:11', '2020-05-24 14:29:11'),
(462, 'App\\Integration\\StudentUserSyncItem', 22, 327, '2020-05-24 14:34:09', '2020-05-24 14:34:09'),
(463, 'App\\Integration\\StudentUserSyncItem', 23, 329, '2020-05-24 14:34:09', '2020-05-24 14:34:09'),
(464, 'App\\Integration\\StudentUserSyncItem', 24, 332, '2020-05-24 14:34:09', '2020-05-24 14:34:09'),
(465, 'App\\Integration\\StudentUserSyncItem', 25, 336, '2020-05-24 14:34:09', '2020-05-24 14:34:09'),
(466, 'App\\Integration\\StudentUserSyncItem', 26, 337, '2020-05-24 14:34:09', '2020-05-24 14:34:09'),
(467, 'App\\Integration\\StudentUserSyncItem', 27, 341, '2020-05-24 14:34:10', '2020-05-24 14:34:10'),
(468, 'App\\Integration\\StudentUserSyncItem', 28, 480, '2020-05-24 14:34:10', '2020-05-24 14:34:10'),
(469, 'App\\Integration\\StudentUserSyncItem', 29, 374, '2020-05-24 14:35:47', '2020-05-24 14:35:47'),
(470, 'App\\Integration\\StudentUserSyncItem', 30, 376, '2020-05-24 14:35:47', '2020-05-24 14:35:47'),
(471, 'App\\Integration\\StudentUserSyncItem', 31, 389, '2020-05-24 14:35:47', '2020-05-24 14:35:47'),
(472, 'App\\Integration\\StudentUserSyncItem', 32, 390, '2020-05-24 14:35:47', '2020-05-24 14:35:47'),
(473, 'App\\Integration\\StudentUserSyncItem', 33, 391, '2020-05-24 14:35:47', '2020-05-24 14:35:47'),
(474, 'App\\Integration\\StudentUserSyncItem', 34, 396, '2020-05-24 14:35:47', '2020-05-24 14:35:47'),
(475, 'App\\Integration\\StudentUserSyncItem', 35, 397, '2020-05-24 14:35:47', '2020-05-24 14:35:47'),
(476, 'App\\Integration\\StudentUserSyncItem', 36, 398, '2020-05-24 14:35:48', '2020-05-24 14:35:48'),
(477, 'App\\Integration\\StudentUserSyncItem', 37, 400, '2020-05-24 14:35:48', '2020-05-24 14:35:48'),
(478, 'App\\Integration\\StudentUserSyncItem', 38, 401, '2020-05-24 14:35:48', '2020-05-24 14:35:48'),
(479, 'App\\Integration\\StudentUserSyncItem', 39, 403, '2020-05-24 14:35:48', '2020-05-24 14:35:48'),
(480, 'App\\Integration\\StudentUserSyncItem', 40, 404, '2020-05-24 14:35:48', '2020-05-24 14:35:48'),
(481, 'App\\Integration\\StudentUserSyncItem', 41, 405, '2020-05-24 14:35:48', '2020-05-24 14:35:48'),
(482, 'App\\Integration\\StudentUserSyncItem', 42, 3545, '2020-05-24 14:35:48', '2020-05-24 14:35:48'),
(483, 'App\\Integration\\StudentUserSyncItem', 43, 14247, '2020-05-24 14:35:49', '2020-05-24 14:35:49'),
(484, 'App\\Integration\\StudentUserSyncItem', 44, 406, '2020-05-24 14:37:54', '2020-05-24 14:37:54');

-- --------------------------------------------------------

--
-- Структура таблиці `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(22, 'menu_items', 'title', 14, 'pt', 'Publicações', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(24, 'menu_items', 'title', 13, 'pt', 'Categorias', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(25, 'menu_items', 'title', 15, 'pt', 'Páginas', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2019-09-06 03:13:33', '2019-09-06 03:13:33'),
(31, 'posts', 'title', 1, 'en', 'Lorem Ipsum Post', '2019-09-06 04:09:45', '2019-09-06 04:09:45'),
(32, 'posts', 'excerpt', 1, 'en', 'This is the excerpt for the Lorem Ipsum Post', '2019-09-06 04:09:45', '2019-09-06 04:09:45'),
(33, 'posts', 'body', 1, 'en', '<p>This is the body of the lorem ipsum post</p>', '2019-09-06 04:09:45', '2019-09-06 04:09:45'),
(34, 'posts', 'slug', 1, 'en', 'lorem-ipsum-post', '2019-09-06 04:09:45', '2019-09-06 04:09:45'),
(35, 'posts', 'meta_description', 1, 'en', 'This is the meta description', '2019-09-06 04:09:45', '2019-09-06 04:09:45'),
(36, 'posts', 'meta_keywords', 1, 'en', 'keyword1, keyword2, keyword3', '2019-09-06 04:09:45', '2019-09-06 04:09:45'),
(37, 'menu_items', 'title', 1, 'en', 'Dashboard', '2019-09-06 04:14:25', '2019-09-06 04:14:25'),
(39, 'menu_items', 'title', 4, 'en', 'Roles', '2019-09-06 05:01:55', '2019-09-06 05:01:55'),
(40, 'menu_items', 'title', 3, 'en', 'Users', '2019-09-06 05:05:29', '2019-09-06 05:05:29'),
(41, 'menu_items', 'title', 5, 'en', 'Tools', '2019-09-09 10:54:48', '2019-09-09 10:54:48'),
(42, 'menu_items', 'title', 6, 'en', 'Menu Builder', '2019-09-09 10:56:27', '2019-09-09 10:56:27'),
(43, 'menu_items', 'title', 7, 'en', 'Database', '2019-09-09 11:00:12', '2019-09-09 11:00:12'),
(44, 'menu_items', 'title', 10, 'en', 'Settings', '2019-09-09 11:01:28', '2019-09-09 11:01:28'),
(45, 'menu_items', 'title', 13, 'en', 'Categories', '2019-09-09 11:02:28', '2019-09-09 11:02:28'),
(46, 'menu_items', 'title', 14, 'en', 'Posts', '2019-09-09 11:02:48', '2019-09-09 11:02:48'),
(47, 'menu_items', 'title', 15, 'en', 'Pages', '2019-09-09 11:03:06', '2019-09-09 11:03:06'),
(48, 'menu_items', 'title', 2, 'en', 'Media', '2019-09-09 11:05:07', '2019-09-09 11:05:07'),
(49, 'menu_items', 'title', 16, 'en', 'Новини', '2020-01-10 17:43:36', '2020-01-10 17:43:36'),
(50, 'posts', 'title', 2, 'en', 'My Sample Post', '2020-01-10 19:25:26', '2020-01-10 19:25:26'),
(51, 'posts', 'excerpt', 2, 'en', 'This is the excerpt for the sample Post', '2020-01-10 19:25:26', '2020-01-10 19:25:26'),
(52, 'posts', 'body', 2, 'en', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', '2020-01-10 19:25:26', '2020-01-10 19:25:26'),
(53, 'posts', 'slug', 2, 'en', 'my-sample-post', '2020-01-10 19:25:26', '2020-01-10 19:25:26'),
(54, 'posts', 'meta_description', 2, 'en', 'Meta Description for sample post', '2020-01-10 19:25:26', '2020-01-10 19:25:26'),
(55, 'posts', 'meta_keywords', 2, 'en', 'keyword1, keyword2, keyword3', '2020-01-10 19:25:26', '2020-01-10 19:25:26'),
(56, 'data_types', 'display_name_singular', 5, 'en', 'Post', '2020-01-13 18:44:55', '2020-01-13 18:44:55'),
(57, 'data_types', 'display_name_plural', 5, 'en', 'Posts', '2020-01-13 18:44:55', '2020-01-13 18:44:55'),
(58, 'posts', 'title', 5, 'en', 'Elearn', '2020-01-15 18:33:54', '2020-01-15 18:33:54'),
(59, 'posts', 'excerpt', 5, 'en', 'Інфо про ельорн', '2020-01-15 18:33:54', '2020-01-15 18:33:54'),
(60, 'posts', 'body', 5, 'en', '<p>Навчальний портал</p>\n<p><a href=\"https://elearn.nubip.edu.ua/login/index.php\">Посилання на сайт</a></p>\n<p>&nbsp;</p>\n<p><img title=\"Назва фото\" src=\"http://localhost:8000/storage/posts/January2020/elearning-banner2-1354x500.png\" alt=\"Опис\" width=\"1016\" height=\"375\" /></p>\n<ul>\n<li>1</li>\n<li>2</li>\n<li>3</li>\n</ul>\n<p><span style=\"color: #ff0000;\">красний</span></p>\n<p>&nbsp;</p>', '2020-01-15 18:33:54', '2020-01-15 18:33:54'),
(61, 'posts', 'slug', 5, 'en', 'elearn', '2020-01-15 18:33:54', '2020-01-15 18:33:54'),
(62, 'data_types', 'display_name_singular', 4, 'en', 'Category', '2020-01-19 16:05:30', '2020-01-19 16:05:30'),
(63, 'data_types', 'display_name_plural', 4, 'en', 'Categories', '2020-01-19 16:05:30', '2020-01-19 16:05:30'),
(64, 'data_types', 'display_name_singular', 8, 'en', 'Infoblock Type', '2020-01-22 19:15:46', '2020-01-22 19:15:46'),
(65, 'data_types', 'display_name_plural', 8, 'en', 'Infoblock Types', '2020-01-22 19:15:46', '2020-01-22 19:15:46'),
(66, 'data_types', 'display_name_singular', 9, 'en', 'Infoblock', '2020-01-29 17:15:04', '2020-01-29 17:15:04'),
(67, 'data_types', 'display_name_plural', 9, 'en', 'Infoblocks', '2020-01-29 17:15:04', '2020-01-29 17:15:04'),
(68, 'data_types', 'display_name_singular', 10, 'en', 'Infoblock Item', '2020-01-30 14:20:47', '2020-01-30 14:20:47'),
(69, 'data_types', 'display_name_plural', 10, 'en', 'Infoblock Items', '2020-01-30 14:20:47', '2020-01-30 14:20:47'),
(70, 'menu_items', 'title', 23, 'en', 'Infoblock Types', '2020-01-30 14:24:37', '2020-01-30 14:24:37'),
(71, 'menu_items', 'title', 24, 'en', 'Infoblocks', '2020-01-30 14:30:42', '2020-01-30 14:30:42'),
(73, 'data_types', 'display_name_singular', 11, 'en', 'Social Network', '2020-01-30 19:31:03', '2020-01-30 19:31:03'),
(74, 'data_types', 'display_name_plural', 11, 'en', 'Social Networks', '2020-01-30 19:31:03', '2020-01-30 19:31:03'),
(75, 'menu_items', 'title', 27, 'en', 'Social Networks', '2020-02-02 17:43:19', '2020-02-02 17:43:19'),
(76, 'posts', 'title', 3, 'en', 'Latest Post', '2020-02-04 06:49:18', '2020-02-04 06:49:18'),
(77, 'posts', 'excerpt', 3, 'en', 'This is the excerpt for the latest post', '2020-02-04 06:49:18', '2020-02-04 06:49:18'),
(78, 'posts', 'body', 3, 'en', '<p>This is the body for the latest post</p>', '2020-02-04 06:49:18', '2020-02-04 06:49:18'),
(79, 'posts', 'slug', 3, 'en', 'latest-post', '2020-02-04 06:49:18', '2020-02-04 06:49:18'),
(80, 'posts', 'meta_description', 3, 'en', 'This is the meta description', '2020-02-04 06:49:18', '2020-02-04 06:49:18'),
(81, 'posts', 'meta_keywords', 3, 'en', 'keyword1, keyword2, keyword3', '2020-02-04 06:49:18', '2020-02-04 06:49:18'),
(82, 'posts', 'title', 4, 'en', 'Yarr Post', '2020-02-04 06:49:28', '2020-02-04 06:49:28'),
(83, 'posts', 'excerpt', 4, 'en', 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '2020-02-04 06:49:28', '2020-02-04 06:49:28'),
(84, 'posts', 'body', 4, 'en', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', '2020-02-04 06:49:28', '2020-02-04 06:49:28'),
(85, 'posts', 'slug', 4, 'en', 'yarr-post', '2020-02-04 06:49:28', '2020-02-04 06:49:28'),
(86, 'posts', 'meta_description', 4, 'en', 'this be a meta descript', '2020-02-04 06:49:28', '2020-02-04 06:49:28'),
(87, 'posts', 'meta_keywords', 4, 'en', 'keyword1, keyword2, keyword3', '2020-02-04 06:49:28', '2020-02-04 06:49:28'),
(88, 'posts', 'title', 8, 'en', 'Море', '2020-02-04 18:39:42', '2020-02-04 18:39:42'),
(89, 'posts', 'body', 8, 'en', '<p><span style=\"color: #000000; font-family: \'Open Sans\', Arial, sans-serif; text-align: justify;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p>', '2020-02-04 18:39:42', '2020-02-04 18:39:42'),
(90, 'posts', 'slug', 8, 'en', 'more', '2020-02-04 18:39:42', '2020-02-04 18:39:42'),
(91, 'posts', 'title', 6, 'en', 'Новина про квіти', '2020-02-04 18:39:55', '2020-02-04 18:39:55'),
(92, 'posts', 'body', 6, 'en', '<p><span style=\"color: #000000; font-family: \'Open Sans\', Arial, sans-serif; text-align: justify;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p>', '2020-02-04 18:39:55', '2020-02-04 18:39:55'),
(93, 'posts', 'slug', 6, 'en', 'novina-pro-kviti', '2020-02-04 18:39:55', '2020-02-04 18:39:55'),
(94, 'posts', 'title', 11, 'en', 'Новий 2020', '2020-02-04 19:30:06', '2020-02-04 19:30:06'),
(95, 'posts', 'excerpt', 11, 'en', 'Про новий рік.\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Mi proin sed libero enim sed faucibus turpis in eu. Venenatis tellus in metus vulputate eu scelerisque felis imperdiet proin. Sodales ut etiam sit amet nisl. Pharetra vel turpis nunc eget lorem dolor sed. ', '2020-02-04 19:30:06', '2020-02-04 19:30:06'),
(96, 'posts', 'body', 11, 'en', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Mi proin sed libero enim sed faucibus turpis in eu. Venenatis tellus in metus vulputate eu scelerisque felis imperdiet proin. Sodales ut etiam sit amet nisl. Pharetra vel turpis nunc eget lorem dolor sed. Imperdiet nulla malesuada pellentesque elit eget gravida cum sociis. Est lorem ipsum dolor sit. Id donec ultrices tincidunt arcu non sodales neque sodales ut. Id interdum velit laoreet id donec. Integer vitae justo eget magna. Tellus integer feugiat scelerisque varius morbi. Ultrices neque ornare aenean euismod elementum nisi quis eleifend quam. Nibh tellus molestie nunc non blandit massa enim. Sed augue lacus viverra vitae congue. Cras fermentum odio eu feugiat pretium nibh. Nulla facilisi nullam vehicula ipsum a arcu. Purus non enim praesent elementum facilisis leo vel. Est sit amet facilisis magna etiam tempor orci eu lobortis. Nec tincidunt praesent semper feugiat nibh sed pulvinar proin gravida.</p>\n<figure class=\"image\"><img title=\"Символ року\" src=\"http://localhost:8000/storage/posts/February2020/mouse.jpg\" alt=\"Символ року\" />\n<figcaption>Caption</figcaption>\n</figure>\n<p>&nbsp;</p>\n<p><strong>Molestie at elementum eu facilisis sed odi</strong>o. Ac turpis egestas integer eget aliquet nibh. Dictum non consectetur a erat nam at lectus. Tortor vitae purus faucibus ornare suspendisse sed. Dictum non consectetur a erat. Orci dapibus ultrices in iaculis nunc sed augue lacus viverra. Mattis rhoncus urna neque viverra. Elementum facilisis leo vel fringilla. Vestibulum rhoncus est pellentesque elit ullamcorper dignissim cras tincidunt lobortis. Morbi tincidunt ornare massa eget. At erat pellentesque adipiscing commodo elit at. Sed vulputate mi sit amet mauris commodo quis imperdiet massa. Amet justo donec enim diam vulputate ut pharetra. Id cursus metus aliquam eleifend mi in nulla. Porta nibh venenatis cras sed felis eget velit aliquet sagittis. Bibendum at varius vel pharetra. Massa sed elementum tempus egestas.</p>\n<p><a href=\"https://loremipsum.io/ru/generator/?n=5&amp;t=p\" target=\"_blank\" rel=\"noopener\">Lorem Ipsum Generator</a></p>\n<p><em>At ultrices mi tempus imperdiet nulla malesuada pellentesque elit. Etiam erat velit scelerisque in dictum. Cras sed felis eget velit aliquet sagittis.</em></p>\n<p>&nbsp;</p>\n<p>Mauris a diam maecenas sed enim ut sem viverra aliquet. Ullamcorper a lacus vestibulum sed. Lectus vestibulum mattis ullamcorper velit sed. Nulla porttitor massa id neque aliquam. Aliquet nec ullamcorper sit amet risus nullam eget. Leo integer malesuada nunc vel risus commodo viverra. Est pellentesque elit ullamcorper dignissim cras tincidunt lobortis feugiat. Varius quam quisque id diam vel. Proin sagittis nisl rhoncus mattis rhoncus urna neque. Suspendisse ultrices gravida dictum fusce. Venenatis lectus magna fringilla urna porttitor rhoncus. Adipiscing elit ut aliquam purus sit amet luctus venenatis. Etiam dignissim diam quis enim lobortis. Diam quam nulla porttitor massa.</p>\n<p><img src=\"http://localhost:8000/storage/posts/February2020/ket.jpg\" alt=\"\" /></p>\n<p>Pulvinar etiam non quam lacus suspendisse faucibus interdum. Cursus metus aliquam eleifend mi in nulla posuere. Tempor id eu nisl nunc mi ipsum faucibus. Augue ut lectus arcu bibendum at varius vel. Ut faucibus pulvinar elementum integer enim neque volutpat ac tincidunt. Dis parturient montes nascetur ridiculus mus. Enim blandit volutpat maecenas volutpat blandit aliquam etiam erat. Euismod lacinia at quis risus. Nibh ipsum consequat nisl vel pretium lectus. Faucibus interdum posuere lorem ipsum dolor sit amet consectetur. Eu sem integer vitae justo eget magna fermentum. Nunc aliquet bibendum enim facilisis gravida neque convallis a. Viverra justo nec ultrices dui sapien eget mi proin. Scelerisque felis imperdiet proin fermentum leo vel orci porta non. Quam pellentesque nec nam aliquam sem et. Volutpat ac tincidunt vitae semper. Quis lectus nulla at volutpat diam ut. Eu feugiat pretium nibh ipsum consequat nisl vel.</p>\n<ul>\n<li>Augue ut lectus arcu bibendum at varius ve</li>\n<li>Augue ut lectus arcu</li>\n<li>Dis parturient montes nascetur ridiculus mus. Enim blandit volutpat maecenas volutpat blandit aliquam etiam erat. Euismod lacinia at quis risus. Nibh ipsum consequat nisl vel pretium lectus</li>\n</ul>\n<p>Porttitor massa id neque aliquam vestibulum morbi blandit. Senectus et netus et malesuada fames ac turpis. Nunc non blandit massa enim. <span style=\"color: #ff0000;\">Lorem mollis aliquam ut porttitor leo a diam sollicitudin.</span> Aliquam faucibus purus in massa tempor nec feugiat nisl pretium. Erat velit scelerisque in dictum non. Et tortor at risus viverra adipiscing at in tellus. Euismod nisi porta lorem mollis aliquam ut. Integer vitae justo eget magna fermentum iaculis eu. Purus in massa tempor nec feugiat nisl pretium fusce. Convallis posuere morbi leo urna molestie at elementum. Condimentum mattis pellentesque id nibh tortor id aliquet lectus proin. Egestas congue quisque egestas diam in arcu cursus euismod. Non nisi est sit amet facilisis.</p>\n<ol>\n<li>Кот</li>\n<li>Миша</li>\n<li>Дракон</li>\n<li>Кріль / Зайчик</li>\n<li>Мавпа</li>\n</ol>', '2020-02-04 19:30:06', '2020-02-04 19:30:06'),
(97, 'posts', 'slug', 11, 'en', 'novij-2020', '2020-02-04 19:30:06', '2020-02-04 19:30:06'),
(99, 'infoblock_items', 'title', 1, 'en', 'Розпочни свою кар\'єру в ІТ з нами!', '2020-02-08 15:53:41', '2020-02-08 15:53:41'),
(101, 'infoblocks', 'name', 2, 'en', 'ДЕКІЛЬКА СЛІВ ПРО НАС', '2020-02-08 17:10:31', '2020-02-08 17:10:31'),
(102, 'infoblocks', 'slug', 2, 'en', 'dekil-ka-sliv-pro-nas', '2020-02-08 17:10:31', '2020-02-08 17:10:31'),
(103, 'infoblocks', 'title', 2, 'en', 'ДЕКІЛЬКА СЛІВ ПРО НАС', '2020-02-08 17:10:31', '2020-02-08 17:10:31'),
(104, 'infoblocks', 'button_title', 2, 'en', 'Читати далі', '2020-02-08 17:10:31', '2020-02-08 17:10:31'),
(105, 'infoblock_items', 'title', 12, 'en', 'Інформація', '2020-02-09 12:05:37', '2020-02-09 12:05:37'),
(106, 'infoblock_items', 'title', 14, 'en', 'Про факультет', '2020-02-09 12:08:57', '2020-02-09 12:08:57'),
(107, 'infoblock_items', 'title', 15, 'en', 'Вступникам', '2020-02-09 12:09:24', '2020-02-09 12:09:24'),
(108, 'infoblock_items', 'title', 16, 'en', 'Студентам', '2020-02-09 12:09:41', '2020-02-09 12:09:41'),
(109, 'infoblock_items', 'title', 17, 'en', 'Розклад занять', '2020-02-09 12:09:54', '2020-02-09 12:09:54'),
(110, 'infoblock_items', 'title', 18, 'en', 'Співробітникам', '2020-02-09 12:10:05', '2020-02-09 12:10:05'),
(111, 'infoblock_items', 'title', 13, 'en', 'Діяльність', '2020-02-09 12:30:37', '2020-02-09 12:30:37'),
(112, 'infoblock_items', 'title', 19, 'en', 'Наукова', '2020-02-09 12:30:58', '2020-02-09 12:30:58'),
(113, 'infoblock_items', 'title', 20, 'en', 'Міжнародна', '2020-02-09 12:31:19', '2020-02-09 12:31:19'),
(114, 'infoblock_items', 'title', 21, 'en', 'Культура', '2020-02-09 12:31:32', '2020-02-09 12:31:32'),
(115, 'infoblock_items', 'title', 22, 'en', 'Школа програмування', '2020-02-09 12:31:43', '2020-02-09 12:31:43'),
(116, 'infoblock_items', 'title', 23, 'en', 'Навчальні програми', '2020-02-09 12:33:01', '2020-02-09 12:33:01'),
(117, 'infoblock_items', 'title', 24, 'en', 'Кафедри', '2020-02-09 12:33:11', '2020-02-09 12:33:11'),
(118, 'infoblock_items', 'title', 25, 'en', 'Адміністрація', '2020-02-09 12:33:22', '2020-02-09 12:33:22'),
(119, 'infoblock_items', 'title', 26, 'en', 'Студентська рада', '2020-02-09 12:33:32', '2020-02-09 12:33:32'),
(120, 'infoblock_items', 'title', 27, 'en', 'Ресурси', '2020-02-09 12:34:55', '2020-02-09 12:34:55'),
(121, 'infoblock_items', 'title', 28, 'en', 'Е-навчання', '2020-02-09 12:35:07', '2020-02-09 12:35:07'),
(122, 'infoblock_items', 'title', 29, 'en', 'Сервіси', '2020-02-09 12:35:20', '2020-02-09 12:35:20'),
(123, 'infoblock_items', 'title', 30, 'en', 'Документи', '2020-02-09 12:35:32', '2020-02-09 12:35:32'),
(124, 'infoblock_items', 'title', 31, 'en', 'Комп\'ютерні науки', '2020-02-09 13:11:56', '2020-02-09 13:11:56'),
(125, 'infoblock_items', 'title', 32, 'en', 'Комп\'ютерна інженерія', '2020-02-09 13:12:21', '2020-02-09 13:12:21'),
(126, 'infoblock_items', 'title', 33, 'en', 'Економічна кібернетика', '2020-02-09 13:12:43', '2020-02-09 13:12:43'),
(128, 'infoblock_items', 'title', 36, 'en', '42 викладачі', '2020-02-09 13:30:13', '2020-02-09 13:30:13'),
(129, 'infoblock_items', 'title', 37, 'en', '8 кафедр', '2020-02-09 13:30:38', '2020-02-09 13:30:38'),
(130, 'infoblock_items', 'title', 38, 'en', '6 напрямків навчання', '2020-02-09 13:34:32', '2020-02-09 13:34:32'),
(131, 'infoblock_items', 'title', 34, 'en', '365 студентів', '2020-02-09 13:39:02', '2020-02-09 13:39:02'),
(132, 'infoblock_items', 'title', 39, 'en', '122 Комп\'ютерні науки', '2020-02-10 17:21:21', '2020-02-10 17:21:21'),
(133, 'infoblock_items', 'title', 40, 'en', '122 Комп\'ютерна інженерія', '2020-02-10 17:21:59', '2020-02-10 17:21:59'),
(134, 'infoblock_items', 'title', 41, 'en', '123 Економічна кібернетика', '2020-02-10 17:22:24', '2020-02-10 17:22:24'),
(135, 'infoblocks', 'name', 4, 'en', 'Навчальні програми (головна)', '2020-02-10 17:23:27', '2020-02-10 17:23:27'),
(136, 'infoblocks', 'slug', 4, 'en', 'navchal-ni-programi-golovna', '2020-02-10 17:23:27', '2020-02-10 17:23:27'),
(140, 'infoblocks', 'name', 8, 'en', 'Кафедри факультету', '2020-02-10 18:43:38', '2020-02-10 18:43:38'),
(141, 'infoblocks', 'slug', 8, 'en', 'kafedri-fakul-tetu', '2020-02-10 18:43:38', '2020-02-10 18:43:38'),
(142, 'infoblock_items', 'title', 42, 'en', 'Кафедра інформаційних і дистанційних технологій', '2020-02-10 18:45:16', '2020-02-10 18:45:16'),
(143, 'infoblock_items', 'title', 43, 'en', 'Кафедра інформаційних систем', '2020-02-10 18:49:59', '2020-02-10 18:49:59'),
(144, 'infoblock_items', 'title', 44, 'en', 'Кафедра економічної кібернетики', '2020-02-10 18:50:22', '2020-02-10 18:50:22'),
(145, 'infoblock_items', 'title', 45, 'en', 'Кафедра комп\'ютених наук', '2020-02-10 18:50:42', '2020-02-10 18:50:42'),
(146, 'infoblocks', 'title', 8, 'en', 'КАФЕДРИ ФАКУЛЬТЕТУ', '2020-02-10 19:23:32', '2020-02-10 19:23:32'),
(147, 'infoblocks', 'sub_title', 8, 'en', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias animi dolorum inve', '2020-02-10 19:23:32', '2020-02-10 19:23:32'),
(148, 'menu_items', 'title', 42, 'en', 'Наші випускники', '2020-02-10 19:38:55', '2020-03-11 20:48:56'),
(149, 'pages', 'title', 2, 'en', 'Кафедра інформаційних систем', '2020-02-11 18:54:45', '2020-02-11 18:54:45'),
(150, 'pages', 'slug', 2, 'en', 'kafedra-informacijnih-sistem', '2020-02-11 18:54:45', '2020-02-11 18:54:45'),
(151, 'pages', 'body', 2, 'en', '<p>Кафедра інформаційних систем створена в 1997р. Основною метою діяльності кафедри є підготовка спеціалістів, які забезпечують розробку і впровадження інформаційних систем та комп&rsquo;ютерних технологій в агропромисловому комплексі. Кафедра веде підготовку студентів факультету інформаційних технологій, економічного факультету, факультету аграрного менеджменту та навчально-наукового інституту післядипломної освіти.</p>\n<p>&nbsp;</p>\n<p>На кафедрі постійно йде процес поліпшення матеріальної, навчальної і методичної бази, започатковуються нові дисципліни, які відповідають сучасним вимогам. Ще в кінці 90-х років, першою серед аграрних вищих навчальних закладів України, кафедра запровадила елементи дистанційного навчання у навчальний процес. При цьому активно проводились семінари різного рівня, створювались електронні навчальні посібники, велась просвітницька діяльність по впровадженню дистанційного навчання як ефективного напрямку більш повної реалізації прав громадян на освіту. Кафедра інформаційних систем першою адаптувала на українську мову міжнародну систему дистанційного навчання Moodle, яка нині ефективно використовується університетом у навчальному процесі.</p>', '2020-02-11 18:54:45', '2020-02-11 18:54:45'),
(152, 'data_rows', 'display_name', 104, 'en', 'Id', '2020-02-11 21:07:40', '2020-02-11 21:07:40'),
(153, 'data_rows', 'display_name', 105, 'en', 'User Id', '2020-02-11 21:07:40', '2020-02-11 21:07:40'),
(154, 'data_rows', 'display_name', 106, 'en', 'Name', '2020-02-11 21:07:40', '2020-02-11 21:07:40'),
(155, 'data_rows', 'display_name', 107, 'en', 'Slug', '2020-02-11 21:07:40', '2020-02-11 21:07:40'),
(156, 'data_rows', 'display_name', 108, 'en', 'Phone', '2020-02-11 21:07:40', '2020-02-11 21:07:40'),
(157, 'data_rows', 'display_name', 109, 'en', 'Email', '2020-02-11 21:07:40', '2020-02-11 21:07:40'),
(158, 'data_rows', 'display_name', 110, 'en', 'Position', '2020-02-11 21:07:40', '2020-02-11 21:07:40'),
(159, 'data_rows', 'display_name', 111, 'en', 'Description', '2020-02-11 21:07:40', '2020-02-11 21:07:40'),
(160, 'data_rows', 'display_name', 112, 'en', 'Image', '2020-02-11 21:07:40', '2020-02-11 21:07:40'),
(161, 'data_rows', 'display_name', 113, 'en', 'Link', '2020-02-11 21:07:40', '2020-02-11 21:07:40'),
(162, 'data_rows', 'display_name', 114, 'en', 'Status', '2020-02-11 21:07:40', '2020-02-11 21:07:40'),
(163, 'data_rows', 'display_name', 115, 'en', 'Created At', '2020-02-11 21:07:40', '2020-02-11 21:07:40'),
(164, 'data_rows', 'display_name', 116, 'en', 'Updated At', '2020-02-11 21:07:40', '2020-02-11 21:07:40'),
(165, 'data_types', 'display_name_singular', 13, 'en', 'People Info', '2020-02-11 21:07:40', '2020-02-11 21:07:40'),
(166, 'data_types', 'display_name_plural', 13, 'en', 'People Infos', '2020-02-11 21:07:40', '2020-02-11 21:07:40'),
(167, 'menu_items', 'title', 44, 'en', 'People Infos', '2020-02-12 17:54:35', '2020-02-12 17:54:35'),
(168, 'data_rows', 'display_name', 44, 'en', 'ID', '2020-02-12 18:28:29', '2020-02-12 18:28:29'),
(169, 'data_rows', 'display_name', 45, 'en', 'Author', '2020-02-12 18:28:29', '2020-02-12 18:28:29'),
(170, 'data_rows', 'display_name', 46, 'en', 'Title', '2020-02-12 18:28:29', '2020-02-12 18:28:29'),
(171, 'data_rows', 'display_name', 47, 'en', 'Excerpt', '2020-02-12 18:28:29', '2020-02-12 18:28:29'),
(172, 'data_rows', 'display_name', 48, 'en', 'Body', '2020-02-12 18:28:29', '2020-02-12 18:28:29'),
(173, 'data_rows', 'display_name', 55, 'en', 'Page Image', '2020-02-12 18:28:29', '2020-02-12 18:28:29'),
(174, 'data_rows', 'display_name', 49, 'en', 'Slug', '2020-02-12 18:28:29', '2020-02-12 18:28:29'),
(175, 'data_rows', 'display_name', 50, 'en', 'Meta Description', '2020-02-12 18:28:29', '2020-02-12 18:28:29'),
(176, 'data_rows', 'display_name', 51, 'en', 'Meta Keywords', '2020-02-12 18:28:29', '2020-02-12 18:28:29'),
(177, 'data_rows', 'display_name', 52, 'en', 'Status', '2020-02-12 18:28:29', '2020-02-12 18:28:29'),
(178, 'data_rows', 'display_name', 53, 'en', 'Created At', '2020-02-12 18:28:29', '2020-02-12 18:28:29'),
(179, 'data_rows', 'display_name', 54, 'en', 'Updated At', '2020-02-12 18:28:29', '2020-02-12 18:28:29'),
(180, 'data_types', 'display_name_singular', 6, 'en', 'Page', '2020-02-12 18:28:30', '2020-02-12 18:28:30'),
(181, 'data_types', 'display_name_plural', 6, 'en', 'Pages', '2020-02-12 18:28:30', '2020-02-12 18:28:30'),
(185, 'pages', 'title', 4, 'en', 'Кафедри факультету', '2020-02-12 18:38:07', '2020-02-12 18:38:07'),
(186, 'pages', 'slug', 4, 'en', 'departmens', '2020-02-12 18:38:07', '2020-02-12 18:38:07'),
(187, 'pages', 'body', 4, 'en', '<p>[infoblock code=\"kafedri-fakul-tetu\"]</p>', '2020-02-12 18:38:07', '2020-02-12 18:38:07'),
(188, 'data_rows', 'display_name', 117, 'en', 'Id', '2020-02-12 19:29:22', '2020-02-12 19:29:22'),
(189, 'data_rows', 'display_name', 118, 'en', 'Name', '2020-02-12 19:29:22', '2020-02-12 19:29:22'),
(190, 'data_rows', 'display_name', 119, 'en', 'Slug', '2020-02-12 19:29:22', '2020-02-12 19:29:22'),
(191, 'data_rows', 'display_name', 120, 'en', 'Title', '2020-02-12 19:29:22', '2020-02-12 19:29:22'),
(192, 'data_rows', 'display_name', 121, 'en', 'Sub Title', '2020-02-12 19:29:22', '2020-02-12 19:29:22'),
(193, 'data_rows', 'display_name', 122, 'en', 'Created At', '2020-02-12 19:29:22', '2020-02-12 19:29:22'),
(194, 'data_rows', 'display_name', 123, 'en', 'Updated At', '2020-02-12 19:29:22', '2020-02-12 19:29:22'),
(195, 'data_types', 'display_name_singular', 14, 'en', 'Gallery', '2020-02-12 19:29:22', '2020-02-12 19:29:22'),
(196, 'data_types', 'display_name_plural', 14, 'en', 'Galleries', '2020-02-12 19:29:22', '2020-02-12 19:29:22'),
(197, 'menu_items', 'title', 46, 'en', 'Galleries', '2020-02-12 19:30:02', '2020-02-12 19:30:02'),
(199, 'data_rows', 'display_name', 132, 'en', 'gallery_images', '2020-02-12 19:34:14', '2020-02-12 19:34:14'),
(200, 'data_rows', 'display_name', 124, 'en', 'Id', '2020-02-12 19:34:29', '2020-02-12 19:34:29'),
(201, 'data_rows', 'display_name', 125, 'en', 'Gallery Id', '2020-02-12 19:34:29', '2020-02-12 19:34:29'),
(202, 'data_rows', 'display_name', 126, 'en', 'Image', '2020-02-12 19:34:29', '2020-02-12 19:34:29'),
(203, 'data_rows', 'display_name', 127, 'en', 'Caption', '2020-02-12 19:34:29', '2020-02-12 19:34:29'),
(204, 'data_rows', 'display_name', 128, 'en', 'Order', '2020-02-12 19:34:29', '2020-02-12 19:34:29'),
(205, 'data_rows', 'display_name', 129, 'en', 'Created At', '2020-02-12 19:34:29', '2020-02-12 19:34:29'),
(206, 'data_rows', 'display_name', 130, 'en', 'Updated At', '2020-02-12 19:34:29', '2020-02-12 19:34:29'),
(207, 'data_rows', 'display_name', 131, 'en', 'galleries', '2020-02-12 19:34:29', '2020-02-12 19:34:29'),
(208, 'data_types', 'display_name_singular', 15, 'en', 'Gallery Image', '2020-02-12 19:34:29', '2020-02-12 19:34:29'),
(209, 'data_types', 'display_name_plural', 15, 'en', 'Gallery Images', '2020-02-12 19:34:29', '2020-02-12 19:34:29'),
(210, 'data_rows', 'display_name', 63, 'en', 'Id', '2020-02-12 19:36:41', '2020-02-12 19:36:41'),
(211, 'data_rows', 'display_name', 64, 'en', 'Name', '2020-02-12 19:36:41', '2020-02-12 19:36:41'),
(212, 'data_rows', 'display_name', 65, 'en', 'Slug', '2020-02-12 19:36:41', '2020-02-12 19:36:41'),
(213, 'data_rows', 'display_name', 66, 'en', 'Type Id', '2020-02-12 19:36:41', '2020-02-12 19:36:41'),
(214, 'data_rows', 'display_name', 67, 'en', 'Title', '2020-02-12 19:36:41', '2020-02-12 19:36:41'),
(215, 'data_rows', 'display_name', 68, 'en', 'Sub Title', '2020-02-12 19:36:41', '2020-02-12 19:36:41'),
(216, 'data_rows', 'display_name', 69, 'en', 'Button Title', '2020-02-12 19:36:41', '2020-02-12 19:36:41'),
(217, 'data_rows', 'display_name', 70, 'en', 'Button Link', '2020-02-12 19:36:41', '2020-02-12 19:36:41'),
(218, 'data_rows', 'display_name', 71, 'en', 'Created At', '2020-02-12 19:36:41', '2020-02-12 19:36:41'),
(219, 'data_rows', 'display_name', 72, 'en', 'Updated At', '2020-02-12 19:36:41', '2020-02-12 19:36:41'),
(220, 'data_rows', 'display_name', 101, 'en', 'Body', '2020-02-12 19:36:41', '2020-02-12 19:36:41'),
(221, 'data_rows', 'display_name', 102, 'en', 'Image', '2020-02-12 19:36:41', '2020-02-12 19:36:41'),
(222, 'data_rows', 'display_name', 73, 'en', 'Type', '2020-02-12 19:36:41', '2020-02-12 19:36:41'),
(223, 'data_rows', 'display_name', 133, 'en', 'infoblock_items', '2020-02-12 19:36:41', '2020-02-12 19:36:41'),
(232, 'data_rows', 'display_name', 74, 'en', 'Id', '2020-02-16 19:57:33', '2020-02-16 19:57:33'),
(233, 'data_rows', 'display_name', 75, 'en', 'Infoblock Id', '2020-02-16 19:57:33', '2020-02-16 19:57:33'),
(234, 'data_rows', 'display_name', 76, 'en', 'Title', '2020-02-16 19:57:33', '2020-02-16 19:57:33'),
(235, 'data_rows', 'display_name', 77, 'en', 'Sub Title', '2020-02-16 19:57:33', '2020-02-16 19:57:33'),
(236, 'data_rows', 'display_name', 78, 'en', 'Image', '2020-02-16 19:57:33', '2020-02-16 19:57:33'),
(237, 'data_rows', 'display_name', 79, 'en', 'Button Title', '2020-02-16 19:57:33', '2020-02-16 19:57:33'),
(238, 'data_rows', 'display_name', 80, 'en', 'Button Link', '2020-02-16 19:57:33', '2020-02-16 19:57:33'),
(239, 'data_rows', 'display_name', 81, 'en', 'Body', '2020-02-16 19:57:33', '2020-02-16 19:57:33'),
(240, 'data_rows', 'display_name', 82, 'en', 'Order', '2020-02-16 19:57:33', '2020-02-16 19:57:33'),
(241, 'data_rows', 'display_name', 83, 'en', 'Created At', '2020-02-16 19:57:33', '2020-02-16 19:57:33'),
(242, 'data_rows', 'display_name', 84, 'en', 'Updated At', '2020-02-16 19:57:33', '2020-02-16 19:57:33'),
(243, 'data_rows', 'display_name', 103, 'en', 'Parent Id', '2020-02-16 19:57:33', '2020-02-16 19:57:33'),
(244, 'data_rows', 'display_name', 85, 'en', 'Infoblock', '2020-02-16 19:57:33', '2020-02-16 19:57:33'),
(247, 'data_rows', 'display_name', 134, 'en', 'infoblock_items', '2020-02-18 18:26:04', '2020-02-18 18:26:04'),
(249, 'gallery_images', 'caption', 1, 'en', '1', '2020-02-18 19:44:47', '2020-02-18 19:44:47'),
(250, 'gallery_images', 'caption', 2, 'en', '2', '2020-02-18 19:59:51', '2020-02-18 19:59:51'),
(251, 'gallery_images', 'caption', 3, 'en', '3', '2020-02-18 20:07:26', '2020-02-18 20:07:26'),
(252, 'gallery_images', 'caption', 4, 'en', '4', '2020-02-18 20:12:57', '2020-02-18 20:12:57'),
(253, 'galleries', 'title', 1, 'en', 'Галерея', '2020-02-18 20:40:19', '2020-02-18 20:40:19'),
(254, 'infoblock_items', 'title', 58, 'en', '1С', '2020-02-18 20:55:47', '2020-02-18 20:55:47'),
(255, 'infoblock_items', 'title', 59, 'en', 'Microsoft Imagine', '2020-02-18 20:57:18', '2020-02-18 20:57:18'),
(256, 'infoblock_items', 'title', 60, 'en', 'Google', '2020-02-18 20:57:48', '2020-02-18 20:57:48'),
(257, 'infoblock_items', 'title', 61, 'en', 'Cisco', '2020-02-18 20:58:05', '2020-02-18 20:58:05'),
(258, 'infoblock_items', 'title', 62, 'en', 'Google2', '2020-02-18 21:01:07', '2020-02-18 21:01:07'),
(259, 'data_rows', 'display_name', 143, 'en', 'Id', '2020-02-28 14:47:05', '2020-02-28 14:47:05'),
(260, 'data_rows', 'display_name', 144, 'en', 'Name', '2020-02-28 14:47:05', '2020-02-28 14:47:05'),
(261, 'data_rows', 'display_name', 145, 'en', 'Slug', '2020-02-28 14:47:05', '2020-02-28 14:47:05'),
(262, 'data_rows', 'display_name', 146, 'en', 'Description', '2020-02-28 14:47:05', '2020-02-28 14:47:05'),
(263, 'data_rows', 'display_name', 147, 'en', 'Info Body', '2020-02-28 14:47:05', '2020-02-28 14:47:05'),
(264, 'data_rows', 'display_name', 148, 'en', 'Image', '2020-02-28 14:47:05', '2020-02-28 14:47:05'),
(265, 'data_rows', 'display_name', 149, 'en', 'Order', '2020-02-28 14:47:05', '2020-02-28 14:47:05'),
(266, 'data_rows', 'display_name', 150, 'en', 'Education Degree Id', '2020-02-28 14:47:05', '2020-02-28 14:47:05'),
(267, 'data_rows', 'display_name', 151, 'en', 'Education Specialty Id', '2020-02-28 14:47:05', '2020-02-28 14:47:05'),
(268, 'data_rows', 'display_name', 152, 'en', 'Parent Id', '2020-02-28 14:47:05', '2020-02-28 14:47:05'),
(269, 'data_rows', 'display_name', 153, 'en', 'Created At', '2020-02-28 14:47:05', '2020-02-28 14:47:05'),
(270, 'data_rows', 'display_name', 154, 'en', 'Updated At', '2020-02-28 14:47:05', '2020-02-28 14:47:05'),
(271, 'data_types', 'display_name_singular', 17, 'en', 'Освітня програма', '2020-02-28 14:47:05', '2020-02-28 14:47:05'),
(272, 'data_types', 'display_name_plural', 17, 'en', 'Освітні програми', '2020-02-28 14:47:05', '2020-02-28 14:47:05'),
(273, 'menu_items', 'title', 50, 'en', 'Освітні програми', '2020-02-28 14:47:28', '2020-02-28 14:47:28'),
(275, 'data_rows', 'display_name', 135, 'en', 'Id', '2020-02-29 07:33:15', '2020-02-29 07:33:15'),
(276, 'data_rows', 'display_name', 136, 'en', 'Name', '2020-02-29 07:33:15', '2020-02-29 07:33:15'),
(277, 'data_rows', 'display_name', 137, 'en', 'Slug', '2020-02-29 07:33:15', '2020-02-29 07:33:15'),
(278, 'data_rows', 'display_name', 138, 'en', 'Description', '2020-02-29 07:33:15', '2020-02-29 07:33:15'),
(279, 'data_rows', 'display_name', 139, 'en', 'Image', '2020-02-29 07:33:15', '2020-02-29 07:33:15'),
(280, 'data_rows', 'display_name', 140, 'en', 'Order', '2020-02-29 07:33:15', '2020-02-29 07:33:15'),
(281, 'data_rows', 'display_name', 141, 'en', 'Created At', '2020-02-29 07:33:15', '2020-02-29 07:33:15'),
(282, 'data_rows', 'display_name', 142, 'en', 'Updated At', '2020-02-29 07:33:15', '2020-02-29 07:33:15'),
(283, 'data_types', 'display_name_singular', 16, 'en', 'Освітній ступінь', '2020-02-29 07:33:15', '2020-02-29 07:33:15'),
(284, 'data_types', 'display_name_plural', 16, 'en', 'Освітні стені', '2020-02-29 07:33:15', '2020-02-29 07:33:15'),
(285, 'menu_items', 'title', 49, 'en', 'Освітні ступені', '2020-02-29 07:33:49', '2020-02-29 07:33:49'),
(286, 'data_rows', 'display_name', 161, 'en', 'education_degrees', '2020-02-29 07:50:09', '2020-02-29 07:50:09'),
(287, 'data_rows', 'display_name', 162, 'en', 'education_specialties', '2020-02-29 07:52:00', '2020-02-29 07:52:00'),
(288, 'infoblock_items', 'title', 63, 'en', '8 березня', '2020-03-02 18:55:41', '2020-03-02 18:55:41'),
(289, 'data_rows', 'display_name', 163, 'en', 'Id', '2020-03-02 19:40:35', '2020-03-02 19:40:35'),
(290, 'data_rows', 'display_name', 164, 'en', 'Name', '2020-03-02 19:40:35', '2020-03-02 19:40:35'),
(291, 'data_rows', 'display_name', 165, 'en', 'Slug', '2020-03-02 19:40:36', '2020-03-02 19:40:36'),
(292, 'data_rows', 'display_name', 166, 'en', 'Description', '2020-03-02 19:40:36', '2020-03-02 19:40:36'),
(293, 'data_rows', 'display_name', 167, 'en', 'Created At', '2020-03-02 19:40:36', '2020-03-02 19:40:36'),
(294, 'data_rows', 'display_name', 168, 'en', 'Updated At', '2020-03-02 19:40:36', '2020-03-02 19:40:36'),
(295, 'data_rows', 'display_name', 169, 'en', 'people_infos', '2020-03-02 19:40:36', '2020-03-02 19:40:36'),
(296, 'data_types', 'display_name_singular', 19, 'en', 'Група інформації користувачів', '2020-03-02 19:40:36', '2020-03-02 19:40:36'),
(297, 'data_types', 'display_name_plural', 19, 'en', 'Групи інформації користувачів', '2020-03-02 19:40:36', '2020-03-02 19:40:36'),
(298, 'menu_items', 'title', 32, 'en', 'Напрямки навчання', '2020-03-12 19:49:32', '2020-03-12 19:49:32'),
(302, 'pages', 'title', 6, 'en', 'Випускникам шкіл', '2020-05-10 09:43:40', '2020-05-10 09:43:40'),
(303, 'pages', 'excerpt', 6, 'en', 'Випускникам шкіл', '2020-05-10 09:43:40', '2020-05-10 09:43:40'),
(304, 'pages', 'body', 6, 'en', '<p>Відповідно до <strong>Правил прийому на 2020 рік</strong>&nbsp; вступ на базі повної загальної середньої освіти буде проходити на основі <strong>сертифікатів ЗНО 2020, 2019, 2018 та 2017&nbsp; років. Оцінки з англійської, французької, німецької та іспанської мов приймаються лише із сертифікатів зовнішнього незалежного оцінювання 2018-2020 років.&nbsp;</strong></p>\n<p>Звертаємо Вашу увагу, що цьогоріч можна буде подати <strong>до п\'яти заяв</strong> за спеціальностями, на які передбачено прийом за кошти державного бюджету. Кількість поданих заяв на спеціальності, на яких не передбачається прийому за кошти державного бюджету, не обмежується.</p>\n<p>Під час подання заяв абітурієнт, що претендує на місця державного або регіонального замовлення, має зазначити її пріоритетність, при цьому показник пріоритетності 1 (один) означає найвищу пріоритетність.&nbsp;</p>\n<p><strong>Зазначена вступником пріоритетність заяви не може бути зміненою.</strong></p>\n<p><strong>Прийом заяв і документів на навчання розпочинається з <span style=\"color: #ff0000;\">13 липня 2020 року</span>.</strong></p>\n<p>Мінімальна кількість балів з конкурсних предметів для допуску до участі в конкурсі:</p>\n<ul>\n<li>українська мова і література &ndash; <span style=\"color: #ff0000;\"><strong>100 балів</strong></span>.</li>\n<li>другий предмет &ndash; <span style=\"color: #ff0000;\"><strong>100 балів</strong></span> для усіх спеціальностей, окрім спеціальності <strong>Геодезія та землеустрій</strong> &ndash; <span style=\"color: #ff0000;\"><strong>110 балів</strong></span>.</li>\n<li>третій предмет (на вибір з двох) &ndash; <span style=\"color: #ff0000;\"><strong>100 балів</strong></span>.</li>\n</ul>', '2020-05-10 09:43:40', '2020-05-10 09:43:40'),
(305, 'infoblock_items', 'title', 64, 'en', 'Перелік документів', '2020-05-10 10:28:43', '2020-05-10 10:28:43'),
(306, 'infoblock_items', 'title', 65, 'en', 'Перелік спеціальностей', '2020-05-10 10:30:00', '2020-05-10 10:30:00'),
(307, 'menu_items', 'title', 33, 'en', 'Випускникам шкіл', '2020-05-10 10:30:52', '2020-05-10 10:30:52'),
(308, 'infoblock_items', 'title', 66, 'en', 'Термін вступної кампанії', '2020-05-10 10:45:06', '2020-05-10 10:45:06'),
(309, 'infoblock_items', 'body', 1, 'en', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam dolor optio provident temporibus tenetur? Ad, alias commodi corporis ea eos hic id ipsa iure molestiae natus nobis sint suscipit voluptas.', '2020-05-10 12:57:01', '2020-05-10 12:57:01'),
(310, 'infoblock_items', 'button_title', 1, 'en', 'Details', '2020-05-10 12:57:01', '2020-05-10 13:01:29'),
(311, 'disciplines', 'name', 2, 'en', 'Mathematical analysis', '2020-05-18 14:45:51', '2020-05-18 14:45:51'),
(312, 'disciplines', 'name', 3, 'en', 'Physics', '2020-05-18 14:45:51', '2020-05-18 14:45:51'),
(313, 'disciplines', 'name', 4, 'en', 'Linear algebra and analytic geometry', '2020-05-18 14:45:51', '2020-05-18 14:45:51'),
(314, 'disciplines', 'name', 5, 'en', 'Computer Architecture', '2020-05-18 14:45:51', '2020-05-18 14:45:51'),
(315, 'disciplines', 'name', 6, 'en', 'Foreign language', '2020-05-18 14:45:51', '2020-05-18 14:45:51'),
(316, 'disciplines', 'name', 7, 'en', 'Databases', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(317, 'disciplines', 'name', 8, 'en', 'Fundamentals of software engineering', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(318, 'disciplines', 'name', 9, 'en', 'Fundamentals of programming', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(319, 'disciplines', 'name', 10, 'en', 'History of Ukrainian statehood', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(320, 'disciplines', 'name', 11, 'en', 'Physical education', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(321, 'disciplines', 'name', 12, 'en', 'Information technology', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(322, 'disciplines', 'name', 13, 'en', 'Analysis of software requirements', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(323, 'disciplines', 'name', 14, 'en', 'Discrete structures', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(324, 'disciplines', 'name', 15, 'en', 'Probability theory', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(325, 'disciplines', 'name', 16, 'en', 'Mathematical statistics', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(326, 'disciplines', 'name', 17, 'en', 'Algorithms and Data Structures', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(327, 'disciplines', 'name', 18, 'en', 'Architecture and designing software', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(328, 'disciplines', 'name', 19, 'en', 'Security of applications and data', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(329, 'disciplines', 'name', 20, 'en', 'Group dynamics and communication', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(330, 'disciplines', 'name', 21, 'en', 'Software Economics', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(331, 'disciplines', 'name', 22, 'en', 'Empirical methods of software engineering', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(332, 'disciplines', 'name', 23, 'en', 'Computer discrete mathematics', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(333, 'disciplines', 'name', 24, 'en', 'Software design', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(334, 'disciplines', 'name', 25, 'en', 'Human-machine interaction', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(335, 'disciplines', 'name', 26, 'en', 'Software project management', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(336, 'disciplines', 'name', 27, 'en', 'Modeling and analysis of the subject area', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(337, 'disciplines', 'name', 28, 'en', 'Object-Oriented Programming', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(338, 'disciplines', 'name', 29, 'en', 'Operating Systems', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(339, 'disciplines', 'name', 30, 'en', 'Organization of computer networks', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(340, 'disciplines', 'name', 31, 'en', 'Web Programming Technologies', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(341, 'disciplines', 'name', 32, 'en', 'Project Workshop', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(342, 'disciplines', 'name', 33, 'en', 'Professional practice in software engineering', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(343, 'disciplines', 'name', 34, 'en', 'Software quality and testing', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(344, 'disciplines', 'name', 35, 'en', 'Practical and Technological Training', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(345, 'disciplines', 'name', 36, 'en', 'Pre-diploma practice', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(346, 'disciplines', 'name', 37, 'en', 'Ethnocultural studies', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(347, 'disciplines', 'name', 38, 'en', 'Programming of microprocessors', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(348, 'disciplines', 'name', 39, 'en', 'Ukrainian language', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(349, 'disciplines', 'name', 40, 'en', 'Philosophy', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(350, 'disciplines', 'name', 41, 'en', 'Safety of life and the basis of occupational safety', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(351, 'disciplines', 'name', 42, 'en', 'Computer Graphics', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(352, 'disciplines', 'name', 43, 'en', 'Logical programming', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(353, 'disciplines', 'name', 44, 'en', 'Logic', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(354, 'disciplines', 'name', 45, 'en', 'Intelligent Systems', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(355, 'disciplines', 'name', 46, 'en', 'Cross-platform Programming', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(356, 'disciplines', 'name', 47, 'en', 'Management', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(357, 'disciplines', 'name', 48, 'en', 'Programming of mobile devices', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(358, 'disciplines', 'name', 49, 'en', 'Technologies database programming', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(359, 'disciplines', 'name', 50, 'en', 'Programming', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(360, 'disciplines', 'name', 51, 'en', 'History and culture of Ukraine', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(361, 'disciplines', 'name', 52, 'en', 'Ukrainian language (professional)', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(362, 'disciplines', 'name', 53, 'en', 'Dot.net software technology', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(363, 'disciplines', 'name', 54, 'en', 'Methods of object-oriented design of software systems', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(364, 'disciplines', 'name', 55, 'en', 'Distributed Programming Technologies', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(365, 'disciplines', 'name', 56, 'en', 'Labour and Life Safety', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(366, 'disciplines', 'name', 57, 'en', 'Legal Culture of Personality', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(367, 'disciplines', 'name', 58, 'en', 'Databases', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(368, 'disciplines', 'name', 59, 'en', 'Probability Theory, Probabilistic Processes and Mathematical Statistics', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(369, 'disciplines', 'name', 60, 'en', 'Bachelor thesis', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(370, 'disciplines', 'name', 61, 'en', 'Preparing and defense of bachelor thesis', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(371, 'disciplines', 'name', 62, 'en', 'Modeling and forecasting in environmental sphere', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(372, 'disciplines', 'name', 63, 'en', 'Object modeling and designing of complex systems', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(373, 'disciplines', 'name', 64, 'en', 'Organization of data warehouses', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(374, 'disciplines', 'name', 65, 'en', 'Mathematical methods in systems of artificial intelligence', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(375, 'disciplines', 'name', 66, 'en', 'Web Applications Development', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(376, 'disciplines', 'name', 67, 'en', 'Robotic control systems', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(377, 'disciplines', 'name', 68, 'en', 'Reliability of the functioning of computer systems', '2020-05-18 14:45:52', '2020-05-18 14:45:52');
INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(378, 'disciplines', 'name', 69, 'en', 'Designing information and control systems and intelligent systems', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(379, 'disciplines', 'name', 70, 'en', 'Information and communication systems security', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(380, 'disciplines', 'name', 71, 'en', 'Business foreign language', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(381, 'disciplines', 'name', 72, 'en', 'Agrarian Policy', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(382, 'disciplines', 'name', 73, 'en', 'Methodology and organization of research on the basics of intellectual property', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(383, 'disciplines', 'name', 74, 'en', 'Standardization and Certification of Information Technologies', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(384, 'disciplines', 'name', 75, 'en', 'Data Mining Technologies', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(385, 'disciplines', 'name', 76, 'en', 'Information Services Management', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(386, 'disciplines', 'name', 77, 'en', 'Templates of object-oriented modeling and programming', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(387, 'disciplines', 'name', 78, 'en', 'Global information resources', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(388, 'disciplines', 'name', 79, 'en', 'GIS technology and environmental management', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(389, 'disciplines', 'name', 80, 'en', 'Project management', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(390, 'disciplines', 'name', 81, 'en', 'Principles of Distributed and Networked Programming', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(391, 'disciplines', 'name', 82, 'en', 'Intelligent environmental monitoring systems', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(392, 'disciplines', 'name', 83, 'en', 'Mobile Computer Integrated Systems', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(393, 'disciplines', 'name', 84, 'en', 'Methods and Information Technologies for Risk Assessment', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(394, 'disciplines', 'name', 85, 'en', 'Scientific and production practice', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(395, 'disciplines', 'name', 86, 'en', 'Preparing and defense of master thesis', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(396, 'disciplines', 'name', 87, 'en', 'Hardware and software for collecting and processing environmental information', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(397, 'disciplines', 'name', 88, 'en', 'IT monitoring of environmental and socio-economic processes', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(398, 'disciplines', 'name', 89, 'en', 'Content management and integration of information in the agro-eco-systems', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(399, 'disciplines', 'name', 90, 'en', 'Security and reliability of computer systems', '2020-05-18 14:45:52', '2020-05-18 14:45:52'),
(400, 'disciplines', 'name', 91, 'en', 'Educational technologies', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(401, 'disciplines', 'name', 92, 'en', 'Philosophy of science', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(402, 'disciplines', 'name', 93, 'en', 'Methods of building expert systems', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(403, 'disciplines', 'name', 94, 'en', 'IT Infrastructure Management of Monitoring Systems', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(404, 'disciplines', 'name', 95, 'en', 'Environmental control and security', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(405, 'disciplines', 'name', 96, 'en', 'Environmental management and audit', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(406, 'disciplines', 'name', 97, 'en', 'Research practice', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(407, 'disciplines', 'name', 98, 'en', 'Scientific and pedagogical practice', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(408, 'disciplines', 'name', 99, 'en', 'Master\'s Graduate Thesis', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(409, 'disciplines', 'name', 100, 'en', 'Big Data Technologies', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(410, 'disciplines', 'name', 101, 'en', 'Master\'s thesis project', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(411, 'disciplines', 'name', 102, 'en', 'Aerospace monitoring of geosystems', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(412, 'disciplines', 'name', 103, 'en', 'Simulation modeling of environmental processes', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(413, 'disciplines', 'name', 104, 'en', 'Geographic information systems and technologies in ecology and environmental', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(414, 'disciplines', 'name', 105, 'en', 'Methods and systems for decision support in the management of ecological and economic processes', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(415, 'disciplines', 'name', 106, 'en', 'Managing of IT infrastructure', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(416, 'disciplines', 'name', 107, 'en', 'Modeling in the management of production processes', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(417, 'disciplines', 'name', 108, 'en', 'Global Economy', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(418, 'disciplines', 'name', 109, 'en', 'Management Economics', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(419, 'disciplines', 'name', 110, 'en', 'Applied Econometrics', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(420, 'disciplines', 'name', 111, 'en', 'Data mining', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(421, 'disciplines', 'name', 112, 'en', 'Models of environmental management', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(422, 'disciplines', 'name', 113, 'en', 'E-commerce', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(423, 'disciplines', 'name', 114, 'en', 'Big data analysis', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(424, 'disciplines', 'name', 115, 'en', 'Risk Management Models', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(425, 'disciplines', 'name', 116, 'en', 'Modeling with R', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(426, 'disciplines', 'name', 117, 'en', 'Models of financial management', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(427, 'disciplines', 'name', 118, 'en', 'Agrarian consulting', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(428, 'disciplines', 'name', 119, 'en', 'Statistics in nature management', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(429, 'disciplines', 'name', 120, 'en', 'Investment Portfolio Management', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(430, 'disciplines', 'name', 121, 'en', 'Practical training', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(431, 'disciplines', 'name', 122, 'en', 'Ecological and economic risks', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(432, 'disciplines', 'name', 123, 'en', 'Actuarial calculations', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(433, 'disciplines', 'name', 124, 'en', 'State Attestation', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(434, 'disciplines', 'name', 125, 'en', 'Special sections of mathematics', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(435, 'disciplines', 'name', 126, 'en', 'Remote Sensing and Geospatial Data Processing Technologies', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(436, 'disciplines', 'name', 127, 'en', 'Modeling of business processes', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(437, 'disciplines', 'name', 128, 'en', 'Ecological-economic modeling', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(438, 'disciplines', 'name', 129, 'en', 'Risks of innovation in agrarian production', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(439, 'disciplines', 'name', 130, 'en', 'Mathematical Methods of Operations Research', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(440, 'disciplines', 'name', 131, 'en', 'Software Design', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(441, 'disciplines', 'name', 132, 'en', 'Systems Analysis', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(442, 'disciplines', 'name', 133, 'en', 'Web-technologies and Web-design', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(443, 'disciplines', 'name', 134, 'en', 'Computer networks', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(444, 'disciplines', 'name', 135, 'en', 'Economy and Business', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(445, 'disciplines', 'name', 136, 'en', 'Methods and Systems of Artificial Intelligence', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(446, 'disciplines', 'name', 137, 'en', 'Practical Training in Information Systems', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(447, 'disciplines', 'name', 138, 'en', 'Higher Mathematics', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(448, 'disciplines', 'name', 139, 'en', 'History of Ukraine', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(449, 'disciplines', 'name', 140, 'en', 'Electrical and Electronics', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(450, 'disciplines', 'name', 141, 'en', 'Computer Circuitry and Computer Architecture', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(451, 'disciplines', 'name', 142, 'en', 'Practical Training in Technology of Production and Processing of Agricultural Products', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(452, 'disciplines', 'name', 143, 'en', 'Practical Training in information technology', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(453, 'disciplines', 'name', 144, 'en', 'Discrete Mathematics', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(454, 'disciplines', 'name', 145, 'en', 'Numerical Methods', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(455, 'disciplines', 'name', 146, 'en', 'Theory of Algorithms', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(456, 'disciplines', 'name', 147, 'en', 'System Simulation', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(457, 'disciplines', 'name', 148, 'en', 'Technical Communication Tools', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(458, 'disciplines', 'name', 149, 'en', 'Ecology', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(459, 'disciplines', 'name', 150, 'en', 'Statistical Methods, Streams of Events Theory', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(460, 'disciplines', 'name', 151, 'en', 'Distribution Systems Technology and Parallel Computing', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(461, 'disciplines', 'name', 152, 'en', 'Decision Theory', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(462, 'disciplines', 'name', 153, 'en', 'Information Systems Design', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(463, 'disciplines', 'name', 154, 'en', 'IT-Project Management', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(464, 'disciplines', 'name', 155, 'en', 'Theory of Pattern Recognition and Classification in the Intelligence Systems', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(465, 'disciplines', 'name', 156, 'en', 'Technology Information Protection', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(466, 'disciplines', 'name', 157, 'en', 'Microprocessor Control Systems', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(467, 'disciplines', 'name', 158, 'en', 'Computer ecological and economic monitoring systems', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(468, 'disciplines', 'name', 159, 'en', 'Computer Design Technology', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(469, 'disciplines', 'name', 160, 'en', 'Programming mobile apps', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(470, 'disciplines', 'name', 161, 'en', 'Multimedia Information Technology', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(471, 'disciplines', 'name', 162, 'en', 'Technologies of information management systems development', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(472, 'disciplines', 'name', 163, 'en', 'Modern Management Theory', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(473, 'disciplines', 'name', 164, 'en', 'Information technology for environmental monitoring', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(474, 'disciplines', 'name', 165, 'en', 'Introduction to the Speciality', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(475, 'disciplines', 'name', 166, 'en', 'Typical Technological Objects of Production of Agriculture', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(476, 'disciplines', 'name', 167, 'en', 'Life Safety', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(477, 'disciplines', 'name', 168, 'en', 'Algorithmic and Programming', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(478, 'disciplines', 'name', 169, 'en', 'Computer circuitry (elements and circuit of computer systems)', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(479, 'disciplines', 'name', 170, 'en', 'Organization of Date and Knowledges Bases', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(480, 'disciplines', 'name', 171, 'en', 'Database Management Systems', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(481, 'disciplines', 'name', 172, 'en', 'Electrical  Technology in Agriculture', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(482, 'disciplines', 'name', 173, 'en', 'Probability Theory, Probabilistic Processes and Mathematical Statistics', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(483, 'disciplines', 'name', 174, 'en', 'Computer Networks (local, corporate, global)', '2020-05-18 14:45:53', '2020-05-18 14:45:53'),
(484, 'disciplines', 'name', 175, 'en', 'Political Science', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(485, 'disciplines', 'name', 176, 'en', 'Theory of  Information', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(486, 'disciplines', 'name', 177, 'en', 'Information Control Systems and Technologies in Agriculture', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(487, 'disciplines', 'name', 178, 'en', 'Law Science', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(488, 'disciplines', 'name', 179, 'en', 'Basics of Health', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(489, 'disciplines', 'name', 180, 'en', 'Bachelor\'s thesis project', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(490, 'disciplines', 'name', 181, 'en', 'Methods and Tools of Computer Information Technologies', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(491, 'disciplines', 'name', 182, 'en', 'History of Ukrainian Culture', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(492, 'disciplines', 'name', 183, 'en', 'Religious Studies', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(493, 'disciplines', 'name', 184, 'en', 'Information Law', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(494, 'disciplines', 'name', 185, 'en', 'Algorithms and methods of computation', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(495, 'disciplines', 'name', 186, 'en', 'Computer Logic', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(496, 'disciplines', 'name', 187, 'en', 'System programming', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(497, 'disciplines', 'name', 188, 'en', 'Computer circuitry', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(498, 'disciplines', 'name', 189, 'en', 'Computer electronics', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(499, 'disciplines', 'name', 190, 'en', 'System software', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(500, 'disciplines', 'name', 191, 'en', 'Computer systems', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(501, 'disciplines', 'name', 192, 'en', 'Software engineering', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(502, 'disciplines', 'name', 193, 'en', 'Psychology', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(503, 'disciplines', 'name', 194, 'en', 'Parallel and distributed computing', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(504, 'disciplines', 'name', 195, 'en', 'Technology designing of computer systems', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(505, 'disciplines', 'name', 196, 'en', 'Information protecting in computer systems', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(506, 'disciplines', 'name', 197, 'en', 'Built-in object systems of the agricultural production', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(507, 'disciplines', 'name', 198, 'en', 'GIS hardware and software', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(508, 'disciplines', 'name', 199, 'en', 'Programming in the environment of modern OS', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(509, 'disciplines', 'name', 200, 'en', 'Mobile computer systems', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(510, 'disciplines', 'name', 201, 'en', 'History of Ukrainian Statehood', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(511, 'disciplines', 'name', 202, 'en', 'Linear algebra', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(512, 'disciplines', 'name', 203, 'en', 'Practical Training in Computer Technology', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(513, 'disciplines', 'name', 204, 'en', 'Training technological practice in databases and object-oriented programming', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(514, 'disciplines', 'name', 205, 'en', 'Modern economic theory', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(515, 'disciplines', 'name', 206, 'en', 'Mathematics for economists: higher mathematics', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(516, 'disciplines', 'name', 207, 'en', 'Informatics', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(517, 'disciplines', 'name', 208, 'en', 'Modern information communication', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(518, 'disciplines', 'name', 209, 'en', 'Technology of Processing, Storage and Standardization of Agricultural Products', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(519, 'disciplines', 'name', 210, 'en', 'Economic Cybernetics', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(520, 'disciplines', 'name', 211, 'en', 'Practical Training in Informatics', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(521, 'disciplines', 'name', 212, 'en', 'Practical Training in Technology of Animal Products Production', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(522, 'disciplines', 'name', 213, 'en', 'Practical Training in Technology of Crop Production', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(523, 'disciplines', 'name', 214, 'en', 'Practical training in modern information communication', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(524, 'disciplines', 'name', 215, 'en', 'Technology of Animal Products Production', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(525, 'disciplines', 'name', 216, 'en', 'Microeconomics', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(526, 'disciplines', 'name', 217, 'en', 'Probability Theory and Mathematical Statistics', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(527, 'disciplines', 'name', 218, 'en', 'Optimization methods and models', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(528, 'disciplines', 'name', 219, 'en', 'Money and Credit', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(529, 'disciplines', 'name', 220, 'en', 'Macroeconomics', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(530, 'disciplines', 'name', 221, 'en', 'Statistics', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(531, 'disciplines', 'name', 222, 'en', 'Accounting', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(532, 'disciplines', 'name', 223, 'en', 'Operations Research-І', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(533, 'disciplines', 'name', 224, 'en', 'Practical Training in software development technologies', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(534, 'disciplines', 'name', 225, 'en', 'Operations Research-ІІ', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(535, 'disciplines', 'name', 226, 'en', 'Risk management', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(536, 'disciplines', 'name', 227, 'en', 'Econometrics', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(537, 'disciplines', 'name', 228, 'en', 'Analytics with R', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(538, 'disciplines', 'name', 229, 'en', 'Marketing', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(539, 'disciplines', 'name', 230, 'en', 'Technology of design and administration of DB and SD', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(540, 'disciplines', 'name', 231, 'en', 'Web programming', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(541, 'disciplines', 'name', 232, 'en', 'Mathematical models of agrarian sector', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(542, 'disciplines', 'name', 233, 'en', 'Operations Research-ІІІ', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(543, 'disciplines', 'name', 234, 'en', 'Labour economics and labour relations', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(544, 'disciplines', 'name', 235, 'en', 'Business Economics', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(545, 'disciplines', 'name', 236, 'en', 'Modeling economy', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(546, 'disciplines', 'name', 237, 'en', 'Practical Training in Technology Design and Administration of DB and DW', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(547, 'disciplines', 'name', 238, 'en', 'Practical Trainig in Web Programming', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(548, 'disciplines', 'name', 239, 'en', 'Practical training in mathematical models of agrarian sector', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(549, 'disciplines', 'name', 240, 'en', 'Computer Programming', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(550, 'disciplines', 'name', 241, 'en', 'Regional economy', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(551, 'disciplines', 'name', 242, 'en', 'Operations Research', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(552, 'disciplines', 'name', 243, 'en', 'Practical Training in IT', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(553, 'disciplines', 'name', 244, 'en', 'Practical Training in Computer Programming', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(554, 'disciplines', 'name', 245, 'en', 'Technology of designing and administration of DB and JV', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(555, 'disciplines', 'name', 246, 'en', 'Economic and mathematical models in the agroindustrial complex', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(556, 'disciplines', 'name', 247, 'en', 'Practical Training in the Economic and mathematical models in the agroindustrial complex', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(557, 'disciplines', 'name', 248, 'en', 'Forecasting of social and economic processes', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(558, 'disciplines', 'name', 249, 'en', 'Finances', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(559, 'disciplines', 'name', 250, 'en', 'Information systems and technologies in management', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(560, 'disciplines', 'name', 251, 'en', 'Models of Economic Dynamics', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(561, 'disciplines', 'name', 252, 'en', 'IT Project Management', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(562, 'disciplines', 'name', 253, 'en', 'International Economics', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(563, 'disciplines', 'name', 254, 'en', 'Systems Analysis and Design of IS', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(564, 'disciplines', 'name', 255, 'en', 'Decision of making systems', '2020-05-18 14:45:54', '2020-05-18 14:45:54'),
(565, 'disciplines', 'name', 256, 'en', 'Computer Networks', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(566, 'disciplines', 'name', 257, 'en', 'Psychology and Pedagogy', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(567, 'disciplines', 'name', 258, 'en', 'Organization and planning of production in agrarian formations', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(568, 'disciplines', 'name', 259, 'en', 'IBM SPSS Tools', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(569, 'disciplines', 'name', 260, 'en', 'Practical Training in programming', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(570, 'disciplines', 'name', 261, 'en', 'Practical Training of Automated Technolodies in Agricultural', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(571, 'disciplines', 'name', 262, 'en', 'Practical Training in engineering and technology in agroindustrial complex', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(572, 'disciplines', 'name', 263, 'en', 'Specialized computers', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(573, 'disciplines', 'name', 264, 'en', 'Digital circuitry of specialized devices', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(574, 'disciplines', 'name', 265, 'en', 'Theory of electric and magnetic circles', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(575, 'disciplines', 'name', 266, 'en', 'Technology and technology in the agroindustrial complex', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(576, 'disciplines', 'name', 267, 'en', 'Philosophy', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(577, 'disciplines', 'name', 268, 'en', 'Practical and Technological Training in computer electronics', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(578, 'disciplines', 'name', 269, 'en', 'Practical and Technological Training in software engineering', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(579, 'disciplines', 'name', 270, 'en', 'Programming Technologies Computer Systems', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(580, 'disciplines', 'name', 271, 'en', 'Practical Training in Programming', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(581, 'disciplines', 'name', 272, 'en', 'Computer systems of agricultural production facilities', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(582, 'disciplines', 'name', 273, 'en', 'Microprocessor control systems', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(583, 'disciplines', 'name', 274, 'en', 'Fundamentals of GIS and Remote Sensing', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(584, 'disciplines', 'name', 275, 'en', 'Training technological practice in information technology', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(585, 'disciplines', 'name', 276, 'en', 'Simulation modeling', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(586, 'disciplines', 'name', 277, 'en', 'Fundamentals of Stock Exchange Activities', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(587, 'disciplines', 'name', 278, 'en', 'Quantitative methods in economics', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(588, 'disciplines', 'name', 279, 'en', 'Psychology and Pedagogy', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(589, 'disciplines', 'name', 280, 'en', 'Political economy', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(590, 'disciplines', 'name', 281, 'en', 'University education', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(591, 'disciplines', 'name', 282, 'en', 'History of Economics and Economic Thought', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(592, 'disciplines', 'name', 283, 'en', 'Public communications', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(593, 'disciplines', 'name', 284, 'en', 'Technology of Crop Production', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(594, 'disciplines', 'name', 285, 'en', 'Practical Training in Public Communications', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(595, 'disciplines', 'name', 286, 'en', 'Sociology', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(596, 'disciplines', 'name', 287, 'en', 'Complex coursework in Business Economics and Statistics', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(597, 'disciplines', 'name', 288, 'en', 'State examination professional disciplines', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(598, 'disciplines', 'name', 289, 'en', 'Economics and Mathematical Models in Management and Economics', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(599, 'disciplines', 'name', 290, 'en', 'Theory of Random Processes', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(600, 'disciplines', 'name', 291, 'en', 'Practical Training in the Economic and Mathematical Models in Management and Economics', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(601, 'disciplines', 'name', 292, 'en', 'Economic analysis', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(602, 'disciplines', 'name', 293, 'en', 'Organization of production', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(603, 'disciplines', 'name', 294, 'en', 'Systems of Automated Processing Information', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(604, 'disciplines', 'name', 295, 'en', 'Java programming', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(605, 'disciplines', 'name', 296, 'en', 'Mass service systems', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(606, 'disciplines', 'name', 297, 'en', 'Information systems and technologies in management activity', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(607, 'disciplines', 'name', 298, 'en', 'Methods of agri-ecological land valuation', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(608, 'disciplines', 'name', 299, 'en', 'Design and Technological Practical Training', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(609, 'disciplines', 'name', 300, 'en', 'Labour and life safety', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(610, 'disciplines', 'name', 301, 'en', 'Information systems and technologies at enterprises', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(611, 'disciplines', 'name', 302, 'en', 'Theory and design of computer systems and networks', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(612, 'disciplines', 'name', 303, 'en', 'Information technology for monitoring of the environment', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(613, 'disciplines', 'name', 304, 'en', 'Economic theory', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(614, 'disciplines', 'name', 305, 'en', 'Business protocol and communication ethics', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(615, 'disciplines', 'name', 306, 'en', 'Technologies of Crop Products Production and Animal Products Production', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(616, 'disciplines', 'name', 307, 'en', 'Data mining based on artificial intelligence methods', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(617, 'disciplines', 'name', 308, 'en', 'Research training on the theme of master thesis', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(618, 'disciplines', 'name', 309, 'en', 'Digital economy', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(619, 'disciplines', 'name', 310, 'en', 'Technology of Production, Storage and Processing of Agricultural Products', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(620, 'disciplines', 'name', 311, 'en', 'Probability Theory and Mathematic Statistics', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(621, 'disciplines', 'name', 312, 'en', 'Information Security in Computer Systems and Cybersecurity (Part 1)', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(622, 'disciplines', 'name', 313, 'en', 'Robotic operating systems', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(623, 'disciplines', 'name', 314, 'en', 'Information Protection in Computer Systems and Cybersecurity (Part 2)', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(624, 'disciplines', 'name', 315, 'en', 'Visualization and pattern recognition systems', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(625, 'disciplines', 'name', 316, 'en', 'Computer systems of artificial intelligence', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(626, 'disciplines', 'name', 317, 'en', 'Technologies for designing IOT systems', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(627, 'disciplines', 'name', 318, 'en', 'Protocols for data transmission in IOT systems', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(628, 'disciplines', 'name', 319, 'en', 'Information technology for monitoring and modeling of the environment', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(629, 'disciplines', 'name', 320, 'en', 'Economics and management of software projects', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(630, 'disciplines', 'name', 321, 'en', 'Digital processing of signals and images', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(631, 'disciplines', 'name', 322, 'en', 'High-performance computer systems', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(632, 'disciplines', 'name', 323, 'en', 'Software for embedded systems', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(633, 'disciplines', 'name', 324, 'en', 'Software project management', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(634, 'disciplines', 'name', 325, 'en', 'Theory of formal languages and compilation', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(635, 'disciplines', 'name', 326, 'en', 'Programming of Artificial Intelligence Systems', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(636, 'disciplines', 'name', 327, 'en', 'Legal protection of software', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(637, 'disciplines', 'name', 328, 'en', 'Content Management', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(638, 'disciplines', 'name', 329, 'en', 'Software quality', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(639, 'disciplines', 'name', 330, 'en', 'Fundamentals of GIS', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(640, 'disciplines', 'name', 331, 'en', 'Electrical Engineering and Electromechanics', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(641, 'disciplines', 'name', 332, 'en', 'Computer technologies in agrarian and industrial complex', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(642, 'disciplines', 'name', 333, 'en', 'zahist information', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(643, 'disciplines', 'name', 334, 'en', 'Sociology', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(644, 'disciplines', 'name', 335, 'en', 'ARM Accountant', '2020-05-18 14:45:55', '2020-05-18 14:45:55'),
(645, 'disciplines', 'name', 336, 'en', 'Production, processing and storage technology products', '2020-05-18 14:45:56', '2020-05-18 14:45:56'),
(646, 'disciplines', 'name', 338, 'en', 'Informational Bezpeka Power', '2020-05-18 14:45:56', '2020-05-18 14:45:56'),
(647, 'disciplines', 'name', 339, 'en', 'Advanced Technology Programming', '2020-05-18 14:45:56', '2020-05-18 14:45:56'),
(648, 'disciplines', 'name', 340, 'en', 'Microcontroller systems', '2020-05-18 14:45:56', '2020-05-18 14:45:56'),
(649, 'disciplines', 'name', 341, 'en', 'Methodology and organization of research on the basics of intellectual property', '2020-05-18 14:45:56', '2020-05-18 14:45:56'),
(650, 'disciplines', 'name', 342, 'en', 'Blockchain technologies', '2020-05-18 14:45:56', '2020-05-18 14:45:56'),
(651, 'disciplines', 'name', 343, 'en', 'Methodology and organization of scientific research', '2020-05-18 14:45:56', '2020-05-18 14:45:56'),
(652, 'data_rows', 'display_name', 22, 'en', 'ID', '2020-05-18 14:50:07', '2020-05-18 14:50:07'),
(653, 'data_rows', 'display_name', 23, 'en', 'Parent', '2020-05-18 14:50:07', '2020-05-18 14:50:07'),
(654, 'data_rows', 'display_name', 24, 'en', 'Order', '2020-05-18 14:50:07', '2020-05-18 14:50:07'),
(655, 'data_rows', 'display_name', 25, 'en', 'Name', '2020-05-18 14:50:07', '2020-05-18 14:50:07'),
(656, 'data_rows', 'display_name', 26, 'en', 'Slug', '2020-05-18 14:50:07', '2020-05-18 14:50:07'),
(657, 'data_rows', 'display_name', 27, 'en', 'Created At', '2020-05-18 14:50:07', '2020-05-18 14:50:07'),
(658, 'data_rows', 'display_name', 28, 'en', 'Updated At', '2020-05-18 14:50:07', '2020-05-18 14:50:07'),
(659, 'data_rows', 'display_name', 155, 'en', 'Id', '2020-05-18 14:52:23', '2020-05-18 14:52:23'),
(660, 'data_rows', 'display_name', 156, 'en', 'Name', '2020-05-18 14:52:23', '2020-05-18 14:52:23'),
(661, 'data_rows', 'display_name', 157, 'en', 'Code', '2020-05-18 14:52:23', '2020-05-18 14:52:23'),
(662, 'data_rows', 'display_name', 158, 'en', 'Description', '2020-05-18 14:52:23', '2020-05-18 14:52:23'),
(663, 'data_rows', 'display_name', 159, 'en', 'Created At', '2020-05-18 14:52:23', '2020-05-18 14:52:23'),
(664, 'data_rows', 'display_name', 160, 'en', 'Updated At', '2020-05-18 14:52:23', '2020-05-18 14:52:23'),
(665, 'data_types', 'display_name_singular', 18, 'en', 'Освітня спеціальність', '2020-05-18 14:52:23', '2020-05-18 14:52:23'),
(666, 'data_types', 'display_name_plural', 18, 'en', 'Освітні спеціальності', '2020-05-18 14:52:23', '2020-05-18 14:52:23'),
(667, 'menu_items', 'title', 56, 'en', 'Логи інтеграції', '2020-05-18 15:51:18', '2020-05-18 15:51:18'),
(668, 'menu_items', 'title', 59, 'en', 'Довідники', '2020-05-18 15:55:36', '2020-05-18 15:55:36'),
(674, 'data_rows', 'display_name', 1, 'en', 'ID', '2020-05-18 17:21:32', '2020-05-18 17:21:32'),
(675, 'data_rows', 'display_name', 21, 'en', 'Role', '2020-05-18 17:21:32', '2020-05-18 17:21:32'),
(676, 'data_rows', 'display_name', 2, 'en', 'Name', '2020-05-18 17:21:32', '2020-05-18 17:21:32'),
(677, 'data_rows', 'display_name', 3, 'en', 'Email', '2020-05-18 17:21:32', '2020-05-18 17:21:32'),
(678, 'data_rows', 'display_name', 8, 'en', 'Avatar', '2020-05-18 17:21:32', '2020-05-18 17:21:32'),
(679, 'data_rows', 'display_name', 4, 'en', 'Password', '2020-05-18 17:21:32', '2020-05-18 17:21:32'),
(680, 'data_rows', 'display_name', 5, 'en', 'Remember Token', '2020-05-18 17:21:32', '2020-05-18 17:21:32'),
(681, 'data_rows', 'display_name', 11, 'en', 'Settings', '2020-05-18 17:21:32', '2020-05-18 17:21:32'),
(682, 'data_rows', 'display_name', 6, 'en', 'Created At', '2020-05-18 17:21:32', '2020-05-18 17:21:32'),
(683, 'data_rows', 'display_name', 7, 'en', 'Updated At', '2020-05-18 17:21:32', '2020-05-18 17:21:32'),
(684, 'data_rows', 'display_name', 9, 'en', 'Role', '2020-05-18 17:21:32', '2020-05-18 17:21:32'),
(685, 'data_rows', 'display_name', 10, 'en', 'Roles', '2020-05-18 17:21:32', '2020-05-18 17:21:32'),
(686, 'data_types', 'display_name_singular', 1, 'en', 'User', '2020-05-18 17:21:32', '2020-05-18 17:21:32'),
(687, 'data_types', 'display_name_plural', 1, 'en', 'Users', '2020-05-18 17:21:32', '2020-05-18 17:21:32'),
(688, 'data_rows', 'display_name', 180, 'en', 'Підтверджено', '2020-05-18 17:22:45', '2020-05-18 17:22:45'),
(689, 'data_rows', 'display_name', 181, 'en', 'Дата народження', '2020-05-18 17:22:45', '2020-05-18 17:22:45'),
(690, 'data_rows', 'display_name', 182, 'en', 'Ід групи', '2020-05-18 17:22:45', '2020-05-18 17:22:45'),
(691, 'data_rows', 'display_name', 183, 'en', 'Номер залікової книжки', '2020-05-18 17:22:45', '2020-05-18 17:22:45'),
(692, 'data_rows', 'display_name', 184, 'en', 'groups', '2020-05-18 18:11:35', '2020-05-18 18:11:35'),
(693, 'data_rows', 'display_name', 86, 'en', 'Id', '2020-05-19 18:08:42', '2020-05-19 18:08:42'),
(694, 'data_rows', 'display_name', 87, 'en', 'Svg', '2020-05-19 18:08:42', '2020-05-19 18:08:42'),
(695, 'data_rows', 'display_name', 88, 'en', 'Link', '2020-05-19 18:08:42', '2020-05-19 18:08:42'),
(696, 'data_rows', 'display_name', 96, 'en', 'Created At', '2020-05-19 18:08:42', '2020-05-19 18:08:42'),
(697, 'data_rows', 'display_name', 97, 'en', 'Updated At', '2020-05-19 18:08:42', '2020-05-19 18:08:42'),
(698, 'data_rows', 'display_name', 98, 'en', 'Name', '2020-05-19 18:08:42', '2020-05-19 18:08:42'),
(699, 'data_rows', 'display_name', 185, 'en', 'Відображати для студентів', '2020-05-19 18:09:48', '2020-05-19 18:09:48'),
(700, 'data_rows', 'display_name', 189, 'en', 'Id', '2020-05-19 18:13:36', '2020-05-19 18:13:36'),
(701, 'data_rows', 'display_name', 190, 'en', 'Назва', '2020-05-19 18:13:36', '2020-05-19 18:13:36'),
(702, 'data_rows', 'display_name', 191, 'en', 'Period Type Id', '2020-05-19 18:13:36', '2020-05-19 18:13:36'),
(703, 'data_rows', 'display_name', 192, 'en', 'Дата початку', '2020-05-19 18:13:36', '2020-05-19 18:13:36'),
(704, 'data_rows', 'display_name', 193, 'en', 'Дата закінчення', '2020-05-19 18:13:36', '2020-05-19 18:13:36'),
(705, 'data_rows', 'display_name', 194, 'en', 'Опис', '2020-05-19 18:13:36', '2020-05-19 18:13:36'),
(706, 'data_rows', 'display_name', 195, 'en', 'period_types', '2020-05-19 18:13:36', '2020-05-19 18:13:36'),
(707, 'data_types', 'display_name_singular', 27, 'en', 'Період', '2020-05-19 18:13:36', '2020-05-19 18:13:36'),
(708, 'data_types', 'display_name_plural', 27, 'en', 'Періоди', '2020-05-19 18:13:36', '2020-05-19 18:13:36'),
(709, 'data_rows', 'display_name', 203, 'en', 'Id', '2020-05-19 18:18:57', '2020-05-19 18:18:57'),
(710, 'data_rows', 'display_name', 204, 'en', 'Назва', '2020-05-19 18:18:57', '2020-05-19 18:18:57'),
(711, 'data_rows', 'display_name', 205, 'en', 'Опис', '2020-05-19 18:18:57', '2020-05-19 18:18:57'),
(712, 'data_rows', 'display_name', 206, 'en', 'Parent Id', '2020-05-19 18:18:57', '2020-05-19 18:18:57'),
(713, 'data_rows', 'display_name', 207, 'en', 'Створено', '2020-05-19 18:18:57', '2020-05-19 18:18:57'),
(714, 'data_rows', 'display_name', 208, 'en', 'Updated At', '2020-05-19 18:18:57', '2020-05-19 18:18:57'),
(715, 'data_rows', 'display_name', 209, 'en', 'rating_item_groups', '2020-05-19 18:18:57', '2020-05-19 18:18:57'),
(716, 'data_types', 'display_name_singular', 29, 'en', 'Блок пункту рейтингу', '2020-05-19 18:18:57', '2020-05-19 18:18:57'),
(717, 'data_types', 'display_name_plural', 29, 'en', 'Блоки пунктів рейтингу', '2020-05-19 18:18:57', '2020-05-19 18:18:57'),
(718, 'data_rows', 'display_name', 196, 'en', 'Id', '2020-05-19 18:19:53', '2020-05-19 18:19:53'),
(719, 'data_rows', 'display_name', 197, 'en', 'Назва', '2020-05-19 18:19:53', '2020-05-19 18:19:53'),
(720, 'data_rows', 'display_name', 198, 'en', 'Опис', '2020-05-19 18:19:53', '2020-05-19 18:19:53'),
(721, 'data_rows', 'display_name', 199, 'en', 'Бал', '2020-05-19 18:19:53', '2020-05-19 18:19:53'),
(722, 'data_rows', 'display_name', 200, 'en', 'Rating Item Group Id', '2020-05-19 18:19:53', '2020-05-19 18:19:53'),
(723, 'data_rows', 'display_name', 201, 'en', 'Створено', '2020-05-19 18:19:53', '2020-05-19 18:19:53'),
(724, 'data_rows', 'display_name', 202, 'en', 'Updated At', '2020-05-19 18:19:53', '2020-05-19 18:19:53'),
(725, 'data_rows', 'display_name', 210, 'en', 'rating_item_groups', '2020-05-19 18:19:53', '2020-05-19 18:19:53'),
(726, 'data_types', 'display_name_singular', 28, 'en', 'Пункт рейтингу', '2020-05-19 18:19:53', '2020-05-19 18:19:53'),
(727, 'data_types', 'display_name_plural', 28, 'en', 'Пункти рейтингу', '2020-05-19 18:19:53', '2020-05-19 18:19:53'),
(728, 'data_rows', 'display_name', 211, 'en', 'rating_items', '2020-05-19 18:35:13', '2020-05-19 18:35:13'),
(729, 'data_rows', 'display_name', 212, 'en', 'Порядковий номер', '2020-05-19 18:40:42', '2020-05-19 18:40:42'),
(730, 'data_rows', 'display_name', 213, 'en', 'Порядковий номер', '2020-05-19 18:41:09', '2020-05-19 18:41:09'),
(731, 'data_rows', 'display_name', 214, 'en', 'users', '2020-05-20 16:13:09', '2020-05-20 16:13:09'),
(732, 'people_infos', 'name', 2, 'en', 'Литвинчук Владислав', '2020-05-20 16:14:35', '2020-05-20 16:14:35'),
(733, 'people_infos', 'description', 2, 'en', '<p>Студент спеціальності \"Комп\'ютерні науки\" 2020 року випуску. SQL / C# / JS deweloper в компанії SalesUp. Розробник Creatio (BPMonline) систем.</p>', '2020-05-20 16:14:35', '2020-05-20 16:14:35'),
(734, 'rating_item_groups', 'name', 1, 'en', '1. Студентська організація (СО)', '2020-05-23 14:20:52', '2020-05-23 14:20:52'),
(735, 'rating_item_groups', 'name', 5, 'en', '1.4. Соціальна робота', '2020-05-23 14:21:55', '2020-05-23 14:21:55'),
(736, 'rating_items', 'name', 5, 'en', 'Голови СО на факультеті (ННІ)', '2020-05-23 14:22:42', '2020-05-23 14:22:42'),
(737, 'rating_items', 'name', 3, 'en', 'Голова СО Університету', '2020-05-23 14:22:50', '2020-05-23 14:22:50'),
(738, 'rating_items', 'name', 4, 'en', 'Заступники голови СО Університету', '2020-05-23 14:22:57', '2020-05-23 14:22:57'),
(739, 'rating_items', 'name', 6, 'en', 'Члени Вченої ради Університету ', '2020-05-23 14:23:15', '2020-05-23 14:23:15'),
(740, 'rating_items', 'name', 7, 'en', 'Заступник голови СР Гуртожитку', '2020-05-23 14:23:54', '2020-05-23 14:23:54'),
(741, 'rating_items', 'name', 2, 'en', 'Голови СР гуртожитків', '2020-05-23 14:24:01', '2020-05-23 14:24:01'),
(742, 'rating_items', 'name', 1, 'en', 'Голова об’єднаної студентської ради гуртожитків', '2020-05-23 14:24:08', '2020-05-23 14:24:08'),
(743, 'rating_items', 'name', 8, 'en', '1. Голова профбюро факультету (ННІ)', '2020-05-23 14:25:28', '2020-05-23 14:25:28'),
(744, 'rating_items', 'name', 9, 'en', '1. Членство у волонтерському зареєстрованому об\'єднанні', '2020-05-23 14:26:03', '2020-05-23 14:26:03'),
(745, 'rating_items', 'name', 10, 'en', '2. Курсант автошколи НУБіП України', '2020-05-23 14:26:27', '2020-05-23 14:26:27'),
(746, 'rating_items', 'name', 11, 'en', '1. Переможці і призери міжнародних олімпіад', '2020-05-23 14:29:39', '2020-05-23 14:29:39'),
(747, 'rating_items', 'name', 12, 'en', '2. Переможці II етапу Всеукраїнських студентських олімпіад (1 місце)', '2020-05-23 14:29:54', '2020-05-23 14:29:54'),
(748, 'rating_items', 'name', 13, 'en', '2.1. Переможці II етапу Всеукраїнських студентських олімпіад (2 місце)', '2020-05-23 14:30:17', '2020-05-23 14:30:17'),
(749, 'rating_items', 'name', 14, 'en', '2.2. Переможці II етапу Всеукраїнських студентських олімпіад (3 місце) ', '2020-05-23 14:30:33', '2020-05-23 14:30:33'),
(750, 'rating_items', 'name', 15, 'en', '1. Виступ на конференціях що проходять за межами території України (на іноземній мові) ', '2020-05-23 14:31:35', '2020-05-23 14:31:35'),
(751, 'rating_items', 'name', 16, 'en', '2. Виступ на конференціях, що проходять в Україні', '2020-05-23 14:32:14', '2020-05-23 14:32:14'),
(752, 'rating_items', 'name', 17, 'en', '3. Виступ на конференціях на рівні Університету', '2020-05-23 14:32:28', '2020-05-23 14:32:28'),
(753, 'data_rows', 'display_name', 16, 'en', 'ID', '2020-05-24 08:31:10', '2020-05-24 08:31:10'),
(754, 'data_rows', 'display_name', 17, 'en', 'Name', '2020-05-24 08:31:10', '2020-05-24 08:31:10'),
(755, 'data_rows', 'display_name', 20, 'en', 'Display Name', '2020-05-24 08:31:10', '2020-05-24 08:31:10'),
(756, 'data_rows', 'display_name', 18, 'en', 'Created At', '2020-05-24 08:31:10', '2020-05-24 08:31:10'),
(757, 'data_rows', 'display_name', 19, 'en', 'Updated At', '2020-05-24 08:31:10', '2020-05-24 08:31:10'),
(758, 'data_types', 'display_name_singular', 3, 'en', 'Role', '2020-05-24 08:31:10', '2020-05-24 08:31:10'),
(759, 'data_types', 'display_name_plural', 3, 'en', 'Roles', '2020-05-24 08:31:10', '2020-05-24 08:31:10'),
(760, 'data_rows', 'display_name', 215, 'en', 'Id', '2020-05-24 09:44:47', '2020-05-24 09:44:47'),
(761, 'data_rows', 'display_name', 216, 'en', 'Назва', '2020-05-24 09:44:47', '2020-05-24 09:44:47'),
(762, 'data_rows', 'display_name', 217, 'en', 'Рік вступу', '2020-05-24 09:44:47', '2020-05-24 09:44:47'),
(763, 'data_rows', 'display_name', 218, 'en', 'Starosta Id', '2020-05-24 09:44:47', '2020-05-24 09:44:47'),
(764, 'data_rows', 'display_name', 219, 'en', 'Education Program Id', '2020-05-24 09:44:47', '2020-05-24 09:44:47'),
(765, 'data_rows', 'display_name', 220, 'en', 'Created At', '2020-05-24 09:44:47', '2020-05-24 09:44:47'),
(766, 'data_rows', 'display_name', 221, 'en', 'Updated At', '2020-05-24 09:44:47', '2020-05-24 09:44:47'),
(767, 'data_types', 'display_name_singular', 30, 'en', 'Навчальна група', '2020-05-24 09:44:47', '2020-05-24 09:44:47'),
(768, 'data_types', 'display_name_plural', 30, 'en', 'Навчальні групи', '2020-05-24 09:44:47', '2020-05-24 09:44:47'),
(769, 'data_rows', 'display_name', 222, 'en', 'users', '2020-05-24 09:47:11', '2020-05-24 09:47:11'),
(770, 'data_rows', 'display_name', 223, 'en', 'education_programs', '2020-05-24 09:47:11', '2020-05-24 09:47:11'),
(771, 'menu_items', 'title', 65, 'en', 'Навчальні групи', '2020-05-24 09:47:39', '2020-05-24 09:47:39'),
(772, 'data_rows', 'display_name', 224, 'en', 'Id', '2020-05-24 09:57:21', '2020-05-24 09:57:21'),
(773, 'data_rows', 'display_name', 225, 'en', 'Дата', '2020-05-24 09:57:21', '2020-05-24 09:57:21'),
(774, 'data_rows', 'display_name', 226, 'en', 'Статус', '2020-05-24 09:57:21', '2020-05-24 09:57:21'),
(775, 'data_rows', 'display_name', 227, 'en', 'Rating Item Id', '2020-05-24 09:57:21', '2020-05-24 09:57:21'),
(776, 'data_rows', 'display_name', 228, 'en', 'User Id', '2020-05-24 09:57:21', '2020-05-24 09:57:21'),
(777, 'data_rows', 'display_name', 229, 'en', 'Створено', '2020-05-24 09:57:21', '2020-05-24 09:57:21'),
(778, 'data_rows', 'display_name', 230, 'en', 'Змінено', '2020-05-24 09:57:21', '2020-05-24 09:57:21'),
(779, 'data_rows', 'display_name', 231, 'en', 'Назва', '2020-05-24 09:57:21', '2020-05-24 09:57:21'),
(780, 'data_rows', 'display_name', 232, 'en', 'Коментар', '2020-05-24 09:57:21', '2020-05-24 09:57:21'),
(781, 'data_rows', 'display_name', 233, 'en', 'rating_items', '2020-05-24 09:57:21', '2020-05-24 09:57:21'),
(782, 'data_rows', 'display_name', 234, 'en', 'users', '2020-05-24 09:57:21', '2020-05-24 09:57:21'),
(783, 'data_types', 'display_name_singular', 31, 'en', 'Рейтинг студента', '2020-05-24 09:57:21', '2020-05-24 09:57:21'),
(784, 'data_types', 'display_name_plural', 31, 'en', 'Рейтинг студентів', '2020-05-24 09:57:21', '2020-05-24 09:57:21'),
(785, 'people_infos', 'name', 3, 'en', 'Чубар Людмила', '2020-05-24 16:19:21', '2020-05-24 16:19:21'),
(786, 'people_infos', 'description', 3, 'en', '<p>Студентка спеціальності \"Комп\'ютерні науки\" 2020 року випуску. Web developer в компанції CF digital</p>', '2020-05-24 16:19:21', '2020-05-24 16:19:21'),
(787, 'rating_items', 'name', 18, 'en', 'Участь у мистецьких заходах на рівні університету', '2020-05-24 16:32:36', '2020-05-24 16:32:36'),
(788, 'rating_items', 'name', 19, 'en', 'Участь у мистецьких заходах на рівні факультету (ННІ)', '2020-05-24 16:33:08', '2020-05-24 16:33:08'),
(789, 'rating_items', 'name', 20, 'en', '10. Участь у мистецьких заходах на рівні гуртожитку', '2020-05-24 16:33:43', '2020-05-24 16:33:43'),
(790, 'rating_items', 'name', 21, 'en', '11. Написання статті на сайт Університету у публіцистичному стилі', '2020-05-24 16:34:06', '2020-05-24 16:34:06'),
(791, 'rating_items', 'name', 22, 'en', '3. Учасник збірної команди Чемпіонату гумору Університету', '2020-05-24 16:34:43', '2020-05-24 16:34:43'),
(792, 'rating_items', 'name', 23, 'en', '4. Учасник збірної команди Чемпіонату гумору факультету (ННІ)', '2020-05-24 16:34:56', '2020-05-24 16:34:56'),
(793, 'data_rows', 'display_name', 235, 'en', 'Id', '2020-05-25 13:25:33', '2020-05-25 13:25:33'),
(794, 'data_rows', 'display_name', 236, 'en', 'Назва', '2020-05-25 13:25:33', '2020-05-25 13:25:33'),
(795, 'data_rows', 'display_name', 237, 'en', 'Створено', '2020-05-25 13:25:33', '2020-05-25 13:25:33'),
(796, 'data_rows', 'display_name', 238, 'en', 'Updated At', '2020-05-25 13:25:33', '2020-05-25 13:25:33'),
(797, 'data_types', 'display_name_singular', 32, 'en', 'Факультут', '2020-05-25 13:25:33', '2020-05-25 13:25:33'),
(798, 'data_types', 'display_name_plural', 32, 'en', 'Факультети', '2020-05-25 13:25:33', '2020-05-25 13:25:33');
INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(799, 'menu_items', 'title', 67, 'en', 'Факультети', '2020-05-25 13:25:48', '2020-05-25 13:25:48'),
(800, 'menu_items', 'title', 68, 'en', 'Типи аудиторій', '2020-05-25 13:29:05', '2020-05-25 13:29:05'),
(801, 'data_rows', 'display_name', 248, 'en', 'Id', '2020-05-25 13:32:05', '2020-05-25 13:32:05'),
(802, 'data_rows', 'display_name', 249, 'en', 'Назва', '2020-05-25 13:32:05', '2020-05-25 13:32:05'),
(803, 'data_rows', 'display_name', 250, 'en', 'Номер', '2020-05-25 13:32:05', '2020-05-25 13:32:05'),
(804, 'data_rows', 'display_name', 251, 'en', 'Faculty Owner Id', '2020-05-25 13:32:05', '2020-05-25 13:32:05'),
(805, 'data_rows', 'display_name', 252, 'en', 'faculties', '2020-05-25 13:32:05', '2020-05-25 13:32:05'),
(806, 'data_types', 'display_name_singular', 36, 'en', 'Корпус', '2020-05-25 13:32:05', '2020-05-25 13:32:05'),
(807, 'data_types', 'display_name_plural', 36, 'en', 'Корпуси', '2020-05-25 13:32:05', '2020-05-25 13:32:05'),
(808, 'data_rows', 'display_name', 245, 'en', 'Id', '2020-05-25 13:33:29', '2020-05-25 13:33:29'),
(809, 'data_rows', 'display_name', 246, 'en', 'Назва', '2020-05-25 13:33:29', '2020-05-25 13:33:29'),
(810, 'data_rows', 'display_name', 247, 'en', 'Порядковий номер', '2020-05-25 13:33:29', '2020-05-25 13:33:29'),
(811, 'data_types', 'display_name_singular', 35, 'en', 'День', '2020-05-25 13:33:30', '2020-05-25 13:33:30'),
(812, 'data_types', 'display_name_plural', 35, 'en', 'Дні', '2020-05-25 13:33:30', '2020-05-25 13:33:30'),
(813, 'data_rows', 'display_name', 253, 'en', 'Id', '2020-05-25 13:35:15', '2020-05-25 13:35:15'),
(814, 'data_rows', 'display_name', 254, 'en', 'Назва', '2020-05-25 13:35:15', '2020-05-25 13:35:15'),
(815, 'data_rows', 'display_name', 255, 'en', 'Номер', '2020-05-25 13:35:15', '2020-05-25 13:35:15'),
(816, 'data_rows', 'display_name', 256, 'en', 'Audience Type Id', '2020-05-25 13:35:15', '2020-05-25 13:35:15'),
(817, 'data_rows', 'display_name', 257, 'en', 'Building Id', '2020-05-25 13:35:15', '2020-05-25 13:35:15'),
(818, 'data_rows', 'display_name', 258, 'en', 'Створено', '2020-05-25 13:35:15', '2020-05-25 13:35:15'),
(819, 'data_rows', 'display_name', 259, 'en', 'Updated At', '2020-05-25 13:35:15', '2020-05-25 13:35:15'),
(820, 'data_rows', 'display_name', 260, 'en', 'buildings', '2020-05-25 13:35:15', '2020-05-25 13:35:15'),
(821, 'data_types', 'display_name_singular', 37, 'en', 'Аудиторія', '2020-05-25 13:35:15', '2020-05-25 13:35:15'),
(822, 'data_types', 'display_name_plural', 37, 'en', 'Аудиторії', '2020-05-25 13:35:15', '2020-05-25 13:35:15'),
(823, 'data_rows', 'display_name', 261, 'en', 'audience_types', '2020-05-25 13:36:17', '2020-05-25 13:36:17'),
(824, 'data_rows', 'display_name', 262, 'en', 'Id', '2020-05-25 13:51:51', '2020-05-25 13:51:51'),
(825, 'data_rows', 'display_name', 263, 'en', 'Назва', '2020-05-25 13:51:51', '2020-05-25 13:51:51'),
(826, 'data_rows', 'display_name', 264, 'en', 'Номер', '2020-05-25 13:51:51', '2020-05-25 13:51:51'),
(827, 'data_rows', 'display_name', 265, 'en', 'Частота', '2020-05-25 13:51:51', '2020-05-25 13:51:51'),
(828, 'data_rows', 'display_name', 266, 'en', 'Day Id', '2020-05-25 13:51:51', '2020-05-25 13:51:51'),
(829, 'data_rows', 'display_name', 267, 'en', 'Discipline Id', '2020-05-25 13:51:51', '2020-05-25 13:51:51'),
(830, 'data_rows', 'display_name', 268, 'en', 'Audience Id', '2020-05-25 13:51:51', '2020-05-25 13:51:51'),
(831, 'data_rows', 'display_name', 269, 'en', 'Lesson Type Id', '2020-05-25 13:51:51', '2020-05-25 13:51:51'),
(832, 'data_rows', 'display_name', 270, 'en', 'Period Id', '2020-05-25 13:51:51', '2020-05-25 13:51:51'),
(833, 'data_rows', 'display_name', 271, 'en', 'Створено', '2020-05-25 13:51:51', '2020-05-25 13:51:51'),
(834, 'data_rows', 'display_name', 272, 'en', 'Updated At', '2020-05-25 13:51:51', '2020-05-25 13:51:51'),
(835, 'data_types', 'display_name_singular', 38, 'en', 'Заняття', '2020-05-25 13:51:51', '2020-05-25 13:51:51'),
(836, 'data_types', 'display_name_plural', 38, 'en', 'Заняття', '2020-05-25 13:51:51', '2020-05-25 13:51:51'),
(837, 'menu_items', 'title', 73, 'en', 'Заняття', '2020-05-25 13:52:05', '2020-05-25 13:52:05'),
(838, 'data_rows', 'display_name', 273, 'en', 'days', '2020-05-25 13:59:13', '2020-05-25 13:59:13'),
(839, 'data_rows', 'display_name', 275, 'en', 'disciplines', '2020-05-25 13:59:13', '2020-05-25 13:59:13'),
(840, 'data_rows', 'display_name', 274, 'en', 'audiences', '2020-05-25 13:59:13', '2020-05-25 13:59:13'),
(841, 'data_rows', 'display_name', 276, 'en', 'lesson_types', '2020-05-25 13:59:13', '2020-05-25 13:59:13'),
(842, 'data_rows', 'display_name', 277, 'en', 'periods', '2020-05-25 13:59:13', '2020-05-25 13:59:13'),
(843, 'data_rows', 'display_name', 278, 'en', 'groups', '2020-05-25 14:05:25', '2020-05-25 14:05:25'),
(844, 'data_rows', 'display_name', 279, 'en', 'users', '2020-05-25 14:05:25', '2020-05-25 14:05:25'),
(845, 'data_rows', 'display_name', 239, 'en', 'Id', '2020-05-25 14:07:19', '2020-05-25 14:07:19'),
(846, 'data_rows', 'display_name', 240, 'en', 'Назва', '2020-05-25 14:07:19', '2020-05-25 14:07:19'),
(847, 'data_rows', 'display_name', 241, 'en', 'Опис', '2020-05-25 14:07:19', '2020-05-25 14:07:19'),
(848, 'data_rows', 'display_name', 280, 'en', 'lesson_types', '2020-05-25 14:07:19', '2020-05-25 14:07:19'),
(849, 'data_types', 'display_name_singular', 33, 'en', 'Тип аудиторії', '2020-05-25 14:07:19', '2020-05-25 14:07:19'),
(850, 'data_types', 'display_name_plural', 33, 'en', 'Типи аудиторій', '2020-05-25 14:07:19', '2020-05-25 14:07:19'),
(851, 'data_rows', 'display_name', 242, 'en', 'Id', '2020-05-25 14:08:41', '2020-05-25 14:08:41'),
(852, 'data_rows', 'display_name', 243, 'en', 'Назва', '2020-05-25 14:08:41', '2020-05-25 14:08:41'),
(853, 'data_rows', 'display_name', 244, 'en', 'Опис', '2020-05-25 14:08:41', '2020-05-25 14:08:41'),
(854, 'data_rows', 'display_name', 281, 'en', 'audience_types', '2020-05-25 14:08:41', '2020-05-25 14:08:41'),
(855, 'data_types', 'display_name_singular', 34, 'en', 'Тип заняття', '2020-05-25 14:08:41', '2020-05-25 14:08:41'),
(856, 'data_types', 'display_name_plural', 34, 'en', 'Типи занять', '2020-05-25 14:08:41', '2020-05-25 14:08:41'),
(857, 'days', 'name', 1, 'en', 'Monday', '2020-05-25 14:25:20', '2020-05-25 14:25:20'),
(858, 'days', 'name', 2, 'en', 'Tuesday', '2020-05-25 14:25:32', '2020-05-25 14:25:32'),
(859, 'days', 'name', 3, 'en', 'Wednesday', '2020-05-25 14:25:43', '2020-05-25 14:25:43'),
(860, 'days', 'name', 4, 'en', 'Thursday', '2020-05-25 14:25:56', '2020-05-25 14:25:56'),
(861, 'days', 'name', 5, 'en', 'Friday', '2020-05-25 14:26:09', '2020-05-25 14:26:09'),
(862, 'days', 'name', 6, 'en', 'Saturday', '2020-05-25 14:26:22', '2020-05-25 14:26:22');

-- --------------------------------------------------------

--
-- Структура таблиці `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `credit_note_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `birthday`, `group_id`, `credit_note_number`) VALUES
(1, 1, 'Vladislav Administrator', 'vlad_litvinchyk@ukr.net', 'users\\April2020\\8za12oMmhve0ZZdvS5tk.png', NULL, '$2y$10$ttRNN0T8K06nuknV.SxDjuAUgD8swUVzgFwNgnYSBqm0v27trRejy', 'ibcm1qIKF5DlUmlLwmHAsvL7hKcjDpYgxn6fL1hXXuSbTOHgccGKPvLVHW8E', '{\"locale\":\"uk\"}', '2019-09-04 03:26:31', '2020-05-24 14:35:15', NULL, NULL, NULL),
(4, 2, 'Lytvynchuk Vladyslav Grygorovuch', 'vlad.litvinchyk@gmail.com', 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$NHOhIpVaiWEvGgO6p3t0EOl/ZnZNfXrQcqFIi7kla3ChCGg2UvejG', NULL, NULL, '2020-03-11 19:40:28', '2020-03-11 19:40:28', NULL, NULL, NULL),
(5, 5, 'Contenter', 'contenter@gmail.com', 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$jcDPBel38TuntpzYhdFnhuJL2Gy5G.ZREp9hOmXRidayLCROIPm3e', NULL, '{\"locale\":\"uk\"}', '2020-05-18 16:51:59', '2020-05-18 16:51:59', NULL, NULL, NULL),
(12, 3, 'Бабуркин Володимир Сергійович', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$HYCAfeCqnp0bgeJcewXYTOfE8V5iDyW5KvaqQ39iN5XBDkwAu36zi', NULL, NULL, '2020-05-24 14:08:41', '2020-05-24 14:08:41', '1998-10-20', 37, '16518'),
(13, 3, 'Гаврилюк Вікторія Ігорівна', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$EwcB3/LUQZ4JlLJcUBcZM.kq31.Vo3e563eT9CR73yBGkod1IRgRS', NULL, NULL, '2020-05-24 14:08:41', '2020-05-24 14:08:41', '1999-06-27', 37, '16428'),
(14, 3, 'Демеркова Анастасія Андріївна', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$C/99LJxEa/3tPuh2A6zFQuK14Y00qPZEkTvpDDd3hLJMA6pyqq0E.', NULL, NULL, '2020-05-24 14:08:41', '2020-05-24 14:08:41', '1999-09-15', 37, '16781'),
(15, 3, 'Заболотний Василь Васильович', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$q9NWhSYrhwsCJjEk1aiJNOAvzaDDuXveECGjSdAamOOXmJwumerJC', NULL, NULL, '2020-05-24 14:08:41', '2020-05-24 14:08:41', '1999-11-10', 37, '16627'),
(16, 3, 'Зібцева Ірина Сергіївна', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$kEt9YtjPE0OZ/45wmxjRW.V6OVRw1RncI54uZsQHglOze4hgiaE5S', NULL, NULL, '2020-05-24 14:08:41', '2020-05-24 14:08:41', '1998-10-29', 37, '16278'),
(17, 3, 'Іщук Юлія Олегівна', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$IiunrHZnsIssgJOS1SCkHe6KhDUxnzLuT1F.X8xqlYIi7qqu1IJtu', NULL, NULL, '2020-05-24 14:08:41', '2020-05-24 14:08:41', '1999-06-24', 37, '16233'),
(18, 3, 'Кантур Вікторія Олександрівна', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$Ut.WlQSqcUr9.gUsJLNY6eQJo1U.ydNCGoKS96AM0Hk64FgT/wRty', NULL, NULL, '2020-05-24 14:10:31', '2020-05-24 14:10:31', '1999-08-14', 37, '16508'),
(19, 3, 'Кармазіновська Дар\'я Валеріївна', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$BLixmSEtG5YAUgYwSTc2Lex9uQqPgh7fbgBPhHNFHMYz.N7WXdQea', NULL, NULL, '2020-05-24 14:17:43', '2020-05-24 14:17:43', '1998-05-13', 37, '16174'),
(20, 3, 'Кузнецов Віталій Валерійович', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$7P2Hzm1tVZVZkwi455gR7.hVpMIsxrg2dTWDnMSBpyGvHHzruxdem', NULL, NULL, '2020-05-24 14:29:11', '2020-05-24 14:29:11', '1999-05-23', 37, '16741'),
(22, 3, 'Литвинчук Владислав Григорович', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$LAKZOPGpzyYuL2Dt8GdSbObNbStrPw.OlmM0xoAY5O7H2NMb4RMgq', NULL, NULL, '2020-05-24 14:34:09', '2020-05-24 14:34:09', '1999-08-22', 37, '16266'),
(23, 3, 'Недбайло Дмитро Андрійович', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$KkHy93ao.ztodO2Ke1tV0OSY5vxKFxfB7Y9bgTioALRiolVUwovuC', NULL, '{\"locale\":\"uk\"}', '2020-05-24 14:34:09', '2020-05-24 16:44:52', '1998-12-03', 37, '16298'),
(24, 3, 'Осіпов Аркадій Олександрович', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$QDumB1Kcyd6OR1HeMXmM5OMPg8PM7Tll/yJMH5wFuiF/eOO0mdH5i', NULL, NULL, '2020-05-24 14:34:09', '2020-05-24 14:34:09', '1999-11-24', 37, '13107'),
(25, 3, 'Сологуб Василь Олексійович', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$Y48AVla9W7OlZJgsSW337OAGld2WPalFvQEEBwvNJqQlnRFeddmpq', NULL, NULL, '2020-05-24 14:34:09', '2020-05-24 14:34:09', '1999-02-27', 37, '16481'),
(26, 3, 'Трішніков Роман Андрійович', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$42ag8fe5j1LJ29vMAUXOQO2Cz9kGjuBtzWGlK9aJMwBdN5Lw8b4lu', NULL, NULL, '2020-05-24 14:34:09', '2020-05-24 14:34:09', '1999-08-06', 37, '16062'),
(27, 3, 'Шиян Олександр Олександрович', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$IoGrA9TxBz/sCbxfxPtJBu05DLwDwgMp6Gl9XhVvWlFJzz353JkYK', NULL, NULL, '2020-05-24 14:34:10', '2020-05-24 14:34:10', '1999-08-03', 37, '16740'),
(28, 3, 'Демченко Станіслав Костянтинович', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$Bh.P3IYljFWIGR1zcHFlXuPyXklirfKLce8GY2lNkcdpWSjeRcDq.', NULL, NULL, '2020-05-24 14:34:10', '2020-05-24 14:34:10', '1995-04-21', 37, '14601'),
(29, 3, 'Березанський Максим Олександрович', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$/jO3UgyD6ob/egtWg5V8tOeTABO.TDBwCmDoi9uaEPPOd5DCi.zCS', NULL, NULL, '2020-05-24 14:35:47', '2020-05-24 14:35:47', '1998-11-16', 36, '16277'),
(30, 3, 'Бойко Іван Павлович', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$s82TiGJqEBbon7SfLHFxNO/btBysoS6LywQXpTGHkZTy.leLNowEu', NULL, NULL, '2020-05-24 14:35:47', '2020-05-24 14:35:47', '1999-03-23', 36, '16218'),
(31, 3, 'Єфіменко Єфим Олегович', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$VbeNY/YjrFbXdB.hcUx7d.wkcMWF/ObAO7wRCfB30/4fPpOb/mgPW', NULL, NULL, '2020-05-24 14:35:47', '2020-05-24 14:35:47', '1999-09-26', 36, '16314'),
(32, 3, 'Зима Анна Володимирівна', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$5fKzVRyaOnAw4VbjzAI07e8tQvHX1XShUw2GTz0LJHX.4HVMT7oU2', NULL, NULL, '2020-05-24 14:35:47', '2020-05-24 14:35:47', '1999-05-29', 36, '16344'),
(33, 3, 'Калініченко Євгеній Олексійович', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$fYylsL0sTF8e0lsjjZrVd.isVlBCqIrABR06plVltI4jAck/QuAW.', NULL, NULL, '2020-05-24 14:35:47', '2020-05-24 14:35:47', '1998-10-20', 36, '16161'),
(34, 3, 'Лободенко Варвара Олегівна', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$77CV3dUzMNOoloVks4NEzOnDwnwHvxRIuOzd/0Ya8Hn3dTIfYwGue', NULL, NULL, '2020-05-24 14:35:47', '2020-05-24 14:35:47', '1996-07-27', 36, '16843'),
(35, 3, 'Лукашенко Богдан Юрійович', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$lR65VJXBfHxAA2n6JnujnuRMigGb.L0f4cV3bDFw9N9y0LeNxy9B.', NULL, NULL, '2020-05-24 14:35:47', '2020-05-24 14:35:47', '1998-09-05', 36, '16438'),
(36, 3, 'Олійник Микола Михайлович', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$7r2cqk4jLk1vAfinMkO44O9Jc9F7ddiWi3ZZpwczN/xxbNkBWq4KW', NULL, NULL, '2020-05-24 14:35:48', '2020-05-24 14:35:48', '1999-05-22', 36, '16598'),
(37, 3, 'Пронішина Катерина Олександрівна', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$O98/LcGSkYDQ2tusPCwu2OvycKZNGeGlPq9oyK0qs9tVi1YIdyXUC', NULL, '{\"locale\":\"uk\"}', '2020-05-24 14:35:48', '2020-05-24 16:45:06', '1999-08-25', 36, '16770'),
(38, 3, 'Токарєв Дмитро Вікторович', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$3j3RYflQ9j4A0O2B49LaseuPILC6pbfqeBX6jkUUSmRtMwMAL.sky', NULL, NULL, '2020-05-24 14:35:48', '2020-05-24 14:35:48', '1999-05-25', 36, '16529'),
(39, 3, 'Чубар Людмила Іванівна', 'arriadnie@gmail.com', 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$kW5WRzK0ruMDNKG79ZjzO.17YdU2nDEzxEaS6BerYScSmrNWL4kKm', NULL, NULL, '2020-05-24 14:35:48', '2020-05-24 16:20:14', '1999-05-05', 36, '16253'),
(40, 3, 'Якимов Олексій Сергійович', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$A41b5V82GIqA3HbBb0clH.KUAZ2iepZ02.T2ut3XdEVT4JvLU/mYm', NULL, NULL, '2020-05-24 14:35:48', '2020-05-24 14:35:48', '1999-09-26', 36, '16230'),
(41, 3, 'Яровенко Іван Андрійович', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$bVouVTLx1G55zbBhQqcaiOqgBVkosfwQwYGd1qo.ofQ5cGAopEGwa', NULL, NULL, '2020-05-24 14:35:48', '2020-05-24 14:35:48', '1999-06-30', 36, '16191'),
(42, 3, 'Кемажу Чиканту Тьєрі -', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$OhB7N3mEBhOh9ndb5NHjUueXElrn4KRBwbhN6d9wDTAyqt.6GYlCi', NULL, NULL, '2020-05-24 14:35:48', '2020-05-24 14:35:48', '1991-11-09', 36, '18013'),
(43, 3, 'Новіков Євген Тарасович', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$iiDf30WkA4JHJjrx5GKI5eeJbvuhOoOXfuVlGnxzQY5a8aMXMRSG6', NULL, NULL, '2020-05-24 14:35:49', '2020-05-24 14:35:49', '1995-05-25', 36, 'КН-19004б(к)'),
(44, 3, 'Кучук Дмитро Павлович', NULL, 'settings\\May2020\\I7qsKc27YDoA3uX2WY7k.jpg', NULL, '$2y$10$yocUlTUTrfW45cOMmi4MKeTtxhZkYQM6iSQlossWAaIkDRUjC/KoW', NULL, NULL, '2020-05-24 14:37:54', '2020-05-24 14:37:54', NULL, 36, '18002б');

-- --------------------------------------------------------

--
-- Структура таблиці `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_shown` tinyint(1) NOT NULL DEFAULT 0,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `record_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `user_rating_items`
--

CREATE TABLE `user_rating_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `status` enum('IN_PROCESS','EDITED','REJECTED','CONFIRMED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'IN_PROCESS',
  `rating_item_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `user_rating_items`
--

INSERT INTO `user_rating_items` (`id`, `date`, `status`, `rating_item_id`, `user_id`, `created_at`, `updated_at`, `name`, `comment`) VALUES
(1, '2020-05-31', 'CONFIRMED', 1, 1, '2020-05-20 18:54:25', '2020-05-20 18:54:25', 'Голова СР гуртожитку 2 семестр', ''),
(2, '2019-12-17', 'IN_PROCESS', 3, 1, '2020-05-21 16:19:51', '2020-05-22 20:54:43', 'sdsf', ''),
(4, '2020-04-28', 'IN_PROCESS', 3, 1, '2020-05-21 16:23:10', '2020-05-24 09:15:42', 'dik', ''),
(5, '2020-04-27', 'IN_PROCESS', 2, 1, '2020-05-21 16:59:13', '2020-05-22 20:18:08', 'Голова СР гуртожитку 2 семестр', ''),
(6, '2020-05-31', 'CONFIRMED', 4, 1, '2020-05-21 17:00:17', '2020-05-22 20:40:12', 'Владислав Литвинчукnsdf', ''),
(7, '2020-05-07', 'CONFIRMED', 4, 1, '2020-05-21 17:01:22', '2020-05-22 20:51:59', 'gr', ''),
(8, '2020-06-11', 'IN_PROCESS', 4, 1, '2020-05-22 20:45:35', '2020-05-22 20:45:51', 'Зам СО університету', ''),
(13, '2020-03-18', 'CONFIRMED', 13, 39, '2020-05-24 16:23:12', '2020-05-24 16:46:58', 'Олімпіада з програмування ICPC', NULL),
(14, '2020-05-06', 'CONFIRMED', 20, 36, '2020-05-24 16:35:59', '2020-05-24 16:46:50', 'Участь у мистецькому заході на рівні гуртожитку )', NULL),
(15, '2020-04-05', 'CONFIRMED', 23, 40, '2020-05-24 16:38:53', '2020-05-24 16:46:54', 'Учасник збірної команди Чемпіонату гумору факультету', NULL),
(16, '2020-05-07', 'CONFIRMED', 21, 40, '2020-05-24 16:50:39', '2020-05-24 16:52:13', 'Написання статті про одиничку', NULL),
(17, '2020-05-19', 'CONFIRMED', 21, 40, '2020-05-24 16:51:03', '2020-05-24 16:52:09', 'Написання статті про двійку', NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(5, 5),
(23, 4),
(37, 4);

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `audiences`
--
ALTER TABLE `audiences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audiences_audience_type_id_foreign` (`audience_type_id`),
  ADD KEY `audiences_building_id_foreign` (`building_id`);

--
-- Індекси таблиці `audience_lesson_types`
--
ALTER TABLE `audience_lesson_types`
  ADD KEY `audience_lesson_types_audience_type_id_foreign` (`audience_type_id`),
  ADD KEY `audience_lesson_types_lesson_type_id_foreign` (`lesson_type_id`);

--
-- Індекси таблиці `audience_types`
--
ALTER TABLE `audience_types`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buildings_faculty_owner_id_foreign` (`faculty_owner_id`);

--
-- Індекси таблиці `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Індекси таблиці `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Індекси таблиці `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Індекси таблиці `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `disciplines`
--
ALTER TABLE `disciplines`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `education_degrees`
--
ALTER TABLE `education_degrees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `education_degrees_slug_unique` (`slug`);

--
-- Індекси таблиці `education_programs`
--
ALTER TABLE `education_programs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `education_programs_slug_unique` (`slug`),
  ADD KEY `education_programs_education_degree_id_foreign` (`education_degree_id`),
  ADD KEY `education_programs_education_specialty_id_foreign` (`education_specialty_id`);

--
-- Індекси таблиці `education_specialties`
--
ALTER TABLE `education_specialties`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `galleries_slug_unique` (`slug`);

--
-- Індекси таблиці `gallery_images`
--
ALTER TABLE `gallery_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gallery_images_gallery_id_foreign` (`gallery_id`);

--
-- Індекси таблиці `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groups_starosta_id_foreign` (`starosta_id`),
  ADD KEY `groups_education_program_id_foreign` (`education_program_id`);

--
-- Індекси таблиці `group_in_lessons`
--
ALTER TABLE `group_in_lessons`
  ADD KEY `group_in_lessons_group_id_foreign` (`group_id`),
  ADD KEY `group_in_lessons_lesson_id_foreign` (`lesson_id`);

--
-- Індекси таблиці `infoblocks`
--
ALTER TABLE `infoblocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `infoblocks_slug_unique` (`slug`),
  ADD KEY `infoblocks_type_id_foreign` (`type_id`);

--
-- Індекси таблиці `infoblock_items`
--
ALTER TABLE `infoblock_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `infoblock_items_infoblock_id_foreign` (`infoblock_id`);

--
-- Індекси таблиці `infoblock_types`
--
ALTER TABLE `infoblock_types`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `integration_logs`
--
ALTER TABLE `integration_logs`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_day_id_foreign` (`day_id`),
  ADD KEY `lessons_discipline_id_foreign` (`discipline_id`),
  ADD KEY `lessons_audience_id_foreign` (`audience_id`),
  ADD KEY `lessons_lesson_type_id_foreign` (`lesson_type_id`),
  ADD KEY `lessons_period_id_foreign` (`period_id`);

--
-- Індекси таблиці `lesson_types`
--
ALTER TABLE `lesson_types`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Індекси таблиці `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Індекси таблиці `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Індекси таблиці `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Індекси таблиці `people_infos`
--
ALTER TABLE `people_infos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `people_infos_slug_unique` (`slug`),
  ADD KEY `people_infos_user_id_foreign` (`user_id`);

--
-- Індекси таблиці `people_info_groups`
--
ALTER TABLE `people_info_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `people_info_groups_slug_unique` (`slug`);

--
-- Індекси таблиці `people_info_in_group`
--
ALTER TABLE `people_info_in_group`
  ADD KEY `people_info_in_group_people_info_id_foreign` (`people_info_id`),
  ADD KEY `people_info_in_group_people_info_group_id_foreign` (`people_info_group_id`);

--
-- Індекси таблиці `people_info_social_networks`
--
ALTER TABLE `people_info_social_networks`
  ADD KEY `people_info_social_networks_people_info_id_foreign` (`people_info_id`),
  ADD KEY `people_info_social_networks_social_network_id_foreign` (`social_network_id`);

--
-- Індекси таблиці `periods`
--
ALTER TABLE `periods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `periods_period_type_id_foreign` (`period_type_id`);

--
-- Індекси таблиці `period_types`
--
ALTER TABLE `period_types`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Індекси таблиці `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Індекси таблиці `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Індекси таблиці `professor_in_lessons`
--
ALTER TABLE `professor_in_lessons`
  ADD KEY `professor_in_lessons_professor_id_foreign` (`user_id`),
  ADD KEY `professor_in_lessons_lesson_id_foreign` (`lesson_id`);

--
-- Індекси таблиці `rating_items`
--
ALTER TABLE `rating_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rating_items_rating_item_group_id_foreign` (`rating_item_group_id`);

--
-- Індекси таблиці `rating_item_groups`
--
ALTER TABLE `rating_item_groups`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Індекси таблиці `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Індекси таблиці `social_networks`
--
ALTER TABLE `social_networks`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `sys_sync_meta_data`
--
ALTER TABLE `sys_sync_meta_data`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Індекси таблиці `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`),
  ADD KEY `users_group_id_foreign` (`group_id`);

--
-- Індекси таблиці `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_notifications_user_id_foreign` (`user_id`);

--
-- Індекси таблиці `user_rating_items`
--
ALTER TABLE `user_rating_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_rating_items_rating_item_id_foreign` (`rating_item_id`),
  ADD KEY `user_rating_items_user_id_foreign` (`user_id`);

--
-- Індекси таблиці `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `audiences`
--
ALTER TABLE `audiences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблиці `audience_types`
--
ALTER TABLE `audience_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `buildings`
--
ALTER TABLE `buildings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=282;

--
-- AUTO_INCREMENT для таблиці `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT для таблиці `days`
--
ALTER TABLE `days`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблиці `disciplines`
--
ALTER TABLE `disciplines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=344;

--
-- AUTO_INCREMENT для таблиці `education_degrees`
--
ALTER TABLE `education_degrees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `education_programs`
--
ALTER TABLE `education_programs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблиці `education_specialties`
--
ALTER TABLE `education_specialties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблиці `faculties`
--
ALTER TABLE `faculties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `gallery_images`
--
ALTER TABLE `gallery_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT для таблиці `infoblocks`
--
ALTER TABLE `infoblocks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблиці `infoblock_items`
--
ALTER TABLE `infoblock_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT для таблиці `infoblock_types`
--
ALTER TABLE `infoblock_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблиці `integration_logs`
--
ALTER TABLE `integration_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT для таблиці `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблиці `lesson_types`
--
ALTER TABLE `lesson_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT для таблиці `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT для таблиці `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблиці `people_infos`
--
ALTER TABLE `people_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `people_info_groups`
--
ALTER TABLE `people_info_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `periods`
--
ALTER TABLE `periods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблиці `period_types`
--
ALTER TABLE `period_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT для таблиці `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблиці `rating_items`
--
ALTER TABLE `rating_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблиці `rating_item_groups`
--
ALTER TABLE `rating_item_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблиці `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблиці `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT для таблиці `social_networks`
--
ALTER TABLE `social_networks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `sys_sync_meta_data`
--
ALTER TABLE `sys_sync_meta_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=485;

--
-- AUTO_INCREMENT для таблиці `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=863;

--
-- AUTO_INCREMENT для таблиці `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT для таблиці `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `user_rating_items`
--
ALTER TABLE `user_rating_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `audiences`
--
ALTER TABLE `audiences`
  ADD CONSTRAINT `audiences_audience_type_id_foreign` FOREIGN KEY (`audience_type_id`) REFERENCES `audience_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `audiences_building_id_foreign` FOREIGN KEY (`building_id`) REFERENCES `buildings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `audience_lesson_types`
--
ALTER TABLE `audience_lesson_types`
  ADD CONSTRAINT `audience_lesson_types_audience_type_id_foreign` FOREIGN KEY (`audience_type_id`) REFERENCES `audience_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `audience_lesson_types_lesson_type_id_foreign` FOREIGN KEY (`lesson_type_id`) REFERENCES `lesson_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `buildings`
--
ALTER TABLE `buildings`
  ADD CONSTRAINT `buildings_faculty_owner_id_foreign` FOREIGN KEY (`faculty_owner_id`) REFERENCES `faculties` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `education_programs`
--
ALTER TABLE `education_programs`
  ADD CONSTRAINT `education_programs_education_degree_id_foreign` FOREIGN KEY (`education_degree_id`) REFERENCES `education_degrees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `education_programs_education_specialty_id_foreign` FOREIGN KEY (`education_specialty_id`) REFERENCES `education_specialties` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `gallery_images`
--
ALTER TABLE `gallery_images`
  ADD CONSTRAINT `gallery_images_gallery_id_foreign` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_education_program_id_foreign` FOREIGN KEY (`education_program_id`) REFERENCES `education_programs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `groups_starosta_id_foreign` FOREIGN KEY (`starosta_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `group_in_lessons`
--
ALTER TABLE `group_in_lessons`
  ADD CONSTRAINT `group_in_lessons_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `group_in_lessons_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `infoblocks`
--
ALTER TABLE `infoblocks`
  ADD CONSTRAINT `infoblocks_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `infoblock_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `infoblock_items`
--
ALTER TABLE `infoblock_items`
  ADD CONSTRAINT `infoblock_items_infoblock_id_foreign` FOREIGN KEY (`infoblock_id`) REFERENCES `infoblocks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_audience_id_foreign` FOREIGN KEY (`audience_id`) REFERENCES `audiences` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lessons_day_id_foreign` FOREIGN KEY (`day_id`) REFERENCES `days` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lessons_discipline_id_foreign` FOREIGN KEY (`discipline_id`) REFERENCES `disciplines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lessons_lesson_type_id_foreign` FOREIGN KEY (`lesson_type_id`) REFERENCES `lesson_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `lessons_period_id_foreign` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `people_infos`
--
ALTER TABLE `people_infos`
  ADD CONSTRAINT `people_infos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `people_info_in_group`
--
ALTER TABLE `people_info_in_group`
  ADD CONSTRAINT `people_info_in_group_people_info_group_id_foreign` FOREIGN KEY (`people_info_group_id`) REFERENCES `people_info_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `people_info_in_group_people_info_id_foreign` FOREIGN KEY (`people_info_id`) REFERENCES `people_infos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `people_info_social_networks`
--
ALTER TABLE `people_info_social_networks`
  ADD CONSTRAINT `people_info_social_networks_people_info_id_foreign` FOREIGN KEY (`people_info_id`) REFERENCES `people_infos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `people_info_social_networks_social_network_id_foreign` FOREIGN KEY (`social_network_id`) REFERENCES `social_networks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `periods`
--
ALTER TABLE `periods`
  ADD CONSTRAINT `periods_period_type_id_foreign` FOREIGN KEY (`period_type_id`) REFERENCES `period_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `professor_in_lessons`
--
ALTER TABLE `professor_in_lessons`
  ADD CONSTRAINT `professor_in_lessons_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `professor_in_lessons_professor_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `rating_items`
--
ALTER TABLE `rating_items`
  ADD CONSTRAINT `rating_items_rating_item_group_id_foreign` FOREIGN KEY (`rating_item_group_id`) REFERENCES `rating_item_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD CONSTRAINT `user_notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `user_rating_items`
--
ALTER TABLE `user_rating_items`
  ADD CONSTRAINT `user_rating_items_rating_item_id_foreign` FOREIGN KEY (`rating_item_id`) REFERENCES `rating_items` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `user_rating_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
