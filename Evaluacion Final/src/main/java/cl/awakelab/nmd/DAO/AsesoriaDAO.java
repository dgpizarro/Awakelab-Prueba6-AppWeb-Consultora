package cl.awakelab.nmd.DAO;


import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.Calendar;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import cl.awakelab.nmd.beans.Accidente;
import cl.awakelab.nmd.beans.Actividad;
import cl.awakelab.nmd.beans.Asesoria;
import cl.awakelab.nmd.beans.Cliente;
import cl.awakelab.nmd.beans.Profesional;
import cl.awakelab.nmd.beans.Usuario;
import cl.awakelab.nmd.beans.Visita;

public class AsesoriaDAO {

	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public class AsesoriaMapper implements RowMapper<Asesoria> {
		public Asesoria mapRow(ResultSet rs, int rowNum) throws SQLException {
			Asesoria as = new Asesoria();
			Actividad a = new Actividad();
			Accidente ac = new Accidente();
			Visita v = new Visita();
			Cliente cl = new Cliente();
			Profesional p = new Profesional();
			Usuario u = new Usuario();
			as.setId_asesoria(rs.getInt(1));
			as.setFecha_creacion(rs.getDate(2));
			as.setAsunto(rs.getString(3));
			as.setDetalle(rs.getString(4));
			as.setExtra(rs.getNString(5));
			a.setId_actividad(rs.getInt(6));
			ac.setId_accidente(rs.getInt(7));
			v.setId_visita(rs.getInt(8));
			cl.setId_cliente(rs.getInt(9));
			p.setId_profesional(rs.getInt(10));
			u.setNombre(rs.getString(11));
			cl.setUsuario(u);
			a.setCliente(cl);
			a.setProfesional(p);
			as.setActividad(a);
			as.setVisita(v);
			as.setAccidente(ac);

			return as;

		}
	}

	public int cuentaAsesoriasCliente(int id) {
		Calendar fecha = Calendar.getInstance();
		int year = fecha.get(Calendar.YEAR);
		int mes = fecha.get(Calendar.MONTH) + 1;
		try {
			String sql = "select sum(n_asesorias) from asesoria_x_cl where (id_cliente = ?) and (year= " + year
					+ ") and (mes = " + mes + ")";
			return template.queryForObject(sql, new Object[] { id }, Integer.class);
		} catch (EmptyResultDataAccessException | NullPointerException e) {
			return 0;
		}
	}

	public List<Asesoria> buscarAsesoriasPorProfesional(int id_profesional) {
		String sql = "SELECT id_asesoria, fecha_creacion, asunto, detalle, extra,"
				+ " asesoria.id_actividad, id_accidente, id_visita, actividad.id_cliente, id_profesional, nombre "
				+ " FROM asesoria INNER JOIN actividad ON (asesoria.id_actividad = actividad.id_actividad)"
				+ " INNER JOIN cliente on (actividad.id_cliente = cliente.id_cliente) "
				+ " INNER JOIN usuario on (cliente.id_usuario = usuario.id_usuario) "
				+ " WHERE id_profesional = " + id_profesional;

		return template.query(sql, new AsesoriaMapper());
	}

	public Asesoria buscarAsesoriaPorId(int id) {
		String sql = "SELECT id_asesoria, fecha_creacion, asunto, detalle, extra, "
				+ "asesoria.id_actividad, id_accidente, id_visita, actividad.id_cliente, id_profesional, nombre "
				+ "FROM asesoria INNER JOIN actividad ON (asesoria.id_actividad = actividad.id_actividad) "
				+ " INNER JOIN cliente on (actividad.id_cliente = cliente.id_cliente) "
                                + " INNER JOIN usuario on (cliente.id_usuario = usuario.id_usuario) "
				+ "WHERE id_asesoria = ? ";

		return template.queryForObject(sql, new Object[] { id }, new AsesoriaMapper());
	}

	
	public int crearAsesoria(Asesoria a) {
		String sql = "CALL crear_asesoria ( SYSDATE, '" + a.getAsunto() + "', '" + a.getDetalle()
				+ "', 'F', " + a.getActividad().getProfesional().getId_profesional() + ", "
				+ a.getActividad().getCliente().getId_cliente() + ")";

		return template.update(sql);
	}

}
