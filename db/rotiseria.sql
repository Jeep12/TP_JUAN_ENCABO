-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2021 a las 14:42:26
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rotiseria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre_categoria` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre_categoria`) VALUES
(2, 'Bebida'),
(3, 'Bebida Alcoholica'),
(9, 'Comida'),
(10, 'Postre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `id_comida_fk` int(11) NOT NULL,
  `usuario` varchar(200) NOT NULL,
  `comentario` varchar(535) NOT NULL,
  `valoracion` int(11) NOT NULL,
  `fecha` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `id_comida_fk`, `usuario`, `comentario`, `valoracion`, `fecha`) VALUES
(141, 39, 'Juan', 'Muy rica pero llego quemada', 3, '23/11/2021'),
(142, 41, 'Juan', 'Llego medio derretido', 3, '23/11/2021'),
(143, 43, 'Juan', 'LLego muy fria, excelente servicio', 5, '23/11/2021');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comidas`
--

CREATE TABLE `comidas` (
  `id` int(11) NOT NULL,
  `titulo` varchar(250) NOT NULL,
  `categoria_fk` int(11) NOT NULL,
  `detalle` varchar(535) NOT NULL,
  `imagen` varchar(400) DEFAULT NULL,
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comidas`
--

INSERT INTO `comidas` (`id`, `titulo`, `categoria_fk`, `detalle`, `imagen`, `precio`) VALUES
(39, 'Pizza a la española', 9, 'Pizza española, 50 g de salami\r\n50 g de chorizo\r\n50 g de beicon (tocino o tocineta)\r\n100 g de queso emmental\r\n150 g de queso mozzarella\r\n200 ml de tomate triturado o salsa de tomate\r\nPimienta\r\nOrégano\r\nSal\r\nAceite de oliv', 'images/piza.jpg', 720),
(40, 'Empanadas Jamon y Queso', 9, 'Empanadas de jamon y queso, fritas en grasa. el precio es por empanada', 'images/empanadas.jpg', 140),
(41, 'Helado Chino', 10, 'Helado marca Chino de todos los gustos. el precio es por 1/4', 'images/heladochino.jpg', 400),
(42, 'Sandwich de Carne', 9, 'Sandwich de mila de carne vacuna, con jamon, queso, tomate, lechuga y pan fresco', 'images/sandwich-de-milanesa.jpg', 755),
(43, 'Cerveza Quilmes', 3, 'Cerveza quilmes rubia de litro.', 'images/quilmes-cervezajpg.jpg', 250),
(44, 'Coca Cola clasica', 2, 'Coca cola de 1litro y medio clasica', 'images/cocacola.jpg', 250),
(45, 'Empanadas de carne', 9, 'Empanadas de carne, con aceitunas,huevo,morron,cebolla. el precio es por empanada', 'images/empanadacarne.jpg', 120);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `id` int(11) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `mensaje` varchar(535) NOT NULL,
  `fecha` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`id`, `titulo`, `mensaje`, `fecha`) VALUES
(9, 'Cerrado', 'El dia de hoy el delivery se encuntra cerrado.\r\nVolveremos a abrir en febrero', '23-11-2021'),
(10, 'OFERTA PIZZA JAMON Y QUESO', 'Tenemos 2 x 1 la pizza de jamon y queso, no se la pierda\r\nclick  <a href=\"productos\">aqui</a> para ir a ver productos', '23-11-2021'),
(11, 'CERVEZA SIN STOCK', 'La cerveza linea Quilmes actualmente no tiene stock', '23-11-2021'),
(12, 'Cigarrillos', 'Pronto venderemos cigarrillos tambien', '23-11-2021'),
(13, 'Nuevo telefono de contacto', 'Tenemos otro nuevo telefono de contacto, tel: 2938 - 02429393', '23-11-2021');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `nick` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(100) NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `admin`, `nick`, `nombre`, `apellido`, `direccion`, `telefono`, `email`, `password`) VALUES
(30, 1, 'jeep12', 'Juan', 'Encabo', '', '123', '', '$argon2id$v=19$m=65536,t=4,p=1$Rk5GYzExTUpyNVQ2LzhiRg$MzI50sz5c9vCDl+EF+zd2CmKqLA8CwKkzXAcznGTxJ4');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_comida_fk` (`id_comida_fk`);

--
-- Indices de la tabla `comidas`
--
ALTER TABLE `comidas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_fk` (`categoria_fk`);

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT de la tabla `comidas`
--
ALTER TABLE `comidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_comida_fk`) REFERENCES `comidas` (`id`);

--
-- Filtros para la tabla `comidas`
--
ALTER TABLE `comidas`
  ADD CONSTRAINT `comidas_ibfk_1` FOREIGN KEY (`categoria_fk`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
