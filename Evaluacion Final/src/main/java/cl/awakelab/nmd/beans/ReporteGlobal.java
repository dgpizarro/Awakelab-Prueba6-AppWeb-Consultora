package cl.awakelab.nmd.beans;

import java.util.Date;

public class ReporteGlobal {

    private int id_reporte_global;
    private Date fecha_emision;
    private String detalle;
    private Usuario admin;

    public ReporteGlobal() {
        super();
    }

    public int getId_reporte_global() {
        return id_reporte_global;
    }

    public void setId_reporte_global(int id_reporte_global) {
        this.id_reporte_global = id_reporte_global;
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

    public Usuario getAdmin() {
        return admin;
    }

    public void setAdmin(Usuario admin) {
        this.admin = admin;
    }

}
