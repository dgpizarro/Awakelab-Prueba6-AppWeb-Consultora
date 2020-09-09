package cl.awakelab.nmd.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import cl.awakelab.nmd.beans.Pagos;
import cl.awakelab.nmd.beans.Cliente;


public class PagosDAO {

	JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }
    
    public class PagosMapper implements RowMapper<Pagos> {
    	public Pagos mapRow(ResultSet rs, int rowNum) throws SQLException{
    		Pagos p = new Pagos();
    		Cliente c = new Cliente();
    		p.setId_pago(rs.getInt(1));
    		p.setFecha_compromiso_pago(rs.getDate(2));
    		p.setCosto_base_mes(rs.getFloat(3));
    		p.setCosto_adicional_mes(rs.getFloat(4));
    		p.setPago_mensual_total(rs.getFloat(5));
    		p.setFecha_pago(rs.getDate(6));
    		p.setEstado(rs.getString(7));
    		c.setId_cliente(rs.getInt(8));
    		p.setCliente(c);
    		return p;
    		
    	}
    }
    
    
    		
  

		
}
