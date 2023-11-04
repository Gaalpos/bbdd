CREATE DEFINER=`root`@`localhost` PROCEDURE `Procutos_AplicarIVA`(Opcion int)
BEGIN
	case Opcion
		when 1 then update Productos set Precio = Precio * 1.21;
        when 2 then update Productos set Precio = Precio * 1.1;
        when 3 then update Productos set Precio = Precio * 1.04;
	end case;
END