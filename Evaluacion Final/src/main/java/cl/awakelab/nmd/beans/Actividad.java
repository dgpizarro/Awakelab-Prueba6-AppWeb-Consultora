package cl.awakelab.nmd.beans;

public class Actividad {
	
	private int id_actividad;
	private Cliente cliente;
	private Profesional profesional;

	
	public Actividad() {
		
	}


	public int getId_actividad() {
		return id_actividad;
	}


	public void setId_actividad(int id_actividad) {
		this.id_actividad = id_actividad;
	}


	public Cliente getCliente() {
		return cliente;
	}


	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}


	public Profesional getProfesional() {
		return profesional;
	}


	public void setProfesional(Profesional profesional) {
		this.profesional = profesional;
	}
	
	

}