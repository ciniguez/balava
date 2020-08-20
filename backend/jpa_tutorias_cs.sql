-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 20-08-2020 a las 13:27:16
-- Versión del servidor: 8.0.19
-- Versión de PHP: 7.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jpa_tutorias_cs`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DEPARTAMENTO`
--

CREATE TABLE `DEPARTAMENTO` (
  `dep_codigo` int NOT NULL,
  `dep_nombre` varchar(64) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `DEPARTAMENTO`
--

INSERT INTO `DEPARTAMENTO` (`dep_codigo`, `dep_nombre`) VALUES
(1, 'INTERACCION HUMANO COMPUTADOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DOCENTE`
--

CREATE TABLE `DOCENTE` (
  `PRO_ID` int NOT NULL,
  `PRO_NUM_OFICINA` int DEFAULT NULL,
  `DEP_CODIGO` int NOT NULL,
  `USU_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `DOCENTE`
--

INSERT INTO `DOCENTE` (`PRO_ID`, `PRO_NUM_OFICINA`, `DEP_CODIGO`, `USU_ID`) VALUES
(1, 2005, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ESTUDIANTE`
--

CREATE TABLE `ESTUDIANTE` (
  `EST_ID` int NOT NULL,
  `EST_CEDULA` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `EST_GENERO` int NOT NULL,
  `USU_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ESTUDIANTE`
--

INSERT INTO `ESTUDIANTE` (`EST_ID`, `EST_CEDULA`, `EST_GENERO`, `USU_ID`) VALUES
(1, '1719477360', 1, 1),
(2, '1719477370', 0, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TUTORIA`
--

CREATE TABLE `TUTORIA` (
  `TUT_ID` int NOT NULL,
  `TUT_FECHA` date NOT NULL,
  `TUT_TEMA` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PRO_ID` int NOT NULL,
  `EST_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `TUTORIA`
--

INSERT INTO `TUTORIA` (`TUT_ID`, `TUT_FECHA`, `TUT_TEMA`, `PRO_ID`, `EST_ID`) VALUES
(1, '2020-09-20', 'Estilos y Paradigmas de interacción', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USUARIO`
--

CREATE TABLE `USUARIO` (
  `USU_ID` int NOT NULL,
  `USU_APELLIDO` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `USU_CLAVE` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `USU_CORREO` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `USU_NOMBRE` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `US_PERFIL` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `USUARIO`
--

INSERT INTO `USUARIO` (`USU_ID`, `USU_APELLIDO`, `USU_CLAVE`, `USU_CORREO`, `USU_NOMBRE`, `US_PERFIL`) VALUES
(1, 'RIVAS', 'est111', 'ismael.rivas@epn.edu.ec', 'ISMAEL', 0),
(2, 'HALLO', 'pro123', 'maria.hallo@epn.edu.ec', 'MARIA', 1),
(3, 'SEVILLA', 'est112', 'daniela.sevilla@epn.edu.ec', 'DANIELA', 0),
(4, 'Grijalva', 'est333', 'pedro.grijalva@epn.edu.ec', 'Peddro', 1),
(5, 'Luis', 'est555', 'luis.perales@epn.edu.ec', 'Perales', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `DEPARTAMENTO`
--
ALTER TABLE `DEPARTAMENTO`
  ADD PRIMARY KEY (`dep_codigo`);

--
-- Indices de la tabla `DOCENTE`
--
ALTER TABLE `DOCENTE`
  ADD PRIMARY KEY (`PRO_ID`),
  ADD KEY `FK_DOCENTE_DEP_CODIGO` (`DEP_CODIGO`),
  ADD KEY `FK_DOCENTE_USU_ID` (`USU_ID`);

--
-- Indices de la tabla `ESTUDIANTE`
--
ALTER TABLE `ESTUDIANTE`
  ADD PRIMARY KEY (`EST_ID`),
  ADD KEY `FK_ESTUDIANTE_USU_ID` (`USU_ID`);

--
-- Indices de la tabla `TUTORIA`
--
ALTER TABLE `TUTORIA`
  ADD PRIMARY KEY (`TUT_ID`),
  ADD KEY `FK_TUTORIA_EST_ID` (`EST_ID`),
  ADD KEY `FK_TUTORIA_PRO_ID` (`PRO_ID`);

--
-- Indices de la tabla `USUARIO`
--
ALTER TABLE `USUARIO`
  ADD PRIMARY KEY (`USU_ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `DEPARTAMENTO`
--
ALTER TABLE `DEPARTAMENTO`
  MODIFY `dep_codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `DOCENTE`
--
ALTER TABLE `DOCENTE`
  MODIFY `PRO_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ESTUDIANTE`
--
ALTER TABLE `ESTUDIANTE`
  MODIFY `EST_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `TUTORIA`
--
ALTER TABLE `TUTORIA`
  MODIFY `TUT_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `USUARIO`
--
ALTER TABLE `USUARIO`
  MODIFY `USU_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `DOCENTE`
--
ALTER TABLE `DOCENTE`
  ADD CONSTRAINT `FK_DOCENTE_DEP_CODIGO` FOREIGN KEY (`DEP_CODIGO`) REFERENCES `DEPARTAMENTO` (`dep_codigo`),
  ADD CONSTRAINT `FK_DOCENTE_USU_ID` FOREIGN KEY (`USU_ID`) REFERENCES `USUARIO` (`USU_ID`);

--
-- Filtros para la tabla `ESTUDIANTE`
--
ALTER TABLE `ESTUDIANTE`
  ADD CONSTRAINT `FK_ESTUDIANTE_USU_ID` FOREIGN KEY (`USU_ID`) REFERENCES `USUARIO` (`USU_ID`);

--
-- Filtros para la tabla `TUTORIA`
--
ALTER TABLE `TUTORIA`
  ADD CONSTRAINT `FK_TUTORIA_EST_ID` FOREIGN KEY (`EST_ID`) REFERENCES `ESTUDIANTE` (`EST_ID`),
  ADD CONSTRAINT `FK_TUTORIA_PRO_ID` FOREIGN KEY (`PRO_ID`) REFERENCES `DOCENTE` (`PRO_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
