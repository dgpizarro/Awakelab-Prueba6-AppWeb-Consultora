package cl.awakelab.nmd.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import cl.awakelab.nmd.beans.Actividad;
import cl.awakelab.nmd.beans.Cliente;
import cl.awakelab.nmd.beans.Profesional;


public class ActividadDAO {

	 JdbcTemplate template;

	    public void setTemplate(JdbcTemplate template) {
	        this.template = template;
	    }
	    
	public class ActividadMapper implements RowMapper<Actividad> {
		public Actividad mapRow(ResultSet rs, int rowNum) throws SQLException{
			Actividad a = new Actividad();
			Cliente c = new Cliente(); 
			Profesional p = new Profesional();
			a.setId_actividad(rs.getInt(1));
			c.setId_cliente(rs.getInt(2));
			p.setId_profesional(rs.getInt(3));
			return a;
							
		}
	}
	
	
}
