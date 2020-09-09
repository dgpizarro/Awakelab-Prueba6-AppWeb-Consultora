package cl.awakelab.nmd;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Month;
import java.time.format.TextStyle;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cl.awakelab.nmd.DAO.AccidenteDAO;
import cl.awakelab.nmd.DAO.AsesoriaDAO;
import cl.awakelab.nmd.DAO.CapacitacionDAO;
import cl.awakelab.nmd.DAO.CheckListDAO;
import cl.awakelab.nmd.DAO.ClienteDAO;
import cl.awakelab.nmd.DAO.EventoAsesoriaDAO;
import cl.awakelab.nmd.DAO.LugarDAO;
import cl.awakelab.nmd.DAO.MensajeDAO;
import cl.awakelab.nmd.DAO.ProfesionalDAO;
import cl.awakelab.nmd.DAO.UsuarioDAO;
import cl.awakelab.nmd.DAO.VisitaDAO;
import cl.awakelab.nmd.beans.Accidente;
import cl.awakelab.nmd.beans.Asesoria;
import cl.awakelab.nmd.beans.Capacitacion;
import cl.awakelab.nmd.beans.CheckList;
import cl.awakelab.nmd.beans.Cliente;
import cl.awakelab.nmd.beans.EventoAsesoria;
import cl.awakelab.nmd.beans.Lugar;
import cl.awakelab.nmd.beans.Mensaje;
import cl.awakelab.nmd.beans.Profesional;
import cl.awakelab.nmd.beans.Usuario;
import cl.awakelab.nmd.beans.Visita;

@Controller
@SessionAttributes({ "rut", "empresa", "idU_cliente", "id_cliente" })
public class ClienteController {

    private static final Logger logger = LoggerFactory.getLogger(ClienteController.class);

    @Autowired
    AsesoriaDAO asd;

    @Autowired
    AccidenteDAO ad;

    @Autowired
    ClienteDAO cd;

    @Autowired
    CapacitacionDAO cpd;

    @Autowired
    EventoAsesoriaDAO eas;

    @Autowired
    CheckListDAO chkd;

    @Autowired
    LugarDAO lug;

    @Autowired
    MensajeDAO md;

    @Autowired
    ProfesionalDAO pd;

    @Autowired
    UsuarioDAO ud;

    @Autowired
    VisitaDAO vd;

    // Manejo de fechas desde formulario html Date a atributo de clase java Date
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true, 10));
    }

    // --- Portal Cliente, resumen datos, notificaciones, envío solicitud---

    @RequestMapping("/Cliente/home")
    public String irPortalCliente(Model m) {
        String usuario = SecurityContextHolder.getContext().getAuthentication().getName();
        int id_usuario_cl = ud.obtenerIDUsuario(usuario);
        Cliente c = cd.buscarPorId(id_usuario_cl);
        int id_cliente = c.getId_cliente();
        String nombreE = c.getUsuario().getNombre();
        String morosidad = c.getMorosidad();

        Month mes = LocalDate.now().getMonth();
        String nombreMes = mes.getDisplayName(TextStyle.FULL, new Locale("es", "ES"));
        String mesFinal = nombreMes.substring(0, 1).toUpperCase() + nombreMes.substring(1);
        int year = LocalDate.now().getYear();

        int n_asesorias = asd.cuentaAsesoriasCliente(id_cliente);
        int n_capacitaciones = cpd.cuentaCapacitacionesCliente(id_cliente);
        int n_visitas = vd.cuentaVisitasCliente(id_cliente);
        int n_accidentes_mes = ad.cuentaAccidentesCliente(id_cliente);
        int n_accidentes_year = ad.cuentaAccidentesClienteAnio(id_cliente);

        CheckList chk = chkd.buscarPorId(id_cliente);
        int contadorCheck = 0;
        if (chk != null) {
            Date fechaAct1 = chk.getFecha_act_1();
            Date fechaAct2 = chk.getFecha_act_2();
            if (fechaAct1 != null)
                contadorCheck += 1;
            if (fechaAct2 != null)
                contadorCheck += 1;
        }

        List<Mensaje> news = md.buscarNotificacionesPorDestinatario(id_usuario_cl);

        // logs debug message
        if (logger.isDebugEnabled()) {
            logger.debug("isPortalCliente is executed!");
        }

        m.addAttribute("empresa", nombreE);
        m.addAttribute("rut", usuario);
        m.addAttribute("idU_cliente", id_usuario_cl);
        m.addAttribute("id_cliente", id_cliente);
        m.addAttribute("estado_pagos", morosidad);
        m.addAttribute("mes", mesFinal);
        m.addAttribute("year", year);

        m.addAttribute("tA", n_asesorias);
        m.addAttribute("tC", n_capacitaciones);
        m.addAttribute("tV", n_visitas);
        m.addAttribute("aM", n_accidentes_mes);
        m.addAttribute("aT", n_accidentes_year);
        m.addAttribute("mC", contadorCheck);

        m.addAttribute("newsP", news);
        m.addAttribute("command", new Mensaje());
        return "PortalCliente";
    }

    @RequestMapping("Cliente/buscarDestinatarios")
    public String listarDestinatarios(Model m) {
        List<Profesional> listaD = pd.listarDestinatariosCliente();
        m.addAttribute("lista", listaD);

        return "ListaDestinatarios";
    }

    @RequestMapping("Cliente/seleccionarDestinatario/{id}/{nombre}")
    public String nombrarProfesional(@PathVariable int id, @PathVariable String nombre, RedirectAttributes r) {
        r.addFlashAttribute("idU_profesional", id);
        r.addFlashAttribute("profesional", nombre);
        return "redirect:/Cliente/home.html";
    }

    @RequestMapping(value = "Cliente/generaSolicitud", method = RequestMethod.POST)
    public String registrarSolicitud(Mensaje m, RedirectAttributes r) {
        md.crearMensaje(m);
        String alert = "open";
        r.addFlashAttribute("open", alert);
        return "redirect:/Cliente/home.html";
    }

    @RequestMapping("Cliente/quitarNotificacion/{id}")
    public String borrarNotificacion(@PathVariable int id, Model m) {
        Mensaje txt = md.buscarMensajePorId(id);
        int id_profesional = txt.getRemitente().getId_usuario();
        String profesion = pd.obtenerProfesion(id_profesional);
        md.cambiarLeido(id);
        m.addAttribute("mensaje", txt);
        m.addAttribute("profesion", profesion);
        return "DetalleMensaje";
    }

    // --- Listado de Accidentes ---

    @RequestMapping("/Cliente/listarAccidentes/{id}")
    public String listarAccidentes(@PathVariable int id, Model m) {

        List<Accidente> listaAcc = ad.listarAccidentesCliente(id);
        m.addAttribute("lacc", listaAcc);

        return "ListaAccidentesCliente";
    }

    @RequestMapping("/Cliente/irDetalleAccidente/{id}")
    public String detallaMensaje(@PathVariable int id, Model m) {
        Accidente acc1 = ad.buscarAccidentePorId(id);
        m.addAttribute("accidente", acc1);
        return "DetalleAccidente";
    }

    // --- Reportar accidente ---

    @RequestMapping("/Cliente/registrarNuevoAccidente")
    public ModelAndView reporAccidente() {
        return new ModelAndView("ReportarAccidente", "command", new Accidente());
    }

    @RequestMapping(value = "Cliente/insertarAccidente", method = RequestMethod.POST)
    public String crearAccidente(Accidente a, RedirectAttributes r) {
        ad.insertarAccidente(a);
        String alert = "open";
        r.addFlashAttribute("open", alert);
        int id_cliente = a.getCliente().getId_cliente();
        return "redirect:/Cliente/listarAccidentes/" + id_cliente + ".html";
    }

    // --- Mensajes ---

    @RequestMapping("/Cliente/irMensajesCliente")
    public String mensajeriaCliente(Model m) {
        List<Profesional> listaD = pd.listarDestinatariosCliente();
        m.addAttribute("lista", listaD);
        m.addAttribute("command", new Mensaje());
        return "MensajesCliente";
    }

    @RequestMapping(value = "Cliente/generaMensaje", method = RequestMethod.POST)
    public String registrarMensaje(Mensaje m, RedirectAttributes r) {
        md.crearMensaje(m);
        String alert = "open";
        r.addFlashAttribute("open", alert);
        return "redirect:/Cliente/irMensajesCliente.html";
    }

    @RequestMapping("/Cliente/todosLosMensajes/{id}")
    public String totalMensajes(@PathVariable int id, Model m) {
        List<Mensaje> news = md.buscarTodosLosMensajesPorDestinatario(id);
        m.addAttribute("newsP", news);
        return "AllMensajesClientes";
    }

    @RequestMapping("/Cliente/todosLosMensajesNoLeidos/{id}")
    public String totalMensajesNoLeidos(@PathVariable int id, Model m) {
        List<Mensaje> news = md.buscarNotificacionesPorDestinatario(id);
        m.addAttribute("newsP", news);
        return "NoLeidosCliente";
    }

    @RequestMapping("/Cliente/mensajesEnviados/{id}")
    public String totalMensajesEnviados(@PathVariable int id, Model m) {
        List<Mensaje> news = md.buscarEnviadosPorRemitente(id);
        m.addAttribute("newsP", news);
        return "EnviadosCliente";
    }

    @RequestMapping("Cliente/irDetalleEnviado/{id}")
    public String mostrarEnviado(@PathVariable int id, Model m) {
        Mensaje txt = md.buscarMensajeEnviadoPorId(id);
        int id_profesional = txt.getDestinatario().getId_usuario();
        String profesion = pd.obtenerProfesion(id_profesional);
        m.addAttribute("mensaje", txt);
        m.addAttribute("profesion", profesion);
        return "DetalleEnviado";
    }

    // --- Servicios ---

    @RequestMapping("Cliente/irServicios/{id}")
    public String resumenServicios(@PathVariable int id, Model m) {
        List<Capacitacion> lcapacitaciones = cpd.listarCapacitacionesJsonCliente(id);
        m.addAttribute("capacitaciones", lcapacitaciones);

        List<Visita> lvisitas = vd.listarVisitasJsonCliente(id);
        m.addAttribute("visitas", lvisitas);

        List<EventoAsesoria> lasesorias = eas.listarAsesoriaJsonCliente(id);
        m.addAttribute("asesorias", lasesorias);

        return "ServiciosCliente";
    }

    @RequestMapping("Cliente/irDetalleAsesoria/{id}/{id_cl}")
    public String detalleAsesoriaCliente(@PathVariable int id, @PathVariable int id_cl, Model m) {
        Asesoria a = asd.buscarAsesoriaPorId(id);
        EventoAsesoria ea = eas.buscarEventoAsesoriaPorId(id);
        m.addAttribute("asesoria", a);
        m.addAttribute("eventoasesoria", ea);
        m.addAttribute("id_cl", id_cl);
        return "DetalleAsesoriaCliente";
    }

    @RequestMapping("Cliente/irDetalleVisita/{id}/{id_cl}")
    public String detalleVisitaCliente(@PathVariable int id, @PathVariable int id_cl, Model m) {
        Visita v = vd.buscarVisitaPorId(id);
        Lugar l = lug.buscarLugarPorVisita(id);
        m.addAttribute("lugar", l);
        m.addAttribute("visita", v);
        m.addAttribute("id_cl", id_cl);
        m.addAttribute("command", v);
        return "DetalleVisitaCliente";
    }

    @RequestMapping("Cliente/irDetalleCapacitacion/{id}/{id_cl}")
    public String detalleCapacitacionCliente(@PathVariable int id, @PathVariable int id_cl, Model m) {
        Capacitacion c = cpd.buscarCapacitacionPorId(id);
        Lugar l = lug.buscarLugarPorCapacitacion(id);
        m.addAttribute("command", c);
        m.addAttribute("lugar", l);
        m.addAttribute("capacitacion", c);
        m.addAttribute("id_cl", id_cl);
        return "DetalleCapacitacionCliente";
    }

    @RequestMapping(value = "Cliente/cumplimientoCapacitacion/{id}", method = RequestMethod.POST)
    public String cumplimientoCapacitacionCliente(@PathVariable int id, Capacitacion c) {
        cpd.cambiarCumplimientoCapacitacion(c);
        int id_cliente = id;
        return "redirect:/Cliente/irServicios/"+ id_cliente+".html";
    }
    
    @RequestMapping(value = "Cliente/cumplimientoVisita/{id}", method = RequestMethod.POST)
    public String cumplimientoVisitaCliente(@PathVariable int id, Visita v) {
        vd.cambiarCumplimientoVisita(v);
        int id_cliente = id;
        return "redirect:/Cliente/irServicios/"+ id_cliente+".html";
    }

    // --- Mi Cuenta ---

    @RequestMapping("/Cliente/miCuenta/{id}")
    public String irMiCuenta(@PathVariable int id, Model m) {
        Cliente c = cd.buscarPorIdCliente(id);
        m.addAttribute("cliente", c);
        m.addAttribute("command", new Usuario());
        return "CuentaCliente";
    }

    @RequestMapping(value = "Cliente/cambioContrasena/{id}", method = RequestMethod.POST)
    public String actualizarClaveCliente(@PathVariable int id, Usuario u, RedirectAttributes r) {
        ud.cambiarPassword(u);
        String alert = "open";
        r.addFlashAttribute("open", alert);
        int id_cliente = id;
        return "redirect:/Cliente/miCuenta/" + id_cliente + ".html";
    }

    @RequestMapping("/Cliente/actualizarInfoCliente")
    public String solicitudCambioDatos(Model m) {
        m.addAttribute("command", new Mensaje());
        return "SolicitudActualizacionCliente";
    }

}
