package cl.awakelab.nmd.beans;

public class Prop_Mejoras {

	private int id_mejora;
	private String detalle;
	private String estado;
	private Visita visita;
	
	public Prop_Mejoras() {
		
	}

	public int getId_mejora() {
		return id_mejora;
	}

	public void setId_mejora(int id_mejora) {
		this.id_mejora = id_mejora;
	}

	public String getDetalle() {
		return detalle;
	}

	public void setDetalle(String detalle) {
		this.detalle = detalle;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public Visita getVisita() {
		return visita;
	}

	public void setVisita(Visita visita) {
		this.visita = visita;
	}
	
	
	
	
	
}
