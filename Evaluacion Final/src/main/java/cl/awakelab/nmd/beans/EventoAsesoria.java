package cl.awakelab.nmd.beans;

import java.sql.Date;

public class EventoAsesoria {

	private int id_evento_asesoria;
	private Date fecha_evento;
	private String hora_evento;
	private Asesoria asesoria;
	private Lugar lugar;
	
	
	public EventoAsesoria() {
		
	}


	public int getId_evento_asesoria() {
		return id_evento_asesoria;
	}


	public void setId_evento_asesoria(int id_evento_asesoria) {
		this.id_evento_asesoria = id_evento_asesoria;
	}


	public Date getFecha_evento() {
		return fecha_evento;
	}


	public void setFecha_evento(Date fecha_evento) {
		this.fecha_evento = fecha_evento;
	}


	public String getHora_evento() {
		return hora_evento;
	}


	public void setHora_evento(String hora_evento) {
		this.hora_evento = hora_evento;
	}


	public Asesoria getAsesoria() {
		return asesoria;
	}


	public void setAsesoria(Asesoria asesoria) {
		this.asesoria = asesoria;
	}


	public Lugar getLugar() {
		return lugar;
	}


	public void setLugar(Lugar lugar) {
		this.lugar = lugar;
	}
	
	
	
	
}
