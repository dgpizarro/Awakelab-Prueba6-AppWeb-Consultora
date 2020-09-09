package cl.awakelab.nmd.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.Calendar;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;


import cl.awakelab.nmd.beans.Actividad;
import cl.awakelab.nmd.beans.CheckList;
import cl.awakelab.nmd.beans.Cliente;

import cl.awakelab.nmd.beans.Profesional;

import cl.awakelab.nmd.beans.Usuario;

public class CheckListDAO {

    JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    public class CheckListMapper implements RowMapper<CheckList> {
        public CheckList mapRow(ResultSet rs, int rowNum) throws SQLException {
            CheckList ck = new CheckList();
            Actividad a = new Actividad();
            Cliente c = new Cliente();
            Usuario u = new Usuario();
            Profesional p = new Profesional();
            ck.setId_checklist(rs.getInt(1));
            a.setId_actividad(rs.getInt(2));
            ck.setFecha_creacion(rs.getDate(3));
            ck.setFecha_act_1(rs.getDate(4));
            ck.setFecha_act_2(rs.getDate(5));
            c.setId_cliente(rs.getInt(6));
            p.setId_profesional(rs.getInt(7));
            u.setNombre(rs.getString(8));
            c.setUsuario(u);
            a.setCliente(c);
            a.setProfesional(p);
            ck.setActividad(a);
            return ck;
        }
    }
    
    public class CheckListMapper2 implements RowMapper<CheckList> {
        public CheckList mapRow(ResultSet rs, int rowNum) throws SQLException {
            CheckList ck = new CheckList();
            Actividad a = new Actividad();
            ck.setId_checklist(rs.getInt(1));
            a.setId_actividad(rs.getInt(2));
            ck.setFecha_creacion(rs.getDate(3));
            ck.setFecha_act_1(rs.getDate(4));
            ck.setFecha_act_2(rs.getDate(5));
            ck.setActividad(a);
            return ck;
        }
    }
    



    public List<CheckList> misCheckList(int id_profecional) {
        String sql = "select id_checklist, checklist.id_actividad,fecha_creacion, "
                + "fecha_act_1, fecha_act_2,actividad.id_cliente, actividad.id_profesional,"
                + " usuario.nombre from checklist inner join actividad on "
                + "(checklist.id_actividad = actividad.id_actividad) inner join cliente on "
                + "(actividad.id_cliente = cliente.id_cliente) inner join usuario on "
                + "(cliente.id_usuario = usuario.id_usuario) WHERE id_profesional =" + id_profecional;
        return template.query(sql, new CheckListMapper());
    }

    public int crearCheckList(int id_cliente, int id_profesional) {
        String sql = "call crear_checklist (" + id_cliente + "," + id_profesional + ")";
        return template.update(sql);
    }

    public int eliminarClecklist(int id_checklist) {
        String sql = "CALL eliminar_checklist (" + id_checklist + ")";
        return template.update(sql);
    }

    public List<Cliente> listarClientes() {
        return template.query(
                "select cliente.id_cliente, nombre, cliente.RUT from perfil_usuario "
                        + "inner join usuario on (usuario.id_usuario = perfil_usuario.id_usuario)  "
                        + "inner join cliente on (cliente.id_usuario = usuario.id_usuario) where rol = 'ROLE_CLIENTE'",
                new RowMapper<Cliente>() {
                    public Cliente mapRow(ResultSet rs, int row) throws SQLException {
                        Cliente c = new Cliente();
                        Usuario u = new Usuario();
                        c.setId_cliente(rs.getInt(1));
                        u.setNombre(rs.getString(2));
                        c.setRut(rs.getNString(3));
                        c.setUsuario(u);
                        return c;
                    }
                });
    }

    public CheckList buscarPorId(int id_cliente) {
        Calendar fecha = Calendar.getInstance();
        int year = fecha.get(Calendar.YEAR);
        try {
            String sql = "select checklist.id_checklist, checklist.id_actividad, checklist.fecha_creacion, "
                    + "checklist.fecha_act_1, checklist.fecha_act_2 from checklist inner join "
                    + "actividad on (checklist.id_actividad = actividad.id_actividad) "
                    + "where EXTRACT (YEAR FROM fecha_creacion) = " + year + " and actividad.id_cliente = ?";
            return template.queryForObject(sql, new Object[] { id_cliente }, new CheckListMapper2());
        } catch (EmptyResultDataAccessException e) {
            return null;
        }

    }

}
