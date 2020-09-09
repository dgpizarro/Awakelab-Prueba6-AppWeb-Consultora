package cl.awakelab.nmd.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import cl.awakelab.nmd.beans.Asistente;

public class AsistenteDAO {

    JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    public class AsistenteMapper implements RowMapper<Asistente> {
        public Asistente mapRow(ResultSet rs, int rowNum) throws SQLException {
            Asistente as = new Asistente();
            as.setNombre(rs.getString(1));
            as.setRut(rs.getNString(2));
            return as;
        }
    }

    public int crearAsistente(Asistente a) {
        String nombre = a.getNombre();
        String nombreR = nombre.replace("'", "''");
        String sql = "insert into asistente (nombre,rut, id_capacitacion) " + "values ('" + nombreR + "', '"
                + a.getRut() + "', '" + a.getCapacitacion().getId_capacitacion() + "')";
        return template.update(sql);
    }

    public List<Asistente> listarAsistentes(int id_capacitacion) {
        String sql = "SELECT nombre, rut FROM asistente INNER JOIN capacitacion ON"
                + " (asistente.id_capacitacion = capacitacion.id_capacitacion)" + " WHERE asistente.id_capacitacion = "
                + id_capacitacion;

        return template.query(sql, new AsistenteMapper());
    }
}