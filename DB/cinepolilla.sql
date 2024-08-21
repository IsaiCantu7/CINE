-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-04-2024 a las 15:08:17
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cinepolilla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `apellido`, `correo`, `telefono`, `fecha_nacimiento`, `fecha_registro`) VALUES
(1, 'Bryan', 'Rdz', 'bryan123@ejemplo.com', '09999999', '2007-05-10', '2024-04-11 03:00:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `puesto` varchar(100) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `fecha_contratacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre`, `apellido`, `puesto`, `salario`, `fecha_contratacion`) VALUES
(3, 'afasf', 'egsdg', 'sddb', 43.00, '2024-04-26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

CREATE TABLE `peliculas` (
  `id_pelicula` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `director` varchar(100) NOT NULL,
  `genero` varchar(50) NOT NULL,
  `duracion_minutos` int(11) NOT NULL,
  `clasificacion` varchar(20) NOT NULL,
  `sinopsis` text DEFAULT NULL,
  `fecha_estreno` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`id_pelicula`, `titulo`, `director`, `genero`, `duracion_minutos`, `clasificacion`, `sinopsis`, `fecha_estreno`) VALUES
(1, 'Avengers: Endgame', 'Anthony Russo, Joe Russo', 'Acción, Aventura, Fantasía', 181, 'PG-13', 'Después de los devastadores eventos de Avengers: Infinity War, los Vengadores restantes se reúnen una vez más para deshacer las acciones de Thanos y restaurar el orden en el universo.', '2019-04-26'),
(3, 'dhzdrh', 'rtdh', 'reh', 4, 'rwgs', 'rhrh', '2024-05-03'),
(4, 'Título 1', 'Director 1', 'Género 1', 120, 'Clasificación 1', 'Sinopsis 1', '2024-04-15'),
(5, 'Título 1', 'Director 1', 'Género 1', 120, 'Clasificación 1', 'Sinopsis 1', '2024-04-15'),
(6, 'Título 2', 'Director 2', 'Género 2', 110, 'Clasificación 2', 'Sinopsis 2', '2024-04-15'),
(7, 'Título 2', 'Director 2', 'Género 2', 110, 'Clasificación 2', 'Sinopsis 2', '2024-04-15'),
(8, 'Título 3', 'Director 3', 'Género 3', 100, 'Clasificación 3', 'Sinopsis 3', '2024-04-15'),
(9, 'Título 4', 'Director 4', 'Género 4', 130, 'Clasificación 4', 'Sinopsis 4', '2024-04-15'),
(10, 'Título 5', 'Director 5', 'Género 5', 140, 'Clasificación 5', 'Sinopsis 5', '2024-04-15'),
(11, 'Título 6', 'Director 6', 'Género 6', 150, 'Clasificación 6', 'Sinopsis 6', '2024-04-15'),
(12, 'Título 7', 'Director 7', 'Género 7', 160, 'Clasificación 7', 'Sinopsis 7', '2024-04-15'),
(13, 'Título 8', 'Director 8', 'Género 8', 170, 'Clasificación 8', 'Sinopsis 8', '2024-04-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_boletos`
--

CREATE TABLE `ventas_boletos` (
  `id_venta` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_pelicula` int(11) NOT NULL,
  `cantidad_boletos` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha_venta` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas_boletos`
--

INSERT INTO `ventas_boletos` (`id_venta`, `id_cliente`, `id_pelicula`, `cantidad_boletos`, `total`, `fecha_venta`) VALUES
(1, 1, 1, 2, 33.00, '2024-04-12 21:06:16'),
(2, 1, 1, 9, 87.00, '2024-04-14 05:48:00'),
(3, 1, 1, 36, 4565.00, '2024-04-15 00:47:42'),
(4, 1, 1, 20, 100.00, '2024-04-15 11:09:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_snacks`
--

CREATE TABLE `ventas_snacks` (
  `id_venta` int(11) NOT NULL,
  `nombre_snack` varchar(255) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `precio_unitario` int(11) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `fecha_venta` datetime DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas_snacks`
--

INSERT INTO `ventas_snacks` (`id_venta`, `nombre_snack`, `id_cliente`, `precio_unitario`, `cantidad`, `fecha_venta`, `fecha_hora`) VALUES
(1, 'pollo', 1, 90, 2.00, '2024-04-12 00:00:00', NULL),
(2, 'ijhj|8', 1, 43, 9.00, '2024-04-13 00:00:00', NULL),
(3, '344', 1, 54334, 334.00, '2024-04-14 00:00:00', NULL),
(4, 'Palomitas', 1, 100, 2.00, '2024-04-15 00:00:00', NULL),
(5, 'Palomitas', 1, 100, 2.00, '2024-04-15 00:00:00', NULL),
(6, 'Snack A', 1, 3, 10.00, '2024-04-15 00:00:00', '2024-04-15 05:35:59'),
(7, 'Snack A', 2, 3, 5.00, '2024-04-15 00:00:00', '2024-04-15 05:35:59'),
(8, 'Snack A', 3, 3, 8.00, '2024-04-15 00:00:00', '2024-04-15 05:35:59'),
(9, 'Snack B', 4, 3, 12.00, '2024-04-15 00:00:00', '2024-04-15 05:35:59'),
(10, 'Snack B', 5, 3, 15.00, '2024-04-15 00:00:00', '2024-04-15 05:35:59'),
(11, 'Snack B', 6, 3, 10.00, '2024-04-15 00:00:00', '2024-04-15 05:35:59'),
(12, 'Snack C', 7, 2, 20.00, '2024-04-15 00:00:00', '2024-04-15 05:35:59'),
(13, 'Snack C', 8, 2, 18.00, '2024-04-15 00:00:00', '2024-04-15 05:35:59'),
(14, 'Snack D', 9, 3, 14.00, '2024-04-15 00:00:00', '2024-04-15 05:35:59'),
(15, 'Snack D', 10, 3, 16.00, '2024-04-15 00:00:00', '2024-04-15 05:35:59'),
(16, 'Snack E', 11, 4, 8.00, '2024-04-15 00:00:00', '2024-04-15 05:35:59'),
(17, 'Snack E', 12, 4, 10.00, '2024-04-15 00:00:00', '2024-04-15 05:35:59'),
(18, 'Snack A', 13, 3, 6.00, '2024-04-15 00:00:00', '2024-04-15 05:35:59'),
(19, 'Snack B', 14, 3, 9.00, '2024-04-15 00:00:00', '2024-04-15 05:35:59'),
(20, 'Snack C', 15, 2, 12.00, '2024-04-15 00:00:00', '2024-04-15 05:35:59'),
(21, 'Snack D', 16, 3, 20.00, '2024-04-15 00:00:00', '2024-04-15 05:35:59'),
(22, 'Snack E', 17, 4, 15.00, '2024-04-15 00:00:00', '2024-04-15 05:35:59'),
(23, 'Snack A', 18, 3, 10.00, '2024-04-15 00:00:00', '2024-04-15 05:35:59'),
(24, 'Snack B', 19, 3, 5.00, '2024-04-15 00:00:00', '2024-04-15 05:35:59'),
(25, 'Snack C', 20, 2, 18.00, '2024-04-15 00:00:00', '2024-04-15 05:35:59'),
(26, 'Snack F', 21, 3, 10.00, '2024-04-15 00:00:00', '2024-04-15 05:39:27'),
(27, 'Snack G', 22, 3, 8.00, '2024-04-15 00:00:00', '2024-04-15 05:39:27'),
(28, 'Snack H', 23, 2, 15.00, '2024-04-15 00:00:00', '2024-04-15 05:39:27'),
(29, 'Snack I', 24, 4, 12.00, '2024-04-15 00:00:00', '2024-04-15 05:39:27'),
(30, 'Snack J', 25, 3, 20.00, '2024-04-15 00:00:00', '2024-04-15 05:39:27'),
(31, 'Snack K', 26, 4, 18.00, '2024-04-15 00:00:00', '2024-04-15 05:39:27'),
(32, 'Snack L', 27, 2, 14.00, '2024-04-15 00:00:00', '2024-04-15 05:39:27'),
(33, 'Snack M', 28, 3, 10.00, '2024-04-15 00:00:00', '2024-04-15 05:39:27'),
(34, 'Snack N', 29, 3, 16.00, '2024-04-15 00:00:00', '2024-04-15 05:39:27'),
(35, 'Snack O', 30, 3, 22.00, '2024-04-15 00:00:00', '2024-04-15 05:39:27'),
(36, 'Snack P', 31, 2, 9.00, '2024-04-15 00:00:00', '2024-04-15 05:39:27'),
(37, 'Snack Q', 32, 3, 12.00, '2024-04-15 00:00:00', '2024-04-15 05:39:27'),
(38, 'Snack R', 33, 2, 15.00, '2024-04-15 00:00:00', '2024-04-15 05:39:27'),
(39, 'Snack S', 34, 4, 18.00, '2024-04-15 00:00:00', '2024-04-15 05:39:27'),
(40, 'Snack T', 35, 3, 14.00, '2024-04-15 00:00:00', '2024-04-15 05:39:27'),
(41, 'Snack U', 36, 3, 20.00, '2024-04-15 00:00:00', '2024-04-15 05:39:27'),
(42, 'Snack V', 37, 3, 17.00, '2024-04-15 00:00:00', '2024-04-15 05:39:27'),
(43, 'Snack W', 38, 4, 11.00, '2024-04-15 00:00:00', '2024-04-15 05:39:27'),
(44, 'Snack X', 39, 2, 25.00, '2024-04-15 00:00:00', '2024-04-15 05:39:27'),
(45, 'Snack Y', 40, 4, 13.00, '2024-04-15 00:00:00', '2024-04-15 05:39:27'),
(46, 'Snack F', 21, 3, 10.00, '2024-04-15 00:00:00', '2024-04-15 05:43:02'),
(47, 'Snack G', 22, 3, 8.00, '2024-04-15 00:00:00', '2024-04-15 05:43:02'),
(48, 'Snack H', 23, 2, 15.00, '2024-04-15 00:00:00', '2024-04-15 05:43:02'),
(49, 'Snack I', 24, 4, 12.00, '2024-04-15 00:00:00', '2024-04-15 05:43:02'),
(50, 'Snack J', 25, 3, 20.00, '2024-04-15 00:00:00', '2024-04-15 05:43:02'),
(51, 'Snack K', 26, 4, 18.00, '2024-04-15 00:00:00', '2024-04-15 05:43:02'),
(52, 'Snack L', 27, 2, 14.00, '2024-04-15 00:00:00', '2024-04-15 05:43:02'),
(53, 'Snack M', 28, 3, 10.00, '2024-04-15 00:00:00', '2024-04-15 05:43:02'),
(54, 'Snack N', 29, 3, 16.00, '2024-04-15 00:00:00', '2024-04-15 05:43:02'),
(55, 'Snack O', 30, 3, 22.00, '2024-04-15 00:00:00', '2024-04-15 05:43:02'),
(56, 'Snack P', 31, 2, 9.00, '2024-04-15 00:00:00', '2024-04-15 05:43:02'),
(57, 'Snack Q', 32, 3, 12.00, '2024-04-15 00:00:00', '2024-04-15 05:43:02'),
(58, 'Snack R', 33, 2, 15.00, '2024-04-15 00:00:00', '2024-04-15 05:43:02'),
(59, 'Snack S', 34, 4, 18.00, '2024-04-15 00:00:00', '2024-04-15 05:43:02'),
(60, 'Snack T', 35, 3, 14.00, '2024-04-15 00:00:00', '2024-04-15 05:43:02'),
(61, 'Snack U', 36, 3, 20.00, '2024-04-15 00:00:00', '2024-04-15 05:43:02'),
(62, 'Snack V', 37, 3, 17.00, '2024-04-15 00:00:00', '2024-04-15 05:43:02'),
(63, 'Snack W', 38, 4, 11.00, '2024-04-15 00:00:00', '2024-04-15 05:43:02'),
(64, 'Snack X', 39, 2, 25.00, '2024-04-15 00:00:00', '2024-04-15 05:43:02'),
(65, 'Snack Y', 40, 4, 13.00, '2024-04-15 00:00:00', '2024-04-15 05:43:02');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`id_pelicula`);

--
-- Indices de la tabla `ventas_boletos`
--
ALTER TABLE `ventas_boletos`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_pelicula` (`id_pelicula`);

--
-- Indices de la tabla `ventas_snacks`
--
ALTER TABLE `ventas_snacks`
  ADD PRIMARY KEY (`id_venta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  MODIFY `id_pelicula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `ventas_boletos`
--
ALTER TABLE `ventas_boletos`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `ventas_snacks`
--
ALTER TABLE `ventas_snacks`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ventas_boletos`
--
ALTER TABLE `ventas_boletos`
  ADD CONSTRAINT `ventas_boletos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `ventas_boletos_ibfk_2` FOREIGN KEY (`id_pelicula`) REFERENCES `peliculas` (`id_pelicula`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
