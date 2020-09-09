package cl.awakelab.nmd.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;


import cl.awakelab.nmd.beans.Mensaje;
import cl.awakelab.nmd.beans.Usuario;

public class MensajeDAO {

    JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    public class MensajeMapperRemitente implements RowMapper<Mensaje> {
        public Mensaje mapRow(ResultSet rs, int rowNum) throws SQLException {
            Mensaje m = new Mensaje();
            Usuario destinatario = new Usuario();
            Usuario remitente = new Usuario();
            m.setId_mensaje(rs.getInt(1));
            m.setAsunto(rs.getString(2));
            m.setDetalle(rs.getString(3));
            m.setFecha(rs.getDate(4));
            destinatario.setId_usuario(rs.getInt(5));
            m.setLeido(rs.getString(6));
            remitente.setId_usuario(rs.getInt(7));
            remitente.setNombre(rs.getString(8));
            m.setDestinatario(destinatario);
            m.setRemitente(remitente);
            return m;
        }
    }
    
    public class MensajeMapperDestinatario implements RowMapper<Mensaje> {
        public Mensaje mapRow(ResultSet rs, int rowNum) throws SQLException {
            Mensaje m = new Mensaje();
            Usuario destinatario = new Usuario();
            Usuario remitente = new Usuario();
            m.setId_mensaje(rs.getInt(1));
            m.setAsunto(rs.getString(2));
            m.setDetalle(rs.getString(3));
            m.setFecha(rs.getDate(4));
            destinatario.setId_usuario(rs.getInt(5));
            m.setLeido(rs.getString(6));
            remitente.setId_usuario(rs.getInt(7));
            destinatario.setNombre(rs.getString(8));
            m.setDestinatario(destinatario);
            m.setRemitente(remitente);
            return m;
        }
    }

    public List<Mensaje> buscarNotificacionesPorDestinatario(int id_usuario) {
        String sql = "select id_mensaje, asunto, detalle, fecha, id_us_destinatario, "
                + "leido, id_us_remitente, nombre from mensaje inner join usuario on "
                + "(mensaje.id_us_remitente = usuario.id_usuario) where leido = 'N' " + "and id_us_destinatario = "
                + id_usuario;
        return template.query(sql, new MensajeMapperRemitente());
    }
    
    public List<Mensaje> buscarEnviadosPorRemitente(int id_usuario) {
        String sql = "select id_mensaje, asunto, detalle, fecha, id_us_destinatario, "
                + "leido, id_us_remitente, nombre from mensaje inner join usuario on "
                + "(mensaje.id_us_destinatario = usuario.id_usuario) where id_us_remitente = "
                + id_usuario;
        return template.query(sql, new MensajeMapperDestinatario());
    }
    
    public List<Mensaje> buscarTodosLosMensajesPorDestinatario(int id_usuario) {
        String sql = "select id_mensaje, asunto, detalle, fecha, id_us_destinatario, "
                + "leido, id_us_remitente, nombre from mensaje inner join usuario on "
                + "(mensaje.id_us_remitente = usuario.id_usuario) where id_us_destinatario = "
                + id_usuario;
        return template.query(sql, new MensajeMapperRemitente());
    }

    public int crearMensaje(Mensaje m) {
        String sql = "insert into mensaje (asunto, detalle, fecha, id_us_destinatario, id_us_remitente) values ('"
                + m.getAsunto() + "','" + m.getDetalle() + "', SYSDATE ," + m.getDestinatario().getId_usuario() + ","
                + m.getRemitente().getId_usuario() + ")";
        return template.update(sql);
    }

    public int cambiarLeido(int id) {
        String sql = "update mensaje set leido = 'L' where id_mensaje =" + id;
        return template.update(sql);
    }
    
    public Mensaje buscarMensajePorId(int id) {
        String sql = "select id_mensaje, asunto, detalle, fecha, id_us_destinatario, "
                + "leido, id_us_remitente, nombre from mensaje inner join usuario on "
                + "(mensaje.id_us_remitente = usuario.id_usuario) where id_mensaje=? ";
        return template.queryForObject(sql, new Object[]{id}, new MensajeMapperRemitente());
    }
    
    public Mensaje buscarMensajeEnviadoPorId(int id) {
        String sql = "select id_mensaje, asunto, detalle, fecha, id_us_destinatario, "
                + "leido, id_us_remitente, nombre from mensaje inner join usuario on "
                + "(mensaje.id_us_destinatario = usuario.id_usuario) where id_mensaje=? ";
        return template.queryForObject(sql, new Object[]{id}, new MensajeMapperDestinatario());
    }
    
    public List<Mensaje> listarMensajesActualizacionCliente(int id) {
        Calendar fecha1 = Calendar.getInstance();
        fecha1.add(Calendar.MONTH,-1);
        Calendar fecha2 = Calendar.getInstance();
        fecha2.add(Calendar.MONTH,1);
        SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
        String fechaCadena1 = formato.format(fecha1.getTime());
        String fechaCadena2 = formato.format(fecha2.getTime());
        
        return template.query("select detalle, fecha from mensaje inner join usuario on "
                + "(mensaje.id_us_remitente = usuario.id_usuario) inner join cliente on "
                + "(usuario.id_usuario = cliente.id_usuario) where asunto= 'Solicito actualizar mis datos' and "
                + " id_cliente = " + id + " and fecha >= '" + fechaCadena1 + "' and fecha <= '" + fechaCadena2 + "'", new RowMapper<Mensaje>() {
                    public Mensaje mapRow(ResultSet rs, int row) throws SQLException {
                        Mensaje m = new Mensaje();
                        m.setDetalle(rs.getString(1));
                        m.setFecha(rs.getDate(2));
                        return m;
                    }
                });
    }
    
    public List<Mensaje> listarMensajesActualizacionProfesional(int id){
        Calendar fecha1 = Calendar.getInstance();
        fecha1.add(Calendar.MONTH,-1);
        Calendar fecha2 = Calendar.getInstance();
        fecha2.add(Calendar.MONTH,1);
        SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
        String fechaCadena1 = formato.format(fecha1.getTime());
        String fechaCadena2 = formato.format(fecha2.getTime());
        
        return template.query("select detalle, fecha from mensaje inner join usuario on "
                + "(mensaje.id_us_remitente = usuario.id_usuario) inner join profesional on "
                + "(usuario.id_usuario = profesional.id_usuario) where asunto= 'Solicito actualizar mis datos' and "
                + " id_profesional = " + id + " and fecha >= '" + fechaCadena1 + "' and fecha <= '" + fechaCadena2 + "'", new RowMapper<Mensaje>() {
                    public Mensaje mapRow(ResultSet rs, int row) throws SQLException {
                        Mensaje m = new Mensaje();
                        m.setDetalle(rs.getString(1));
                        m.setFecha(rs.getDate(2));
                        return m;
                    }
                });
        
    }

}
