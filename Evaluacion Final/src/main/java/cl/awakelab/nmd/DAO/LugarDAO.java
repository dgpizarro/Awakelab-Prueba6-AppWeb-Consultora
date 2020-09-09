package cl.awakelab.nmd.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import cl.awakelab.nmd.beans.Lugar;

public class LugarDAO {

    JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    public class LugarMapper implements RowMapper<Lugar> {
        public Lugar mapRow(ResultSet rs, int rowNum) throws SQLException {
            Lugar l = new Lugar();
            l.setId_lugar(rs.getInt(1));
            l.setDireccion(rs.getString(2));
            l.setLatitud(rs.getFloat(3));
            l.setLongitud(rs.getFloat(4));
            return l;
        }

    }

    public Lugar buscarLugarPorCapacitacion(int id) {
        try {
            String sql = "SELECT lugar.id_lugar, direccion, latitud, longitud"
                    + " FROM lugar INNER JOIN evento ON (lugar.id_lugar = evento.id_lugar)"
                    + " INNER JOIN capacitacion ON (evento.id_evento = capacitacion.id_evento) "
                    + "WHERE id_capacitacion = ?";

            return template.queryForObject(sql, new Object[] { id }, new LugarMapper());
        } catch (Exception e) {
            return null;
        }

    }

    public Lugar buscarLugarPorAsesoria(int id) {

        try {
            String sql = "SELECT lugar.id_lugar, direccion, latitud, longitud FROM lugar "
                    + "INNER JOIN evento_asesoria ON (lugar.id_lugar = evento_asesoria.id_lugar)"
                    + "INNER JOIN asesoria ON (evento_asesoria.id_asesoria = asesoria.id_asesoria) WHERE asesoria.id_asesoria = ?";

            return template.queryForObject(sql, new Object[] { id }, new LugarMapper());
        } catch (Exception e) {
            return null;
        }

    }

    public Lugar buscarLugarPorVisita(int id) {

        try {
            String sql = "SELECT lugar.id_lugar, direccion, latitud, longitud FROM lugar INNER JOIN evento ON (lugar.id_lugar = evento.id_lugar)"
                    + "INNER JOIN visita ON (evento.id_evento = visita.id_evento) WHERE id_visita = ?";

            return template.queryForObject(sql, new Object[] { id }, new LugarMapper());
        } catch (Exception e) {
            return null;
        }

    }

}
