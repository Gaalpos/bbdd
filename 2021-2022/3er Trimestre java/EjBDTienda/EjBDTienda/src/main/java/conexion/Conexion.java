package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
	
	static String bd = "BDTiendaInformatica";
	static String user = "root";
	static String password = "admin";
	
	String url = "jdbc:mysql://localhost:3306/"+bd+"?serverTimeZone=Europe/Madrid$useSSL=false";
	
	Connection conexion = null;
	
	public Conexion() {
		
		try {
			// Obtener driver para la conexion
			Class.forName("com.mysql.cj.jdbc.Driver");
			// Crear la conexion
			conexion = DriverManager.getConnection(url, user, password);
			
		}catch(SQLException ex) {
			
			ex.printStackTrace();
		
		}catch(ClassNotFoundException e) {
			
			e.printStackTrace();
			
		}
		
	}
	
	public Connection getConexion() {
		return conexion;
	}
	
	public void desconectar() {
		conexion = null;
	}

}
