package modeloVO;

public class Producto {
	
	private int codigo;
	private String nombre;
	private double precio;
	private int codFabricante;
	private int existencias;
	
	public Producto() {
		super();
	}

	public Producto(int codigo, String nombre, double precio, int codFabricante, int existencias) {
		super();
		this.codigo = codigo;
		this.nombre = nombre;
		this.precio = precio;
		this.codFabricante = codFabricante;
		this.existencias = existencias;
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public int getCodFabricante() {
		return codFabricante;
	}

	public void setCodFabricante(int codFabricante) {
		this.codFabricante = codFabricante;
	}

	public int getExistencias() {
		return existencias;
	}

	public void setExistencias(int existencias) {
		this.existencias = existencias;
	}
	

}
