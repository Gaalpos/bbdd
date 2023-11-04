package Ejemplo02;

import java.sql.*;

public class Principal01 {

	public static void main(String[] args) {
		String server = "localhost";
		int puerto = 3306;
		String user = "root";
		String passwd =  "";
		String db = "sakila";
		Conexion con = new Conexion(server, puerto, user, passwd, "");

		try {
			Statement s = con.getConexion().createStatement();
			s.execute("use " + db);
			ResultSet rs = s.executeQuery("select * from film");
			
			ResultSetMetaData rsmd = rs.getMetaData();
			int numRegistros = 0;
			while(rs.next()) numRegistros++;
			System.out.println("Hay " + numRegistros + " peliculas");
			
			for (int i=1;i<=rsmd.getColumnCount();i++) 
				System.out.println("COLUMNA " + i + " " + rsmd.getColumnName(i));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
