package cl.awakelab.nmd.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import cl.awakelab.nmd.DAO.Prop_MejorasDAO.Prop_MejorasMapper;
import cl.awakelab.nmd.beans.Actividad;
import cl.awakelab.nmd.beans.CheckList;
import cl.awakelab.nmd.beans.Cliente;
import cl.awakelab.nmd.beans.Prop_Mejoras;
import cl.awakelab.nmd.beans.Tarea;


public class TareaDAO {

    JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    public class TareaMapper implements RowMapper<Tarea> {
        public Tarea mapRow(ResultSet rs, int rowNum) throws SQLException {
            Tarea t = new Tarea();
            CheckList ck = new CheckList();
            Cliente c = new Cliente();
            Actividad a = new Actividad();
            t.setId_tarea(rs.getInt(1));
            t.setDetalle_tarea(rs.getString(2));
            ck.setId_checklist(rs.getInt(3));
            c.setId_cliente(rs.getInt(4));
            a.setCliente(c);
            ck.setActividad(a);
            t.setChecklist(ck);
            return t;
        }

    }

    public List<Tarea> misTareas(int id_cliente) {
        String sql = "Select id_tarea, detalle_tarea, checklist.id_checklist, cliente.id_cliente from tarea inner join checklist on ( tarea.id_checklist = checklist.id_checklist) inner join  actividad on (checklist.id_actividad = actividad.id_actividad) inner join cliente on (actividad.id_cliente = cliente.id_cliente) WHERE cliente.id_cliente = " + id_cliente;
        return template.query(sql, new TareaMapper());
    }

    public int crearTarea(Tarea t) {
        String sql = "insert into tarea ( detalle_tarea, id_checklist) values" + " ('" + t.getDetalle_tarea() + "', "
                + t.getChecklist().getId_checklist() + ")";
        return template.update(sql);
        
    }
    
    public Tarea buscarTareaPorId(int id) {
        String sql = "SELECT id_tarea, detalle_tarea,id_checklist FROM tarea where id_tarea = ? ";
        return template.queryForObject(sql, new Object[] { id }, new TareaMapper());
    }
    

    public Tarea buscarUsuarioPorId(int id) {
        String sql = "select id_usuario, nombre from usuario whene id_usuario = ?";
        return template.queryForObject(sql, new Object[] { id }, new TareaMapper());
    }

    public int editarTarea(Tarea t) {

        String sql = "UPDATE Tarea SET Detalle_tarea = '" + t.getDetalle_tarea() + "' WHERE Id_tarea = "
                + t.getId_tarea() + "";
        return template.update(sql);
    }

    //buscarTareasPorId
}
