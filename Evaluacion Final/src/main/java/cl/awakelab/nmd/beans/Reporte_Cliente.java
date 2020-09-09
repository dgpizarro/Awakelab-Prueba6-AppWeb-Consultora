package cl.awakelab.nmd.beans;

import java.sql.Date;

public class Reporte_Cliente {

	private int id_reporte_cliente;
	private Date fecha_emision;
	private String detalle;
	private String tipo;
	private String visibilidad;
	private Cliente cliente;
	
	
	public Reporte_Cliente() {
		
	}


	public int getId_reporte_cliente() {
		return id_reporte_cliente;
	}


	public void setId_reporte_cliente(int id_reporte_cliente) {
		this.id_reporte_cliente = id_reporte_cliente;
	}


	public Date getFecha_emision() {
		return fecha_emision;
	}


	public void setFecha_emision(Date fecha_emision) {
		this.fecha_emision = fecha_emision;
	}


	public String getDetalle() {
		return detalle;
	}


	public void setDetalle(String detalle) {
		this.detalle = detalle;
	}


	public String getTipo() {
		return tipo;
	}


	public void setTipo(String tipo) {
		this.tipo = tipo;
	}


	public String getVisibilidad() {
		return visibilidad;
	}


	public void setVisibilidad(String visibilidad) {
		this.visibilidad = visibilidad;
	}


	public Cliente getCliente() {
		return cliente;
	}


	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	
	
	
}
