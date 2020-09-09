package cl.awakelab.nmd.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;


import cl.awakelab.nmd.beans.Actividad;
import cl.awakelab.nmd.beans.Capacitacion;
import cl.awakelab.nmd.beans.Cliente;
import cl.awakelab.nmd.beans.Evento;
import cl.awakelab.nmd.beans.Lugar;
import cl.awakelab.nmd.beans.Profesional;
import cl.awakelab.nmd.beans.Usuario;

public class CapacitacionDAO {

    JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    public class CapacitacionMapper implements RowMapper<Capacitacion> {
        public Capacitacion mapRow(ResultSet rs, int rowNum) throws SQLException {
            Capacitacion c = new Capacitacion();
            Evento e = new Evento();
            Actividad ac = new Actividad();
            Lugar l = new Lugar();
            Cliente cl = new Cliente();
            Usuario u = new Usuario();
            Profesional p = new Profesional();
            c.setId_capacitacion(rs.getInt(1));
            c.setDetalle(rs.getString(2));
            c.setExtra(rs.getString(3));
            e.setId_evento(rs.getInt(4));
            e.setFecha_inicio(rs.getDate(5));
            e.setFecha_fin(rs.getDate(6));
            e.setHora(rs.getString(7));
            e.setAsunto(rs.getString(8));
            e.setCumplimiento(rs.getString(9));
            ac.setId_actividad(rs.getInt(10));
            l.setId_lugar(rs.getInt(11));
            p.setId_profesional(rs.getInt(12));
            u.setNombre(rs.getString(13));
            l.setDireccion(rs.getString(14));
            cl.setUsuario(u);
            ac.setCliente(cl);
            e.setActividad(ac);
            e.setLugar(l);
            c.setEvento(e);

            return c;

        }
    }

    public int cuentaCapacitacionesCliente(int id) {
        Calendar fecha = Calendar.getInstance();
        int year = fecha.get(Calendar.YEAR);
        int mes = fecha.get(Calendar.MONTH) + 1;
        try {
            String sql = "select sum(n_capacitaciones) from capacitacion_x_cl where (id_cliente = ?) and (year= " + year
                    + ") and (mes = " + mes + ")";
            return template.queryForObject(sql, new Object[] { id }, Integer.class);
        } catch (EmptyResultDataAccessException | NullPointerException e) {
            return 0;
        }
    }

    public List<Capacitacion> listarCapacitacion(int id) {
        String sql = "SELECT id_capacitacion, detalle, extra, capacitacion.id_evento, fecha_inicio, fecha_fin,"
                + " hora, asunto, cumplimiento, evento.id_actividad, evento.id_lugar, id_profesional, nombre, lugar.direccion"
                + " FROM capacitacion INNER JOIN evento ON (capacitacion.id_evento = evento.id_evento)"
                + " INNER JOIN actividad ON (evento.id_actividad = actividad.id_actividad) INNER JOIN"
                + " cliente ON (actividad.id_cliente = cliente.id_cliente) INNER JOIN usuario"
                + " ON (cliente.id_usuario = usuario.id_usuario)"
                + "INNER JOIN lugar ON (evento.id_lugar = lugar.id_lugar) WHERE id_profesional =" + id;

        return template.query(sql, new CapacitacionMapper());
    }

    public Capacitacion buscarCapacitacionPorId(int id) {
        String sql = "SELECT id_capacitacion, detalle, extra, capacitacion.id_evento, fecha_inicio, fecha_fin,"
                + " hora, asunto, cumplimiento, evento.id_actividad, evento.id_lugar, id_profesional, nombre, lugar.direccion"
                + " FROM capacitacion INNER JOIN evento ON (capacitacion.id_evento = evento.id_evento)"
                + " INNER JOIN actividad ON (evento.id_actividad = actividad.id_actividad) INNER JOIN"
                + " cliente ON (actividad.id_cliente = cliente.id_cliente) INNER JOIN usuario"
                + " ON (cliente.id_usuario = usuario.id_usuario) "
                + "INNER JOIN lugar ON (evento.id_lugar = lugar.id_lugar) WHERE id_capacitacion = ?";

        return template.queryForObject(sql, new Object[] { id }, new CapacitacionMapper());
    }

    public int crearCapacitacion(Capacitacion c) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        String fechaInicio = sdf.format(c.getEvento().getFecha_inicio());
        String fechaFin = sdf.format(c.getEvento().getFecha_fin());

        String sql = "CALL crear_capacitacion ( '" + c.getDetalle() + "', '" + c.getExtra() + "', '" + fechaInicio
                + "', '" + fechaFin + "', '" + c.getEvento().getHora() + "', '" + c.getEvento().getAsunto() + "', 'F', "
                + c.getEvento().getLugar().getLatitud() + ", '" + c.getEvento().getLugar().getDireccion() + "', "
                + c.getEvento().getLugar().getLongitud() + ", "
                + c.getEvento().getActividad().getCliente().getId_cliente() + ", "
                + c.getEvento().getActividad().getProfesional().getId_profesional() + " )";

        return template.update(sql);

    }

    public List<Capacitacion> listarCapacitacionesJsonProf(int id) {
        Calendar fecha1 = Calendar.getInstance();
        fecha1.add(Calendar.MONTH, -6);
        Calendar fecha2 = Calendar.getInstance();
        fecha2.add(Calendar.MONTH, 6);
        SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
        String fechaCadena1 = formato.format(fecha1.getTime());
        String fechaCadena2 = formato.format(fecha2.getTime());
        return template.query("SELECT id_capacitacion, fecha_inicio, fecha_fin, "
                + " asunto FROM capacitacion INNER JOIN evento ON (capacitacion.id_evento = evento.id_evento) "
                + " INNER JOIN actividad ON (evento.id_actividad = actividad.id_actividad) WHERE id_profesional = " + id
                + " and fecha_inicio >= '" + fechaCadena1 + "' and fecha_inicio <= '" + fechaCadena2 + "'",
                new RowMapper<Capacitacion>() {
                    public Capacitacion mapRow(ResultSet rs, int row) throws SQLException {
                        Capacitacion c = new Capacitacion();
                        Evento e = new Evento();
                        c.setId_capacitacion(rs.getInt(1));
                        e.setFecha_inicio(rs.getDate(2));
                        e.setFecha_fin(rs.getDate(3));
                        e.setAsunto(rs.getString(4));
                        c.setEvento(e);
                        return c;
                    }
                });
    }
    
    public List<Capacitacion> listarCapacitacionesJsonCliente(int id) {
        Calendar fecha1 = Calendar.getInstance();
        fecha1.add(Calendar.MONTH, -6);
        Calendar fecha2 = Calendar.getInstance();
        fecha2.add(Calendar.MONTH, 6);
        SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
        String fechaCadena1 = formato.format(fecha1.getTime());
        String fechaCadena2 = formato.format(fecha2.getTime());
        return template.query("SELECT id_capacitacion, fecha_inicio, fecha_fin, "
                + " asunto FROM capacitacion INNER JOIN evento ON (capacitacion.id_evento = evento.id_evento) "
                + " INNER JOIN actividad ON (evento.id_actividad = actividad.id_actividad) WHERE id_cliente = " + id
                + " and fecha_inicio >= '" + fechaCadena1 + "' and fecha_inicio <= '" + fechaCadena2 + "'",
                new RowMapper<Capacitacion>() {
                    public Capacitacion mapRow(ResultSet rs, int row) throws SQLException {
                        Capacitacion c = new Capacitacion();
                        Evento e = new Evento();
                        c.setId_capacitacion(rs.getInt(1));
                        e.setFecha_inicio(rs.getDate(2));
                        e.setFecha_fin(rs.getDate(3));
                        e.setAsunto(rs.getString(4));
                        c.setEvento(e);
                        return c;
                    }
                });
    }
    
    public int cambiarCumplimientoCapacitacion(Capacitacion c) {
        String sql = "update evento set cumplimiento = '" + c.getEvento().getCumplimiento() + "' where id_evento =" + c.getEvento().getId_evento();
        return template.update(sql);
    }

}
