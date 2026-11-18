-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-11-2026 a las 19:57:10
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bond_english`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `documento` int(11) NOT NULL,
  `edad` int(11) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `lugar` varchar(255) NOT NULL,
  `id_nivel` int(11) NOT NULL,
  `ingles_previo` longtext NOT NULL,
  `objetivo` longtext NOT NULL,
  `preferencia_horario` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases`
--

CREATE TABLE `clases` (
  `id` int(11) NOT NULL,
  `desde` time NOT NULL,
  `hasta` time NOT NULL,
  `dia` int(11) NOT NULL,
  `modificacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clases`
--

INSERT INTO `clases` (`id`, `desde`, `hasta`, `dia`, `modificacion`) VALUES
(1, '13:00:00', '14:00:00', 1, '2026-11-18 10:15:15'),
(2, '14:00:00', '15:00:00', 1, '2026-11-18 10:15:15'),
(3, '15:00:00', '16:00:00', 1, '2026-11-18 10:15:15'),
(4, '16:00:00', '17:00:00', 1, '2026-11-18 10:15:15'),
(5, '17:00:00', '18:00:00', 1, '2026-11-18 10:15:15'),
(6, '18:00:00', '19:00:00', 1, '2026-11-18 10:15:15'),
(7, '19:00:00', '20:00:00', 1, '2026-11-18 10:15:15'),
(8, '13:00:00', '14:00:00', 2, '2026-11-18 10:15:15'),
(9, '14:00:00', '15:00:00', 2, '2026-11-18 10:15:15'),
(10, '15:00:00', '16:00:00', 2, '2026-11-18 10:15:15'),
(11, '16:00:00', '17:00:00', 2, '2026-11-18 10:15:15'),
(12, '17:00:00', '18:00:00', 2, '2026-11-18 10:15:15'),
(13, '18:00:00', '19:00:00', 2, '2026-11-18 10:15:15'),
(14, '19:00:00', '20:00:00', 2, '2026-11-18 10:15:15'),
(15, '13:00:00', '14:00:00', 3, '2026-11-18 10:15:15'),
(16, '14:00:00', '15:00:00', 3, '2026-11-18 10:15:15'),
(17, '15:00:00', '16:00:00', 3, '2026-11-18 10:15:15'),
(18, '16:00:00', '17:00:00', 3, '2026-11-18 10:15:15'),
(19, '17:00:00', '18:00:00', 3, '2026-11-18 10:15:15'),
(20, '18:00:00', '19:00:00', 3, '2026-11-18 10:15:15'),
(21, '19:00:00', '20:00:00', 3, '2026-11-18 10:15:15'),
(22, '13:00:00', '14:00:00', 4, '2026-11-18 10:15:15'),
(23, '14:00:00', '15:00:00', 4, '2026-11-18 10:15:15'),
(24, '15:00:00', '16:00:00', 4, '2026-11-18 10:15:15'),
(25, '16:00:00', '17:00:00', 4, '2026-11-18 10:15:15'),
(26, '17:00:00', '18:00:00', 4, '2026-11-18 10:15:15'),
(27, '18:00:00', '19:00:00', 4, '2026-11-18 10:15:15'),
(28, '19:00:00', '20:00:00', 4, '2026-11-18 10:15:15'),
(29, '13:00:00', '14:00:00', 5, '2026-11-18 10:15:15'),
(30, '14:00:00', '15:00:00', 5, '2026-11-18 10:15:15'),
(31, '15:00:00', '16:00:00', 5, '2026-11-18 10:15:15'),
(32, '16:00:00', '17:00:00', 5, '2026-11-18 10:15:15'),
(33, '17:00:00', '18:00:00', 5, '2026-11-18 10:15:15'),
(34, '18:00:00', '19:00:00', 5, '2026-11-18 10:15:15'),
(35, '19:00:00', '20:00:00', 5, '2026-11-18 10:15:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias`
--

CREATE TABLE `dias` (
  `dia` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dias`
--

INSERT INTO `dias` (`dia`, `nombre`) VALUES
(1, 'lunes'),
(2, 'martes'),
(3, 'miércoles'),
(4, 'jueves'),
(5, 'viernes'),
(6, 'sábado'),
(7, 'domingo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

CREATE TABLE `inscripciones` (
  `id` int(11) NOT NULL,
  `id_alumno` int(11) NOT NULL,
  `id_clase` int(11) NOT NULL,
  `id_valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `niveles`
--

CREATE TABLE `niveles` (
  `id` int(11) NOT NULL,
  `nivel` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `niveles`
--

INSERT INTO `niveles` (`id`, `nivel`) VALUES
(1, 'Básico'),
(2, 'Pre intermedio'),
(3, 'Intermedio'),
(4, 'Intermedio alto'),
(5, 'Avanzado'),
(6, 'No tengo conocimientos previos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valores`
--

CREATE TABLE `valores` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `valor` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `valores`
--

INSERT INTO `valores` (`id`, `descripcion`, `valor`) VALUES
(1, '4 clases de 01:00hs', '140000.00'),
(2, '4 clases de 01:15hs', '175000.00'),
(3, '4 clases de 01:30hs', '198000.00'),
(4, 'Clase individual', '35000.00'),
(5, 'The English Table', '30000.00'),
(6, 'Clase grupal', '0.00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clases`
--
ALTER TABLE `clases`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `niveles`
--
ALTER TABLE `niveles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `valores`
--
ALTER TABLE `valores`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clases`
--
ALTER TABLE `clases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `niveles`
--
ALTER TABLE `niveles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `valores`
--
ALTER TABLE `valores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
