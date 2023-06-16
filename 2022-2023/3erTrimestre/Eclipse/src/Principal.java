import java.sql.Connection;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Principal {

	public static void main(String[] args) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(ClassNotFoundException e){
			System.out.println(" no ha funcionado");
		}
		
		Connection conexion;
		try {
			String url= "jdbc:mysql://localhost:3306/sakila";
			 conexion = DriverManager.getConnection(url,"root", "1234");
			 
			 System.out.println("Conexion establecida");
			 
			 Statement s = conexion.createStatement();
			 s.execute("USE sakila");
			 
			 ResultSet result=s.executeQuery("select * from film");
			 
			 System.out.println(result);
			
		} catch (SQLException e) {
			System.out.println(" no ha funcionado");
		}
	}

}
