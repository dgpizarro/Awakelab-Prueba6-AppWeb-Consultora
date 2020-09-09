package cl.awakelab.nmd.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import cl.awakelab.nmd.beans.Informe_Visita;
import cl.awakelab.nmd.beans.Visita;

public class InformeVisitaDAO {

    JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    public class InformeVisitaMapper implements RowMapper<Informe_Visita> {
        public Informe_Visita mapRow(ResultSet rs, int rowNum) throws SQLException {
            Informe_Visita iv = new Informe_Visita();
            Visita v = new Visita();
            iv.setId_infor_visita(rs.getInt(1));
            iv.setFecha_creacion(rs.getDate(2));
            iv.setObservaciones(rs.getString(3));
            v.setId_visita(rs.getInt(4));
            iv.setVisita(v);
            return iv;
        }
    }

    public List<Informe_Visita> listaInformePorId(int id) {
        String sql = "SELECT id_infor_visita, fecha_creacion, observaciones, visita.id_visita FROM informe_visita "
                + "INNER JOIN visita ON (informe_visita.id_visita = visita.id_visita) " + "WHERE visita.id_visita = "
                + id;
        return template.query(sql, new InformeVisitaMapper());
    }

    public Informe_Visita buscarInformePorId(int id) {
        try {
            String sql = "SELECT id_infor_visita, fecha_creacion, observaciones, visita.id_visita FROM informe_visita "
                    + "INNER JOIN visita ON (informe_visita.id_visita = visita.id_visita) "
                    + "WHERE visita.id_visita = ?";
            return template.queryForObject(sql, new Object[] { id }, new InformeVisitaMapper());
        } catch (Exception e) {
            return null;
        }

    }

    public int crearInforme(Informe_Visita iv) {
        String sql = "INSERT INTO informe_visita (fecha_creacion, observaciones, id_visita) values (SYSDATE,' "
                + iv.getObservaciones() + "', " + iv.getVisita().getId_visita() + ")";
        return template.update(sql);
    }
    
    public int ediarInformeVisita(Informe_Visita iv) {
        String sql = "UPDATE informe_visita  set observaciones = " + iv.getObservaciones()+ " where id_visita = " + iv.getVisita().getId_visita();      
        return template.update(sql);
    }

    public String obtenerObservacion(int id_visita) {
        String sql = "SELECT observaciones FROM informe_visita WHERE id_visita = ?";
        try {
            String detalle = (String) template.queryForObject(sql, new Object[] { id_visita }, String.class);
            return detalle;
        } catch (Exception e) {
            return "";
        }
    }

}
