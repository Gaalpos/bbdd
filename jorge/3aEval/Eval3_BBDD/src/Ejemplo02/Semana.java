package Ejemplo02;

public class Semana {

	public static boolean comprobarDia(String dia) {
		switch (dia) {
		case "lunes":
		case "martes":
		case "miercoles":
		case "jueves":
		case "viernes": return true;
		case "sabado":
		case "domingo": return false;
		default: return false;
		}
	}

}
