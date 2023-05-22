-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2023 a las 23:35:46
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `innovatech`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_tasks` (IN `_Title` VARCHAR(255), IN `_Description` VARCHAR(255))   BEGIN
            INSERT INTO tasks (title, description) VALUES(_Title, _Description);
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_list` (IN `_Id` BIGINT)   BEGIN
            DELETE FROM list
            WHERE list.id = _Id;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_task` (IN `_Id` BIGINT)   BEGIN
            DELETE FROM tasks
            WHERE tasks.id = _Id;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_user` (IN `_Id` BIGINT)   BEGIN
            DELETE FROM users
            WHERE users.id = _Id;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_list` (IN `_Id` BIGINT)   BEGIN
            SELECT lst.id, lst.list_code, lst.title, lst.description
            FROM list lst
            WHERE lst.user_id = _Id;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_task` ()   BEGIN
            SELECT tks.id, tks.title, tks.description 
            FROM tasks tks;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_users` (IN `_Id` BIGINT)   BEGIN
            SELECT us.id, us.name, us.lastname, us.identification, us.email 
            FROM users us
            WHERE ID = _Id;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `show_list` (IN `_Id` BIGINT, IN `_Code` VARCHAR(255))   BEGIN
            SELECT lst.id, lst.list_code, lst.title, lst.description 
            FROM list lst
            WHERE lst.list_code = _Code
            AND lst.user_id = _Id;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `show_task` (IN `_Id` BIGINT)   BEGIN
            SELECT tks.id, tks.title, tks.description 
            FROM tasks tks
            WHERE tks.id = _Id
            LIMIT 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_tasks` (IN `_Id` BIGINT, IN `_Title` VARCHAR(255), IN `_Description` VARCHAR(255))   BEGIN
            UPDATE  tasks  SET title = _Title, description = _Description
            WHERE id = _Id;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user` (IN `_Id` BIGINT, IN `_Name` VARCHAR(255), IN `_Lastname` VARCHAR(255), IN `_Identification` VARCHAR(255), IN `_Email` VARCHAR(255))   BEGIN
            UPDATE  users  SET name = _Name, lastname = _Lastname, identification = _Identification, email = _Email
            WHERE id = _Id;
        END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `list`
--

CREATE TABLE `list` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `list_code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `list`
--

INSERT INTO `list` (`id`, `list_code`, `title`, `description`, `user_id`) VALUES
(42, '646bdc5f771d2', 'primera', 'adam', 1),
(43, '646bdcd23f1cc', 'z', 'c', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_09_173948_create_list_table', 1),
(6, '2023_05_09_173949_create_tasks_table', 1),
(7, '2023_05_11_165328_task_task_list_table', 1),
(8, '2023_05_15_023831_procedure_tasks_create', 1),
(9, '2023_05_15_024723_procedure_tasks_update', 1),
(10, '2023_05_15_025520_procedure_tasks_show', 1),
(11, '2023_05_15_030033_procedure_tasks_get', 1),
(12, '2023_05_15_030113_procedure_tasks_delete', 1),
(13, '2023_05_15_031113_procedure_list_get', 1),
(14, '2023_05_15_031638_procedure_list_delete', 1),
(15, '2023_05_15_031842_procedure_list_show', 1),
(16, '2023_05_15_033650_procedure_user_get', 1),
(17, '2023_05_15_034403_procedure_user_update', 1),
(18, '2023_05_15_034723_procedure_user_delete', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`) VALUES
(1, 'CREAR BASE DE DATOS', 'Creación de la base de datos del proyecto'),
(2, 'LEVANTAR REQUERIMIENTOS FUNCIONALES', 'Levantar requerimientos funcionales para una solución de software.'),
(3, 'ESTIMAR TIEMPOS', 'Definir en que tiempos se realizara cada una de las actividades para desarrollar una solución de sofware.'),
(4, 'DEFINIR HERAMIENTAS', 'Elegir que herramientas de software se utilizaran para llevar a cabo el desarrollo de una solución de software.'),
(5, 'PLANEAR ACTIVIDADES', 'Crear las actividades a llevarse a cabo dentro del proyecto de software.'),
(6, 'CONTROL DE ACTIVIDADES', 'Regular y verificar que se cumplen los tiempos de las actividades planeadas para la realización del proyecto de software.'),
(7, 'PROBAR FUNCIONALIDADES', 'Realizar las pruebas y ejecuciones necesarias a cada actividad planeada para demostrar que la solución de software fue realizada satisfactoriamente.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `task_task_list`
--

CREATE TABLE `task_task_list` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_list_id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `task_task_list`
--

INSERT INTO `task_task_list` (`id`, `task_list_id`, `task_id`) VALUES
(90, 42, 2),
(91, 43, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `identification` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `lastname`, `identification`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Sebastian', 'Salgado', '1085250136', 'salgadosb1986@gmail.com', NULL, '$2y$10$w.tZDzoh9cUH7mar7c0DsO8UCNNCNAcRlak8.UOKbUfODFbQO3206', NULL, '2023-05-17 03:43:32', '2023-05-23 02:21:15'),
(2, 'carlos', 'baldosa', '1086456789', 'baldosa@gmail.com', NULL, '$2y$10$uwOyOHkSx9eN5VOYfqDhheSaoMdyv4/BTHvHxjSUT1qlW/etv1dPC', NULL, '2023-05-21 22:05:16', '2023-05-21 23:48:36'),
(4, 'verito', 'orozco', '1085456789', 'salgadosb661986@gmail.com', NULL, '$2y$10$F0i5fZVsCnnip1g7pauRgOGSb62lKGjH996POoGbTxkggy25dG61y', NULL, '2023-05-22 21:12:39', '2023-05-22 21:27:15'),
(5, 'dfd', 'dfdfd', '1098765456', 'dfdfd@gmail.com', NULL, '$2y$10$kkwaSCa7.iChCrQMiE/O1uA.zJ8JkNZurdyhL5/0QdPzliktAcr82', NULL, '2023-05-22 23:47:19', '2023-05-22 23:47:19'),
(6, 'lorenzo', 'lamas', '1098678567', 'lamas@gmail.com', NULL, '$2y$10$0I/GZhHgXqBjaxc55vqYzeBMQwMlRhlj9NWg9tiFoOR7kVIeLsqvG', NULL, '2023-05-23 00:32:34', '2023-05-23 00:32:34'),
(7, 'chavo', 'del ocho', '10986776', 'chavo@gmail.com', NULL, '$2y$10$fDOvZXBWXYGRGdgsGqi/POnKMRhi8vdVH2TwFic0CA2CeFJ37Xkq6', NULL, '2023-05-23 00:34:35', '2023-05-23 00:34:35');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `list`
--
ALTER TABLE `list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `list_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `task_task_list`
--
ALTER TABLE `task_task_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_task_list_task_list_id_foreign` (`task_list_id`),
  ADD KEY `task_task_list_task_id_foreign` (`task_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_identification_unique` (`identification`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `list`
--
ALTER TABLE `list`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `task_task_list`
--
ALTER TABLE `task_task_list`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `list`
--
ALTER TABLE `list`
  ADD CONSTRAINT `list_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `task_task_list`
--
ALTER TABLE `task_task_list`
  ADD CONSTRAINT `task_task_list_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_task_list_task_list_id_foreign` FOREIGN KEY (`task_list_id`) REFERENCES `list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
