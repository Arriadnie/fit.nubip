-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Час створення: Трв 10 2020 р., 16:47
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
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
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
(88, 11, 'link', 'text', 'Link', 1, 1, 1, 1, 1, 1, '{}', 4),
(96, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(97, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(98, 11, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(99, 8, 'with_items', 'checkbox', 'With Items', 1, 1, 1, 1, 1, 0, '{}', 5),
(100, 8, 'with_item_parent', 'checkbox', 'With Item Parent', 1, 0, 1, 1, 1, 0, '{}', 6),
(101, 9, 'body', 'rich_text_box', 'Body', 0, 0, 1, 1, 1, 1, '{}', 7),
(102, 9, 'image', 'image', 'Image', 0, 0, 1, 1, 1, 0, '{}', 10),
(103, 10, 'parent_id', 'text', 'Parent Id', 0, 0, 0, 0, 0, 0, '{}', 12),
(104, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(105, 13, 'user_id', 'text', 'User Id', 0, 0, 0, 0, 0, 1, '{}', 2),
(106, 13, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(107, 13, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:people_infos,slug\"}}', 4),
(108, 13, 'phone', 'text', 'Phone', 0, 0, 1, 1, 1, 0, '{}', 5),
(109, 13, 'email', 'text', 'Email', 0, 0, 1, 1, 1, 0, '{}', 6),
(110, 13, 'position', 'text', 'Position', 0, 0, 1, 1, 1, 0, '{}', 7),
(111, 13, 'description', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 0, '{}', 8),
(112, 13, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 0, '{}', 9),
(113, 13, 'link', 'text', 'Link', 0, 0, 1, 1, 1, 0, '{}', 10),
(114, 13, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"CHANGED\",\"options\":{\"PUBLISHED\":\"PUBLISHED\",\"NOT_PUBLISHED\":\"NOT_PUBLISHED\",\"CHANGED\":\"CHANGED\"}}', 11),
(115, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 12),
(116, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(117, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(118, 14, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(119, 14, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"},\"validation\":{\"rule\":\"unique:galleries,slug\"}}', 3),
(120, 14, 'title', 'text', 'Title', 0, 0, 1, 1, 1, 0, '{}', 4),
(121, 14, 'sub_title', 'text', 'Sub Title', 0, 0, 1, 1, 1, 0, '{}', 5),
(122, 14, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(123, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(124, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(125, 15, 'gallery_id', 'text', 'Gallery Id', 1, 0, 1, 0, 0, 1, '{}', 2),
(126, 15, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 0, '{}', 3),
(127, 15, 'caption', 'text', 'Caption', 0, 1, 1, 1, 1, 0, '{}', 4),
(128, 15, 'order', 'text', 'Order', 1, 0, 0, 0, 0, 0, '{}', 5),
(129, 15, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 1, '{}', 6),
(130, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(131, 15, 'gallery_image_belongsto_gallery_relationship', 'relationship', 'Gallery', 0, 1, 1, 1, 1, 1, '{\"isItemsParent\":true,\"parentDataTypeSlug\":\"galleries\",\"model\":\"App\\\\Models\\\\Galleries\\\\Gallery\",\"table\":\"galleries\",\"type\":\"belongsTo\",\"column\":\"gallery_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(132, 14, 'gallery_hasmany_gallery_image_relationship', 'relationship', 'Images', 0, 0, 1, 1, 0, 0, '{\"isItems\":true,\"dataTypeSlug\":\"gallery-images\",\"itemsProperty\":\"images\",\"model\":\"App\\\\Models\\\\Galleries\\\\GalleryImage\",\"table\":\"gallery_images\",\"type\":\"hasMany\",\"column\":\"gallery_id\",\"key\":\"id\",\"label\":\"image\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(133, 9, 'infoblock_hasmany_infoblock_item_relationship', 'relationship', 'Items', 0, 0, 1, 1, 0, 0, '{\"isItems\":true,\"dataTypeSlug\":\"infoblock-items\",\"itemsProperty\":\"items\",\"itemsVisibleMethod\":\"typeWithItems\",\"model\":\"App\\\\Models\\\\Infoblocks\\\\InfoblockItem\",\"table\":\"infoblock_items\",\"type\":\"hasMany\",\"column\":\"infoblock_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
(134, 10, 'infoblock_item_hasmany_infoblock_item_relationship', 'relationship', 'children', 0, 1, 1, 1, 1, 1, '{\"isChildItems\":true,\"childItemsProperty\":\"children\",\"model\":\"App\\\\Models\\\\Infoblocks\\\\InfoblockItem\",\"table\":\"infoblock_items\",\"type\":\"hasMany\",\"column\":\"parent_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(135, 16, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(136, 16, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 0, '{}', 2),
(137, 16, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 0, '{\"slugify\":{\"origin\":\"name\"},\"validation\":{\"rule\":\"unique:education_degrees,slug\"}}', 3),
(138, 16, 'description', 'text_area', 'Description', 0, 0, 1, 1, 1, 0, '{}', 4),
(139, 16, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 0, '{}', 5),
(140, 16, 'order', 'number', 'Order', 1, 0, 0, 0, 0, 0, '{}', 6),
(141, 16, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 7),
(142, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(143, 17, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(144, 17, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 4),
(145, 17, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"},\"validation\":{\"rule\":\"unique:education_programs,slug\"}}', 5),
(146, 17, 'description', 'text_area', 'Description', 0, 0, 1, 1, 1, 0, '{}', 6),
(147, 17, 'info_body', 'rich_text_box', 'Info Body', 0, 0, 1, 1, 1, 0, '{}', 7),
(148, 17, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 0, '{}', 8),
(149, 17, 'order', 'number', 'Order', 1, 0, 0, 0, 0, 0, '{}', 9),
(150, 17, 'education_degree_id', 'number', 'Education Degree Id', 0, 0, 1, 1, 1, 1, '{}', 2),
(151, 17, 'education_specialty_id', 'number', 'Education Specialty Id', 0, 0, 1, 1, 1, 1, '{}', 3),
(153, 17, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 1, '{}', 11),
(154, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12),
(155, 18, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(156, 18, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(157, 18, 'code', 'text', 'Code', 1, 1, 1, 1, 1, 1, '{}', 3),
(158, 18, 'description', 'text_area', 'Description', 0, 0, 1, 1, 1, 0, '{}', 4),
(159, 18, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 1, '{}', 5),
(160, 18, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(161, 17, 'education_program_belongsto_education_degree_relationship', 'relationship', 'Degree', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Education\\\\EducationDegree\",\"table\":\"education_degrees\",\"type\":\"belongsTo\",\"column\":\"education_degree_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(162, 17, 'education_program_belongsto_education_specialty_relationship', 'relationship', 'Specialty', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Education\\\\EducationSpecialty\",\"table\":\"education_specialties\",\"type\":\"belongsTo\",\"column\":\"education_specialty_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
(163, 19, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(164, 19, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(165, 19, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"},\"validation\":{\"rule\":\"unique:people_info_groups,slug\"}}', 3),
(166, 19, 'description', 'text_area', 'Description', 0, 0, 1, 1, 1, 0, '{}', 4),
(167, 19, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 1, '{}', 5),
(168, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(169, 19, 'people_info_group_belongstomany_people_info_relationship', 'relationship', 'Infos', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\PeopleInfo\\\\PeopleInfo\",\"table\":\"people_infos\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"people_info_in_group\",\"pivot\":\"1\",\"taggable\":\"on\"}', 7);

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
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'App\\Models\\Posts\\Category', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-09-06 03:13:33', '2020-01-19 16:49:15'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'App\\Models\\Posts\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', 'App\\Http\\Controllers\\Posts\\PostController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-09-06 03:13:33', '2020-01-19 17:32:40'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'App\\Models\\Pages\\Page', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-09-06 03:13:33', '2020-05-10 10:44:16'),
(8, 'infoblock_types', 'infoblock-types', 'Infoblock Type', 'Infoblock Types', 'voyager-belt', 'App\\Models\\Infoblocks\\InfoblockType', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-01-22 19:07:45', '2020-02-10 19:33:37'),
(9, 'infoblocks', 'infoblocks', 'Infoblock', 'Infoblocks', NULL, 'App\\Models\\Infoblocks\\Infoblock', NULL, 'App\\Http\\Controllers\\WithItemsBase\\BaseWithItemsController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-01-29 17:14:12', '2020-02-18 20:50:45'),
(10, 'infoblock_items', 'infoblock-items', 'Infoblock Item', 'Infoblock Items', NULL, 'App\\Models\\Infoblocks\\InfoblockItem', NULL, 'App\\Http\\Controllers\\WithItemsBase\\BaseItemController', NULL, 1, 0, '{\"order_column\":\"order\",\"order_display_column\":\"title\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-01-30 14:18:22', '2020-02-18 20:56:50'),
(11, 'social_networks', 'social-networks', 'Social Network', 'Social Networks', 'voyager-facebook', 'App\\Models\\SocialNetwork', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-01-30 19:20:36', '2020-02-02 17:43:44'),
(13, 'people_infos', 'people-infos', 'People Info', 'People Infos', 'voyager-people', 'App\\Models\\PeopleInfo\\PeopleInfo', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-11 21:05:30', '2020-02-11 21:07:39'),
(14, 'galleries', 'galleries', 'Gallery', 'Galleries', 'voyager-photos', 'App\\Models\\Galleries\\Gallery', NULL, 'App\\Http\\Controllers\\WithItemsBase\\BaseWithItemsController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-12 19:24:14', '2020-02-18 20:17:09'),
(15, 'gallery_images', 'gallery-images', 'Gallery Image', 'Gallery Images', 'voyager-photo', 'App\\Models\\Galleries\\GalleryImage', NULL, 'App\\Http\\Controllers\\WithItemsBase\\BaseItemController', NULL, 1, 0, '{\"order_column\":\"order\",\"order_display_column\":\"caption\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-12 19:27:44', '2020-02-18 20:12:02'),
(16, 'education_degrees', 'education-degrees', 'Освітній ступінь', 'Освітні ступені', 'voyager-file-text', 'App\\Models\\Education\\EducationDegree', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"order\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-28 14:39:45', '2020-02-29 08:12:02'),
(17, 'education_programs', 'education-programs', 'Освітня програма', 'Освітні програми', 'voyager-file-text', 'App\\Models\\Education\\EducationProgram', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"order\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-28 14:44:06', '2020-02-29 08:27:46'),
(18, 'education_specialties', 'education-specialties', 'Освітня спеціальність', 'Освітні спеціальності', 'voyager-file-text', 'App\\Models\\Education\\EducationSpecialty', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-02-28 14:46:00', '2020-02-28 14:46:00'),
(19, 'people_info_groups', 'people-info-groups', 'Група інформації користувачів', 'Групи інформації користувачів', 'voyager-people', 'App\\Models\\PeopleInfo\\PeopleInfoGroup', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-03-02 19:35:39', '2020-03-02 19:40:35');

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
(1, 1, 'Розпочни свою кар\'єру в ІТ з нами!', NULL, 'infoblock-items\\January2020\\yXF91pw5QgoDBpUv8bF6.jpg', 'Дізнатись більше', NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam dolor optio provident temporibus tenetur? Ad, alias commodi corporis ea eos hic id ipsa iure molestiae natus nobis sint suscipit voluptas.', 3, '2020-01-30 15:36:00', '2020-03-02 18:55:46', NULL),
(2, 1, 'Міжнародні програми навчання відкриті для реєстрації!', NULL, 'infoblock-items\\January2020\\ghFmoiC4spN7lfczeKK6.jpg', 'Дізнатись більше', NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam dolor optio provident temporibus tenetur? Ad, alias commodi corporis ea eos hic id ipsa iure molestiae natus nobis sint suscipit voluptas.', 5, '2020-01-30 15:46:18', '2020-03-02 18:55:46', NULL),
(3, 1, 'Вступну кампанію 2020 розпочато!', NULL, 'infoblock-items\\January2020\\MlIIjGPfwW58IRQz1raX.jpg', 'Дізнатись більше', NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam dolor optio provident temporibus tenetur? Ad, alias commodi corporis ea eos hic id ipsa iure molestiae natus nobis sint suscipit voluptas.', 4, '2020-01-30 15:47:04', '2020-03-02 18:55:46', NULL),
(4, 1, 'Відкрита лекція від Cisco Networking Academy', NULL, 'infoblock-items\\January2020\\LFnj5zenjagWaJZmrxZ7.jpg', 'Дізнатись більше', NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam dolor optio provident temporibus tenetur? Ad, alias commodi corporis ea eos hic id ipsa iure molestiae natus nobis sint suscipit voluptas.', 6, '2020-01-30 15:47:48', '2020-03-02 18:55:46', NULL),
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
(5, 1, 'Налаштування', '', '_self', 'voyager-tools', '#000000', NULL, 9, '2019-09-04 16:52:48', '2020-02-29 07:35:51', NULL, ''),
(6, 1, 'Налаштування Меню', '', '_self', 'voyager-list', '#000000', 5, 1, '2019-09-04 16:52:48', '2019-09-09 10:58:25', 'voyager.menus.index', 'null'),
(7, 1, 'База даних', '', '_self', 'voyager-data', '#000000', 5, 2, '2019-09-04 16:52:48', '2019-09-09 11:00:12', 'voyager.database.index', 'null'),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2019-09-04 16:52:48', '2019-09-04 17:35:44', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2019-09-04 16:52:48', '2019-09-04 17:35:44', 'voyager.bread.index', NULL),
(10, 1, 'Системні налаштування', '', '_self', 'voyager-settings', '#000000', NULL, 10, '2019-09-04 16:52:48', '2020-02-29 07:35:51', 'voyager.settings.index', 'null'),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2019-09-04 16:52:48', '2019-09-04 17:35:44', 'voyager.hooks', NULL),
(13, 1, 'Категорії', '', '_self', 'voyager-categories', '#000000', 22, 1, '2019-09-06 03:13:33', '2020-01-19 16:02:52', 'voyager.categories.index', 'null'),
(14, 1, 'Новини', '', '_self', 'voyager-news', '#000000', 22, 2, '2019-09-06 03:13:33', '2020-01-19 16:06:01', 'voyager.posts.index', 'null'),
(15, 1, 'Сторінки', '', '_self', 'voyager-file-text', '#000000', NULL, 4, '2019-09-06 03:13:33', '2020-02-29 07:35:51', 'voyager.pages.index', 'null'),
(16, 3, 'Новини', '', '_self', 'Новини', '#000000', NULL, 1, '2020-01-10 17:41:49', '2020-01-13 19:00:43', 'posts', 'null'),
(21, 4, 'Home 2 2', 'home2-2', '_self', NULL, '#000000', 20, 1, '2020-01-16 16:31:25', '2020-01-16 16:31:35', NULL, ''),
(22, 1, 'Новини', '', '_self', 'voyager-news', '#000000', NULL, 7, '2020-01-19 16:02:42', '2020-02-29 07:35:51', NULL, ''),
(23, 1, 'Типи інфоблоків', '', '_self', 'voyager-categories', '#000000', 26, 1, '2020-01-22 19:07:45', '2020-01-30 14:32:32', 'voyager.infoblock-types.index', 'null'),
(24, 1, 'Інфоблоки', '', '_self', 'voyager-photos', '#000000', 26, 2, '2020-01-29 17:14:13', '2020-01-30 17:51:30', 'voyager.infoblocks.index', 'null'),
(25, 1, 'Елементи інфоблоків', '', '_self', 'voyager-photo', '#000000', 26, 3, '2020-01-30 14:18:23', '2020-01-30 14:33:17', 'voyager.infoblock-items.index', 'null'),
(26, 1, 'Інфоблоки', '', '_self', 'voyager-photos', '#000000', NULL, 5, '2020-01-30 14:23:40', '2020-02-29 07:35:51', NULL, ''),
(27, 1, 'Соціальні мережі', '', '_self', 'voyager-facebook', '#000000', NULL, 11, '2020-01-30 19:20:37', '2020-02-29 07:35:51', 'voyager.social-networks.index', 'null'),
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
(44, 1, 'Інформація користувачів', '', '_self', 'voyager-people', '#000000', 45, 3, '2020-02-11 21:05:30', '2020-02-12 17:54:49', 'voyager.people-infos.index', 'null'),
(45, 1, 'Користувачі', '', '_self', 'voyager-person', '#000000', NULL, 2, '2020-02-12 17:52:32', '2020-02-12 17:52:44', NULL, ''),
(46, 1, 'Галереї', '', '_self', 'voyager-photos', '#000000', 48, 1, '2020-02-12 19:24:14', '2020-02-12 19:31:07', 'voyager.galleries.index', 'null'),
(47, 1, 'Фото галереї', '', '_self', 'voyager-photo', '#000000', 48, 2, '2020-02-12 19:27:44', '2020-02-12 19:31:11', 'voyager.gallery-images.index', 'null'),
(48, 1, 'Галереї', '', '_self', 'voyager-photos', '#000000', NULL, 6, '2020-02-12 19:30:39', '2020-02-29 07:35:51', NULL, ''),
(49, 1, 'Освітні ступені', '', '_self', 'voyager-file-text', '#000000', 52, 1, '2020-02-28 14:39:46', '2020-02-29 07:33:49', 'voyager.education-degrees.index', 'null'),
(50, 1, 'Освітні програми', '', '_self', 'voyager-file-text', '#000000', 52, 3, '2020-02-28 14:44:06', '2020-02-29 07:34:23', 'voyager.education-programs.index', NULL),
(51, 1, 'Освітні спеціальності', '', '_self', 'voyager-file-text', NULL, 52, 2, '2020-02-28 14:46:01', '2020-02-29 07:34:23', 'voyager.education-specialties.index', NULL),
(52, 1, 'Освіта', '', '_self', 'voyager-company', '#000000', NULL, 8, '2020-02-29 07:20:47', '2020-02-29 07:35:51', NULL, ''),
(54, 1, 'Групи інформації користувачів', '', '_self', 'voyager-people', NULL, 45, 4, '2020-03-02 19:35:39', '2020-03-02 19:43:40', 'voyager.people-info-groups.index', NULL);

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
(57, '2020_03_02_212727_create_people_info_in_group_table', 20);

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
(5, 1, 'Наші випускники', NULL, '<p>[people-info-group code=\"vipuskniki\"]</p>', NULL, 'nashi-vipuskniki', NULL, NULL, 'ACTIVE', '2020-03-02 20:21:17', '2020-03-02 20:21:17'),
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
(2, NULL, 'Литвинчук Владислав', 'litvinchuk-vladislav', '380985413495', 'vlad_litvinchyk@ukr.net', '', '<p>Студент спеціальності \"Комп\'ютерні науки\" 2020 року випуску. SQL / C# / JS deweloper в компанії SalesUp. Розробник Creatio (BPMonline) систем.</p>', 'people-infos\\February2020\\5o6ZYBILUN1X7kxOAyRQ.png', NULL, 'PUBLISHED', '2020-02-27 17:49:27', '2020-02-27 17:49:27'),
(3, NULL, 'Чубар Людмила', 'chubar-lyudmila', NULL, NULL, '', '<p>Студентка спеціальності \"Комп\'ютерні науки\" 2020 року випуску. Web developer в компанції CF digital</p>', 'people-infos\\February2020\\KeMW8bD9wOH1vNTEQt48.jpg', NULL, 'PUBLISHED', '2020-02-27 17:55:34', '2020-02-27 17:55:34');

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
(101, 'delete_people_info_groups', 'people_info_groups', '2020-03-02 19:35:39', '2020-03-02 19:35:39');

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
(17, 1),
(18, 1),
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
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1);

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
(1, 'admin', 'Administrator', '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(2, 'user', 'Normal User', '2019-09-04 16:52:48', '2019-09-04 16:52:48'),
(3, 'student', 'Student', '2019-09-04 17:31:04', '2019-09-04 17:31:04');

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
(1, 'site.title', 'Site Title', 'IT NULES', '', 'text', 3, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 4, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 7, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\May2020\\kPWP6sVaZamCC9lpMAYA.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'IT ADMIN', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to IT ADMIN. The Missing Admin for IT NULES', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', 'settings\\May2020\\FCakpD2u7N5v2KK7RuCW.png', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\May2020\\eJzX9EjgWodrD6tV80Q2.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
(15, 'site.university-name', 'University name', 'Національний Університет Біоресурсів і Природокористування України', NULL, 'text', 1, 'Site'),
(16, 'site.department-name', 'Department name', 'Факультет інформаційних технологій', NULL, 'text', 2, 'Site'),
(17, 'contacts.mobile-phone', 'Mobile phone', '+380 11 11 12 111, +380 11 11 13 111', NULL, 'text', 10, 'Contacts'),
(18, 'contacts.email', 'Email', 'itnules@it.nules.com', NULL, 'text', 11, 'Contacts'),
(21, 'contacts.address', 'Address', 'Київ, вул Героїв Оборони, 16а', NULL, 'text', 14, 'Contacts'),
(22, 'contacts.address-map-link', 'Adress map link', 'https://www.google.com/maps/place/Faculty+of+Information+Technologies/@50.3816406,30.4954718,17.58z/data=!4m5!3m4!1s0x40d4c895581f1195:0x86896fac0eccc12d!8m2!3d50.3814928!4d30.4960386', NULL, 'text', 15, 'Contacts'),
(24, 'posts.page-header-image', 'News page header image', 'settings\\February2020\\7tjzSCRMamlV3Bt6Ktnx.jpg', NULL, 'image', 17, 'Posts'),
(25, 'posts.count-on-home-page', 'News count on home page', '3', NULL, 'text', 18, 'Posts'),
(26, 'pages.default-page-image', 'Default page image', 'settings\\February2020\\wRECcdNAscxPCM0oqhso.jpg', NULL, 'image', 19, 'Pages'),
(28, 'posts.preview-title', 'Preview title', 'Новини та події', NULL, 'text', 20, 'Posts'),
(29, 'posts.preview-subtitle', 'Preview subtitle', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodq', NULL, 'text_area', 21, 'Posts'),
(30, 'students.page-header-image', 'Students page header image', 'settings\\February2020\\JvWxoKVSDGWidJVQYhsm.jpg', NULL, 'image', 22, 'Students'),
(31, 'main-page.courses-slider-title', 'Courses slider title', 'НАВЧАЛЬНІ ПРОГРАМИ', NULL, 'text', 23, 'Main page'),
(32, 'main-page.courses-slider-subtitle', 'Courses slider subtitle', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodq', NULL, 'text_area', 24, 'Main page'),
(33, 'site.logo', 'Site Logo', '[{\"download_link\":\"settings\\\\March2020\\\\xdCxJzPWMmVsGDqAkS54.svg\",\"original_name\":\"logo.svg\"}]', NULL, 'file', 25, 'Site');

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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `social_networks`
--

INSERT INTO `social_networks` (`id`, `svg`, `link`, `created_at`, `updated_at`, `name`) VALUES
(1, '[{\"download_link\":\"social-networks\\\\February2020\\\\XoLVDxyUMplCmj7UOpFZ.svg\",\"original_name\":\"instagram.svg\"}]', 'https://www.instagram.com/it_nules', '2020-02-02 14:59:00', '2020-05-10 10:10:14', 'Instagram'),
(2, '[{\"download_link\":\"social-networks\\\\February2020\\\\RiLa4rX0ZLnJUG0wfLE2.svg\",\"original_name\":\"facebook.svg\"}]', 'https://www.facebook.com/fitnubip', '2020-02-02 15:37:00', '2020-02-19 19:55:20', 'Facebook'),
(3, '[{\"download_link\":\"social-networks\\\\May2020\\\\aVYscGK1U15emBzG1fwZ.svg\",\"original_name\":\"youtube.svg\"}]', 'https://www.youtube.com/channel/UC-U1fqRT0jeRLUUDcMq1uaw', '2020-05-10 10:16:00', '2020-05-10 10:17:31', 'Youtube');

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
(72, 'menu_items', 'title', 25, 'en', 'Infoblock Items', '2020-01-30 14:33:09', '2020-01-30 14:33:09'),
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
(198, 'menu_items', 'title', 47, 'en', 'Gallery Images', '2020-02-12 19:31:00', '2020-02-12 19:31:00'),
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
(308, 'infoblock_items', 'title', 66, 'en', 'Термін вступної кампанії', '2020-05-10 10:45:06', '2020-05-10 10:45:06');

-- --------------------------------------------------------

--
-- Структура таблиці `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Vladik', 'vlad_litvinchyk@ukr.net', 'users\\April2020\\8za12oMmhve0ZZdvS5tk.png', NULL, '$2y$10$ZRI6UAP4smD./WSd9s/1AuDaS.VjTqW8H1qpFzKTpG6livqhzoTVG', 'QoOLEzWX0SXEaGF0moZTBvH7o5cYFOXRaxt5OCLTfJtG7qJkIMel219aU9v4', '{\"locale\":\"uk\"}', '2019-09-04 03:26:31', '2020-04-29 17:41:21'),
(3, 3, 'Вася', 'vasya@gmail.com', 'users/default.png', NULL, '$2y$10$iB2zkw.BDKYJQMdosF4diuUGgHw1kt/4fIgl0St7YbdQzd13Cdi4u', NULL, '{\"locale\":\"uk\"}', '2019-09-05 03:44:16', '2020-01-14 19:17:45'),
(4, 2, 'Lytvynchuk Vladyslav Grygorovuch', 'vlad.litvinchyk@gmail.com', 'users/default.png', NULL, '$2y$10$NHOhIpVaiWEvGgO6p3t0EOl/ZnZNfXrQcqFIi7kla3ChCGg2UvejG', NULL, NULL, '2020-03-11 19:40:28', '2020-03-11 19:40:28');

-- --------------------------------------------------------

--
-- Структура таблиці `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Індекси збережених таблиць
--

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
  ADD KEY `people_info_in_group_group_id_foreign` (`people_info_group_id`);

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
  ADD KEY `users_role_id_foreign` (`role_id`);

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
-- AUTO_INCREMENT для таблиці `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT для таблиці `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
-- AUTO_INCREMENT для таблиці `infoblocks`
--
ALTER TABLE `infoblocks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблиці `infoblock_items`
--
ALTER TABLE `infoblock_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT для таблиці `infoblock_types`
--
ALTER TABLE `infoblock_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблиці `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT для таблиці `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

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
-- AUTO_INCREMENT для таблиці `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT для таблиці `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблиці `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT для таблиці `social_networks`
--
ALTER TABLE `social_networks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=309;

--
-- AUTO_INCREMENT для таблиці `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

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
  ADD CONSTRAINT `people_info_in_group_group_id_foreign` FOREIGN KEY (`people_info_group_id`) REFERENCES `people_info_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `people_info_in_group_people_info_id_foreign` FOREIGN KEY (`people_info_id`) REFERENCES `people_infos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

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
