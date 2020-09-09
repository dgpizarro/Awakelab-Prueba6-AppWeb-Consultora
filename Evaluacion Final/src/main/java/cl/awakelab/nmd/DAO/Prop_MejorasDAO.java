package cl.awakelab.nmd.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;



import cl.awakelab.nmd.beans.Prop_Mejoras;
import cl.awakelab.nmd.beans.Visita;

public class Prop_MejorasDAO {
	JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }
    
    public class Prop_MejorasMapper implements RowMapper<Prop_Mejoras> {
    	public Prop_Mejoras mapRow(ResultSet rs, int rowNum) throws SQLException {
    		Prop_Mejoras pm = new Prop_Mejoras();
    		Visita v = new Visita();
    		pm.setId_mejora(rs.getInt(1));
    		pm.setDetalle(rs.getString(2));
    		pm.setEstado(rs.getString(3));
    		v.setId_visita(rs.getInt(4));
    		pm.setVisita(v);
    		return pm;
    	}
    }
    
    public List<Prop_Mejoras> buscarPropuestasPorVisita(int id) {
    	String sql = "SELECT id_mejora, detalle, estado, id_visita " + 
    			"FROM prop_mejoras where id_visita = " + id;
    	return template.query(sql, new Prop_MejorasMapper());
    }
    
    public int crearProp_Mejoras(Prop_Mejoras pm) {
    	String sql = "insert into prop_mejoras (detalle,estado,id_visita)" + 
    			"values ('" + pm.getDetalle() + "','F', " 
    			+ pm.getVisita().getId_visita() + ")";
    	return template.update(sql);
    }
    
    public Prop_Mejoras buscarPropuestaPorId(int id) {
        String sql = "SELECT id_mejora, detalle, estado, id_visita FROM prop_mejoras where id_mejora = ?";
        return template.queryForObject(sql, new Object[] { id }, new Prop_MejorasMapper());
    }
    
    public int modificarPropuesta(Prop_Mejoras pm) {
    	String sql = "update prop_mejoras set detalle ='" + pm.getDetalle() + "','" + pm.getEstado() +"' where id_mejora = " 
    + pm.getId_mejora() +"" ;
    	return template.update(sql);
    }
    
    
    
    
    
    
}
