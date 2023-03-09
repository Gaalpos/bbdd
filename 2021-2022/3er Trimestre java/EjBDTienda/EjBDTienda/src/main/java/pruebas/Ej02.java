package pruebas;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conexion.Conexion;

public class Ej02 {

	public static void main(String[] args) {
		
		// 2a) Listar los productos de un fabricante cuyo código introducimos por teclado.
		
		Conexion conexion = new Conexion();
		
		String sql = "select * from productos where codFabricante = ?";
		
		int codigo = Integer.parseInt(IntroducirDatos.introducirDatos("codigo: "));
		
		try {
			
			PreparedStatement ps = conexion.getConexion().prepareStatement(sql);
			ps.setInt(1, codigo);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				System.out.println(rs.getInt("codigo") + "\t" + rs.getString(2) + "\t" + rs.getDouble("precio") + "\t" + rs.getInt(4));
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

}
