-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 18-11-2018 a las 01:49:42
-- Versión del servidor: 5.7.23
-- Versión de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `baseprogra`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `codcliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombrecl` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `tel` varchar(8) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`codcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`codcliente`, `nombrecl`, `apellido`, `tel`) VALUES
(1, 'JOSE', 'MENDEZ', '77777777'),
(2, 'MARIA', 'LOPEZ', '88888888'),
(3, 'Manuel', 'Guzman', '36356354'),
(4, 'Pedro', 'Palacios', '34463467');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizaciones`
--

DROP TABLE IF EXISTS `cotizaciones`;
CREATE TABLE IF NOT EXISTS `cotizaciones` (
  `codcotizacion` int(11) NOT NULL AUTO_INCREMENT,
  `codpro` int(11) NOT NULL,
  `codcliente` int(11) NOT NULL,
  `fechacot` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`codcotizacion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `cotizaciones`
--

INSERT INTO `cotizaciones` (`codcotizacion`, `codpro`, `codcliente`, `fechacot`) VALUES
(1, 0, 1, '2018-11-17 17:43:15'),
(2, 0, 2, '2018-11-17 17:43:15'),
(3, 5, 3, '2018-11-17 19:02:25'),
(4, 5, 1, '2018-11-17 19:02:25'),
(5, 4, 4, '2018-11-17 19:02:36'),
(6, 2, 3, '2018-11-17 19:02:36'),
(7, 1, 4, '2018-11-17 19:02:47'),
(8, 6, 2, '2018-11-17 19:02:47'),
(9, 5, 4, '2018-11-17 19:02:59'),
(10, 6, 4, '2018-11-17 19:02:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `codpro` int(11) NOT NULL AUTO_INCREMENT,
  `nombreprod` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `precio` float NOT NULL,
  `existencias` int(11) DEFAULT NULL,
  `fechaingreso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`codpro`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`codpro`, `nombreprod`, `precio`, `existencias`, `fechaingreso`) VALUES
(1, 'PEPSI', 1, 500, '2018-11-08 14:57:49'),
(2, 'COCA COLA', 1.5, 800, '2018-11-08 14:57:49'),
(3, 'Cereal Korn Flakes', 4, 80, '2018-11-18 00:57:04'),
(4, 'Harina de Maiz MASECA', 2, 25, '2018-11-18 00:57:04'),
(5, 'Nutella', 8, 150, '2018-11-18 00:58:35'),
(6, 'Gatorade', 1, 500, '2018-11-18 00:58:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `codventa` int(11) NOT NULL AUTO_INCREMENT,
  `codpro` varchar(8) COLLATE utf8_spanish_ci NOT NULL,
  `catidad` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `codcliente` int(11) NOT NULL,
  PRIMARY KEY (`codventa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`codventa`, `codpro`, `catidad`, `fecha`, `codcliente`) VALUES
(1, '00000000', 25, '2018-11-08 08:59:06', 1),
(2, '00000001', 10, '2018-11-08 08:59:06', 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
