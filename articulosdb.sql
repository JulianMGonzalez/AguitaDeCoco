-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-04-2021 a las 05:57:26
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `articulosdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id` int(155) NOT NULL,
  `descripcion` text NOT NULL,
  `nombre` text NOT NULL,
  `imagen` text NOT NULL,
  `descuento` tinyint(2) NOT NULL,
  `precio` float NOT NULL,
  `stock` int(10) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id`, `descripcion`, `nombre`, `imagen`, `descuento`, `precio`, `stock`, `estado`) VALUES
(1, 'La fruta debe ser pelada, desmoñada y OREADA, es decir se debe asegurar que una de las características de calidad del coco como es la apariencia externa no se vea afectada por no realizar el correcto oreado.', 'coco', 'https://img.freepik.com/vector-gratis/ilustracion-coco-plana_23-2148158301.jpg?size=338&ext=jpg', 10, 25000, 20, 1),
(2, 'La mejor combinación de galleta y crema de coco para despertar tus sentidos y hacer de cada beso un momento ideal. Pruébalo y te lo comerás a besos.', 'cocosette', 'https://m.media-amazon.com/images/I/81QdTHGoMKL._SX466_.jpg', 0, 1500, 25, 1),
(3, 'nuevo', 'coco1', 'https://static.wikia.nocookie.net/totaldramaisland/images/a/ac/Mrcoconut.png/revision/latest/top-crop/width/360/height/450?cb=20110202162047&path-prefix=es', 1, 5000, 50, 0),
(4, 'Leche de coco, una bebida super cremosa que tiene un sabor espectacular. Para hacerla solamente necesitas 2 ingredientes simples y fáciles de encontrar ¡y la tendrás lista en 5 minutos!', 'Leche de coco', 'https://blog-static.hola.com/farmaciameritxell/files/2016/01/aceite_coco14.jpg', 25, 3250, 100, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id` int(155) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
