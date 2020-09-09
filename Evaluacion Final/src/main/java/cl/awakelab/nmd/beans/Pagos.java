package cl.awakelab.nmd.beans;

import java.sql.Date;

public class Pagos {

	private int id_pago;
	private Date fecha_compromiso_pago;
	private float costo_base_mes;
	private float costo_adicional_mes;
	private float pago_mensual_total;
	private Date fecha_pago;
	private String estado;
	private Cliente cliente;
	
	public Pagos() {
		
	}

	public int getId_pago() {
		return id_pago;
	}

	public void setId_pago(int id_pago) {
		this.id_pago = id_pago;
	}

	public Date getFecha_compromiso_pago() {
		return fecha_compromiso_pago;
	}

	public void setFecha_compromiso_pago(Date fecha_compromiso_pago) {
		this.fecha_compromiso_pago = fecha_compromiso_pago;
	}

	public float getCosto_base_mes() {
		return costo_base_mes;
	}

	public void setCosto_base_mes(float costo_base_mes) {
		this.costo_base_mes = costo_base_mes;
	}

	public float getCosto_adicional_mes() {
		return costo_adicional_mes;
	}

	public void setCosto_adicional_mes(float costo_adicional_mes) {
		this.costo_adicional_mes = costo_adicional_mes;
	}

	public float getPago_mensual_total() {
		return pago_mensual_total;
	}

	public void setPago_mensual_total(float pago_mensual_total) {
		this.pago_mensual_total = pago_mensual_total;
	}

	public Date getFecha_pago() {
		return fecha_pago;
	}

	public void setFecha_pago(Date fecha_pago) {
		this.fecha_pago = fecha_pago;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	
	
	
}
