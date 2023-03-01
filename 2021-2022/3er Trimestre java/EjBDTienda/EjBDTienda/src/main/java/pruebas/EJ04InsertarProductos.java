package pruebas;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import conexion.Conexion;

public class EJ04InsertarProductos {

	public static void main(String[] args) {

		Conexion conexion = new Conexion();

		String sql = "insert into productos (cod, nombre,precio,codFabricante,existencias) values(?, ?, ?, ?, ?)";

		try {
			PreparedStatement ps = conexion.getConexion().prepareStatement(sql);
			ps.setInt(1, 12);
			ps.setString(2, "ThinkBook 15 gen 2 AMD");
			ps.setDouble(2, 932.33);
			ps.setInt(4, 2);
			ps.setInt(5, 3);

			int fila = ps.executeUpdate();
			if (fila != 0)
				System.out.println("insercion OK");
			else
				System.out.println("error al insertar");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
