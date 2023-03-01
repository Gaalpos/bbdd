package pruebas;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conexion.Conexion;

public class EJ04InsertarProducto {
	
	private static int buscarCodigo(String nbFab) {
		Conexion conexion = new Conexion();
		
		String sql = "select codigo from fabricantes where nombre = ?";
		int codigo= 0;
		
		
		try {
		PreparedStatement ps = conexion.getConexion().prepareStatement(sql);
		ps.setString(1, nbFab);
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			codigo = rs.getInt("codigo");
		}
		
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return codigo;
	}
	
	
	public static void main(String[] args) {
		
		Conexion conexion = new Conexion();
		
		String sql = "insert into productos (codigo, nombre,precio,codFabricante,existencias) values(?, ?, ?, ?, ?)";
		
		
		try {
			PreparedStatement ps = conexion.getConexion().prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(IntroducirDatos.introducirDatos("Codigo: ")));
			ps.setString(2, IntroducirDatos.introducirDatos("Nombre: "));
			ps.setDouble(3, Double.parseDouble(IntroducirDatos.introducirDatos("Precio: ")));
			
			//buscar el codigo del fabricante, le pasamos el nombre
			int codFab = buscarCodigo(IntroducirDatos.introducirDatos("Nombre del fabricante: "));
			
			ps.setInt(4, codFab);
			ps.setInt(5, Integer.parseInt(IntroducirDatos.introducirDatos("Existencias: ")));
			
			if(ps.executeUpdate()!=0)
				System.out.println("INSERCION OK");
			else
				System.out.println("Error al insertar");
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
