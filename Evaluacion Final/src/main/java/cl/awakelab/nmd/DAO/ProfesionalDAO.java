package cl.awakelab.nmd.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import cl.awakelab.nmd.security.ClaveEncriptada;

import cl.awakelab.nmd.beans.Profesional;
import cl.awakelab.nmd.beans.Usuario;

public class ProfesionalDAO {

    JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    public int obtenerIDProfesional(int id_usuario) {
        try {
            String sql = "select id_profesional from profesional where (id_usuario = ?)";
            return template.queryForObject(sql, new Object[] { id_usuario }, Integer.class);
        } catch (EmptyResultDataAccessException e) {
            return 0;
        }
    }

    public class PorfesionalMapper implements RowMapper<Profesional> {
        public Profesional mapRow(ResultSet rs, int rowNum) throws SQLException {
            Profesional pr = new Profesional();
            Usuario u = new Usuario();
            pr.setId_profesional(rs.getInt(1));
            pr.setRut_profesional(rs.getString(2));
            pr.setDireccion_profesional(rs.getString(3));
            pr.setEmail_profesional(rs.getString(4));
            pr.setTelefono_profesional(rs.getString(5));
            pr.setProfesion(rs.getString(6));
            pr.setFecha_nacimiento(rs.getDate(7));
            pr.setEstado(rs.getString(8));
            u.setId_usuario(rs.getInt(9));
            u.setNombre(rs.getString(10));
            pr.setUsuario(u);
            return pr;
        }
    }

    public Profesional buscarPorId(int id) {
        String sql = "select id_profesional, rut_profesional, direccion_profesional, email_profesional, "
                + "telefono_profesional, profesion, fecha_nacimiento, estado, profesional.id_usuario, nombre "
                + "from profesional inner join usuario on (profesional.id_usuario = usuario.id_usuario) "
                + "where profesional.id_usuario = ?";
        return template.queryForObject(sql, new Object[] { id }, new PorfesionalMapper());
    }
    
    public List<Profesional> listarProfesionales(int id) {
        String sql = "select id_profesional, rut_profesional, direccion_profesional, email_profesional, "
                + "telefono_profesional, profesion, fecha_nacimiento, estado, profesional.id_usuario, nombre "
                + "from profesional inner join usuario on (profesional.id_usuario = usuario.id_usuario) ";
                
        return template.query(sql, new PorfesionalMapper());
    }

    public List<Profesional> listarDestinatariosCliente() {
        return template.query("select usuario.id_usuario, nombre, profesion from perfil_usuario "
                + "inner join usuario on (usuario.id_usuario = perfil_usuario.id_usuario)  "
                + "left join profesional on (usuario.id_usuario = profesional.id_usuario) "
                + "where rol = 'ROLE_PROFESIONAL'", new RowMapper<Profesional>() {
                    public Profesional mapRow(ResultSet rs, int row) throws SQLException {
                        Profesional p = new Profesional();
                        Usuario u = new Usuario();
                        u.setId_usuario(rs.getInt(1));
                        u.setNombre(rs.getString(2));
                        p.setProfesion(rs.getString(3));
                        p.setUsuario(u);
                        return p;
                    }
                });
    }

    public String obtenerProfesion(int id_profesional) {
        String sql = "SELECT profesion FROM profesional inner join usuario on (profesional.id_usuario = usuario.id_usuario) WHERE profesional.id_usuario = ?";
        try {
            String detalle = (String) template.queryForObject(sql, new Object[] { id_profesional }, String.class);
            return detalle;
        } catch (Exception e) {
            return "";
        }
    }
    
    public Profesional buscarPorIdProfesional(int id) {
        String sql = "select id_profesional, rut_profesional, direccion_profesional, email_profesional, "
                + "telefono_profesional, profesion, fecha_nacimiento, estado, profesional.id_usuario, nombre "
                + "from profesional inner join usuario on (profesional.id_usuario = usuario.id_usuario) "
                + "where id_profesional = ?";
        return template.queryForObject(sql, new Object[] { id }, new PorfesionalMapper());
    }
    
    public List<Profesional> listarDestinatariosOtrosProfesioanles(int id) {
        return template.query("select usuario.id_usuario, nombre, profesion from perfil_usuario "
                + "inner join usuario on (usuario.id_usuario = perfil_usuario.id_usuario)  "
                + "left join profesional on (usuario.id_usuario = profesional.id_usuario) "
                + "where rol = 'ROLE_PROFESIONAL' and  usuario.id_usuario != " + id, new RowMapper<Profesional>() {
                    public Profesional mapRow(ResultSet rs, int row) throws SQLException {
                        Profesional p = new Profesional();
                        Usuario u = new Usuario();
                        u.setId_usuario(rs.getInt(1));
                        u.setNombre(rs.getString(2));
                        p.setProfesion(rs.getString(3));
                        p.setUsuario(u);
                        return p;
                    }
                });
    }
    
    public int crearProfesional(Profesional p) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        String fechaComoCadena = sdf.format(p.getFecha_nacimiento());
                
        String password = p.getUsuario().getContrasena();
        ClaveEncriptada ce = new ClaveEncriptada();
        String claveSegura = ce.hashPassword(password);
        
        String nombre = p.getUsuario().getNombre();
        String direccion = p.getDireccion_profesional();
        String nombreR = nombre.replace("'","''");
        String direccionR = direccion.replace("'", "''");
        
        String sql = "CALL crear_profesional ('" + p.getRut_profesional() + "', '" + claveSegura + "', SYSDATE , '" + nombreR + "', '"
                + direccionR + "', '" + p.getEmail_profesional() + "', '" + p.getTelefono_profesional() + "', '" + p.getProfesion() + "','"
                + fechaComoCadena + "', 'Vigente' )";
        return template.update(sql);
    }
    
    public int editarProfesional (Profesional p) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        String fechaComoCadena = sdf.format(p.getFecha_nacimiento());
                
        
        String sql = "call editar_profesional ('" + p.getRut_profesional() + "', '" + p.getUsuario().getNombre() + "','"
                + p.getDireccion_profesional() + "','" + fechaComoCadena + "','" + p.getProfesion() + "','"
                + p.getEmail_profesional() + "', '" + p.getTelefono_profesional() + "','" + p.getEstado() + "', '"
                + p.getId_profesional() + "'," + p.getUsuario().getId_usuario() + ")";
        System.out.println("Profesional editado");
        System.out.println(p.getId_profesional());
        System.out.println(p.getUsuario().getId_usuario());
        return template.update(sql);
    }
    
    public List<Profesional> listarResumenProfesionales(){
        return template.query("select id_profesional, usuario.nombre, rut_profesional,  "
                + "profesion, estado, profesional.id_usuario"
                + " from profesional inner join usuario on (profesional.id_usuario = usuario.id_usuario)", new RowMapper<Profesional>() {
                    public Profesional mapRow(ResultSet rs, int row) throws SQLException {
                        Profesional p = new Profesional();
                        Usuario u = new Usuario();
                        p.setId_profesional(rs.getInt(1));
                        u.setNombre(rs.getString(2));
                        p.setRut_profesional(rs.getString(3));
                        p.setProfesion(rs.getString(4));
                        p.setEstado(rs.getString(5));
                        u.setId_usuario(rs.getInt(6));
                        p.setUsuario(u);
                        return p;
                    }
                });
        }
    
    
    
}
