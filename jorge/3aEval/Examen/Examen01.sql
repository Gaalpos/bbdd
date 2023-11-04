CREATE DEFINER=`root`@`localhost` PROCEDURE `Examen01`(PNombre varchar(50), PEdad int)
BEGIN
    create table if not exists personas (
		id int auto_increment primary key,
        nombre varchar(50),
        edad int
        );
        
	insert into `personas` (`nombre`, `edad`) values (PNombre, PEdad);
    
    select * from personas;
END