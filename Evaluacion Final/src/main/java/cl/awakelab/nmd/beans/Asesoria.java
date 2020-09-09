package cl.awakelab.nmd.beans;

import java.sql.Date;

public class Asesoria {

	private int id_asesoria;
	private Date fecha_creacion;
	private String asunto;
	private String detalle;
	private String extra;
	private Actividad actividad;
	private Accidente accidente;
	private Visita visita;
	
	
	
	public Asesoria() {
		
	}


	public Date getFecha_creacion() {
		return fecha_creacion;
	}


	public void setFecha_creacion(Date fecha_creacion) {
		this.fecha_creacion = fecha_creacion;
	}


	public String getAsunto() {
		return asunto;
	}


	public void setAsunto(String asunto) {
		this.asunto = asunto;
	}


	public String getDetalle() {
		return detalle;
	}


	public void setDetalle(String detalle) {
		this.detalle = detalle;
	}


	public String getExtra() {
		return extra;
	}


	public void setExtra(String extra) {
		this.extra = extra;
	}


	public Actividad getActividad() {
		return actividad;
	}


	public void setActividad(Actividad actividad) {
		this.actividad = actividad;
	}


	public Accidente getAccidente() {
		return accidente;
	}


	public void setAccidente(Accidente accidente) {
		this.accidente = accidente;
	}


	public Visita getVisita() {
		return visita;
	}


	public void setVisita(Visita visita) {
		this.visita = visita;
	}


	public int getId_asesoria() {
		return id_asesoria;
	}


	public void setId_asesoria(int id_asesoria) {
		this.id_asesoria = id_asesoria;
	}
	
}
