package cl.awakelab.nmd.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import cl.awakelab.nmd.beans.Cumplimiento_Tarea;
import cl.awakelab.nmd.beans.Tarea;
import cl.awakelab.nmd.beans.Visita;

public class Cumplimiento_TareaDAO {
	
	JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }
    
    public class Cumplimiento_TareaMapper implements RowMapper<Cumplimiento_Tarea>{
    	public Cumplimiento_Tarea mapRow(ResultSet rs, int rowNum) throws SQLException {
    		Cumplimiento_Tarea ct = new Cumplimiento_Tarea();
    		Tarea t = new Tarea();
    		Visita v = new Visita();
    		ct.setId_cumplimiento(rs.getInt(1));
    		v.setId_visita(rs.getInt(2));
    		t.setId_tarea(rs.getInt(3));
    		ct.setEjecucion(rs.getString(4));
    		ct.setVisita(v);
    		ct.setTarea(t);
    		return ct;
    	
    	}
    	 public int editarC_tarea (Cumplimiento_Tarea ct) {
    	    	
    	    	String sql = "UPDATE cumplimiento_tarea SET ejecucion = 'T' WHERE id_tarea = " + ct.getTarea().getId_tarea();
    	    	return template.update(sql);
    	}
    	 
    }
}