package cl.awakelab.nmd.beans;

public class Lugar {

	private int id_lugar;
	private String direccion;
	private float latitud;
	private float longitud;
	
	
	
	public Lugar() {
		
	}



	public int getId_lugar() {
		return id_lugar;
	}



	public void setId_lugar(int id_lugar) {
		this.id_lugar = id_lugar;
	}



	public String getDireccion() {
		return direccion;
	}



	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}



	public float getLatitud() {
		return latitud;
	}



	public void setLatitud(float latitud) {
		this.latitud = latitud;
	}



	public float getLongitud() {
		return longitud;
	}



	public void setLongitud(float longitud) {
		this.longitud = longitud;
	}
	
	
	
}
