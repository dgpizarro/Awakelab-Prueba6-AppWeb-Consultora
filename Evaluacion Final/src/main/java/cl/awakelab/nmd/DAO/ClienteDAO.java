package cl.awakelab.nmd.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import cl.awakelab.nmd.beans.Cliente;

import cl.awakelab.nmd.beans.Usuario;

import cl.awakelab.nmd.security.ClaveEncriptada;

public class ClienteDAO {

    JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    public int obtenerIDCliente(int id_usuario) {
        try {
            String sql = "select id_cliente from cliente where (id_usuario = ?)";
            return template.queryForObject(sql, new Object[] { id_usuario }, Integer.class);
        } catch (EmptyResultDataAccessException e) {
            return 0;
        }
    }

    public class ClienteRowMapper implements RowMapper<Cliente> {
        @Override
        public Cliente mapRow(ResultSet rs, int rowNum) throws SQLException {
            Cliente c = new Cliente();
            Usuario u = new Usuario();
            c.setId_cliente(rs.getInt(1));
            u.setNombre(rs.getString(2));
            c.setRut(rs.getString(3));
            c.setDireccion(rs.getString(4));
            c.setRepresentante_legal(rs.getString(5));
            c.setDelegado(rs.getString(6));
            c.setEmail_delegado(rs.getString(7));
            c.setTelefono(rs.getString(8));
            c.setRubro(rs.getString(9));
            c.setMutualidad(rs.getString(10));
            c.setNumero_empleados(rs.getInt(11));
            c.setPlan_base((rs.getFloat(12)));
            c.setEstado(rs.getString(13));
            c.setMorosidad(rs.getString(14));
            u.setId_usuario(rs.getInt(15));
            c.setUsuario(u);
            return c;
        }
    }

    public Cliente buscarPorId(int id) {
        String sql = "select id_cliente, nombre, rut, direccion, representante_legal, delegado, "
                + "email_delegado, telefono, rubro, mutualidad, numero_empleados, plan_base_uf, "
                + "estado, morosidad, cliente.id_usuario from cliente inner join usuario on "
                + "( cliente.id_usuario = usuario.id_usuario) where cliente.id_usuario = ?";
        return template.queryForObject(sql, new Object[]{id}, new ClienteRowMapper());
    }
    
    public List<Cliente> listarClientes() {
        String sql = "select id_cliente, nombre, rut, direccion, representante_legal, delegado, "
                + "email_delegado, telefono, rubro, mutualidad, numero_empleados, plan_base_uf, "
                + "estado, morosidad, cliente.id_usuario from cliente inner join usuario on "
                + "( cliente.id_usuario = usuario.id_usuario)";
        return template.query(sql, new ClienteRowMapper());
    }
    
    public List<Cliente> listarDestinatariosProfesional() {
        return template.query("select usuario.id_usuario, nombre from perfil_usuario "
                + "inner join usuario on (usuario.id_usuario = perfil_usuario.id_usuario)  "
                + "where rol = 'ROLE_CLIENTE'", new RowMapper<Cliente>() {
                    public Cliente mapRow(ResultSet rs, int row) throws SQLException {
                        Cliente c = new Cliente();
                        Usuario u = new Usuario();
                        u.setId_usuario(rs.getInt(1));
                        u.setNombre(rs.getString(2));
                        c.setUsuario(u);
                        return c;
                    }
                });
    }
    
    public int crearCliente(Cliente c) {
        String password = c.getUsuario().getContrasena();
        ClaveEncriptada p = new ClaveEncriptada();
        String claveSegura = p.hashPassword(password);
        
        String nombre = c.getUsuario().getNombre();
        String direccion = c.getDireccion();
        String nombreR = nombre.replace("'", "''");
        String direccionR = direccion.replace("'", "''");
        
        String sql = "CALL crear_cliente ( '" + c.getRut() + "', '" + claveSegura + "' ,  SYSDATE , '" + nombreR + "','"
                + direccionR + "','" + c.getRepresentante_legal() + "','" 
                + c.getDelegado() + "', '" + c.getEmail_delegado() + "', '" + c.getTelefono() + "', '" 
                + c.getRubro() + "', '" + c.getMutualidad() + "', " + c.getNumero_empleados() + ", " 
                + c.getPlan_base() + ", 'Vigente', 'F' )";
        return template.update(sql);

    }
    
    public List<Cliente> listarResumenClientes() {
        return template.query("select id_cliente, nombre, rut, delegado, numero_empleados, estado, cliente.id_usuario "
                + "from cliente inner join usuario on (cliente.id_usuario = usuario.id_usuario)", new RowMapper<Cliente>() {
                    public Cliente mapRow(ResultSet rs, int row) throws SQLException {
                        Cliente c = new Cliente();
                        Usuario u = new Usuario();
                        c.setId_cliente(rs.getInt(1));
                        u.setNombre(rs.getString(2));
                        c.setRut(rs.getString(3));
                        c.setDelegado(rs.getString(4));
                        c.setNumero_empleados(rs.getInt(5));
                        c.setEstado(rs.getString(6));
                        u.setId_usuario(rs.getInt(7));
                        c.setUsuario(u);
                        return c;
                    }
                });
    }
    
    public Cliente buscarPorIdCliente(int id) {
        String sql = "select id_cliente, nombre, rut, direccion, representante_legal, delegado, "
                + "email_delegado, telefono, rubro, mutualidad, numero_empleados, plan_base_uf, "
                + "estado, morosidad, cliente.id_usuario from cliente inner join usuario on "
                + "( cliente.id_usuario = usuario.id_usuario) where id_cliente = ?";
        return template.queryForObject(sql, new Object[]{id}, new ClienteRowMapper());
    }
    
    public int editarCliente (Cliente c) {
        String sql = "call editar_cliente ('"+ c.getRut() + "','" + c.getUsuario().getNombre()  + "','" 
                    + c.getDireccion() + "','" + c.getRepresentante_legal() + "','" + c.getDelegado() + "','" 
                    + c.getEmail_delegado() + "','" + c.getTelefono() + "','" + c.getRubro() + "','" 
                    + c.getMutualidad() + "'," + c.getNumero_empleados() + ","+ c.getPlan_base() + ",'"
                    + c.getEstado()+ "',"+ c.getId_cliente() + ","+c.getUsuario().getId_usuario() +")";
        System.out.println("Cliente editado");
        System.out.println(c.getId_cliente());
        System.out.println(c.getUsuario().getId_usuario());
        System.out.println(c.getRubro());
        return template.update(sql);
    }
    
    public List<Cliente> listaClientesEventos() {
        return template.query("select id_cliente, nombre, rut from cliente inner join usuario on "
                + "(cliente.id_usuario = usuario.id_usuario)", new RowMapper<Cliente>() {
                    public Cliente mapRow(ResultSet rs, int row) throws SQLException {
                        Cliente c = new Cliente();
                        Usuario u = new Usuario();
                        c.setId_cliente(rs.getInt(1));
                        u.setNombre(rs.getString(2));
                        c.setRut(rs.getString(3));
                        c.setUsuario(u);
                        return c;
                    }
                });
    }
    
    public String obtenerNombreCliente (int id_cliente) {
        try {
            String sql = "select nombre from usuario inner join cliente on (usuario.id_usuario"
                    + " = cliente.id_usuario) where  id_cliente = ?";
            return template.queryForObject(sql, new Object[]{id_cliente}, String.class);
        } catch (EmptyResultDataAccessException | NullPointerException e) {
            return "";
        }
    }
    
}
