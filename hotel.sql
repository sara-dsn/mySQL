-- Active: 1701358382095@@127.0.0.1@3306@phpmyadmin
DROP DATABASE `hotel`;
CREATE DATABASE `hotel`;
USE `hotel`;

CREATE TABLE `station` (
	`sta_id` INT NOT NULL AUTO_INCREMENT,
	`sta_nom` VARCHAR(50) NOT NULL,
	`sta_altitude` INT NOT NULL,
	 PRIMARY KEY(`sta_id`)
);

CREATE TABLE `hotel` (
	`hot_id` 			INT NOT NULL AUTO_INCREMENT ,
	`hot_sta_id` 		INT NOT NULL,
	`hot_nom`		VARCHAR(50) NOT NULL,
	`hot_categorie`	INT NOT NULL,
	`hot_adresse`		VARCHAR(50) NOT NULL,
	`hot_ville` 		VARCHAR(50) NOT NULL, 
	FOREIGN KEY (`hot_sta_id`) REFERENCES `station`(`sta_id`),
	PRIMARY KEY (`hot_id`)
);

CREATE TABLE `chambre` (
	`cha_id` INT NOT NULL AUTO_INCREMENT ,
	`cha_hot_id` INT NOT NULL,
	`cha_numero` INT NOT NULL,
	`cha_capacite` INT NOT NULL,
	`cha_type` INT NOT NULL,
	FOREIGN KEY (`cha_hot_id`) REFERENCES `hotel`(`hot_id`),
	PRIMARY KEY (`cha_id`)
);

CREATE TABLE `client` (
	`cli_id` INT NOT NULL AUTO_INCREMENT ,
	`cli_nom` VARCHAR(50),
	`cli_prenom` VARCHAR(50),
	`cli_adresse` VARCHAR(50),
	`cli_ville` VARCHAR(50),
	PRIMARY KEY (`cli_id`)
);

CREATE TABLE `reservation` (
	`res_id` INT NOT NULL AUTO_INCREMENT,
	`res_cha_id` INT NOT NULL ,
	`res_cli_id` INT NOT NULL ,
	`res_date` DATETIME NOT NULL,
	`res_date_debut` DATETIME NOT NULL,
	`res_date_fin`DATETIME NOT NULL,
	`res_prix` DECIMAL(6,2) NOT NULL,
	`res_arrhes` DECIMAL(6,2),
	FOREIGN KEY (`res_cha_id`) REFERENCES `chambre`(`cha_id`),
	FOREIGN KEY (`res_cli_id`) REFERENCES `client`(`cli_id`),
	PRIMARY KEY (`res_id`)
);

INSERT INTO `station` (`sta_id`, `sta_nom`, `sta_altitude`) VALUES
(1, 'La Montagne', 2500),
(2, 'Le Sud', 200),
(3, 'La Plage', 10);
INSERT INTO `hotel`( `hot_id`,`hot_sta_id`,`hot_nom`,`hot_categorie`,`hot_adresse`,`hot_ville`)VALUES
(1,1,'Le Magnifique',3,'rue du bas','Pralo'),
(2,1,'Hotel du haut',1,'rue du haut','Pralo'),
(3,2,'Le Narval',3,'place de la liberation','Vonten'),
(4,2,'Les Pissenlis',4,'place du 14 juillet','Bretou'),
(5,2,'RR Hotel',5,'place du bas','Bretou'),
(6,2,'La Brique',2,'place du haut','Bretou'),
(7,3,'Le Beau Rivage',3,'place du centre','Toras');
INSERT INTO `chambre`(`cha_id`,`cha_hot_id`,`cha_numero`,`cha_capacite`,`cha_type`) VALUES
(1,1,1,2,1),
(2,1,2,3,1),
(3,1,3,2,1),
(4,1,101,1,1),
(5,1,102,2,1),
(6,1,103,3,1),
(7,1,201,2,1),
(8,1,202,7,1),
(9,1,203,1,1),
(10,2,1,2,1),
(11,2,2,2,1),
(12,2,3,1,1),
(13,2,101,2,1),
(14,2,102,1,1),
(15,2,103,3,1),
(16,2,201,2,1),
(17,2,202,4,1),
(18,2,203,4,1),
(19,3,1,3,1),
(20,3,2,1,1),
(21,3,3,2,1),
(22,3,101,2,1),
(23,3,102,2,1),
(24,3,103,2,1),
(25,3,201,2,1),
(26,3,202,4,1),
(27,3,203,4,1),
(28,4,1,4,1),
(29,4,2,2,1),
(30,4,3,4,1),
(31,4,101,1,1),
(32,4,102,2,1),
(33,4,103,2,1),
(34,4,201,2,1),
(35,4,202,2,1),
(36,4,203,3,1),
(37,5,1,3,1),
(38,5,2,2,1),
(39,5,3,2,1),
(40,5,101,1,1),
(41,5,102,4,1),
(42,5,103,1,1),
(43,5,201,2,1),
(44,5,202,4,1),
(45,5,203,4,1),
(46,6,1,1,1),
(47,6,2,1,1),
(48,6,3,1,1),
(49,6,101,1,1),
(50,6,102,1,1),
(51,6,103,1,1),
(52,6,201,1,1),
(53,6,202,1,1),
(54,6,203,1,1),
(55,7,1,1,1),
(56,7,2,5,1),
(57,7,3,5,1),
(58,7,101,5,1),
(59,7,102,5,1),
(60,7,103,5,1),
(61,7,201,5,1),
(62,7,202,5,1),
(63,7,203,5,1);

INSERT INTO `client`(`cli_id`,`cli_nom`,`cli_prenom`,`cli_adresse`,`cli_ville`) VALUES
(1,'Doe','John', 'Avda. de la Constitucin 2222','LA'),
(2,'Homme','Josh', 'Avda. de la Constitucin 222','Palm Desert'),
(3,'Paul','Weller', 'Avda. de la Constitucin 22','Londre'),
(4,'White','Jack', 'Avda. de la Constitucin 2','Detroit'),
(5,'Claypool','Les', 'Avda. de la Constitucin 8','San Francisco'),
(6,'Squire','Chris', 'Avda. de la Constitucin 9','Londre'),
(7,'Wood','Ronnie', 'Avda. de la Constitucin 10','Londre');
INSERT INTO `reservation` (`res_id`,`res_cha_id`,`res_cli_id`,`res_date`,`res_date_debut`,`res_date_fin`,`res_prix`,`res_arrhes`) VALUES
(1,1,1,'2017-01-10 00:00:00','2017-07-01 00:00:00','2017-07-15 00:00:00',2400.00,800.00),
(2,2,2,'2017-01-10 00:00:00','2017-07-01 00:00:00','2017-07-15 00:00:00',3400.00,100.00),
(3,1,3,'2017-01-10 00:00:00','2017-07-01 00:00:00','2017-07-15 00:00:00',400.00,50.00),
(4,2,4,'2017-01-10 00:00:00','2017-07-01 00:00:00','2017-07-15 00:00:00',7200.00,1800.00),
(5,3,5,'2017-01-10 00:00:00','2017-07-01 00:00:00','2017-07-15 00:00:00',1400.00,450.00),
(6,4,6,'2017-01-10 00:00:00','2017-07-01 00:00:00','2017-07-15 00:00:00',2400.00,780.00),
(7,4,6,'2017-01-10 00:00:00','2017-07-01 00:00:00','2017-07-15 00:00:00',500.00,80.00),
(8,4,1,'2017-01-10 00:00:00','2017-07-01 00:00:00','2017-07-15 00:00:00',40.00,0.00);

