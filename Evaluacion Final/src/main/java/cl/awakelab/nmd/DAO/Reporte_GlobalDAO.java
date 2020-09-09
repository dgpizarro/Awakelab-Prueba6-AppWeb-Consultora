package cl.awakelab.nmd.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import cl.awakelab.nmd.beans.ReporteGlobal;
import cl.awakelab.nmd.beans.Usuario;

public class Reporte_GlobalDAO {

	
	    JdbcTemplate template;

	    public void setTemplate(JdbcTemplate template) {
	        this.template = template;
	    }
	    
	  public class ReporteGlobalMapper implements RowMapper<ReporteGlobal>{
		  public ReporteGlobal mapRow(ResultSet rs, int rowNum) throws SQLException{
			  ReporteGlobal rp = new ReporteGlobal();
			  Usuario us = new Usuario();
			  rp.setId_reporte_global(rs.getInt(1));
			  rp.setFecha_emision(rs.getDate(2));
			  rp.setDetalle(rs.getString(3));
			  us.setId_usuario(rs.getInt(4));
			  rp.setAdmin(us);
			  return rp;
			  
		  }
	  }
}

