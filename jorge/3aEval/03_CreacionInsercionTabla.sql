DROP TABLE IF EXISTS `Productos`;
CREATE TABLE `Productos` (
  `ID` int AUTO_INCREMENT,
  `Description` longtext,
  `Precio` double,
  primary key (`ID`)
);

INSERT INTO `Productos` (`Description`,`Precio`) VALUES 
 ('Bebida', 1.5),
 ('Fiambre', 2.62),
 ('Lacteos', 3.24);