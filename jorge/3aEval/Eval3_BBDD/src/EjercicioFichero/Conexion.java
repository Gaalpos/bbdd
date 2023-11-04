package EjercicioFichero;

import java.sql.*;

public class Conexion {

	public Connection conexion;

	public Conexion() {

	}

	public Conexion(String server, int puerto, String user, String passwd, String database) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://" + server + ":" + String.valueOf(puerto);
			conexion = DriverManager.getConnection(url, user, passwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Connection getConexion() {
		return this.conexion;
	}

}
