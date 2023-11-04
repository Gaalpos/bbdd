package EjemploGUIGUI;

import java.sql.*;

public class Conexion {
	
	public Connection conexion;
	
	public Conexion(String servidor,String puerto,String user,String pwd) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url="jdbc:mysql://"+servidor+":"+puerto;
			conexion=DriverManager.getConnection(url,user,pwd);
			
		} catch (Exception e) {
			e.printStackTrace();
		
		}
	}
}
