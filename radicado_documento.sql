-- --------------------------------------------------------
-- Host:                         190.90.160.172
-- Versión del servidor:         10.6.18-MariaDB-cll-lve-log - MariaDB Server
-- SO del servidor:              Linux
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla credicel_radicado_documentos.Acta
DROP TABLE IF EXISTS `Acta`;
CREATE TABLE IF NOT EXISTS `Acta` (
  `Id` int(4) NOT NULL AUTO_INCREMENT,
  `Tipo_documento` char(12) DEFAULT 'Acta',
  `Fecha_creacion` datetime DEFAULT NULL,
  `Motivo_documento` varchar(70) DEFAULT NULL,
  `Funcionario_solictante` varchar(50) DEFAULT NULL,
  `Dependencia_solicitante` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_area` (`Dependencia_solicitante`),
  KEY `Id_documento` (`Tipo_documento`),
  KEY `Id_funcionario` (`Funcionario_solictante`),
  CONSTRAINT `Acta_ibfk_1` FOREIGN KEY (`Dependencia_solicitante`) REFERENCES `Area` (`Dependencia`),
  CONSTRAINT `Acta_ibfk_3` FOREIGN KEY (`Funcionario_solictante`) REFERENCES `Usuarios` (`Nombres_funcionario`),
  CONSTRAINT `FK_acta_tipo_documento` FOREIGN KEY (`Tipo_documento`) REFERENCES `Tipo_documento` (`Tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci ROW_FORMAT=COMPACT COMMENT='esta tabla es para el consecutivo de los documentos de tipo actas';

-- Volcando datos para la tabla credicel_radicado_documentos.Acta: ~4 rows (aproximadamente)
DELETE FROM `Acta`;
/*!40000 ALTER TABLE `Acta` DISABLE KEYS */;
INSERT INTO `Acta` (`Id`, `Tipo_documento`, `Fecha_creacion`, `Motivo_documento`, `Funcionario_solictante`, `Dependencia_solicitante`) VALUES
	(2, 'Acta', '2024-07-24 20:36:12', 'JUNTA DE PATIOS', 'WILSON GUTIERREZ IZQUIERDO', 'COMANDO DE VIGILANCIA'),
	(3, 'Acta', '2024-07-24 20:36:38', 'CALIFICACION DE CONDUCTAS ', 'CARMEN SILVA PARADA', 'CONDUCTAS'),
	(4, 'Acta', '2024-07-24 20:37:10', 'SOCIALIZACION INSTRUCCIONES DE SEGURIDAD', 'WILSON GUTIERREZ IZQUIERDO', 'COMANDO DE VIGILANCIA'),
	(5, 'Acta', '2024-07-24 20:37:41', 'COMITE DE CONVIVENCIA CASO # 123', 'MAURICIO ARENAS CARDENAS', 'COMITE DE CONVIVENCIA LABORAL');
/*!40000 ALTER TABLE `Acta` ENABLE KEYS */;

-- Volcando estructura para tabla credicel_radicado_documentos.Area
DROP TABLE IF EXISTS `Area`;
CREATE TABLE IF NOT EXISTS `Area` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Dependencia` varchar(50) DEFAULT NULL,
  `Id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Dependencia` (`Dependencia`),
  KEY `Id_usuario` (`Id_usuario`),
  CONSTRAINT `FK_area_usuarios` FOREIGN KEY (`Id_usuario`) REFERENCES `Usuarios` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci COMMENT='esta tabla es para la creacion de los areas y/o dependencias de los puestos de trabajo de una empresa';

-- Volcando datos para la tabla credicel_radicado_documentos.Area: ~24 rows (aproximadamente)
DELETE FROM `Area`;
/*!40000 ALTER TABLE `Area` DISABLE KEYS */;
INSERT INTO `Area` (`Id`, `Dependencia`, `Id_usuario`) VALUES
	(1, 'DIRECCION', 2),
	(2, 'SUBDIRECCION', NULL),
	(3, 'COMANDO DE VIGILANCIA', 1),
	(4, 'JURIDICA', 2),
	(5, 'TALENTO HUMANO', NULL),
	(6, 'PAGADURIA', NULL),
	(7, 'FINANCIERA', NULL),
	(8, 'PLANEACION', NULL),
	(9, 'DOMICILIARIAS', 1),
	(10, 'ALMACEN GENERAL', NULL),
	(11, 'SISTEMAS', NULL),
	(12, 'INVESTIGACIONES A INTERNOS', NULL),
	(13, 'EDUCATIVAS', NULL),
	(14, 'POLICIA JUDICIAL', 3),
	(15, 'CONDUCTAS', NULL),
	(16, 'REGISTRO Y CONTROL', NULL),
	(17, 'DERECHOS HUMANOS', NULL),
	(18, 'BIENESTAR SOCIAL', NULL),
	(19, 'COMITE DE CONVIVENCIA LABORAL', 3),
	(20, 'COPASS', NULL),
	(21, 'BENEFICIOS ADMINISTRATIVOS', NULL),
	(22, 'RESEÑA', NULL),
	(23, 'ATENCION AL CIUDADANO', NULL),
	(24, 'REINSERCION SOCIAL', 1);
/*!40000 ALTER TABLE `Area` ENABLE KEYS */;

-- Volcando estructura para tabla credicel_radicado_documentos.Login
DROP TABLE IF EXISTS `Login`;
CREATE TABLE IF NOT EXISTS `Login` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Cedula` int(11) DEFAULT NULL,
  `Contraseña` varchar(15) DEFAULT NULL,
  `Id_rol` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Usuario` (`Cedula`),
  KEY `Tipo_rol` (`Id_rol`),
  CONSTRAINT `FK1login` FOREIGN KEY (`Cedula`) REFERENCES `Usuarios` (`Cedula`),
  CONSTRAINT `FK_login_rol` FOREIGN KEY (`Id_rol`) REFERENCES `Rol` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci COMMENT='esta tabla es para el ingreso con sus respectivos roles en la bd';

-- Volcando datos para la tabla credicel_radicado_documentos.Login: ~3 rows (aproximadamente)
DELETE FROM `Login`;
/*!40000 ALTER TABLE `Login` DISABLE KEYS */;
INSERT INTO `Login` (`Id`, `Cedula`, `Contraseña`, `Id_rol`) VALUES
	(9, 14325202, '123456*', 1),
	(10, 63330982, '123456*', 2),
	(11, 35789415, '123456*', 2);
/*!40000 ALTER TABLE `Login` ENABLE KEYS */;

-- Volcando estructura para tabla credicel_radicado_documentos.Resolucion
DROP TABLE IF EXISTS `Resolucion`;
CREATE TABLE IF NOT EXISTS `Resolucion` (
  `Id` int(4) NOT NULL AUTO_INCREMENT,
  `Tipo_documento` char(12) DEFAULT 'Resolucion',
  `Fecha_creacion` datetime DEFAULT NULL,
  `Motivo_documento` varchar(70) DEFAULT NULL,
  `Funcionario_solicitante` varchar(50) DEFAULT NULL,
  `Dependencia_solictante` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_area` (`Dependencia_solictante`),
  KEY `Id_documento` (`Tipo_documento`),
  KEY `Id_funcionario` (`Funcionario_solicitante`),
  CONSTRAINT `FK_radicador_area` FOREIGN KEY (`Dependencia_solictante`) REFERENCES `Area` (`Dependencia`),
  CONSTRAINT `FK_radicador_usuarios` FOREIGN KEY (`Funcionario_solicitante`) REFERENCES `Usuarios` (`Nombres_funcionario`),
  CONSTRAINT `FK_resolucion_tipo_documento` FOREIGN KEY (`Tipo_documento`) REFERENCES `Tipo_documento` (`Tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci COMMENT='esta tabla es para el consecutivo de los documentos de tipo resoluciones\r\n';

-- Volcando datos para la tabla credicel_radicado_documentos.Resolucion: ~3 rows (aproximadamente)
DELETE FROM `Resolucion`;
/*!40000 ALTER TABLE `Resolucion` DISABLE KEYS */;
INSERT INTO `Resolucion` (`Id`, `Tipo_documento`, `Fecha_creacion`, `Motivo_documento`, `Funcionario_solicitante`, `Dependencia_solictante`) VALUES
	(2, 'Resolución', '2024-07-24 20:38:39', 'TRASLADO PPL XXXX ', 'MAURICIO ARENAS CARDENAS', 'DIRECCION'),
	(3, 'Resolución', '2024-07-24 20:39:06', 'SANCION 1 INSTANCIA PPL XXXX', 'CARMEN SILVA PARADA', 'INVESTIGACIONES A INTERNOS'),
	(4, 'Resolución', '2024-07-24 20:41:13', 'DISPOSICION FINAL ETM 3 TRIMESTRE AÑO 2023', 'WILSON GUTIERREZ IZQUIERDO', 'POLICIA JUDICIAL');
/*!40000 ALTER TABLE `Resolucion` ENABLE KEYS */;

-- Volcando estructura para tabla credicel_radicado_documentos.Rol
DROP TABLE IF EXISTS `Rol`;
CREATE TABLE IF NOT EXISTS `Rol` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Rol` char(50) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Rol` (`Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci COMMENT='esta tabla es para definir los roles de los usuarios en la empresa';

-- Volcando datos para la tabla credicel_radicado_documentos.Rol: ~2 rows (aproximadamente)
DELETE FROM `Rol`;
/*!40000 ALTER TABLE `Rol` DISABLE KEYS */;
INSERT INTO `Rol` (`Id`, `Rol`) VALUES
	(1, 'Administrador'),
	(2, 'Usuario');
/*!40000 ALTER TABLE `Rol` ENABLE KEYS */;

-- Volcando estructura para tabla credicel_radicado_documentos.Tipo_documento
DROP TABLE IF EXISTS `Tipo_documento`;
CREATE TABLE IF NOT EXISTS `Tipo_documento` (
  `Id` int(1) NOT NULL AUTO_INCREMENT,
  `Tipo` char(12) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Tipo` (`Tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci COMMENT='esta tabla es para definir los tipos de documentos que expide la empresa';

-- Volcando datos para la tabla credicel_radicado_documentos.Tipo_documento: ~2 rows (aproximadamente)
DELETE FROM `Tipo_documento`;
/*!40000 ALTER TABLE `Tipo_documento` DISABLE KEYS */;
INSERT INTO `Tipo_documento` (`Id`, `Tipo`) VALUES
	(1, 'Acta'),
	(2, 'Resolución');
/*!40000 ALTER TABLE `Tipo_documento` ENABLE KEYS */;

-- Volcando estructura para tabla credicel_radicado_documentos.Usuarios
DROP TABLE IF EXISTS `Usuarios`;
CREATE TABLE IF NOT EXISTS `Usuarios` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Cedula` int(11) DEFAULT NULL,
  `Nombres_funcionario` varchar(50) DEFAULT NULL,
  `Cargo` char(50) DEFAULT NULL,
  `Grado` int(2) NOT NULL,
  `Codigo` int(4) NOT NULL,
  `Fecha_posesion` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Cedula` (`Cedula`),
  KEY `Funcionario` (`Nombres_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci COMMENT='esta tabla es para crear a los usuarios que utilizaran la base de datos';

-- Volcando datos para la tabla credicel_radicado_documentos.Usuarios: ~3 rows (aproximadamente)
DELETE FROM `Usuarios`;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
INSERT INTO `Usuarios` (`Id`, `Cedula`, `Nombres_funcionario`, `Cargo`, `Grado`, `Codigo`, `Fecha_posesion`) VALUES
	(1, 14325202, 'WILSON GUTIERREZ IZQUIERDO', 'TENIENTE', 16, 4222, '1999-02-05'),
	(2, 63330982, 'CARMEN SILVA PARADA', 'ADMINSITRATVIO', 9, 4609, '2017-06-26'),
	(3, 35789415, 'MAURICIO ARENAS CARDENAS', 'DRAGONEANTE', 11, 4114, '2020-12-31');
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
