package cl.awakelab.nmd.beans;

public class Perfil_Usuario {
	private int id_perfil_usuario;
	private String rol;
	private Usuario Usuario;
	
	public Perfil_Usuario() {
		super();
	}
	public int getId_perfil_usuario() {
		return id_perfil_usuario;
	}
	public void setId_perfil_usuario(int id_perfil_usuario) {
		this.id_perfil_usuario = id_perfil_usuario;
	}
	public String getRol() {
		return rol;
	}
	public void setRol(String rol) {
		this.rol = rol;
	}
	public Usuario getUsuario() {
		return Usuario;
	}
	public void setUsuario(Usuario usuario) {
		Usuario = usuario;
	}
	
}
