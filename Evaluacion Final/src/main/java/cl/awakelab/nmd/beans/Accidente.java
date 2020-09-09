package cl.awakelab.nmd.beans;

import java.sql.Date;

public class Accidente {
    
    private int id_accidente;
    private int n_accidentados;
    private String accidentados;
    private String tipo_accidente;
    private String lugar_accidente;
    private Date fecha_accidente;
    private String detalle;
    private int muertes;
    private Cliente cliente;
    
    
    public Accidente() {
    }


    public int getId_accidente() {
        return id_accidente;
    }


    public void setId_accidente(int id_accidente) {
        this.id_accidente = id_accidente;
    }


    public int getN_accidentados() {
        return n_accidentados;
    }


    public void setN_accidentados(int n_accidentados) {
        this.n_accidentados = n_accidentados;
    }


    public String getAccidentados() {
        return accidentados;
    }


    public void setAccidentados(String accidentados) {
        this.accidentados = accidentados;
    }


    public String getTipo_accidente() {
        return tipo_accidente;
    }


    public void setTipo_accidente(String tipo_accidente) {
        this.tipo_accidente = tipo_accidente;
    }


    public String getLugar_accidente() {
        return lugar_accidente;
    }


    public void setLugar_accidente(String lugar_accidente) {
        this.lugar_accidente = lugar_accidente;
    }


    public Date getFecha_accidente() {
        return fecha_accidente;
    }


    public void setFecha_accidente(Date fecha_accidente) {
        this.fecha_accidente = fecha_accidente;
    }


    public String getDetalle() {
        return detalle;
    }


    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }


    public int getMuertes() {
        return muertes;
    }


    public void setMuertes(int muertes) {
        this.muertes = muertes;
    }


    public Cliente getCliente() {
        return cliente;
    }


    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    
    
    

}
