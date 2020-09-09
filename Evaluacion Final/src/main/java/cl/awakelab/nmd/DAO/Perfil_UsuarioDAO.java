package cl.awakelab.nmd.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import cl.awakelab.nmd.beans.Perfil_Usuario;
import cl.awakelab.nmd.beans.Usuario;

public class Perfil_UsuarioDAO {

	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public class Perfil_UsuarioMapper implements RowMapper<Perfil_Usuario> {
		public Perfil_Usuario mapRow(ResultSet rs, int rowNum) throws SQLException {
			Perfil_Usuario pu = new Perfil_Usuario();
			Usuario u = new Usuario();
			pu.setId_perfil_usuario(rs.getInt(1));
			pu.setRol(rs.getString(2));
			u.setId_usuario(rs.getInt(3));
			pu.setUsuario(u);
			return pu;
		}
	}
}
