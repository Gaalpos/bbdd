package pruebas;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conexion.Conexion;

public class EJ01ListadoVentas {

	public static void main(String[] args) {

		Conexion conexion = new Conexion();
		
		// Listar todos los productos
		String sql = "select codigo, nombre, precio, existencias from productos";
		
		try {
			
			PreparedStatement ps = conexion.getConexion().prepareStatement(sql);
			
			
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				System.out.println(rs.getInt("codigo") + "\t" + rs.getString("nombre") + "\t" + rs.getDouble("precio") + "\t" + rs.getInt("existencias"));
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

}
