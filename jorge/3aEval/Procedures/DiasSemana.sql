CREATE DEFINER=`root`@`localhost` PROCEDURE `DiasSemana`(dia int)
BEGIN
	if (dia = 1) then select 'domingo';
    elseif (dia = 2) then select 'lunes';
    elseif (dia = 3) then select 'martes';
    elseif (dia = 4) then select 'miercoles';
    elseif (dia = 5) then select 'jueves';
    elseif (dia = 6) then select 'viernes';
    elseif (dia = 7) then select 'sabado';
    end if;
END