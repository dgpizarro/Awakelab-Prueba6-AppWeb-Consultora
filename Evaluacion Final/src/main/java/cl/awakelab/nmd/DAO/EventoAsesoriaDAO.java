package cl.awakelab.nmd.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import cl.awakelab.nmd.beans.Asesoria;

import cl.awakelab.nmd.beans.EventoAsesoria;
import cl.awakelab.nmd.beans.Lugar;


public class EventoAsesoriaDAO {

    JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    public class EventoAsesoriaMapper implements RowMapper<EventoAsesoria> {
        public EventoAsesoria mapRow(ResultSet rs, int rowNum) throws SQLException {
            EventoAsesoria es = new EventoAsesoria();
            Asesoria as = new Asesoria();
            Lugar l = new Lugar();
            es.setId_evento_asesoria(rs.getInt(1));
            es.setFecha_evento(rs.getDate(2));
            es.setHora_evento(rs.getString(3));
            as.setId_asesoria(rs.getInt(4));
            l.setId_lugar(rs.getInt(5));
            l.setLatitud(rs.getInt(6));
            l.setLongitud(rs.getInt(7));
            l.setDireccion(rs.getString(8));
            es.setAsesoria(as);
            es.setLugar(l);
            return es;

        }
    }

    public EventoAsesoria buscarEventoAsesoriaPorId(int id) {
        String sql = "SELECT id_evento_asesoria, fecha_evento, hora_evento, id_asesoria, "
                + "evento_asesoria.id_lugar, latitud, longitud, direccion FROM evento_asesoria "
                + "INNER JOIN lugar ON  (evento_asesoria.id_lugar = lugar.id_lugar) WHERE id_asesoria = ? ";
        try {
            return template.queryForObject(sql, new Object[] { id }, new EventoAsesoriaMapper());
        } catch (Exception e) {
            return null;
        }

    }

    public int crearEventoAsesoria(EventoAsesoria e) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        String fecha_evento = sdf.format(e.getFecha_evento());
        String sql = "CALL crear_evento_asesoria ('" + e.getLugar().getDireccion() + "', " + e.getLugar().getLatitud()
                + ", " + e.getLugar().getLongitud() + ", '" + fecha_evento + "', '" + e.getHora_evento() + "', "
                + e.getAsesoria().getId_asesoria() + ")";

        return template.update(sql);
    }

    public List<EventoAsesoria> listarAsesoriaJsonProf(int id) {
        Calendar fecha1 = Calendar.getInstance();
        fecha1.add(Calendar.MONTH, -6);
        Calendar fecha2 = Calendar.getInstance();
        fecha2.add(Calendar.MONTH, 6);
        SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
        String fechaCadena1 = formato.format(fecha1.getTime());
        String fechaCadena2 = formato.format(fecha2.getTime());
        return template.query("SELECT asesoria.id_asesoria, asunto, fecha_evento FROM asesoria INNER JOIN evento_asesoria "
                            + "ON (asesoria.id_asesoria = evento_asesoria.id_asesoria) "
                            + " INNER JOIN actividad ON (asesoria.id_actividad = actividad.id_actividad) WHERE id_profesional = "
                            + id + " and fecha_evento >= '" + fechaCadena1 + "' and fecha_evento <= '" + fechaCadena2 + "'",
                            new RowMapper<EventoAsesoria>() {
                    public EventoAsesoria mapRow(ResultSet rs, int row) throws SQLException {
                        EventoAsesoria ea = new EventoAsesoria();
                        Asesoria a = new Asesoria();
                        a.setId_asesoria(rs.getInt(1));
                        a.setAsunto(rs.getString(2));
                        ea.setFecha_evento(rs.getDate(3));
                        ea.setAsesoria(a);
                        return ea;
                    }
                });
    }
    
    public List<EventoAsesoria> listarAsesoriaJsonCliente(int id) {
        Calendar fecha1 = Calendar.getInstance();
        fecha1.add(Calendar.MONTH, -6);
        Calendar fecha2 = Calendar.getInstance();
        fecha2.add(Calendar.MONTH, 6);
        SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
        String fechaCadena1 = formato.format(fecha1.getTime());
        String fechaCadena2 = formato.format(fecha2.getTime());
        return template.query("SELECT asesoria.id_asesoria, asunto, fecha_evento FROM asesoria INNER JOIN evento_asesoria "
                            + "ON (asesoria.id_asesoria = evento_asesoria.id_asesoria) "
                            + " INNER JOIN actividad ON (asesoria.id_actividad = actividad.id_actividad) WHERE id_cliente = "
                            + id + " and fecha_evento >= '" + fechaCadena1 + "' and fecha_evento <= '" + fechaCadena2 + "'",
                            new RowMapper<EventoAsesoria>() {
                    public EventoAsesoria mapRow(ResultSet rs, int row) throws SQLException {
                        EventoAsesoria ea = new EventoAsesoria();
                        Asesoria a = new Asesoria();
                        a.setId_asesoria(rs.getInt(1));
                        a.setAsunto(rs.getString(2));
                        ea.setFecha_evento(rs.getDate(3));
                        ea.setAsesoria(a);
                        return ea;
                    }
                });
    }

}
