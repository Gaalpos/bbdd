package Ejemplo02;

import javax.swing.JOptionPane;

public class MainSemana {

	public static void main(String[] args) {
		String dia = JOptionPane.showInputDialog(null, "Introduzca dia de la semana",
				JOptionPane.QUESTION_MESSAGE).toLowerCase();
		
		if(Semana.comprobarDia(dia)) System.out.println("Lectivo");
		else System.out.println("No Lectivo");
	}
	
}
