package pruebas;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class IntroducirDatos {
	//IntroducirDatos
		public static String introducirDatos(String s){
			try{
				System.out.print(s);
				return (new BufferedReader (new InputStreamReader (System.in))).readLine();
			}catch (IOException ioe){
				System.out.println("\nError interno en sistema de entrada/salida\n");
			}
			return "";

		}// fin introducirDatos

}