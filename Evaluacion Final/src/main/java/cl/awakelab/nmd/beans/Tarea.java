package cl.awakelab.nmd.beans;

public class Tarea {

	
	private int id_tarea;
	private String detalle_tarea;
	private CheckList checklist;
	
	



	public Tarea() {
		
	}

	public int getId_tarea() {
		return id_tarea;
	}

	public void setId_tarea(int id_tarea) {
		this.id_tarea = id_tarea;
	}

	public String getDetalle_tarea() {
		return detalle_tarea;
	}

	public void setDetalle_tarea(String detalle_tarea) {
		this.detalle_tarea = detalle_tarea;
	}

	public CheckList getChecklist() {
		return checklist;
	}

	public void setChecklist(CheckList checklist) {
		this.checklist = checklist;
	}
	
	
	
}
