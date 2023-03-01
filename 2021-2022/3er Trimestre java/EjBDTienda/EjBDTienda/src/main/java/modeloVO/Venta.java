package modeloVO;

import java.util.Date;

public class Venta {
	
	private int codProducto;
	private int cantidad;
	private Date fecha;
	
	public Venta() {
		super();
	}

	public Venta(int codProducto, int cantidad, Date fecha) {
		super();
		this.codProducto = codProducto;
		this.cantidad = cantidad;
		this.fecha = fecha;
	}

	public int getCodProducto() {
		return codProducto;
	}

	public void setCodProducto(int codProducto) {
		this.codProducto = codProducto;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

}
