package EjercicioFichero;

import java.io.*;
import java.sql.*;

import Ejemplo02.Conexion;

public class Principal {

	public static void main(String[] args) throws Exception {
		String server = "localhost";
		int puerto = 3306;
		String user = "root";
		String passwd = "";
		String db = "northwind";
		Conexion con = new Conexion(server, puerto, user, passwd, "");

		try {
			Statement s = con.getConexion().createStatement();
			s.execute("use " + db);
			ResultSet rs = s.executeQuery("select * from customers");

			ResultSetMetaData rsmd = rs.getMetaData();
			int numRegistros = 0;

			FileWriter archivo = null;
			PrintWriter impresor = null;

			try {
				archivo = new FileWriter("C:\\Users\\Primero DAM\\eclipse-workspace\\Eval3_BBDD\\src\\ejercicio01.txt");
				impresor = new PrintWriter(archivo);

				while (rs.next()) {
					numRegistros++;
					impresor.println("Cliente " + numRegistros + ":");

					// Recorrido de cada columna para cada customer
					for (int i = 1; i <= rsmd.getColumnCount(); i++) {
						String columnName = rsmd.getColumnName(i);
						Object value = rs.getObject(i);
						impresor.println(columnName + ": " + value);
					}

					impresor.println("----------------------");
				}

				System.out.println("Total de clientes: " + numRegistros);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (archivo != null)
						archivo.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
