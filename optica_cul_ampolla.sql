-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-10-2020 a las 16:40:46
-- Versión del servidor: 10.1.22-MariaDB
-- Versión de PHP: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `optica_cul_ampolla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brand`
--

CREATE TABLE `brand` (
  `id_brand` int(11) NOT NULL,
  `id_supplier` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `brand`
--

INSERT INTO `brand` (`id_brand`, `id_supplier`, `name`) VALUES
(5, 6, 'RayBan'),
(6, 6, 'D&G'),
(7, 6, 'Tous'),
(8, 3, 'Persol'),
(9, 5, 'Carrera'),
(10, 4, 'Oakley'),
(11, 4, 'Arnette');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `surname` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `address` text COLLATE utf8mb4_bin,
  `phone` varchar(12) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `nif` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `registration_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `recommendation_customer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `customer`
--

INSERT INTO `customer` (`id_customer`, `name`, `surname`, `address`, `phone`, `email`, `nif`, `registration_date`, `recommendation_customer`) VALUES
(1, 'Ramón', 'Pérez Gandía', 'c/ Veleta, 5, Santa Perpetua de Mogoda, 08130.', '633205514', 'r.perez@hotmail.com', '65587477F', '2020-09-29 08:43:13', NULL),
(3, 'Magda', 'Soroya Fino', 'c/ Serrano, 76, 4º2ª, Jerez de la Frontera, 11407.', '647152201', 'm.soroya@gmail.com', '35582219M', '2020-09-29 08:46:35', NULL),
(4, 'Rubén', 'Mirano Terraza', 'c/ Giralda, 90, 1º, San Sebastián de los Reyes, 28703.', '633526689', 'r.mirano@hotmail.es', '54442188E', '2020-09-29 08:48:06', NULL),
(5, 'Francisca', 'Toledano Casado', 'c/ Santa Margarita, 54, Logroño, 26005.', '622158730', NULL, '98630220A', '2020-09-29 08:50:04', 1),
(6, 'Soledad', 'Sotelo Serrano', 'c/ Bailén, 65, 2º2ª, Logroño, 26007.', '935426581', NULL, '98851411L', '2020-09-29 08:51:48', 5),
(7, 'Sandra', 'Tornés Aguado', 'c/ Ropero, 3, Santa Amalia, 06410.', '938742111', 's.tornes@gmail.com', '68973220D', '2020-09-29 08:53:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee`
--

CREATE TABLE `employee` (
  `id_employee` int(11) NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `surname` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `employee`
--

INSERT INTO `employee` (`id_employee`, `name`, `surname`) VALUES
(1, 'Rocío', 'Crespillo Fernández'),
(2, 'Tania', 'Rodríguez Sol'),
(3, 'Alex', 'Arriaza Goleta'),
(4, 'Daniel', 'Lozano Rey');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frame_type`
--

CREATE TABLE `frame_type` (
  `id_frame_type` int(11) NOT NULL,
  `type` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `frame_type`
--

INSERT INTO `frame_type` (`id_frame_type`, `type`) VALUES
(1, 'Metálica'),
(2, 'Pasta'),
(4, 'Al aire');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glasses`
--

CREATE TABLE `glasses` (
  `id_glasses` int(11) NOT NULL,
  `id_brand` int(11) DEFAULT NULL,
  `id_frame_type` int(11) DEFAULT NULL,
  `frame_color` enum('Azul','Verde','Amarillo','Rojo','Marrón','Naranja','Blanco','Negro','Lila','Multicolor') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `glasses`
--

INSERT INTO `glasses` (`id_glasses`, `id_brand`, `id_frame_type`, `frame_color`, `price`) VALUES
(3, 7, 2, 'Negro', 200),
(4, 7, 2, 'Azul', 200),
(5, 7, 2, 'Verde', 250),
(6, 5, 2, 'Negro', 90),
(7, 6, 1, 'Azul', 300),
(8, 6, 4, 'Rojo', 220),
(9, 9, 2, 'Multicolor', 150);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glasses_order`
--

CREATE TABLE `glasses_order` (
  `id_glasses_order` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_customer` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `id_glasses` int(11) NOT NULL,
  `right_glass_refraction` double NOT NULL,
  `left_glass_refraction` double NOT NULL,
  `right_glass_color` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `left_glass_color` varchar(50) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `glasses_order`
--

INSERT INTO `glasses_order` (`id_glasses_order`, `date`, `id_customer`, `id_employee`, `id_glasses`, `right_glass_refraction`, `left_glass_refraction`, `right_glass_color`, `left_glass_color`) VALUES
(1, '2020-09-29 10:47:55', 5, 3, 7, 1, 1, 'Transparente', 'Transparente'),
(2, '2020-09-29 10:48:56', 1, 1, 6, 0, 0, 'Verde', 'Verde'),
(3, '2020-09-29 10:50:01', 7, 2, 9, 5, 5, 'Transparente', 'Transparente'),
(4, '2020-09-29 10:51:01', 3, 2, 5, 3, 3, 'Transparente', 'Transparente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `phone` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `fax` varchar(12) COLLATE utf8mb4_bin DEFAULT NULL,
  `cif` varchar(12) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `name`, `phone`, `fax`, `cif`) VALUES
(3, 'Monturas Aguado', '974521485', NULL, 'D48465058'),
(4, 'Cristalería Fidemon', '962145888', NULL, 'S5222498G'),
(5, 'Gafas Forenqui', '954855412', NULL, 'B13829940'),
(6, 'Supergafas Tres', '934155278', NULL, 'B67657189');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supplier_address`
--

CREATE TABLE `supplier_address` (
  `id_address` int(11) NOT NULL,
  `id_supplier` int(11) DEFAULT NULL,
  `street` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `number` smallint(6) NOT NULL,
  `floor` tinyint(4) DEFAULT NULL,
  `door` tinyint(4) DEFAULT NULL,
  `city` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `postal_code` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `country` varchar(58) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `supplier_address`
--

INSERT INTO `supplier_address` (`id_address`, `id_supplier`, `street`, `number`, `floor`, `door`, `city`, `postal_code`, `country`) VALUES
(2, 4, 'c/ Goleta', 76, NULL, NULL, 'Madrid', '28047', 'España'),
(3, 6, 'c/ Dinamarca', 4, 3, NULL, 'Sant Quirze del Vallès', '08192', 'España'),
(4, 5, 'c/ Dom Bosco', 43, 2, 1, 'Palencia', '34002', 'España'),
(5, 3, 'c/ Sorolla', 2, NULL, NULL, 'Algeciras', '11205', 'España');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id_brand`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indices de la tabla `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`),
  ADD UNIQUE KEY `nif` (`nif`),
  ADD KEY `recommendation_customer` (`recommendation_customer`);

--
-- Indices de la tabla `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id_employee`);

--
-- Indices de la tabla `frame_type`
--
ALTER TABLE `frame_type`
  ADD PRIMARY KEY (`id_frame_type`);

--
-- Indices de la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD PRIMARY KEY (`id_glasses`),
  ADD KEY `id_frame_type` (`id_frame_type`),
  ADD KEY `id_brand` (`id_brand`);

--
-- Indices de la tabla `glasses_order`
--
ALTER TABLE `glasses_order`
  ADD PRIMARY KEY (`id_glasses_order`),
  ADD KEY `id_glasses` (`id_glasses`),
  ADD KEY `id_employee` (`id_employee`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indices de la tabla `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`),
  ADD UNIQUE KEY `cif` (`cif`);

--
-- Indices de la tabla `supplier_address`
--
ALTER TABLE `supplier_address`
  ADD PRIMARY KEY (`id_address`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brand`
--
ALTER TABLE `brand`
  MODIFY `id_brand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `employee`
--
ALTER TABLE `employee`
  MODIFY `id_employee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `frame_type`
--
ALTER TABLE `frame_type`
  MODIFY `id_frame_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `glasses`
--
ALTER TABLE `glasses`
  MODIFY `id_glasses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `glasses_order`
--
ALTER TABLE `glasses_order`
  MODIFY `id_glasses_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `supplier_address`
--
ALTER TABLE `supplier_address`
  MODIFY `id_address` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `brand`
--
ALTER TABLE `brand`
  ADD CONSTRAINT `brand_ibfk_1` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`);

--
-- Filtros para la tabla `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`recommendation_customer`) REFERENCES `customer` (`id_customer`);

--
-- Filtros para la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD CONSTRAINT `glasses_ibfk_1` FOREIGN KEY (`id_frame_type`) REFERENCES `frame_type` (`id_frame_type`),
  ADD CONSTRAINT `glasses_ibfk_2` FOREIGN KEY (`id_brand`) REFERENCES `brand` (`id_brand`);

--
-- Filtros para la tabla `glasses_order`
--
ALTER TABLE `glasses_order`
  ADD CONSTRAINT `glasses_order_ibfk_1` FOREIGN KEY (`id_glasses`) REFERENCES `glasses` (`id_glasses`),
  ADD CONSTRAINT `glasses_order_ibfk_2` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id_employee`),
  ADD CONSTRAINT `glasses_order_ibfk_3` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`);

--
-- Filtros para la tabla `supplier_address`
--
ALTER TABLE `supplier_address`
  ADD CONSTRAINT `supplier_address_ibfk_1` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
