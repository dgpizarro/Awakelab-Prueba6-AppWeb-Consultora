package cl.awakelab.nmd.beans;

import java.sql.Date;

public class Informe_Visita {

	private int id_infor_visita;
	private Date fecha_creacion;
	private String observaciones;
	private Visita visita;
	
	public Informe_Visita() {
		
	}

	public int getId_infor_visita() {
		return id_infor_visita;
	}

	public void setId_infor_visita(int id_infor_visita) {
		this.id_infor_visita = id_infor_visita;
	}

	public Date getFecha_creacion() {
		return fecha_creacion;
	}

	public void setFecha_creacion(Date fecha_creacion) {
		this.fecha_creacion = fecha_creacion;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public Visita getVisita() {
		return visita;
	}

	public void setVisita(Visita visita) {
		this.visita = visita;
	}
	
	
	
	
	
}
