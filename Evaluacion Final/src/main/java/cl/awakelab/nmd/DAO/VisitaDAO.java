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
import cl.awakelab.nmd.beans.Cliente;
import cl.awakelab.nmd.beans.Evento;
import cl.awakelab.nmd.beans.Lugar;

import cl.awakelab.nmd.beans.Profesional;
import cl.awakelab.nmd.beans.Usuario;
import cl.awakelab.nmd.beans.Visita;

public class VisitaDAO {

    JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    public class VisitaMapper implements RowMapper<Visita> {
        public Visita mapRow(ResultSet rs, int rowNum) throws SQLException {
            Visita v = new Visita();
            Evento e = new Evento();
            Actividad a = new Actividad();
            Lugar l = new Lugar();
            Cliente cl = new Cliente();
            Usuario u = new Usuario();
            Profesional p = new Profesional();
            v.setId_visita(rs.getInt(1));
            v.setDetalle(rs.getString(2));
            e.setId_evento(rs.getInt(3));
            e.setFecha_inicio(rs.getDate(4));
            e.setFecha_fin(rs.getDate(5));
            e.setHora(rs.getString(6));
            e.setAsunto(rs.getString(7));
            e.setCumplimiento(rs.getString(8));
            a.setId_actividad(rs.getInt(9));
            l.setId_lugar(rs.getInt(10));
            p.setId_profesional(rs.getInt(11));
            u.setNombre(rs.getString(12));
            l.setDireccion(rs.getString(13));
            cl.setUsuario(u);
            a.setCliente(cl);
            a.setProfesional(p);
            e.setLugar(l);
            e.setActividad(a);
            v.setEvento(e);

            return v;
        }
    }

    public int cuentaVisitasCliente(int id) {
        Calendar fecha = Calendar.getInstance();
        int year = fecha.get(Calendar.YEAR);
        int mes = fecha.get(Calendar.MONTH) + 1;
        try {
            String sql = "select n_visitas from visita_x_cl where (id_cliente = ?) and (year= " + year + ") and (mes = "
                    + mes + ")";
            return template.queryForObject(sql, new Object[] { id }, Integer.class);
        } catch (EmptyResultDataAccessException e) {
            return 0;
        }
    }

    public List<Visita> listarVisita (int id) {
        String sql = "SELECT id_visita, detalle, visita.id_evento, fecha_inicio, fecha_fin, hora, asunto,"
        		+ " cumplimiento, evento.id_actividad, evento.id_lugar, id_profesional, nombre, "
        		+ "lugar.direccion FROM visita INNER JOIN evento ON (visita.id_evento = evento.id_evento)"
        		+ " INNER JOIN lugar ON (evento.id_lugar = lugar.id_lugar)INNER JOIN actividad ON"
        		+ " (evento.id_actividad = actividad.id_actividad) INNER JOIN cliente ON"
        		+ " (actividad.id_cliente = cliente.id_cliente) INNER JOIN usuario ON"
        		+ " (cliente.id_usuario = usuario.id_usuario) WHERE id_profesional = " + id; 

        return template.query(sql, new VisitaMapper());
    }

    public Visita buscarVisitaPorId(int id) {
        String sql = "SELECT id_visita, detalle, visita.id_evento, fecha_inicio, fecha_fin, hora, asunto,"
        		+ " cumplimiento, evento.id_actividad, evento.id_lugar, id_profesional, nombre, lugar.direccion "
        		+ "FROM visita INNER JOIN evento ON (visita.id_evento = evento.id_evento) INNER JOIN lugar ON "
        		+ "(evento.id_lugar = lugar.id_lugar)INNER JOIN actividad ON (evento.id_actividad = actividad.id_actividad)"
        		+ " INNER JOIN cliente ON (actividad.id_cliente = cliente.id_cliente) INNER JOIN usuario "
        		+ "ON (cliente.id_usuario = usuario.id_usuario) WHERE id_visita = ?"; 

        return template.queryForObject(sql, new Object[] { id }, new VisitaMapper());
    }

    public int crearVisita(Visita v) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        String fechaInicio = sdf.format(v.getEvento().getFecha_inicio());
        String fechaFin = sdf.format(v.getEvento().getFecha_fin());
        
        String sql = "CALL crear_visita ( '" + v.getEvento().getAsunto() + "', '" + fechaInicio
                + "' , '" + fechaFin + "', '" + v.getEvento().getHora() + "','"
                + v.getEvento().getLugar().getDireccion() + "','" + v.getDetalle() + "', "
                + v.getEvento().getActividad().getProfesional().getId_profesional() + ", "
                + v.getEvento().getActividad().getCliente().getId_cliente() + ", "
                + v.getEvento().getLugar().getLatitud() + ", " + v.getEvento().getLugar().getLongitud() + ", 'F')";

        return template.update(sql);

    }
    
    public int editarVisita (Visita v) {
    	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        String fechaInicio = sdf.format(v.getEvento().getFecha_inicio());
        String fechaFin = sdf.format(v.getEvento().getFecha_fin());
        String sql = "call editar_visita ('" + v.getEvento().getAsunto() + "','" + fechaInicio + "','" + fechaFin + "','" 
        		+ v.getEvento().getHora() + "','" + v.getEvento().getLugar().getDireccion() + "','" + v.getDetalle() + "','"
        		+ "'F', "+ v.getEvento().getLugar().getLatitud() + ", " + v.getEvento().getLugar().getLongitud() + ", " 
        		+ v.getEvento().getId_evento() + ", " + v.getId_visita() + ", " + v.getEvento().getLugar().getId_lugar() + ")";
        		
        System.out.println("Visita Editada");
        return template.update(sql);
    }
    
    public int eliminarVisita(int id) {
    	String sql= "CALL eliminar_visita (" + id + ")";
    	return template.update(sql);

    }
    
    public List<Visita> listarVisitasJsonProf(int id) {
        Calendar fecha1 = Calendar.getInstance();
        fecha1.add(Calendar.MONTH, -6);
        Calendar fecha2 = Calendar.getInstance();
        fecha2.add(Calendar.MONTH, 6);
        SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
        String fechaCadena1 = formato.format(fecha1.getTime());
        String fechaCadena2 = formato.format(fecha2.getTime());
        return template.query("SELECT id_visita, fecha_inicio, fecha_fin, "
                + " asunto FROM visita INNER JOIN evento ON (visita.id_evento = evento.id_evento) "
                + " INNER JOIN actividad ON (evento.id_actividad = actividad.id_actividad) WHERE id_profesional = " + id
                + " and fecha_inicio >= '" + fechaCadena1 + "' and fecha_inicio <= '" + fechaCadena2 + "'",
                new RowMapper<Visita>() {
                    public Visita mapRow(ResultSet rs, int row) throws SQLException {
                        Visita v = new Visita();
                        Evento e = new Evento();
                        v.setId_visita(rs.getInt(1));
                        e.setFecha_inicio(rs.getDate(2));
                        e.setFecha_fin(rs.getDate(3));
                        e.setAsunto(rs.getString(4));
                        v.setEvento(e);
                        return v;
                    }
                });
    }
    
   
    
    public List<Visita> listarVisitasJsonCliente(int id) {
        Calendar fecha1 = Calendar.getInstance();
        fecha1.add(Calendar.MONTH, -6);
        Calendar fecha2 = Calendar.getInstance();
        fecha2.add(Calendar.MONTH, 6);
        SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
        String fechaCadena1 = formato.format(fecha1.getTime());
        String fechaCadena2 = formato.format(fecha2.getTime());
        return template.query("SELECT id_visita, fecha_inicio, fecha_fin, "
                + " asunto FROM visita INNER JOIN evento ON (visita.id_evento = evento.id_evento) "
                + " INNER JOIN actividad ON (evento.id_actividad = actividad.id_actividad) WHERE id_cliente = " + id
                + " and fecha_inicio >= '" + fechaCadena1 + "' and fecha_inicio <= '" + fechaCadena2 + "'",
                new RowMapper<Visita>() {
                    public Visita mapRow(ResultSet rs, int row) throws SQLException {
                        Visita v = new Visita();
                        Evento e = new Evento();
                        v.setId_visita(rs.getInt(1));
                        e.setFecha_inicio(rs.getDate(2));
                        e.setFecha_fin(rs.getDate(3));
                        e.setAsunto(rs.getString(4));
                        v.setEvento(e);
                        return v;
                    }
                });
    }
    
    public int cambiarCumplimientoVisita (Visita v) {
        String sql = "update evento set cumplimiento = '" + v.getEvento().getCumplimiento() + "' where id_evento =" + v.getEvento().getId_evento();
        return template.update(sql);
    }
  
}
