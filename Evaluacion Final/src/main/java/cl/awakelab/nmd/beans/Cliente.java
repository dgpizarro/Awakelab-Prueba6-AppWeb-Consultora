package cl.awakelab.nmd.beans;

public class Cliente {
    private int id_cliente;
    private String rut;
    private String direccion;
    private String representante_legal;
    private String delegado;
    private String email_delegado;
    private String telefono;
    private String rubro;
    private String mutualidad;
    private int numero_empleados;
    private float plan_base;
    private String estado;
    private String morosidad;
    private Usuario usuario;

    public Cliente() {
        super();
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getRepresentante_legal() {
        return representante_legal;
    }

    public void setRepresentante_legal(String representante_legal) {
        this.representante_legal = representante_legal;
    }

    public String getEmail_delegado() {
        return email_delegado;
    }

    public void setEmail_delegado(String email_delegado) {
        this.email_delegado = email_delegado;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getRubro() {
        return rubro;
    }

    public void setRubro(String rubro) {
        this.rubro = rubro;
    }

    public String getMutualidad() {
        return mutualidad;
    }

    public void setMutualidad(String mutualidad) {
        this.mutualidad = mutualidad;
    }

    public int getNumero_empleados() {
        return numero_empleados;
    }

    public void setNumero_empleados(int numero_empleados) {
        this.numero_empleados = numero_empleados;
    }

    public float getPlan_base() {
        return plan_base;
    }

    public void setPlan_base(float plan_base) {
        this.plan_base = plan_base;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getMorosidad() {
        return morosidad;
    }

    public void setMorosidad(String morosidad) {
        this.morosidad = morosidad;
    }

   

    public String getDelegado() {
        return delegado;
    }

    public void setDelegado(String delegado) {
        this.delegado = delegado;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

}
