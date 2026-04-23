-- MySQL dump 10.13  Distrib 9.6.0, for macos15 (arm64)
--
-- Host: localhost    Database: Restaurante2
-- ------------------------------------------------------
-- Server version	9.6.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '85edc418-0954-11f1-80bd-4de286f63f59:1-137';

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `genero` enum('M','F','Otro') DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` VALUES (1,'Ana','Gómez','F','8112345670'),(2,'Luis','Ramírez','M','8112345671'),(3,'María','Fernández','F','8112345672'),(4,'Carlos','Hernández','M','8112345673'),(5,'Sofía','López','F','8112345674'),(6,'Miguel','Martínez','M','8112345675'),(7,'Isabel','Torres','F','8112345676'),(8,'David','Jiménez','M','8112345677'),(9,'Lucía','Pérez','F','8112345678'),(10,'Jorge','Sánchez','M','8112345679');
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Detalle_Orden`
--

DROP TABLE IF EXISTS `Detalle_Orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Detalle_Orden` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_orden` int DEFAULT NULL,
  `id_menu` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_orden` (`id_orden`),
  KEY `id_menu` (`id_menu`),
  CONSTRAINT `detalle_orden_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `Orden` (`id_orden`) ON DELETE CASCADE,
  CONSTRAINT `detalle_orden_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `Menu` (`id_menu`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Detalle_Orden`
--

LOCK TABLES `Detalle_Orden` WRITE;
/*!40000 ALTER TABLE `Detalle_Orden` DISABLE KEYS */;
INSERT INTO `Detalle_Orden` VALUES (1,1,1,2,178.00),(2,1,7,1,95.00),(3,2,3,1,135.00),(4,2,10,2,60.00),(5,3,14,1,185.00),(6,3,12,1,35.00),(7,4,5,1,95.00),(8,4,8,1,110.00),(9,5,2,1,129.00),(10,5,11,1,30.00),(11,6,16,2,360.00),(12,7,21,1,340.00),(13,7,25,1,165.00),(14,8,4,1,109.00),(15,8,9,2,44.00),(16,9,19,1,245.00),(17,9,27,1,75.00),(18,10,6,1,99.00),(19,10,29,1,45.00),(20,11,1,1,89.00),(21,11,7,2,190.00),(22,12,3,1,135.00),(23,12,10,1,30.00),(24,13,14,1,185.00),(25,13,12,1,35.00),(26,14,5,2,198.00),(27,14,8,1,110.00),(28,15,2,1,129.00),(29,15,11,2,60.00),(30,16,16,1,180.00),(31,16,9,1,22.00),(32,17,21,1,340.00),(33,17,25,1,165.00),(34,18,4,2,218.00),(35,18,27,1,75.00),(36,19,19,1,245.00),(37,19,28,1,65.00),(38,20,6,1,99.00),(39,20,30,1,55.00);
/*!40000 ALTER TABLE `Detalle_Orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dieta`
--

DROP TABLE IF EXISTS `Dieta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dieta` (
  `id_dieta` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_dieta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dieta`
--

LOCK TABLES `Dieta` WRITE;
/*!40000 ALTER TABLE `Dieta` DISABLE KEYS */;
INSERT INTO `Dieta` VALUES (1,'Vegano'),(2,'Vegetariano'),(3,'Sin gluten');
/*!40000 ALTER TABLE `Dieta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleado`
--

DROP TABLE IF EXISTS `Empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `rol` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `genero` enum('M','F','Otro') DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `turno` varchar(20) DEFAULT NULL,
  `tipo_contrato` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleado`
--

LOCK TABLES `Empleado` WRITE;
/*!40000 ALTER TABLE `Empleado` DISABLE KEYS */;
INSERT INTO `Empleado` VALUES (1,'Juan Pérez','Cocinero','8123456789','M',12000.00,'Matutino','Tiempo Completo'),(2,'María López','Mesera','8123456790','F',8000.00,'Vespertino','Tiempo Parcial'),(3,'Carlos Sánchez','Gerente','8123456791','M',18000.00,'Matutino','Tiempo Completo'),(4,'Ana Torres','Cajera','8123456792','F',8500.00,'Vespertino','Tiempo Parcial'),(5,'Luis Martínez','Cocinero','8123456793','M',12000.00,'Vespertino','Tiempo Completo'),(6,'Sofía Ramírez','Mesera','8123456794','F',8000.00,'Matutino','Tiempo Parcial'),(7,'Miguel Hernández','Gerente de Turno','8123456795','M',16000.00,'Vespertino','Tiempo Completo'),(8,'Lucía Jiménez','Cajera','8123456796','F',8500.00,'Matutino','Tiempo Parcial'),(9,'David Flores','Cocinero','8123456797','M',12000.00,'Matutino','Tiempo Completo'),(10,'Isabel García','Mesera','8123456798','F',8000.00,'Vespertino','Tiempo Parcial'),(11,'Jorge Moreno','Administrador','8123456799','M',20000.00,'Matutino','Tiempo Completo');
/*!40000 ALTER TABLE `Empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inventario`
--

DROP TABLE IF EXISTS `Inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Inventario` (
  `id_inventario` int NOT NULL AUTO_INCREMENT,
  `id_producto` int DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_inventario`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `Producto` (`id_producto`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inventario`
--

LOCK TABLES `Inventario` WRITE;
/*!40000 ALTER TABLE `Inventario` DISABLE KEYS */;
INSERT INTO `Inventario` VALUES (1,1,50.00,'2026-02-16 22:55:20'),(2,2,40.00,'2026-02-16 22:55:20'),(3,3,100.00,'2026-02-16 22:55:20'),(4,4,30.00,'2026-02-16 22:55:20'),(5,5,20.00,'2026-02-16 22:55:20'),(6,6,25.00,'2026-02-16 22:55:20'),(7,7,15.00,'2026-02-16 22:55:20'),(8,8,10.00,'2026-02-16 22:55:20'),(9,9,50.00,'2026-02-16 22:55:20'),(10,10,20.00,'2026-02-16 22:55:20'),(11,11,200.00,'2026-02-16 22:55:20'),(12,12,50.00,'2026-02-16 22:55:20'),(13,13,50.00,'2026-02-16 22:55:20'),(14,14,30.00,'2026-02-16 22:55:20'),(15,15,20.00,'2026-02-16 22:55:20');
/*!40000 ALTER TABLE `Inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Menu`
--

DROP TABLE IF EXISTS `Menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Menu` (
  `id_menu` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `categoria` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `tiempo_preparacion` time DEFAULT NULL,
  `nivel_picante` int DEFAULT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menu`
--

LOCK TABLES `Menu` WRITE;
/*!40000 ALTER TABLE `Menu` DISABLE KEYS */;
INSERT INTO `Menu` VALUES (1,'Hamburguesa Clasica','Carne, queso, lechuga y tomate','Hamburguesas',89.00,'00:08:00',NULL),(2,'Hamburguesa BBQ Bacon','Carne, queso, tocino y salsa BBQ','Hamburguesas',129.00,'00:10:00',NULL),(3,'Hamburguesa Especial','Hamburguesa premium con carne Angus, queso cheddar y aderezo especial','Hamburguesas',135.00,'00:12:00',NULL),(4,'Hamburguesa Veggie','Hamburguesa a base de plantas','Hamburguesas',109.00,'00:07:00',NULL),(5,'Sandwich de Pollo Crispy','Pollo empanizado y lechuga','Pollo',95.00,'00:09:00',NULL),(6,'Sandwich de Pollo Especial','Pollo con salsa especial','Pollo',99.00,'00:09:00',NULL),(7,'Papas Trufadas','Papas fritas con aceite de trufa y parmesano','Acompanamientos',95.00,'00:06:00',NULL),(8,'Aros de Cebolla Artesanales','Aros de cebolla empanizados estilo artesanal','Acompanamientos',110.00,'00:06:00',NULL),(9,'Botella de Agua','Agua embotellada 600ml','Bebidas',22.00,'00:01:00',NULL),(10,'Jugo de Naranja','Jugo natural de naranja','Bebidas',30.00,'00:02:00',NULL),(11,'Jugo de Manzana','Jugo natural de manzana','Bebidas',30.00,'00:02:00',NULL),(12,'Helado Sundae','Helado con jarabe','Postres',35.00,'00:02:00',NULL),(13,'Pay de Manzana','Pay caliente de manzana','Postres',30.00,'00:03:00',NULL),(14,'Ensalada César con Pollo','Lechuga romana, pollo a la parrilla, crutones y parmesano','Ensaladas',185.00,'00:10:00',NULL),(15,'Ensalada Caprese','Tomate fresco, mozzarella y albahaca con balsámico','Ensaladas',170.00,'00:08:00',NULL),(16,'Ensalada Mediterránea','Mezcla de hojas verdes, aceitunas, pepino y queso feta','Ensaladas',180.00,'00:09:00',NULL),(17,'Spaghetti Bolognesa','Pasta con salsa tradicional italiana de carne','Pastas',220.00,'00:14:00',NULL),(18,'Spaghetti Alfredo','Pasta con salsa cremosa de parmesano','Pastas',210.00,'00:13:00',NULL),(19,'Fettuccine Alfredo con Pollo','Pasta cremosa con pollo a la parrilla','Pastas',245.00,'00:15:00',NULL),(20,'Ravioles de Espinaca y Ricotta','Ravioles rellenos con salsa de tomate artesanal','Pastas',255.00,'00:16:00',NULL),(21,'Salmón a la Parrilla','Filete de salmón con vegetales asados','Platos Fuertes',340.00,'00:18:00',NULL),(22,'Pechuga de Pollo al Limón','Pollo a la parrilla con reducción de limón','Platos Fuertes',260.00,'00:16:00',NULL),(23,'Filete Mignon','Corte premium con puré de papa y vegetales','Platos Fuertes',420.00,'00:20:00',NULL),(24,'Risotto de Champiñones','Arroz cremoso estilo italiano con champiñones','Platos Fuertes',280.00,'00:17:00',NULL),(25,'Cheesecake de Frutos Rojos','Cheesecake con frutos rojos naturales','Postres',165.00,'00:05:00',NULL),(26,'Tiramisú','Postre italiano con café y mascarpone','Postres',170.00,'00:06:00',NULL),(27,'Limonada Natural','Limonada preparada al momento','Bebidas',75.00,'00:03:00',NULL),(28,'Agua Mineral Premium','Agua mineral importada','Bebidas',65.00,'00:01:00',NULL),(29,'Refresco de Fuente Chico','Refresco servido en vaso 355ml','Bebidas',45.00,'00:01:00',NULL),(30,'Refresco de Fuente Mediano','Refresco servido en vaso 500ml','Bebidas',55.00,'00:01:00',NULL),(31,'Refresco de Fuente Grande','Refresco servido en vaso 700ml','Bebidas',65.00,'00:01:00',NULL);
/*!40000 ALTER TABLE `Menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Menu_Dieta`
--

DROP TABLE IF EXISTS `Menu_Dieta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Menu_Dieta` (
  `id_menu` int NOT NULL,
  `id_dieta` int NOT NULL,
  PRIMARY KEY (`id_menu`,`id_dieta`),
  KEY `id_dieta` (`id_dieta`),
  CONSTRAINT `menu_dieta_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `Menu` (`id_menu`) ON DELETE CASCADE,
  CONSTRAINT `menu_dieta_ibfk_2` FOREIGN KEY (`id_dieta`) REFERENCES `Dieta` (`id_dieta`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menu_Dieta`
--

LOCK TABLES `Menu_Dieta` WRITE;
/*!40000 ALTER TABLE `Menu_Dieta` DISABLE KEYS */;
INSERT INTO `Menu_Dieta` VALUES (4,1),(7,2),(8,2),(14,2),(15,2),(16,2);
/*!40000 ALTER TABLE `Menu_Dieta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mesa`
--

DROP TABLE IF EXISTS `Mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mesa` (
  `id_mesa` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `capacidad` int DEFAULT NULL,
  `estado` enum('Disponible','Ocupada','Reservada') DEFAULT 'Disponible',
  PRIMARY KEY (`id_mesa`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mesa`
--

LOCK TABLES `Mesa` WRITE;
/*!40000 ALTER TABLE `Mesa` DISABLE KEYS */;
INSERT INTO `Mesa` VALUES (1,1,4,'Disponible'),(2,2,4,'Ocupada'),(3,3,2,'Reservada'),(4,4,6,'Disponible'),(5,5,2,'Ocupada'),(6,6,4,'Disponible'),(7,7,4,'Reservada'),(8,8,6,'Disponible'),(9,9,2,'Ocupada'),(10,10,4,'Disponible'),(11,11,4,'Ocupada'),(12,12,6,'Reservada'),(13,13,2,'Disponible'),(14,14,4,'Disponible'),(15,15,6,'Ocupada');
/*!40000 ALTER TABLE `Mesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orden`
--

DROP TABLE IF EXISTS `Orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orden` (
  `id_orden` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_empleado` int DEFAULT NULL,
  `tipo_orden` varchar(50) DEFAULT NULL,
  `fecha_orden` datetime DEFAULT NULL,
  `estado_orden` enum('Pendiente','Preparando','Listo','Entregado') DEFAULT 'Pendiente',
  `id_mesa` int DEFAULT NULL,
  PRIMARY KEY (`id_orden`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_empleado` (`id_empleado`),
  KEY `id_mesa` (`id_mesa`),
  CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `Cliente` (`id_cliente`) ON DELETE SET NULL,
  CONSTRAINT `orden_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `Empleado` (`id_empleado`) ON DELETE SET NULL,
  CONSTRAINT `orden_ibfk_3` FOREIGN KEY (`id_mesa`) REFERENCES `Mesa` (`id_mesa`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orden`
--

LOCK TABLES `Orden` WRITE;
/*!40000 ALTER TABLE `Orden` DISABLE KEYS */;
INSERT INTO `Orden` VALUES (1,1,2,'Comer aquí','2026-02-16 23:03:06','Entregado',NULL),(2,2,3,'Para llevar','2026-02-16 23:03:06','Entregado',NULL),(3,3,4,'Comer aquí','2026-02-16 23:03:06','Entregado',NULL),(4,4,5,'Comer aquí','2026-02-16 23:03:06','Preparando',NULL),(5,5,1,'Para llevar','2026-02-16 23:03:06','Pendiente',NULL),(6,6,2,'Comer aquí','2026-02-16 23:03:06','Entregado',NULL),(7,7,3,'Comer aquí','2026-02-16 23:03:06','Entregado',NULL),(8,8,4,'Para llevar','2026-02-16 23:03:06','Preparando',NULL),(9,9,5,'Comer aquí','2026-02-16 23:03:06','Entregado',NULL),(10,10,1,'Comer aquí','2026-02-16 23:03:06','Pendiente',NULL),(11,1,2,'Comer aquí','2026-02-16 23:03:06','Entregado',NULL),(12,2,3,'Para llevar','2026-02-16 23:03:06','Entregado',NULL),(13,3,4,'Comer aquí','2026-02-16 23:03:06','Entregado',NULL),(14,4,5,'Comer aquí','2026-02-16 23:03:06','Preparando',NULL),(15,5,1,'Para llevar','2026-02-16 23:03:06','Pendiente',NULL),(16,6,2,'Comer aquí','2026-02-16 23:03:06','Entregado',NULL),(17,7,3,'Comer aquí','2026-02-16 23:03:06','Entregado',NULL),(18,8,4,'Para llevar','2026-02-16 23:03:06','Preparando',NULL),(19,9,5,'Comer aquí','2026-02-16 23:03:06','Entregado',NULL),(20,10,1,'Comer aquí','2026-02-16 23:03:06','Pendiente',NULL);
/*!40000 ALTER TABLE `Orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pago`
--

DROP TABLE IF EXISTS `Pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pago` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_orden` int DEFAULT NULL,
  `numero_referencia` varchar(50) DEFAULT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  `estado_pago` enum('Pendiente','Pagado','Cancelado') DEFAULT 'Pendiente',
  `fecha_pago` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `id_orden` (`id_orden`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `Orden` (`id_orden`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pago`
--

LOCK TABLES `Pago` WRITE;
/*!40000 ALTER TABLE `Pago` DISABLE KEYS */;
INSERT INTO `Pago` VALUES (1,1,'REF001','Tarjeta','Pagado','2026-02-16 23:03:30'),(2,2,'REF002','Efectivo','Pagado','2026-02-16 23:03:30'),(3,3,'REF003','Tarjeta','Pagado','2026-02-16 23:03:30'),(4,4,'REF004','Efectivo','Pendiente','2026-02-16 23:03:30'),(5,5,'REF005','Tarjeta','Pendiente','2026-02-16 23:03:30'),(6,6,'REF006','Efectivo','Pagado','2026-02-16 23:03:30'),(7,7,'REF007','Tarjeta','Pagado','2026-02-16 23:03:30'),(8,8,'REF008','Efectivo','Pendiente','2026-02-16 23:03:30'),(9,9,'REF009','Tarjeta','Pagado','2026-02-16 23:03:30'),(10,10,'REF010','Efectivo','Pendiente','2026-02-16 23:03:30'),(11,11,'REF011','Tarjeta','Pagado','2026-02-16 23:03:30'),(12,12,'REF012','Efectivo','Pagado','2026-02-16 23:03:30'),(13,13,'REF013','Tarjeta','Pagado','2026-02-16 23:03:30'),(14,14,'REF014','Efectivo','Pendiente','2026-02-16 23:03:30'),(15,15,'REF015','Tarjeta','Pendiente','2026-02-16 23:03:30'),(16,16,'REF016','Efectivo','Pagado','2026-02-16 23:03:30'),(17,17,'REF017','Tarjeta','Pagado','2026-02-16 23:03:30'),(18,18,'REF018','Efectivo','Pendiente','2026-02-16 23:03:30'),(19,19,'REF019','Tarjeta','Pagado','2026-02-16 23:03:30'),(20,20,'REF020','Efectivo','Pendiente','2026-02-16 23:03:30');
/*!40000 ALTER TABLE `Pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pago_Empleado`
--

DROP TABLE IF EXISTS `Pago_Empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pago_Empleado` (
  `id_pago_empleado` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int DEFAULT NULL,
  `fecha_pago` datetime DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pago_empleado`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `pago_empleado_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `Empleado` (`id_empleado`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pago_Empleado`
--

LOCK TABLES `Pago_Empleado` WRITE;
/*!40000 ALTER TABLE `Pago_Empleado` DISABLE KEYS */;
INSERT INTO `Pago_Empleado` VALUES (1,1,'2026-02-16 23:21:33',12000.00,'Transferencia'),(2,2,'2026-02-16 23:21:33',8000.00,'Efectivo'),(3,3,'2026-02-16 23:21:33',18000.00,'Transferencia'),(4,4,'2026-02-16 23:21:33',8500.00,'Efectivo'),(5,5,'2026-02-16 23:21:33',12000.00,'Transferencia'),(6,6,'2026-02-16 23:21:33',8000.00,'Efectivo'),(7,7,'2026-02-16 23:21:33',16000.00,'Transferencia'),(8,8,'2026-02-16 23:21:33',8500.00,'Efectivo'),(9,9,'2026-02-16 23:21:33',12000.00,'Transferencia'),(10,10,'2026-02-16 23:21:33',8000.00,'Efectivo'),(11,11,'2026-02-16 23:21:33',20000.00,'Transferencia');
/*!40000 ALTER TABLE `Pago_Empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Producto`
--

DROP TABLE IF EXISTS `Producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `unidad_medida` varchar(20) DEFAULT NULL,
  `id_proveedor` int DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `Proveedor` (`id_proveedor`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Producto`
--

LOCK TABLES `Producto` WRITE;
/*!40000 ALTER TABLE `Producto` DISABLE KEYS */;
INSERT INTO `Producto` VALUES (1,'Carne de res','kg',1),(2,'Pollo','kg',1),(3,'Pan de hamburguesa','pieza',3),(4,'Queso','kg',2),(5,'Lechuga','kg',2),(6,'Tomate','kg',2),(7,'Aceite','litro',2),(8,'Salsa BBQ','litro',2),(9,'Papas','kg',2),(10,'Cebolla','kg',2),(11,'Agua embotellada','pieza',4),(12,'Jugo de naranja','litro',4),(13,'Jugo de manzana','litro',4),(14,'Helado','kg',5),(15,'Frutos rojos','kg',5);
/*!40000 ALTER TABLE `Producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proveedor`
--

DROP TABLE IF EXISTS `Proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proveedor`
--

LOCK TABLES `Proveedor` WRITE;
/*!40000 ALTER TABLE `Proveedor` DISABLE KEYS */;
INSERT INTO `Proveedor` VALUES (1,'Proveedor Carne','8100000001'),(2,'Proveedor Verduras','8100000002'),(3,'Proveedor Pan','8100000003'),(4,'Proveedor Bebidas','8100000004'),(5,'Proveedor Postres','8100000005');
/*!40000 ALTER TABLE `Proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Receta`
--

DROP TABLE IF EXISTS `Receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Receta` (
  `id_menu` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_menu`,`id_producto`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `receta_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `Menu` (`id_menu`) ON DELETE CASCADE,
  CONSTRAINT `receta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `Producto` (`id_producto`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Receta`
--

LOCK TABLES `Receta` WRITE;
/*!40000 ALTER TABLE `Receta` DISABLE KEYS */;
INSERT INTO `Receta` VALUES (1,1,0.20),(1,3,1.00),(1,4,0.05),(1,5,0.02),(1,6,0.03),(2,1,0.20),(2,3,1.00),(2,4,0.05),(2,6,0.03),(2,8,0.02),(3,1,0.25),(3,3,1.00),(3,4,0.06),(3,5,0.02),(3,6,0.03),(4,2,0.20),(4,3,1.00),(4,5,0.03),(4,6,0.03),(5,2,0.15),(5,3,1.00),(5,5,0.02),(6,2,0.18),(6,3,1.00),(6,7,0.02),(7,4,0.01),(7,7,0.01),(7,9,0.20),(8,4,0.01),(8,7,0.01),(8,10,0.05),(9,11,1.00),(10,12,0.25),(11,13,0.25),(12,14,0.10),(12,15,0.02),(13,15,0.05),(14,2,0.15),(14,4,0.03),(14,5,0.05),(14,6,0.05),(15,4,0.03),(15,5,0.04),(15,6,0.03),(16,4,0.02),(16,5,0.03),(16,6,0.03),(17,1,0.15),(17,4,0.03),(17,6,0.05),(18,1,0.10),(18,4,0.05),(18,6,0.02),(19,2,0.15),(19,4,0.05),(19,6,0.02),(20,4,0.03),(20,6,0.05),(21,5,0.05),(21,6,0.05),(21,11,0.30),(22,2,0.25),(22,6,0.05),(22,7,0.02),(23,1,0.30),(23,5,0.05),(23,6,0.05),(23,9,0.20),(24,5,0.05),(24,6,0.05),(24,9,0.20),(25,15,0.05),(26,15,0.05),(27,12,0.30),(28,11,1.00),(29,11,0.36),(30,11,0.50),(31,11,0.70);
/*!40000 ALTER TABLE `Receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reserva`
--

DROP TABLE IF EXISTS `Reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reserva` (
  `id_reserva` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_mesa` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `num_personas` int DEFAULT NULL,
  `estado` enum('Pendiente','Confirmada','Cancelada') DEFAULT 'Pendiente',
  PRIMARY KEY (`id_reserva`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_mesa` (`id_mesa`),
  CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `Cliente` (`id_cliente`) ON DELETE SET NULL,
  CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`id_mesa`) REFERENCES `Mesa` (`id_mesa`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reserva`
--

LOCK TABLES `Reserva` WRITE;
/*!40000 ALTER TABLE `Reserva` DISABLE KEYS */;
INSERT INTO `Reserva` VALUES (1,1,NULL,'2026-02-16','12:00:00',2,'Confirmada'),(2,2,NULL,'2026-02-16','13:30:00',4,'Pendiente'),(3,3,NULL,'2026-02-16','14:00:00',6,'Cancelada'),(4,4,NULL,'2026-02-16','15:00:00',2,'Confirmada'),(5,5,NULL,'2026-02-16','16:00:00',2,'Pendiente');
/*!40000 ALTER TABLE `Reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Restaurante2'
--
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-22 16:04:30
