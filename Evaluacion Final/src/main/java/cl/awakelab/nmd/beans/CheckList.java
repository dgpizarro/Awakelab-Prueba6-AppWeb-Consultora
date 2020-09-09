package cl.awakelab.nmd.beans;

import java.sql.Date;

public class CheckList {
	private int id_checklist;
	private Actividad Actividad;
	private Date fecha_creacion;
	private Date fecha_act_1;
	private Date fecha_act_2;
	
	public CheckList() {
		super();
	}

	public int getId_checklist() {
		return id_checklist;
	}

	public void setId_checklist(int id_checklist) {
		this.id_checklist = id_checklist;
	}

	public Actividad getActividad() {
		return Actividad;
	}

	public void setActividad(Actividad actividad) {
		Actividad = actividad;
	}

	public Date getFecha_creacion() {
		return fecha_creacion;
	}

	public void setFecha_creacion(Date fecha_creacion) {
		this.fecha_creacion = fecha_creacion;
	}

	public Date getFecha_act_1() {
		return fecha_act_1;
	}

	public void setFecha_act_1(Date fecha_act_1) {
		this.fecha_act_1 = fecha_act_1;
	}

	public Date getFecha_act_2() {
		return fecha_act_2;
	}

	public void setFecha_act_2(Date fecha_act_2) {
		this.fecha_act_2 = fecha_act_2;
	}
	
	
	

}
