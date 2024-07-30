-- Autor: Wilson Gutierrez Izquierdo
-- Fecha de creación: 29/07/24
-- Versión 1
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

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla credicel_radicado_documentos.Rol
DROP TABLE IF EXISTS `Rol`;
CREATE TABLE IF NOT EXISTS `Rol` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Rol` char(50) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Rol` (`Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci COMMENT='esta tabla es para definir los roles de los usuarios en la empresa';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla credicel_radicado_documentos.Tipo_documento
DROP TABLE IF EXISTS `Tipo_documento`;
CREATE TABLE IF NOT EXISTS `Tipo_documento` (
  `Id` int(1) NOT NULL AUTO_INCREMENT,
  `Tipo` char(12) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Tipo` (`Tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci COMMENT='esta tabla es para definir los tipos de documentos que expide la empresa';

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
