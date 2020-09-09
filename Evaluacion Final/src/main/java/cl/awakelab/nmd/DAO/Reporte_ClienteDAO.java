package cl.awakelab.nmd.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import cl.awakelab.nmd.beans.Cliente;
import cl.awakelab.nmd.beans.Reporte_Cliente;

public class Reporte_ClienteDAO {

	JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }
    
    public class Reporte_ClienteMapper implements RowMapper<Reporte_Cliente> {
    	public Reporte_Cliente mapRow(ResultSet rs, int rowNum) throws SQLException{
    		Reporte_Cliente rp = new Reporte_Cliente();
    		Cliente c = new Cliente();
    		rp.setId_reporte_cliente(rs.getInt(1));
    		rp.setFecha_emision(rs.getDate(2));
    		rp.setDetalle(rs.getString(3));
    		rp.setTipo(rs.getString(4));
    		rp.setVisibilidad(rs.getString(5));
    		c.setId_cliente(rs.getInt(6));
    		rp.setCliente(c);
    		return rp;
    	}
    }
	
}
