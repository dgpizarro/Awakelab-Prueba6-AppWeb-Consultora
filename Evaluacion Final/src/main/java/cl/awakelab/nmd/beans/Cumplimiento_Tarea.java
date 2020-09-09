package cl.awakelab.nmd.beans;

public class Cumplimiento_Tarea {
	
	private int id_cumplimiento;
	private Visita visita;
	private Tarea tarea;
	private String ejecucion;
	
	public Cumplimiento_Tarea() {
		
	}

	public int getId_cumplimiento() {
		return id_cumplimiento;
	}

	public void setId_cumplimiento(int id_cumplimiento) {
		this.id_cumplimiento = id_cumplimiento;
	}

	public Visita getVisita() {
		return visita;
	}

	public void setVisita(Visita visita) {
		this.visita = visita;
	}

	public Tarea getTarea() {
		return tarea;
	}

	public void setTarea(Tarea tarea) {
		this.tarea = tarea;
	}

	public String getEjecucion() {
		return ejecucion;
	}

	public void setEjecucion(String ejecucion) {
		this.ejecucion = ejecucion;
	}
	
	
}
