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

-- Volcando datos para la tabla credicel_radicado_documentos.Acta: ~4 rows (aproximadamente)
DELETE FROM `Acta`;
/*!40000 ALTER TABLE `Acta` DISABLE KEYS */;
INSERT INTO `Acta` (`Id`, `Tipo_documento`, `Fecha_creacion`, `Motivo_documento`, `Funcionario_solictante`, `Dependencia_solicitante`) VALUES
	(2, 'Acta', '2024-07-24 20:36:12', 'JUNTA DE PATIOS', 'WILSON GUTIERREZ IZQUIERDO', 'COMANDO DE VIGILANCIA'),
	(3, 'Acta', '2024-07-24 20:36:38', 'CALIFICACION DE CONDUCTAS ', 'CARMEN SILVA PARADA', 'CONDUCTAS'),
	(4, 'Acta', '2024-07-24 20:37:10', 'SOCIALIZACION INSTRUCCIONES DE SEGURIDAD', 'WILSON GUTIERREZ IZQUIERDO', 'COMANDO DE VIGILANCIA'),
	(5, 'Acta', '2024-07-24 20:37:41', 'COMITE DE CONVIVENCIA CASO # 123', 'MAURICIO ARENAS CARDENAS', 'COMITE DE CONVIVENCIA LABORAL');
/*!40000 ALTER TABLE `Acta` ENABLE KEYS */;

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

-- Volcando datos para la tabla credicel_radicado_documentos.Login: ~2 rows (aproximadamente)
DELETE FROM `Login`;
/*!40000 ALTER TABLE `Login` DISABLE KEYS */;
INSERT INTO `Login` (`Id`, `Cedula`, `Contraseña`, `Id_rol`) VALUES
	(9, 14325202, '123456*', 1),
	(10, 63330982, '123456*', 2),
	(11, 35789415, '123456*', 2);
/*!40000 ALTER TABLE `Login` ENABLE KEYS */;

-- Volcando datos para la tabla credicel_radicado_documentos.Resolucion: ~2 rows (aproximadamente)
DELETE FROM `Resolucion`;
/*!40000 ALTER TABLE `Resolucion` DISABLE KEYS */;
INSERT INTO `Resolucion` (`Id`, `Tipo_documento`, `Fecha_creacion`, `Motivo_documento`, `Funcionario_solicitante`, `Dependencia_solictante`) VALUES
	(2, 'Resolución', '2024-07-24 20:38:39', 'TRASLADO PPL XXXX ', 'MAURICIO ARENAS CARDENAS', 'DIRECCION'),
	(3, 'Resolución', '2024-07-24 20:39:06', 'SANCION 1 INSTANCIA PPL XXXX', 'CARMEN SILVA PARADA', 'INVESTIGACIONES A INTERNOS'),
	(4, 'Resolución', '2024-07-24 20:41:13', 'DISPOSICION FINAL ETM 3 TRIMESTRE AÑO 2023', 'WILSON GUTIERREZ IZQUIERDO', 'POLICIA JUDICIAL');
/*!40000 ALTER TABLE `Resolucion` ENABLE KEYS */;

-- Volcando datos para la tabla credicel_radicado_documentos.Rol: ~2 rows (aproximadamente)
DELETE FROM `Rol`;
/*!40000 ALTER TABLE `Rol` DISABLE KEYS */;
INSERT INTO `Rol` (`Id`, `Rol`) VALUES
	(1, 'Administrador'),
	(2, 'Usuario');
/*!40000 ALTER TABLE `Rol` ENABLE KEYS */;

-- Volcando datos para la tabla credicel_radicado_documentos.Tipo_documento: ~2 rows (aproximadamente)
DELETE FROM `Tipo_documento`;
/*!40000 ALTER TABLE `Tipo_documento` DISABLE KEYS */;
INSERT INTO `Tipo_documento` (`Id`, `Tipo`) VALUES
	(1, 'Acta'),
	(2, 'Resolución');
/*!40000 ALTER TABLE `Tipo_documento` ENABLE KEYS */;

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
