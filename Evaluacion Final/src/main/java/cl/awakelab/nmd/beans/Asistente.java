package cl.awakelab.nmd.beans;

public class Asistente {

	private int id_asistente;
	private String nombre;
	private String rut;
	private Capacitacion capacitacion;
	
	
	public Asistente() {
		
	}


	public int getId_asistente() {
		return id_asistente;
	}


	public void setId_asistente(int id_asistente) {
		this.id_asistente = id_asistente;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getRut() {
		return rut;
	}


	public void setRut(String rut) {
		this.rut = rut;
	}


	public Capacitacion getCapacitacion() {
		return capacitacion;
	}


	public void setCapacitacion(Capacitacion capacitacion) {
		this.capacitacion = capacitacion;
	}
	
	
}

