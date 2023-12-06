/*
SQLyog Ultimate v12.09 (32 bit)
MySQL - 10.4.28-MariaDB : Database - bd_tallerprogramacion
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bd_tallerprogramacion` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `bd_tallerprogramacion`;

/*Table structure for table `barrio` */

DROP TABLE IF EXISTS `barrio`;

CREATE TABLE `barrio` (
  `id_barrio` int(11) NOT NULL AUTO_INCREMENT,
  `barrio` varchar(100) NOT NULL,
  PRIMARY KEY (`id_barrio`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `barrio` */

LOCK TABLES `barrio` WRITE;

insert  into `barrio`(`id_barrio`,`barrio`) values (1,'Barrio Obrero'),(2,'Sajonia'),(3,'Tacumbu'),(4,'Encarnacion'),(5,'R. de Francia'),(6,'Gral. Diaz'),(14,'Bel Air'),(16,'Capilla del Montes');

UNLOCK TABLES;

/*Table structure for table `categoria` */

DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(500) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `categoria` */

LOCK TABLES `categoria` WRITE;

insert  into `categoria`(`id_categoria`,`categoria`,`estado`) values (1,'SmartPhone','A'),(2,'SmartTV','A'),(3,'SmartWatch','A'),(4,'Muebles de cocina','A'),(5,'Muebles de comedor','A'),(6,'Muebles de comedor','A'),(19,'Sanitarios','A');

UNLOCK TABLES;

/*Table structure for table `ciudad` */

DROP TABLE IF EXISTS `ciudad`;

CREATE TABLE `ciudad` (
  `id_ciudad` int(11) NOT NULL AUTO_INCREMENT,
  `ciudad` varchar(100) NOT NULL,
  PRIMARY KEY (`id_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ciudad` */

LOCK TABLES `ciudad` WRITE;

insert  into `ciudad`(`id_ciudad`,`ciudad`) values (1,'Asuncion'),(2,'Capiata'),(3,'Luque'),(4,'Itaugua'),(5,'Limpio'),(6,'Ciudad del Este'),(7,'Encarnacion'),(12,'Tangamandapio'),(15,'San Lorenzo');

UNLOCK TABLES;

/*Table structure for table `compras` */

DROP TABLE IF EXISTS `compras`;

CREATE TABLE `compras` (
  `id_compra` int(11) NOT NULL AUTO_INCREMENT,
  `id_proveedor` int(11) NOT NULL,
  `fecha_compra` date NOT NULL,
  `monto` int(11) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id_compra`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `compras` */

LOCK TABLES `compras` WRITE;

insert  into `compras`(`id_compra`,`id_proveedor`,`fecha_compra`,`monto`,`estado`) values (10,2,'2023-10-17',5,'A'),(11,1,'2023-10-17',4032500,'A'),(12,2,'2023-10-17',21000000,'A'),(13,1,'2023-10-17',3000000,'A'),(15,2,'2023-10-17',8871500,'C'),(16,1,'2023-12-04',806500000,'C'),(17,2,'2023-12-04',1613000000,'C'),(18,1,'2023-12-04',50400000,'C');

UNLOCK TABLES;

/*Table structure for table `detalle_compras` */

DROP TABLE IF EXISTS `detalle_compras`;

CREATE TABLE `detalle_compras` (
  `id_detalle_compra` int(11) NOT NULL AUTO_INCREMENT,
  `id_compra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_compra` int(11) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id_detalle_compra`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detalle_compras` */

LOCK TABLES `detalle_compras` WRITE;

insert  into `detalle_compras`(`id_detalle_compra`,`id_compra`,`id_producto`,`cantidad`,`precio_compra`,`estado`) values (10,10,64,5,1,'A'),(11,11,1,5,806500,'A'),(12,12,2,5,4200000,'A'),(13,13,3,3,1000000,'A'),(15,15,1,11,806500,'A'),(16,16,1,1000,806500,'A'),(17,17,1,2000,806500,'A'),(18,17,2,5000,1000,'A'),(19,18,2,12,4200000,'A');

UNLOCK TABLES;

/*Table structure for table `detalle_ventas` */

DROP TABLE IF EXISTS `detalle_ventas`;

CREATE TABLE `detalle_ventas` (
  `id_detalle_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` int(11) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id_detalle_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detalle_ventas` */

LOCK TABLES `detalle_ventas` WRITE;

insert  into `detalle_ventas`(`id_detalle_venta`,`id_venta`,`id_producto`,`cantidad`,`precio_venta`,`estado`) values (1,0,2,2,4200000,'A'),(2,0,15,2,2700002,'A'),(3,0,15,1,2700002,'A'),(4,1,15,2,2700002,'A'),(5,1,3,1,1000000,'A'),(6,1,15,11,2700002,'A'),(7,1,15,1,2700002,'A'),(8,8,15,3,2700002,'A'),(9,9,15,3,2700002,'A'),(10,10,15,3,2700002,'A'),(11,11,15,2,2700002,'A'),(12,12,64,2,1,'A'),(13,13,1,11,806500,'A'),(14,13,2,7,250000,'A'),(15,17,1,40,806500,'A'),(16,17,2,1000,100,'A'),(17,18,1,155,806500,'A'),(18,18,2,18,1000,'A'),(19,19,1,500,806500,'A'),(20,19,2,500,5000,'A'),(21,20,1,2,806500,'A'),(22,21,1,2,806500,'A'),(23,22,1,3,806500,'A'),(24,23,1,490,806500,'A'),(25,23,2,400,100,'A'),(26,24,1,496,806500,'A'),(27,24,2,500,1000,'A'),(28,25,1,100,806500,'A'),(29,25,2,100,1000,'A'),(30,26,1,1,806500,'A'),(31,27,3,1,1000000,'A'),(32,28,1,1,806500,'A'),(33,29,1,55,806500,'A'),(34,30,1,100,806500,'A'),(35,31,1,496,806500,'A'),(36,31,2,500,1000,'A'),(37,32,1,200,806500,'A'),(38,33,1,22,806500,'A'),(39,33,2,22,1000,'A'),(40,34,1,273,806500,'A'),(41,35,1,274,806500,'A'),(42,35,2,300,100,'A'),(43,36,1,1000,806500,'A'),(44,36,2,1000,1000,'A'),(45,37,1,111,806500,'A'),(46,37,2,11,100,'A'),(47,38,1,2,806500,'A'),(48,39,1,1,806500,'A'),(49,40,1,200,806500,'A'),(50,40,2,10,1000,'A'),(51,41,1,15,806500,'A'),(52,41,2,11,1000,'A'),(53,42,1,11,806500,'A'),(54,43,1,11,806500,'A'),(55,44,1,11,806500,'A'),(56,44,2,10,1000,'A'),(57,44,3,1,5000,'A'),(58,44,15,5,2500,'A'),(59,44,60,3,1800,'A'),(60,44,64,2,1500,'A'),(61,53,2,2,4200000,'A'),(62,54,1,10,806500,'A'),(63,55,1,120,806500,'A'),(64,56,2,10,4200000,'A'),(65,57,1,2,806500,'A'),(66,58,1,10,806500,'A');

UNLOCK TABLES;

/*Table structure for table `marcas` */

DROP TABLE IF EXISTS `marcas`;

CREATE TABLE `marcas` (
  `id_marca` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `marcas` */

LOCK TABLES `marcas` WRITE;

insert  into `marcas`(`id_marca`,`marca`,`estado`) values (1,'Samsung','A'),(2,'Huawei','A'),(3,'Xiaomi','A'),(4,'Lenovo','A'),(5,'Toyota','A'),(6,'JBL','A'),(7,'Phillips','A'),(24,'Nokia','A');

UNLOCK TABLES;

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(50) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `estado` varchar(1) DEFAULT 'A',
  `enlace` varchar(50) DEFAULT NULL,
  `id_cab_menu` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `menu` */

LOCK TABLES `menu` WRITE;

insert  into `menu`(`id_menu`,`menu`,`id_rol`,`estado`,`enlace`,`id_cab_menu`) values (1,'Listar Clientes',1,'A','tables.jsp',1),(2,'Crear Clientes',2,'A','add.jsp',1),(3,'Listar Usuarios',1,'A','listarUser_1.jsp',2),(4,'Crear Usuarios',2,'A','register.jsp',2),(5,'Listar Clientes',2,'A','listarClientes.jsp',1),(6,'Listar Usuarios',2,'A','listarUser.jsp',2),(7,'Registrar Productos',2,'A','productos.jsp',3),(9,'Registrar Marcas',2,'A','marcas.jsp',3),(10,'Registar Categorias',2,'A','categorias.jsp',3),(11,'Inventario',2,'A','stock.jsp',5),(12,'Ventas',2,'A','ventas.jsp',5),(13,'Compras',2,'A','compras.jsp',5),(14,'Anulaciones de Ventas',2,'A','historico_ventas.jsp',5),(15,'Anulaciones de Compras',2,'A','historico_compras.jsp',5),(16,'Cargos',2,'A','cargo.jsp',2),(17,'Ciudades',2,'A','ciudades.jsp',1),(18,'Barrios',2,'A','barrios.jsp',1),(19,'Nacionalidad',2,'A','nacionalidad.jsp',1),(20,'Paises',2,'A','paises.jsp',1),(21,'Registrar Proveedores',2,'A','proveedores.jsp',4),(22,'Listar Proveedores',2,'A','listarProveedor.jsp',4),(23,'Ventas2',2,'A','ventas2.jsp',5),(24,'Compras2',2,'A','compras2.jsp',5),(25,'Ventas3',2,'A','ventas3.jsp',5);

UNLOCK TABLES;

/*Table structure for table `nacionalidad` */

DROP TABLE IF EXISTS `nacionalidad`;

CREATE TABLE `nacionalidad` (
  `id_nacionalidad` int(11) NOT NULL AUTO_INCREMENT,
  `nacionalidad` varchar(100) NOT NULL,
  PRIMARY KEY (`id_nacionalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `nacionalidad` */

LOCK TABLES `nacionalidad` WRITE;

insert  into `nacionalidad`(`id_nacionalidad`,`nacionalidad`) values (1,'Paraguaya'),(2,'Argentina'),(3,'Brasilera'),(4,'Uruguaya'),(5,'Colombiana'),(6,'Norteamericana'),(9,'Mexicana'),(11,'Boliviana'),(18,'Venezolana'),(24,'Tacumbuense');

UNLOCK TABLES;

/*Table structure for table `paises` */

DROP TABLE IF EXISTS `paises`;

CREATE TABLE `paises` (
  `id_pais` int(11) NOT NULL AUTO_INCREMENT,
  `pais` varchar(100) NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `paises` */

LOCK TABLES `paises` WRITE;

insert  into `paises`(`id_pais`,`pais`) values (1,'Paraguay'),(2,'Argentina'),(3,'Brasil'),(4,'Uruguay'),(5,'Colombia'),(6,'EE.UU'),(7,'Mexico'),(8,'Bolivia'),(16,'Canada'),(18,'Sudafrica'),(27,'Nueva Zelanda');

UNLOCK TABLES;

/*Table structure for table `personas` */

DROP TABLE IF EXISTS `personas`;

CREATE TABLE `personas` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `direccion` varchar(100) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `id_barrio` int(11) NOT NULL,
  `id_pais` int(11) NOT NULL,
  `id_nacionalidad` int(11) NOT NULL,
  PRIMARY KEY (`id_persona`),
  UNIQUE KEY `ci_unique` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `personas` */

LOCK TABLES `personas` WRITE;

insert  into `personas`(`id_persona`,`cedula`,`nombres`,`apellidos`,`estado`,`direccion`,`id_ciudad`,`id_barrio`,`id_pais`,`id_nacionalidad`) values (74,'12342','JULIO IVAN','GUERRERO VELAZQUEZz','A','Calle 1 y 2',2,2,2,2),(95,'123','PEDRO','PICA PIEDRA','A','Calle C',2,2,2,2),(102,'1234','PAJARO','CAMPANA','A','Avda V',3,3,3,3),(103,'12345','WILLEN','PAATS','A','Avda X',4,4,4,4),(105,'123456','GOKU','GONZALEZ','A','Calle 1 ',5,5,5,5),(107,'777666','PEDRO','PICA PIEDRA','A','Calle 2',6,6,6,6),(113,'1234567','SERGIO','ORTEMAN','A','Calle 3',7,14,7,9),(150,'1616','GASPAR','RODRIGUEZ','A','DE FRANCIA 1811',1,5,1,6),(155,'202020','STEVE','HARRIS','A','CALLE C ESQUINA D',2,1,8,11);

UNLOCK TABLES;

/*Table structure for table `productos` */

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `producto` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `precio` double NOT NULL,
  `costo` double NOT NULL,
  `precio_mayoreo` double NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `productos` */

LOCK TABLES `productos` WRITE;

insert  into `productos`(`id_producto`,`producto`,`descripcion`,`id_categoria`,`id_marca`,`precio`,`costo`,`precio_mayoreo`,`stock`) values (1,'Galaxy Z Fli','256gb',19,3,806500,677000,790000,1825),(2,'Galaxy S20 FE ','128gb',1,1,4200000,3600000,4000000,198),(3,'Galaxy 100','100gb',1,1,1000000,800000,900000,3),(15,'Reloj Pantalla: AMOLED de 1.322','prueba2',3,3,2700002,1800002,2000002,5),(60,'Galaxy S1333','TV pantalla flexx3',7,1,1233,1233,1233,1285),(64,'prueba1','prueba1',2,2,1,1,1,33);

UNLOCK TABLES;

/*Table structure for table `proveedores` */

DROP TABLE IF EXISTS `proveedores`;

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor` varchar(100) NOT NULL,
  `ruc` varchar(100) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `proveedores` */

LOCK TABLES `proveedores` WRITE;

insert  into `proveedores`(`id_proveedor`,`proveedor`,`ruc`,`estado`) values (1,'ABACELL S.R.L','8001234-8','A'),(2,'NISSEI PY S.A','8007484-0','A');

UNLOCK TABLES;

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(20) DEFAULT NULL,
  `estado` varchar(1) DEFAULT 'A',
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `roles` */

LOCK TABLES `roles` WRITE;

insert  into `roles`(`id_rol`,`rol`,`estado`) values (1,'vendedores','A'),(2,'admin','A'),(3,'jefe','A'),(9,'contador','A');

UNLOCK TABLES;

/*Table structure for table `stock` */

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `id_stock` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id_stock`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `stock` */

LOCK TABLES `stock` WRITE;

insert  into `stock`(`id_stock`,`id_producto`,`cantidad`,`estado`) values (1,1,10,'A');

UNLOCK TABLES;

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) DEFAULT NULL,
  `usuario` varchar(100) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `id_rol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuarios` */

LOCK TABLES `usuarios` WRITE;

insert  into `usuarios`(`id_usuario`,`id_persona`,`usuario`,`clave`,`estado`,`id_rol`) values (1,95,'jose@jose.com','666','A',2),(2,105,'will.stig@gmail.com','0101','A',1),(39,109,'olimpia@gmail.com','1111','A',2),(52,74,'jugus@gmail.com','123','A',2),(54,74,'prueba4@gmail.com','123','A',2),(55,150,'pruebasp@gmail.com','111','A',2),(56,103,'prueba158@gmail.com','123','A',2),(57,95,'prueba156668@gmail.com','0101','A',2);

UNLOCK TABLES;

/*Table structure for table `ventas` */

DROP TABLE IF EXISTS `ventas`;

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_venta` date NOT NULL,
  `monto` int(20) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ventas` */

LOCK TABLES `ventas` WRITE;

insert  into `ventas`(`id_venta`,`id_persona`,`id_usuario`,`fecha_venta`,`monto`,`estado`) values (11,95,1,'2023-10-16',5400004,'C'),(12,102,39,'2023-10-17',2,'C'),(13,102,39,'2023-10-17',8871500,'C'),(17,74,2,'2023-11-22',32260000,'C'),(18,95,2,'2023-11-22',125007500,'C'),(19,95,1,'2023-11-22',403250000,'C'),(20,103,1,'2023-11-22',1613000,'C'),(21,74,1,'2023-11-22',1613000,'C'),(22,74,1,'2023-11-22',2419500,'C'),(23,95,1,'2023-11-22',395185000,'C'),(24,102,1,'2023-11-22',400024000,'C'),(25,95,39,'2023-11-22',80650000,'C'),(26,95,1,'2023-11-22',806500,'C'),(27,74,1,'2023-11-22',1000000,'C'),(28,95,52,'2023-11-22',806500,'C'),(29,74,1,'2023-11-22',44357500,'C'),(30,74,1,'2023-11-22',80650000,'C'),(31,103,2,'2023-11-22',400024000,'C'),(32,95,1,'2023-11-22',161300000,'C'),(33,74,1,'2023-11-22',17743000,'C'),(34,95,39,'2023-11-22',220174500,'C'),(35,74,39,'2023-11-22',220981000,'C'),(36,74,1,'2023-11-22',806500000,'C'),(37,74,2,'2023-11-22',89521500,'C'),(38,74,2,'2023-11-22',1613000,'C'),(39,95,2,'2023-11-22',806500,'C'),(40,95,2,'2023-11-24',161300000,'C'),(41,74,1,'2023-11-24',12097500,'C'),(42,74,1,'2023-11-24',8871500,'A'),(43,74,1,'2023-11-24',8871500,'A'),(44,74,1,'2023-11-24',8871500,'A'),(55,95,2,'2023-12-05',96780000,'A');

UNLOCK TABLES;

/* Trigger structure for table `detalle_compras` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `UpdateStockSumar` */$$

/*!50003 CREATE */ /*!50003 TRIGGER `UpdateStockSumar` AFTER INSERT ON `detalle_compras` FOR EACH ROW UPDATE productos
SET productos.stock = productos.stock + NEW.cantidad
WHERE productos.id_producto = NEW.id_producto */$$


DELIMITER ;

/* Trigger structure for table `detalle_ventas` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `UpdateStockRestar` */$$

/*!50003 CREATE */ /*!50003 TRIGGER `UpdateStockRestar` AFTER INSERT ON `detalle_ventas` FOR EACH ROW Update productos
set productos.stock = productos.stock - NEW.cantidad
where productos.id_producto = NEW.id_producto */$$


DELIMITER ;

/* Procedure structure for procedure `sp_ActualizarStock` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ActualizarStock` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_ActualizarStock`(IN p_id_producto INT, IN p_cantidad INT)
BEGIN
    -- Verificar si el producto existe en la tabla stock
  IF EXISTS (SELECT * FROM bd_tpracticolp3.stock WHERE id_producto = p_id_producto) THEN
    -- El producto existe, actualiza la cantidad
    UPDATE bd_tpracticolp3.stock
    SET cantidad = p_cantidad
    WHERE id_producto = p_id_producto;
 
    SELECT 'Stock actualizado correctamente.' AS mensaje;
  ELSE
    SELECT 'El producto no existe en el stock.' AS mensaje;
  END IF;
  
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_AnularCompra` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_AnularCompra` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_AnularCompra`(IN id INT)
BEGIN
	DECLARE c_can INT;
	DECLARE c_idpro INT;
	DECLARE c_cantstock INT;
	DECLARE c_resta INT;
	
	DECLARE pedidoCursor CURSOR FOR
	SELECT a.`cantidad`,a.`id_producto` FROM  `detalle_compras` a WHERE a.`id_compra` =id;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET @hecho = TRUE;
	
	OPEN pedidoCursor;
	loop1: LOOP
        /* Asigno la primera linea a las variables... */
        FETCH pedidoCursor INTO c_can, c_idpro;
        
        IF @hecho THEN
            LEAVE loop1;
        END IF;
    
	SELECT a.`stock` INTO c_cantstock FROM `productos` a WHERE a.`id_producto`= c_idpro;
	
	SET c_resta = c_cantstock - c_can;
	
	UPDATE `productos` a
	SET a.`stock` = c_resta
	WHERE a.`id_producto`= c_idpro;
	
	UPDATE `compras`
	    SET estado = 'C'
	    WHERE `id_compra` = id;  
	    
	END LOOP loop1;
	CLOSE pedidoCursor;
	
    SELECT c_cantstock;
    
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_AnularVenta` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_AnularVenta` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_AnularVenta`(in id int)
BEGIN
	declare v_can int;
	declare v_idpro int;
	declare v_cantstock int;
	DECLARE v_sum int;
	
	DECLARE pedidoCursor CURSOR FOR
	SELECT a.`cantidad`,a.`id_producto` FROM `detalle_ventas` a WHERE a.`id_venta`=id;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET @hecho = TRUE;
	
	OPEN pedidoCursor;
	loop1: LOOP
        /* Asigno la primera linea a las variables... */
        FETCH pedidoCursor INTO v_can, v_idpro;
        
        IF @hecho THEN
            LEAVE loop1;
        END IF;
    
	SELECT a.`stock` into v_cantstock FROM `productos` a WHERE a.`id_producto`= v_idpro;
	
	set v_sum = v_cantstock + v_can;
	
	update `productos` a
	set a.`stock` = v_sum
	where a.`id_producto`= v_idpro;
	
	UPDATE ventas
	    SET estado = 'C'
	    WHERE id_venta = id;  
	    
	END LOOP loop1;
	CLOSE pedidoCursor;
    
  
    
    select v_cantstock;
    
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_CargaBarrio` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_CargaBarrio` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_CargaBarrio`()
BEGIN
SELECT 
 `id_barrio`,
 `barrio`
FROM
  `bd_tallerprogramacion`.`barrio` ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_cargaCategoria` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_cargaCategoria` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_cargaCategoria`()
BEGIN
	 SELECT 
  `id_categoria`,
  `categoria`  
   FROM `bd_tallerprogramacion`.`categoria`  
	where `estado` = 'A';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_CargaCiudad` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_CargaCiudad` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_CargaCiudad`()
BEGIN
SELECT 
  `id_ciudad`,
  `ciudad` 
FROM
  `bd_tallerprogramacion`.`ciudad` ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_cargaClientesPersonas` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_cargaClientesPersonas` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_cargaClientesPersonas`()
BEGIN
SELECT 
  `id_persona`,
   CONCAT(nombres, ' ', apellidos) AS "persona"  
FROM
  `bd_tallerprogramacion`.`personas`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_cargaMarca` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_cargaMarca` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_cargaMarca`()
BEGIN
	SELECT 
  `id_marca`,
  `marca` 
FROM
  `bd_tallerprogramacion`.`marcas` 
where `estado` = 'A';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_CargaNacionalidad` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_CargaNacionalidad` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_CargaNacionalidad`()
BEGIN
    SELECT 
  `id_nacionalidad`,
  `nacionalidad` 
FROM
  `bd_tallerprogramacion`.`nacionalidad`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_CargaPais` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_CargaPais` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_CargaPais`()
BEGIN
    SELECT 
 `id_pais`, 
 `pais`
FROM
  `bd_tallerprogramacion`.`paises`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_cargaProductos` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_cargaProductos` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_cargaProductos`()
BEGIN
    
    SELECT 
  `id_producto`,
  concat ( m.marca ,' - ', p.`producto`) as producto_venta
FROM productos p
JOIN marcas m ON p.id_marca = m.id_marca;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_CargaProveedor` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_CargaProveedor` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_CargaProveedor`()
BEGIN
SELECT 
  `id_proveedor`,
  CONCAT(proveedor, ' - ', ruc) AS "proveedores"  
FROM
  `bd_tallerprogramacion`.`proveedores`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_CargaPuestoDeTrabajo` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_CargaPuestoDeTrabajo` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_CargaPuestoDeTrabajo`()
BEGIN
SELECT 
  `id_rol`,
  `rol`,
  `estado` 
FROM
  `bd_tallerprogramacion`.`roles` ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_CargaUsuarioVendedor` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_CargaUsuarioVendedor` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_CargaUsuarioVendedor`()
BEGIN
SELECT 
  `id_usuario`,
  `usuario` 
FROM
  `bd_tallerprogramacion`.`usuarios` ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_CedulaYaExiste` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_CedulaYaExiste` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_CedulaYaExiste`(IN ci VARCHAR (100))
BEGIN
	SELECT 1  `cedula`
         FROM   `bd_tallerprogramacion`.`personas` a 	
       	 WHERE a.`cedula` = ci
	 AND a.estado = 'A';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_crearUsuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_crearUsuario` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_crearUsuario`(in usu varchar(50), in clave varchar (50))
BEGIN
    
    INSERT INTO `bd_tpracticolp3`.`usuarios` (
 
  `usuario`,
  `clave` 
) 
VALUES
  (
     
    usu,
    clave 
  ) ;
SELECT 'OK' resultado;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_CrearUsuarioPersona` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_CrearUsuarioPersona` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_CrearUsuarioPersona`(
   IN id_per int, IN usu VARCHAR(100), IN passw VARCHAR(100),IN id_rol INT)
BEGIN
         INSERT INTO `bd_tallerprogramacion`.`usuarios`(
   `id_persona`,
   `usuario`,
   `clave`,
   `id_rol`
) 
VALUES
  ( id_per,usu,passw,id_rol) ;
SELECT 'OK' resultado;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EditarBarrio` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EditarBarrio` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_EditarBarrio`(in id int, in bar varchar(100))
BEGIN
    
    UPDATE 
  `bd_tallerprogramacion`.`barrio` 
SET
  `barrio` = bar 
WHERE `id_barrio` = id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EditarCategoria` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EditarCategoria` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_EditarCategoria`(IN id INT,
     IN categ VARCHAR(100))
BEGIN
UPDATE 
  `bd_tpracticolp3`.`categoria` 
SET
  
  `categoria` = categ
 
WHERE `id_categoria` = id ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EditarCiudad` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EditarCiudad` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_EditarCiudad`(IN id INT,
     IN ciu VARCHAR(100))
BEGIN
    UPDATE 
  `bd_tallerprogramacion`.`ciudad` 
SET
  `id_ciudad` = id,
  `ciudad` = ciu 
WHERE `id_ciudad` = id ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EditarMarca` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EditarMarca` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_EditarMarca`(IN id INT,
     IN marca VARCHAR(100))
BEGIN
UPDATE 
  `bd_tpracticolp3`.`marcas` 
SET
  `marca` = marca
WHERE `id_marca` = id ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EditarPais` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EditarPais` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_EditarPais`(IN id INT,
     IN pai VARCHAR(100))
BEGIN
UPDATE 
  `bd_tallerprogramacion`.`paises` 
SET
 
  `pais` = pai 
WHERE `id_pais` = id ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_editarPersonas` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_editarPersonas` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_editarPersonas`(IN id INT, 
						 IN ced VARCHAR(15),
						 IN nom VARCHAR(50), 
						 IN ape VARCHAR(50),
						 IN direcc VARCHAR (100),
						 IN id_c INT,
						 IN id_b INT,
						 IN id_p INT,
						 IN id_nac INT)
BEGIN
    UPDATE 
	   `bd_tallerprogramacion`.`personas` 
	SET
	  `cedula` = ced,
	  `nombres` = nom,
	  `apellidos` = ape,
	  `direccion` = direcc,
	  `id_ciudad` = id_c,
	  `id_barrio`= id_b,
	  `id_pais`= id_p,
	  `id_nacionalidad` = id_nac
	WHERE `id_persona` = id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EditarProd2` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EditarProd2` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_EditarProd2`(IN id INT,
     IN prod VARCHAR(100),
 IN descrip VARCHAR(100),
 in id_cate int,
 in id_mar int,
 IN precio INT,
 IN costo INT,
 IN precio_may INT,
 IN stock INT)
BEGIN
    UPDATE 
  `bd_tallerprogramacion`.`productos` 
SET
  `producto` = prod,
  `descripcion` = descrip,
  `id_categoria` = id_cate,
  `id_marca` = id_mar,
  `precio` = precio,
  `costo` = costo,
  `precio_mayoreo` = precio_may,
  `stock` = stock 
WHERE `id_producto` = id ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_editarProductos` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_editarProductos` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_editarProductos`(IN id INT,
     in prod varchar(100),
 in descrip varchar(100),
 in precio int,
 in costo int,
 in precio_may int,
 in stock int)
BEGIN
    
UPDATE 
  `bd_tpracticolp3`.`productos` 
SET
  `producto` = prod,
  `descripcion` = descrip,
  `precio` = precio,
  `costo` = costo,
  `precio_mayoreo` = precio_may,
  `stock` = stock
WHERE `id_producto` = id;    
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EditarProveedor` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EditarProveedor` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_EditarProveedor`(in id int, in prov varchar(100), in ruc varchar(50))
BEGIN
    
UPDATE 
  `bd_tallerprogramacion`.`proveedores` 
SET
  `proveedor` = prov,
  `ruc` = ruc
  
WHERE `id_proveedor` = id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EditarPuestoTrabajo` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EditarPuestoTrabajo` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_EditarPuestoTrabajo`(IN id INT, IN pto VARCHAR(100))
BEGIN
    
    UPDATE 
  `bd_tallerprogramacion`.`roles`
SET
   `rol` = pto
WHERE `id_rol` = id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EditarUsuarios` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EditarUsuarios` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_EditarUsuarios`(IN id INT, in usu varchar (100), in clave varchar(100), in id_r int)
BEGIN
	UPDATE 
    `bd_tallerprogramacion`.`usuarios` 
SEt
  `usuario` = usu,
  `clave` = clave,
  `id_rol` = id_r
WHERE `id_usuario` = id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_Editar_Nac` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_Editar_Nac` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_Editar_Nac`(IN id INT,
     IN nac VARCHAR(100))
BEGIN
    
    UPDATE 
  `bd_tallerprogramacion`.`nacionalidad` 
SET
  `nacionalidad` = nac 
WHERE `id_nacionalidad` = id ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminarBarrio` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminarBarrio` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_EliminarBarrio`(in id Int)
BEGIN
    
    DELETE 
FROM
  `bd_tallerprogramacion`.`barrio` 
WHERE `id_barrio` = id ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminarCargos` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminarCargos` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_EliminarCargos`(IN id INT)
BEGIN
    DELETE 
FROM
  `bd_tallerprogramacion`.`roles` 
WHERE `id_rol` = id ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminarCategorias` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminarCategorias` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_EliminarCategorias`(IN id INT)
BEGIN
    
    DELETE 
FROM
  `bd_tpracticolp3`.`categoria` 
WHERE `id_categoria` = id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminarCiudad` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminarCiudad` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_EliminarCiudad`(in id Int)
BEGIN
    DELETE 
FROM
  `bd_tallerprogramacion`.`ciudad` 
WHERE `id_ciudad` = id ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminarMarcas` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminarMarcas` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_EliminarMarcas`(IN id INT)
BEGIN
    
    DELETE 
FROM
  `bd_tpracticolp3`.`marcas` 
WHERE `id_marca` = id ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminarNacionalidad` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminarNacionalidad` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_EliminarNacionalidad`(IN id INT)
BEGIN
    
    DELETE 
FROM
  `bd_tallerprogramacion`.`nacionalidad` 
WHERE `id_nacionalidad` = id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminarPais` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminarPais` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_EliminarPais`(in id Int)
BEGIN
DELETE 
FROM
  `bd_tallerprogramacion`.`paises` 
WHERE `id_pais` = id ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminarPersonas` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminarPersonas` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_EliminarPersonas`(IN id INT(10))
BEGIN
	DELETE FROM `personas` WHERE `id_persona` = id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminarProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminarProducto` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_EliminarProducto`(IN id INT)
BEGIN
DELETE 
FROM
  `bd_tpracticolp3`.`productos` 
WHERE `id_producto` = id ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_EliminarProveedor` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_EliminarProveedor` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_EliminarProveedor`(in id int)
BEGIN
    
    DELETE 
FROM
  `bd_tallerprogramacion`.`proveedores` 
WHERE `id_proveedor` = id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_HistorialCompras` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_HistorialCompras` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_HistorialCompras`()
BEGIN
    SELECT
comp.id_compra,
CONCAT(prov.proveedor, ' - ', prov.ruc) AS proveed,  
comp.monto,
comp.fecha_compra
FROM compras comp 
JOIN proveedores prov ON prov.id_proveedor = comp.id_proveedor
WHERE comp.`estado` = 'A'
ORDER BY `id_compra` DESC;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_HistorialVentas` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_HistorialVentas` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_HistorialVentas`()
BEGIN
    
        SELECT 
  v.`id_venta`,
  CONCAT(per.`nombres`, ' ', per.`apellidos`) AS cliente, 
  v.`monto`,
  v.`fecha_venta`,
  us.usuario
FROM
  `ventas` v
  JOIN personas per ON v.id_persona = per.id_persona
  JOIN usuarios us ON us.id_usuario = v.id_usuario
  where v.`estado` = 'A'
  ORDER BY `fecha_venta` DESC;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ImprimirDetalleCompra` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ImprimirDetalleCompra` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_ImprimirDetalleCompra`(IN id INT)
BEGIN
SELECT 
  c.`id_compra`,
  CONCAT(prov.`proveedor`, ' | RUC:', prov.`ruc`) AS Proveedor, 
  pr.`producto` AS Producto,
  pr.`descripcion` AS Descripcion,
  dc.`cantidad` AS Cantidad,
  REPLACE (FORMAT (dc.`precio_compra`,0), ',', '.') AS Precio_Unitario,
  c.`fecha_compra` AS Fecha,
  REPLACE (FORMAT (c.`monto`,0), ',', '.') AS Monto 
FROM `compras` c
JOIN `detalle_compras` dc ON dc.`id_compra` = c.`id_compra`
JOIN `productos` pr ON pr.`id_producto` = dc.`id_producto`
join `proveedores` prov on prov.`id_proveedor` = c.`id_proveedor`
WHERE c.`id_compra` = id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ImprimirDetalleVenta` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ImprimirDetalleVenta` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_ImprimirDetalleVenta`(in id INT)
BEGIN
SELECT 
  v.`id_venta`,
  CONCAT(per.`nombres`, ' ', per.`apellidos`) AS Cliente, 
  us.usuario AS Vendedor,
  pr.`producto` as Producto,
  pr.`descripcion` as Descripcion,
  dv.`cantidad` as Cantidad,
  REPLACE (FORMAT (dv.`precio_venta`,0), ',', '.') as Precio_Unitario,
  v.`fecha_venta` AS Fecha,
  REPLACE (format (v.`monto`,0), ',', '.') AS Monto 
FROM `ventas` v 
JOIN `personas` per ON per.`id_persona` = v.`id_persona`
JOIN `usuarios` us ON us.id_usuario = v.id_usuario
join `detalle_ventas` dv on dv.`id_venta` = v.`id_venta`
join `productos` pr on pr.`id_producto` = dv.`id_producto`
WHERE v.`id_venta` = id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_InsertarBarrio` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_InsertarBarrio` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_InsertarBarrio`(IN bar VARCHAR (100))
BEGIN
INSERT INTO `bd_tallerprogramacion`.`barrio` (`barrio`) 
VALUES (bar) ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_InsertarCabeceraVentas` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_InsertarCabeceraVentas` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_InsertarCabeceraVentas`(in id_per int, 
							    in id_usu int,
							    in monto int,
							    out id int)
BEGIN
  INSERT INTO `bd_tallerprogramacion`.`ventas` (
  `id_persona`,
  `id_usuario`,
  `fecha_venta`,
  `monto`
) 
VALUES
  (
    id_per,
    id_usu,
    now(),
    monto
  ) ;
 SET id = (select `id_venta` from `ventas` order by `id_venta` desc limit 1);
 select id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_InsertarCaberceraCompras` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_InsertarCaberceraCompras` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_InsertarCaberceraCompras`(
    in id_prove int,
    in monto int,
    out id int)
BEGIN
    
    INSERT INTO `bd_tallerprogramacion`.`compras` (
  `id_proveedor`,
  `fecha_compra`,
  `monto`
) 
VALUES
  (
    id_prove,
    now(),
    monto 
  ) ;
   SET id = (SELECT `id_compra` FROM `compras` ORDER BY `id_compra` DESC LIMIT 1);
 SELECT id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_InsertarCargos` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_InsertarCargos` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_InsertarCargos`(IN car VARCHAR (50))
BEGIN
INSERT INTO `bd_tallerprogramacion`.`roles` (`rol`) 
VALUES
  (car) ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_InsertarCategoria` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_InsertarCategoria` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_InsertarCategoria`(IN cate VARCHAR (50))
BEGIN
    
    INSERT INTO `bd_tpracticolp3`.`categoria` (
  `categoria`
) 
VALUES
  (
    cate
  ) ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_InsertarCiudad` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_InsertarCiudad` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_InsertarCiudad`(IN ciu VARCHAR (100))
BEGIN
    
    INSERT INTO `bd_tallerprogramacion`.`ciudad` (`ciudad`) 
VALUES
  (ciu) ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_InsertarDetalle_Compras` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_InsertarDetalle_Compras` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_InsertarDetalle_Compras`(
    in id_comp int,
    in id_prod int,
    in cantidad int,
    in prec_comp int)
BEGIN
   INSERT INTO `bd_tallerprogramacion`.`detalle_compras` (
  `id_compra`,
  `id_producto`,
  `cantidad`,
  `precio_compra`
) 
VALUES
  (
    id_comp,
    id_prod,
    cantidad,
    prec_comp
  ) ;
  
SELECT 'OK' resultado;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_InsertarDetalle_Ventas` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_InsertarDetalle_Ventas` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_InsertarDetalle_Ventas`(
    in id_vta int,
    in id_prod int,
    in cantidad int,
    in precio_vta int)
BEGIN
    
INSERT INTO `bd_tallerprogramacion`.`detalle_ventas` (
  `id_venta`,
  `id_producto`,
  `cantidad`,
  `precio_venta`
) 
VALUES
  (
    id_vta,
    id_prod,
    cantidad,
    precio_vta
  ) ;
SELECT 'OK' resultado;
 
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_InsertarMarca` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_InsertarMarca` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_InsertarMarca`(IN marca VARCHAR (50))
BEGIN
INSERT INTO `bd_tpracticolp3`.`marcas`  (`marca`)
	
VALUES (marca);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_InsertarPais` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_InsertarPais` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_InsertarPais`(IN pa VARCHAR (50))
BEGIN
INSERT INTO `bd_tallerprogramacion`.`paises` (`pais`) 
VALUES
  ( pa ) ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_InsertarPersonas` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_InsertarPersonas` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_InsertarPersonas`(IN ced VARCHAR (20), IN nom VARCHAR(50), IN ape VARCHAR(50),
in direcc varchar (100), in id_ciu int, in id_barr int, id_pais int, in id_nac int)
BEGIN
	INSERT INTO `bd_tallerprogramacion`.`personas` (
  `cedula`,
  `nombres`,
  `apellidos`, 
  `direccion`,
  `id_ciudad`,
  `id_barrio`,
  `id_pais`,
  `id_nacionalidad`
) 
VALUES
  ( ced, UPPER(nom), UPPER(ape), UPPER(direcc), id_ciu, id_barr, id_pais, id_nac
  ) ;
SELECT 'OK' resultado;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_InsertarProductos` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_InsertarProductos` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_InsertarProductos`( in prod varchar (50), in descrip varchar(50),
							in id_cat int,
							in id_marca int,
							in precio double,
							in costo double,
							in precio_mayoreo double,
							in stock int
							)
BEGIN
INSERT INTO `bd_tpracticolp3`.`productos` (
 
  `producto`,
  `descripcion`,
  `id_categoria`,
  `id_marca`,
  `precio`,
  `costo`,
  `precio_mayoreo`,
  `stock`
) 
VALUES
  ( 
prod,
descrip,
id_cat,
id_marca,
precio,
costo,
precio_mayoreo,
stock
  ) ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_InsertarProveedor` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_InsertarProveedor` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_InsertarProveedor`(IN prov VARCHAR (100), in ruc varchar (100))
BEGIN
 
INSERT INTO `bd_tallerprogramacion`.`proveedores` (
  `proveedor`,
  `ruc`) 
VALUES
  ( prov,
    ruc) ; 
 
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_Insertar_Nacionalidad` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_Insertar_Nacionalidad` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_Insertar_Nacionalidad`(in nac varchar (100))
BEGIN
INSERT INTO `bd_tallerprogramacion`.`nacionalidad` (`nacionalidad`) 
VALUES
  (nac) ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ListaProveedor` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ListaProveedor` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_ListaProveedor`()
BEGIN
SELECT 
  `id_proveedor`,
  `proveedor`,
  `ruc`
FROM
  `bd_tallerprogramacion`.`proveedores`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ListarBarrio_Id` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ListarBarrio_Id` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_ListarBarrio_Id`(IN id INT)
BEGIN
    
    SELECT 
  `id_barrio`,
  `barrio` 
FROM
  `bd_tallerprogramacion`.`barrio` 
 WHERE `id_barrio` = id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ListarCategoria_id` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ListarCategoria_id` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_ListarCategoria_id`(IN id INT)
BEGIN
    
    SELECT 
  `id_categoria`,
  `categoria` 
FROM
 `bd_tallerprogramacion`.`categoria` 
 WHERE  `id_categoria` = id
	  AND `estado`='A';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ListarCiudad_id` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ListarCiudad_id` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_ListarCiudad_id`(IN id INT)
BEGIN
    
    SELECT 
  `id_ciudad`,
  `ciudad` 
FROM
  `bd_tallerprogramacion`.`ciudad` 
   WHERE `id_ciudad` = id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_listarClientes` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_listarClientes` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_listarClientes`()
BEGIN
	SELECT 
  p.`id_persona`,
  p.`cedula`,
  p.`nombres`,
  p.`apellidos`,
  p.`direccion`,
  c.ciudad,
  b.barrio,
  pa.pais,
  nac.nacionalidad
 
FROM
   `bd_tallerprogramacion`.`personas` p
   JOIN `ciudad` c ON p.id_ciudad = c.id_ciudad
   JOIN `barrio` b ON p.`id_barrio` = b.`id_barrio`
   join  `paises` pa on p.`id_pais` = pa.`id_pais`
   JOIN  `nacionalidad` nac ON nac.`id_nacionalidad` = p.`id_nacionalidad`
    
 WHERE p.`estado` = 'A';
 
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_listarClientes_id` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_listarClientes_id` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_listarClientes_id`(IN id INT)
BEGIN
    	SELECT 
	  `id_persona`,
	  `cedula`,
	  `nombres`,
	  `apellidos`,
	  `direccion`,
	  `id_ciudad`,
	  `id_barrio`,
	  `id_pais`,
	  `id_nacionalidad`
	FROM
	   `bd_tallerprogramacion`.`personas` 
	WHERE `id_persona`= id
	  AND `estado`='A';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ListarMarca_Id` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ListarMarca_Id` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_ListarMarca_Id`(IN id INT)
BEGIN
    
    SELECT 
    
    `id_marca`,
  `marca`
 
FROM
  `bd_tpracticolp3`.`marcas` 
  WHERE `id_marca` = id
	  AND `estado`='A';
    
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ListarPais_id` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ListarPais_id` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_ListarPais_id`(IN id INT)
BEGIN
    
    SELECT 
   `id_pais`,`pais`
 
FRom
 `bd_tallerprogramacion`.`paises`
 WHERE   `id_pais` = id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ListarProductos` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ListarProductos` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_ListarProductos`()
BEGIN
    
SELECT 
 p.`id_producto`,
 c.`categoria`,
 p.`producto`,
 p.`descripcion`,
 m.`marca`,
 p.`precio`,
 p.`costo`,
 p.`precio_mayoreo`,
 p.`stock`
 
 FROM   `productos` p
 JOIN `categoria` c ON p.`id_categoria` = c.`id_categoria`
 JOIN `marcas` m ON m.`id_marca` = p.`id_marca`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ListarProductos2_id` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ListarProductos2_id` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_ListarProductos2_id`(IN id INT)
BEGIN
    
    SELECT 
 p.`id_producto`,
 p.`producto`,
 p.`descripcion`,
 p.`precio`,
 p.`costo`,
 p.`precio_mayoreo`,
 p.`stock`
 
 FROM   `productos` p
 WHERE `id_producto` = id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_listarProd_id` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_listarProd_id` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_listarProd_id`(IN id INT)
BEGIN
SELECT 
 p.`id_producto`,
 p.`producto`,
 p.`descripcion`,
 p.`id_categoria`,
 p.`id_marca`,
 p.`precio`,
 p.`costo`,
 p.`precio_mayoreo`,
 p.`stock`
 
 FROM   `productos` p
 WHERE `id_producto` = id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ListarProveedor_id` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ListarProveedor_id` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_ListarProveedor_id`(IN id INT)
BEGIN
     SELECT 
 `id_proveedor`,
 `proveedor`,
 `ruc`
FROM
 `bd_tallerprogramacion`.`proveedores`
 WHERE   `id_proveedor` = id
	  AND `estado`='A';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ListarPtoTrabajo_id` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ListarPtoTrabajo_id` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_ListarPtoTrabajo_id`(IN id INT)
BEGIN
    
    SELECT 
   `id_rol`,
   `rol`
FROM
  `bd_tallerprogramacion`.`roles`
 WHERE `id_rol` = id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ListarUser` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ListarUser` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_ListarUser`()
BEGIN
SELECT u.id_usuario,
           CONCAT(p.nombres, ' ', p.apellidos) AS Nombre,
           u.usuario,
           r.rol
    FROM usuarios u
    JOIN personas p ON u.id_persona = p.id_persona
    JOIN roles r ON u.id_rol = r.id_rol;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ListarUser_id` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ListarUser_id` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_ListarUser_id`(in id int)
BEGIN
    SELECT 
	   `id_usuario`,
	   `usuario`,
	   `clave`
	FROM
	   `bd_tallerprogramacion`.`usuarios`
	WHERE  `id_usuario` = id
	  AND `estado`='A';    
 
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_Listar_Nac_Id` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_Listar_Nac_Id` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_Listar_Nac_Id`(IN id INT)
BEGIN
    
    SELECT 
  `id_nacionalidad`,
  `nacionalidad` 
FROM
  `bd_tallerprogramacion`.`nacionalidad` 
  WHERE `id_nacionalidad` = id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_login4` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_login4` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_login4`(IN usu VARCHAR(50),IN pass VARCHAR(50))
BEGIN
	declare v_con int;
	DECLARE v_idrol INT;
	select count(1),a.`id_rol` into v_con, v_idrol
	from `usuarios` a
	where a.`usuario` = usu
	and a.`clave` = pass
	and a.`estado`='A';
	
	if v_con > 0 then
	   select a.`menu`,a.`enlace`
	   from `menu` a
	   where a.id_rol = v_idrol
	   and a.estado = 'A';
	else
	   select 'NO' menu;
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_login5` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_login5` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_login5`(IN usu VARCHAR(50),IN pass VARCHAR(50))
BEGIN
	DECLARE v_con INT;
	DECLARE v_idrol INT;
	SELECT COUNT(1),a.`id_rol` INTO v_con, v_idrol
	FROM `usuarios` a
	WHERE a.`usuario` = usu
	AND a.`clave` = pass
	AND a.`estado`='A';
	
	IF v_con > 0 THEN
	   SELECT a.`menu`,a.`id_cab_menu`,a.`enlace`
	   FROM `menu` a
	   WHERE a.id_rol = v_idrol
	   AND a.estado = 'A';
	ELSE
	   SELECT 'NO' menu;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ObtenerIdCabecera` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ObtenerIdCabecera` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_ObtenerIdCabecera`()
BEGIN
SELECT `id_venta` AS id FROM  `ventas` ORDER BY  `id_venta` DESC LIMIT 1;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ObtenerStock` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ObtenerStock` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_ObtenerStock`(in id int)
BEGIN
SELECT a.`stock` FROM `productos` a WHERE a.`id_producto`= id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ResetPassw` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ResetPassw` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_ResetPassw`(IN id INT, 
						 IN clave VARCHAR(100))
BEGIN
	UPDATE 
   `bd_tpracticolp3`.`usuarios` 
SET
  `clave` = clave 
 
WHERE `id_usuario` = id ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_UsuarioYaExiste` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_UsuarioYaExiste` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `sp_UsuarioYaExiste`(IN usu VARCHAR (100))
BEGIN
	SELECT 1 `usuario`
         FROM   `bd_tallerprogramacion`.`usuarios` a 	
       	 WHERE a.usuario = usu
	 AND a.estado = 'A';
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
