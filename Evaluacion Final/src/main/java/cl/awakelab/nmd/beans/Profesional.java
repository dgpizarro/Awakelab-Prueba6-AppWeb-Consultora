package cl.awakelab.nmd.beans;

import java.sql.Date;

public class Profesional {

	private int id_profesional;
	private String rut_profesional;
	private String direccion_profesional;
	private String email_profesional;
	private String telefono_profesional;
	private String profesion;
	private Date fecha_nacimiento;
	private String estado;
	private Usuario usuario;
	
	public Profesional() {
		super();
	}

	public int getId_profesional() {
		return id_profesional;
	}

	public void setId_profesional(int id_profesional) {
		this.id_profesional = id_profesional;
	}

	public String getRut_profesional() {
		return rut_profesional;
	}

	public void setRut_profesional(String rut_profesional) {
		this.rut_profesional = rut_profesional;
	}

	public String getDireccion_profesional() {
		return direccion_profesional;
	}

	public void setDireccion_profesional(String direccion_profesional) {
		this.direccion_profesional = direccion_profesional;
	}

	public String getEmail_profesional() {
		return email_profesional;
	}

	public void setEmail_profesional(String email_profesional) {
		this.email_profesional = email_profesional;
	}

	public String getTelefono_profesional() {
		return telefono_profesional;
	}

	public void setTelefono_profesional(String telefono_profesional) {
		this.telefono_profesional = telefono_profesional;
	}

	public String getProfesion() {
		return profesion;
	}

	public void setProfesion(String profesion) {
		this.profesion = profesion;
	}

	public Date getFecha_nacimiento() {
		return fecha_nacimiento;
	}

	public void setFecha_nacimiento(Date fecha_nacimiento) {
		this.fecha_nacimiento = fecha_nacimiento;
	}

	public String getEstado() {
	    return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	
	
}
