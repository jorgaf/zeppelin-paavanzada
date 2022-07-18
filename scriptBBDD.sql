# Creación de BASE DE DATOS

DROP DATABASE IF EXISTS `P_AVANZADA`;
CREATE DATABASE P_AVANZADA;

# Creación del usuario
CREATE USER IF NOT EXISTS 'pavanzada'@'localhost' IDENTIFIED BY 'pAvanzada@utpl.edu.ec';

USE P_AVANZADA;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla CLASIFICACION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CLASIFICACION`;

CREATE TABLE `CLASIFICACION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `CLASIFICACION` WRITE;
/*!40000 ALTER TABLE `CLASIFICACION` DISABLE KEYS */;

INSERT INTO `CLASIFICACION` (`ID`, `NOMBRE`)
VALUES
	(1,'Alimentos y bebidas'),
	(2,'Alojamiento'),
	(3,'Centro de turismo comunitario'),
	(4,'Intermediación'),
	(5,'Operación e intermediación'),
	(6,'Parques de atracción estable'),
	(7,'Transporte turístico');

/*!40000 ALTER TABLE `CLASIFICACION` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla PROVINCIA
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PROVINCIA`;

CREATE TABLE `PROVINCIA` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(128) DEFAULT NULL,
  `REGION_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `REGION_ID_idxfk` (`REGION_ID`),
  CONSTRAINT `provincia_ibfk_1` FOREIGN KEY (`REGION_ID`) REFERENCES `REGION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `PROVINCIA` WRITE;
/*!40000 ALTER TABLE `PROVINCIA` DISABLE KEYS */;

INSERT INTO `PROVINCIA` (`ID`, `NOMBRE`, `REGION_ID`)
VALUES
	(1,'AZUAY',4),
	(2,'BOLÍVAR',4),
	(3,'CAÑAR',4),
	(4,'CARCHI',4),
	(5,'CHIMBORAZO',4),
	(6,'COTOPAXI',4),
	(7,'EL ORO',1),
	(8,'ESMERALDAS',1),
	(9,'GALÁPAGOS',2),
	(10,'GUAYAS',1),
	(11,'IMBABURA',4),
	(12,'LOJA',4),
	(13,'LOS RÍOS',1),
	(14,'MANABÍ',1),
	(15,'MORONA SANTIAGO',3),
	(16,'NAPO',3),
	(17,'ORELLANA',3),
	(18,'PASTAZA',3),
	(19,'PICHINCHA',4),
	(20,'SANTA ELENA',1),
	(21,'SANTO DOMINGO DE LOS TSÁCHILAS',1),
	(22,'SUCUMBÍOS',3),
	(23,'TUNGURAHUA',4),
	(24,'ZAMORA CHINCHIPE',3);

/*!40000 ALTER TABLE `PROVINCIA` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla REGION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `REGION`;

CREATE TABLE `REGION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `REGION` WRITE;
/*!40000 ALTER TABLE `REGION` DISABLE KEYS */;

INSERT INTO `REGION` (`ID`, `NOMBRE`)
VALUES
	(1,'Costa'),
	(2,'Insular'),
	(3,'Oriente'),
	(4,'Sierra');

/*!40000 ALTER TABLE `REGION` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla REGISTRO_EMPRENDIMIENTO
# ------------------------------------------------------------

DROP TABLE IF EXISTS `REGISTRO_EMPRENDIMIENTO`;

CREATE TABLE `REGISTRO_EMPRENDIMIENTO` (
  `ID` int(11) DEFAULT NULL,
  `ANIO` int(11) DEFAULT NULL,
  `TRIMESTRE` int(11) DEFAULT NULL,
  `PROVINCIA_ID` int(11) DEFAULT NULL,
  `SUBCLASIFICACION_ID` int(11) DEFAULT NULL,
  `CANTIDAD_REGISTROS` int(11) DEFAULT NULL,
  KEY `PROVINCIA_ID_idxfk` (`PROVINCIA_ID`),
  KEY `SUBCLASIFICACION_ID_idxfk` (`SUBCLASIFICACION_ID`),
  CONSTRAINT `registro_emprendimiento_ibfk_2` FOREIGN KEY (`SUBCLASIFICACION_ID`) REFERENCES `SUBCLASIFICACION` (`ID`),
  CONSTRAINT `registro_emprendimiento_ibfk_1` FOREIGN KEY (`PROVINCIA_ID`) REFERENCES `PROVINCIA` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `REGISTRO_EMPRENDIMIENTO` WRITE;
/*!40000 ALTER TABLE `REGISTRO_EMPRENDIMIENTO` DISABLE KEYS */;

INSERT INTO `REGISTRO_EMPRENDIMIENTO` (`ID`, `ANIO`, `TRIMESTRE`, `PROVINCIA_ID`, `SUBCLASIFICACION_ID`, `CANTIDAD_REGISTROS`)
VALUES
	(1,2022,2,1,7,1),
	(2,2022,2,1,2,3),
	(3,2022,2,5,2,1),
	(4,2022,2,6,7,1),
	(5,2022,2,10,2,4),
	(6,2022,2,10,37,1),
	(7,2022,2,11,2,1),
	(8,2022,2,14,2,2),
	(9,2022,2,19,31,3),
	(10,2022,2,19,2,7),
	(11,2022,2,19,8,1),
	(12,2022,2,19,37,1);

/*!40000 ALTER TABLE `REGISTRO_EMPRENDIMIENTO` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla SUBCLASIFICACION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SUBCLASIFICACION`;

CREATE TABLE `SUBCLASIFICACION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `CLASIFICACION_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CLASIFICACION_ID_idxfk` (`CLASIFICACION_ID`),
  CONSTRAINT `subclasificacion_ibfk_1` FOREIGN KEY (`CLASIFICACION_ID`) REFERENCES `CLASIFICACION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `SUBCLASIFICACION` WRITE;
/*!40000 ALTER TABLE `SUBCLASIFICACION` DISABLE KEYS */;

INSERT INTO `SUBCLASIFICACION` (`ID`, `NOMBRE`, `CLASIFICACION_ID`)
VALUES
	(1,'Bar',1),
	(2,'Cafetería',1),
	(3,'Discoteca',1),
	(4,'Establecimiento Móvil',1),
	(5,'Fuente de Soda',1),
	(6,'Plazas de Comida',1),
	(7,'Restaurante',1),
	(8,'Servicio de Catering',1),
	(9,'Cabaña',2),
	(10,'Campamento Turístico',2),
	(11,'Casa de Huéspedes',2),
	(12,'Hacienda Turística',2),
	(13,'Hostal',2),
	(14,'Hostal Residencia',2),
	(15,'Hostería',2),
	(16,'Hotel',2),
	(17,'Lodge',2),
	(18,'Pension',2),
	(19,'Refugio',2),
	(20,'Resort',2),
	(21,'Centro de Turismo Comunitario',3),
	(22,'Centro de Convenciones',4),
	(23,'Centro de Recreación Turística',4),
	(24,'Organizadores de Eventos, Congresos y Convenciones',4),
	(25,'Peña',4),
	(26,'Sala de Baile',4),
	(27,'Sala de Recepciones y Banquetes',4),
	(28,'Agencia de Viajes Dual',5),
	(29,'Agencia de Viajes Internacional',5),
	(30,'Agencia de Viajes Mayorista',5),
	(31,'Operador Turístico',5),
	(32,'Bolera',6),
	(33,'Pista de Patinaje',6),
	(34,'Termas y Balnearios',6),
	(35,'Transporte Aéreo',7),
	(36,'Transporte Maritimo y Fluvial',7),
	(37,'Transporte Terrestre',7);

/*!40000 ALTER TABLE `SUBCLASIFICACION` ENABLE KEYS */;
UNLOCK TABLES;

#Otorgar privilegios
GRANT ALL PRIVILEGES ON P_AVANZADA.* TO 'pavanzada'@'localhost';
FLUSH PRIVILEGES;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
