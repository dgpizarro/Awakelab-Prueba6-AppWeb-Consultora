package cl.awakelab.nmd.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import cl.awakelab.nmd.beans.Accidente;
import cl.awakelab.nmd.beans.Cliente;

public class AccidenteDAO {

    JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    public class AccidenteMapper implements RowMapper<Accidente> {
        public Accidente mapRow(ResultSet rs, int rowNum) throws SQLException {
            Accidente ac = new Accidente();
            Cliente c = new Cliente();
            ac.setId_accidente(rs.getInt(1));
            ac.setN_accidentados(rs.getInt(2));
            ac.setAccidentados(rs.getString(3));
            ac.setTipo_accidente(rs.getString(4));
            ac.setLugar_accidente(rs.getString(5));
            ac.setFecha_accidente(rs.getDate(6));
            ac.setDetalle(rs.getString(7));
            ac.setMuertes(rs.getInt(8));
            c.setId_cliente(rs.getInt(9));
            ac.setCliente(c);
            return ac;
        }
    }

    public int cuentaAccidentesCliente(int id) {
        Calendar fecha = Calendar.getInstance();
        int year = fecha.get(Calendar.YEAR);
        int mes = fecha.get(Calendar.MONTH) + 1;
        try {
            String sql = "select N_ACCIDENTES from ACCI_X_CL where (id_cliente = ?) and (year= " + year
                    + ") and (mes = " + mes + ")";
            return template.queryForObject(sql, new Object[] { id }, Integer.class);
        } catch (EmptyResultDataAccessException | NullPointerException e) {
            return 0;
        }
    }

    public int cuentaAccidentesClienteAnio(int id) {
        Calendar fecha = Calendar.getInstance();
        int year = fecha.get(Calendar.YEAR);
        try {
            String sql = "select sum(N_ACCIDENTES) from ACCI_X_CL where (id_cliente = ?) and (year= " + year + ")";
            return template.queryForObject(sql, new Object[] { id }, Integer.class);
        } catch (EmptyResultDataAccessException | NullPointerException e) {
            return 0;
        }
    }

    public List<Accidente> listarAccidentesCliente(int id_cliente) {
        String sql = "select id_accidente, n_accidentados, accidentados, tipo_accidente, lugar_accidente, "
                + "fecha_accidente, detalle, muertes, id_cliente from accidente where id_cliente =" + id_cliente;
        return template.query(sql, new AccidenteMapper());
    }

    public Accidente buscarAccidentePorId(int id) {
        String sql = "select id_accidente, n_accidentados, accidentados, tipo_accidente, lugar_accidente, "
                + "fecha_accidente, detalle, muertes, id_cliente from accidente where id_accidente = ?";
        return template.queryForObject(sql, new Object[] { id }, new AccidenteMapper());
    }

    public int insertarAccidente(Accidente a) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        String fechaComoCadena = sdf.format(a.getFecha_accidente());

        String sql = "insert into accidente (n_accidentados, accidentados, tipo_accidente, "
                + "lugar_accidente, fecha_accidente, detalle, muertes, id_cliente) values ("
                + a.getN_accidentados() + " ,'" + a.getAccidentados() + "','" + a.getTipo_accidente()
                + "','" + a.getLugar_accidente() + "','" + fechaComoCadena + "','" + a.getDetalle() + "',"
                + a.getMuertes() + "," + a.getCliente().getId_cliente() + ")";
        return template.update(sql);
    }
    
}
