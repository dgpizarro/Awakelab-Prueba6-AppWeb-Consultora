package cl.awakelab.nmd.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import cl.awakelab.nmd.beans.Actividad;
import cl.awakelab.nmd.beans.Evento;
import cl.awakelab.nmd.beans.Lugar;

public class EventoDAO {

	 JdbcTemplate template;

	    public void setTemplate(JdbcTemplate template) {
	        this.template = template;
	    }
	
	    public class EventoMapper implements RowMapper<Evento> {
	        public Evento mapRow(ResultSet rs, int rowNum) throws SQLException {
	            Evento ev = new Evento();
	            Lugar lu = new Lugar();
	            Actividad ac = new Actividad();
	            ev.setId_evento(rs.getInt(1));
	            ev.setFecha_inicio(rs.getDate(2));
	            ev.setFecha_fin(rs.getDate(3));
	            ev.setHora(rs.getString(4));
	            ev.setAsunto(rs.getString(5));
	            ev.setCumplimiento(rs.getString(6));
	            ac.setId_actividad(rs.getInt(7));
	            lu.setId_lugar(rs.getInt(8));
	            ev.setActividad(ac);
	            ev.setLugar(lu);
	            return ev;
	        }
	    }
}
