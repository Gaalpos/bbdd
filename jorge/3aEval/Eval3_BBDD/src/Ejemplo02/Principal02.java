package Ejemplo02;

import java.sql.*;

import javax.swing.JOptionPane;

public class Principal02 {
	
	public static int ejecutarPreparedStatement(Connection con, String nombre) {
		String consulta = "select * from actor where first_name = ?";
		int numRegistros = 0;

		try {
			Statement s = con.createStatement();
			s.execute("use sakila");
			PreparedStatement psConsulta = con.prepareStatement(consulta);
			psConsulta.setString(1, nombre);
			ResultSet rs = psConsulta.executeQuery();
			while(rs.next()) numRegistros++;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return numRegistros;
	}
	
	@SuppressWarnings("unused")
	public static void main(String[] args) {
		String server = "localhost";
		int puerto = 3306;
		String user = "root";
		String passwd =  "";
		String db = "sakila";
		Conexion con = new Conexion(server, puerto, user, passwd, "");
		
	/*	String aBuscar;
		aBuscar = JOptionPane.showInputDialog("Introduzca la pelicula a buscar");
		System.out.println(aBuscar);
	 */
		String name = JOptionPane.showInputDialog("Nombre del actor");
		System.out.println("Hay " + ejecutarPreparedStatement(con.getConexion(), name) + " actores que cumplan el filtro");
		
	/*	try {
			Statement s = con.getConexion().createStatement();
			s.execute("use " + db);
			String consulta = "select * from film where title = \"" + aBuscar + "\"";
			ResultSet rs = s.executeQuery(consulta);
			
			ResultSetMetaData rsmd = rs.getMetaData();
			int numRegistros = 0;
			while(rs.next()) numRegistros++;
			System.out.println("Hay " + numRegistros + " peliculas");
			
			for (int i=1;i<=rsmd.getColumnCount();i++) 
				System.out.println("COLUMNA " + i + " " + rsmd.getColumnName(i));
		} catch (SQLException e) {
			e.printStackTrace();
		}			
	 */	
	}
}
