package cl.awakelab.nmd.DAO;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;


import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import cl.awakelab.nmd.security.ClaveEncriptada;

import cl.awakelab.nmd.beans.Usuario;

public class UsuarioDAO {
    
    JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }
    
    public class UsuarioMapper implements RowMapper<Usuario>{
    	public Usuario mapRow(ResultSet rs, int rowNum) throws SQLException{
    		Usuario u = new Usuario();
    		u.setId_usuario(rs.getInt(1));
    		u.setUsuario(rs.getString(2));
    		u.setContrasena(rs.getString(3));
    		u.setFecha_registro(rs.getDate(4));
    		return u;
    	}
    }
    
    public int obtenerIDUsuario (String username) {
        try {
            String sql = "select id_usuario from usuario where (usuario = ?)";
            return template.queryForObject(sql, new Object[]{username}, Integer.class);
        } catch (EmptyResultDataAccessException | NullPointerException e) {
            return 0;
        }
    }
    
    public String obtenerNombreUsuario (String username) {
        try {
            String sql = "select nombre from usuario where (usuario = ?)";
            return template.queryForObject(sql, new Object[]{username}, String.class);
        } catch (EmptyResultDataAccessException | NullPointerException e) {
            return "";
        }
    }
    
    public int cambiarPassword (Usuario u) {
        int id = u.getId_usuario();
        String password = u.getContrasena();
        ClaveEncriptada p = new ClaveEncriptada();
        String claveSegura = p.hashPassword(password);
        String sql = "update usuario set contrasena = '" + claveSegura + "' where id_usuario =" + id;
        System.out.println("Contraseña cambiada exitosamente");
        return template.update(sql);        
    }
    
    public Date obtenerFechaRegistro (String username) {
        try {
            String sql = "select fecha_registro from usuario where (usuario = ?)";
            return template.queryForObject(sql, new Object[]{username}, Date.class);
        } catch (EmptyResultDataAccessException | NullPointerException e) {
            return null;
        }
    }
    
    
    
   
    
    

}
