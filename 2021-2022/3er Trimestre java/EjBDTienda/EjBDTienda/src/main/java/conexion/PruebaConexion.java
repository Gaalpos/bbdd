package conexion;

public class PruebaConexion {

	public static void main(String[] args) {

		Conexion conexion = new Conexion();
		
		if(conexion != null) System.out.println("Conexion OK");
		else System.out.println("Error en la conexion");
		
		// Cerrar la conexion
		conexion.desconectar();

	}

}
