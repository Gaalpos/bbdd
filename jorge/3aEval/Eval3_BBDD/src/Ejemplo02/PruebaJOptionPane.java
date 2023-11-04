package Ejemplo02;

import javax.swing.JOptionPane;

public class PruebaJOptionPane {
	
	public static void main(String[] args) {
		int opcion = JOptionPane.showOptionDialog(null, "¿Quieres que te arranque la cabeza?", "Arrancar cabeza",
					JOptionPane.YES_NO_CANCEL_OPTION, JOptionPane.QUESTION_MESSAGE, null,
					new Object[] { "Si, me sobra", "No, decora", "No, la uso" }, "opcion 1");
		
		if (opcion != -1)
			   System.out.println("seleccionada opcion " + (opcion + 1));
	}

}
