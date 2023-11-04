package Ejemplo01;
import java.sql.*;

public class Principal {
	
	@SuppressWarnings("unused")
	public static void main(String[] args) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		Connection con;
		try {
			String url = "jdbc:mysql://localhost:3306";
			con = DriverManager.getConnection(url, "root", "");
			
			Statement s = con.createStatement();
			s.execute("use sakila;");
			ResultSet rs = s.executeQuery("select film_id, title from film;");
			
			int numFilms = 0;
			while (rs.next()) {
				System.out.println(rs.getInt(1) + " " + rs.getString(2));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}

}
