package cl.awakelab.nmd;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Month;
import java.time.format.TextStyle;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import cl.awakelab.nmd.DAO.EventoAsesoriaDAO;
import cl.awakelab.nmd.DAO.InformeVisitaDAO;
import cl.awakelab.nmd.DAO.LugarDAO;
import cl.awakelab.nmd.DAO.AsesoriaDAO;
import cl.awakelab.nmd.DAO.AsistenteDAO;
import cl.awakelab.nmd.DAO.CapacitacionDAO;
import cl.awakelab.nmd.DAO.CheckListDAO;
import cl.awakelab.nmd.DAO.ClienteDAO;
import cl.awakelab.nmd.DAO.MensajeDAO;
import cl.awakelab.nmd.DAO.ProfesionalDAO;
import cl.awakelab.nmd.DAO.Prop_MejorasDAO;
import cl.awakelab.nmd.DAO.TareaDAO;
import cl.awakelab.nmd.DAO.UsuarioDAO;
import cl.awakelab.nmd.DAO.VisitaDAO;
import cl.awakelab.nmd.beans.Asesoria;
import cl.awakelab.nmd.beans.Asistente;
import cl.awakelab.nmd.beans.Capacitacion;
import cl.awakelab.nmd.beans.CheckList;
import cl.awakelab.nmd.beans.Cliente;
import cl.awakelab.nmd.beans.EventoAsesoria;
import cl.awakelab.nmd.beans.Informe_Visita;
import cl.awakelab.nmd.beans.Lugar;
import cl.awakelab.nmd.beans.Mensaje;
import cl.awakelab.nmd.beans.Profesional;
import cl.awakelab.nmd.beans.Prop_Mejoras;
import cl.awakelab.nmd.beans.Tarea;
import cl.awakelab.nmd.beans.Usuario;
import cl.awakelab.nmd.beans.Visita;

@Controller
@SessionAttributes({ "rut", "nombre", "idU_profesional", "id_profesional" })
public class ProfesionalController {

    @Autowired
    AsesoriaDAO asd;

    @Autowired
    MensajeDAO md;

    @Autowired
    ClienteDAO cd;

    @Autowired
    CapacitacionDAO cad;

    @Autowired
    ProfesionalDAO pd;

    @Autowired
    VisitaDAO vd;

    @Autowired
    UsuarioDAO ud;

    @Autowired
    Prop_MejorasDAO pm;

    @Autowired
    EventoAsesoriaDAO eas;

    @Autowired
    AsistenteDAO asisd;

    @Autowired
    LugarDAO lug;

    @Autowired
    InformeVisitaDAO iv;

    @Autowired
    CheckListDAO ck;

    @Autowired
    TareaDAO t;

    // Manejo de fechas desde formulario html Date a atributo de clase java Date
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true, 10));
    }

    // --- PORTAL PROFESIONAL ---

    @RequestMapping("/Profesional/home")
    public String irPortalCliente(Model m) {
        String usuario = SecurityContextHolder.getContext().getAuthentication().getName();
        int id_usuario_profesional = ud.obtenerIDUsuario(usuario);
        Profesional p = pd.buscarPorId(id_usuario_profesional);
        int id_profesional = p.getId_profesional();
        String nombreP = p.getUsuario().getNombre();

        List<Mensaje> news = md.buscarNotificacionesPorDestinatario(id_usuario_profesional);
        m.addAttribute("newsP", news);

        List<Capacitacion> lcapacitaciones = cad.listarCapacitacionesJsonProf(id_profesional);
        m.addAttribute("capacitaciones", lcapacitaciones);

        List<Visita> lvisitas = vd.listarVisitasJsonProf(id_profesional);
        m.addAttribute("visitas", lvisitas);

        List<EventoAsesoria> lasesorias = eas.listarAsesoriaJsonProf(id_profesional);
        m.addAttribute("asesorias", lasesorias);

        m.addAttribute("id_profesional", id_profesional);
        m.addAttribute("idU_profesional", id_usuario_profesional);
        m.addAttribute("rut", usuario);
        m.addAttribute("nombre", nombreP);
        return "PortalProfesional";
    }

    // ------VISITAS-----//

    @RequestMapping("/Profesional/irGestionVisitas/{id}")
    public String irGestionVisitas(@PathVariable int id, Model m) {
        List<Visita> listaVisitas = vd.listarVisita(id);
        List<Cliente> lclientes = cd.listaClientesEventos();
        m.addAttribute("command", new Visita());
        m.addAttribute("listaClientes", lclientes);
        m.addAttribute("lvisitas", listaVisitas);
        return "VisitasProfesional";
    }

    @RequestMapping("/Profesional/irDetalleVisita/{id}/{id_profesional}")
    public String detalleVisitaPorId(@PathVariable int id, @PathVariable int id_profesional, Model m) {
        Visita v = vd.buscarVisitaPorId(id);
        Lugar l = lug.buscarLugarPorVisita(id);
        m.addAttribute("lugar", l);
        m.addAttribute("visita", v);
        m.addAttribute(id_profesional);
        return "DetalleVisita";
    }

    @RequestMapping(value = "Profesional/añadirVisita", method = RequestMethod.POST)
    public String registrarVisita(Visita v) {
        vd.crearVisita(v);
        int idProfesional = v.getEvento().getActividad().getProfesional().getId_profesional();
        return "redirect:/Profesional/irGestionVisitas/" + idProfesional + ".html";
    }

    @RequestMapping(value = "/Profesional/irModificarVisita/{id}/{id_profesional}")
    public String modificarVisita(@PathVariable int id, @PathVariable int id_profesional, Model m) {
        Visita v = vd.buscarVisitaPorId(id);
        m.addAttribute("command", v);
        m.addAttribute(id_profesional);
        return "ModificarVisita";
    }

    @RequestMapping(value = "/Profesional/editarVisita", method = RequestMethod.POST)
    public String editarYSalvarVisita(@ModelAttribute("v") Visita v) {
        vd.editarVisita(v);
        return "redirect:/Profesional/VisitasProfesional.html";
    }

    @RequestMapping("Profesional/borrarVisita/{id}")
    public String borrarVisita(@PathVariable int id, Model m) {
        Visita v = vd.buscarVisitaPorId(id);
        vd.eliminarVisita(id);
        int idProfesional = v.getEvento().getActividad().getProfesional().getId_profesional();
        return "redirect:/Profesional/gestionVisitas/" + idProfesional + ".html";
    }

 // ----Propuesta de Mejoras----//

    @RequestMapping("/Profesional/irGestionMejoras/{id}")
    public String ListarPropuestas(@PathVariable int id, Model m) {
        List<Prop_Mejoras> listMejoras = pm.buscarPropuestasPorVisita(id);
        m.addAttribute("command", new Prop_Mejoras());
        m.addAttribute("lpro", listMejoras);
        return "ListarPropuesta";
    }

    @RequestMapping("/Profesional/irDetallePropuesta/{id}/{id_Profesional}")
    public String detallePropuestaPorId(@PathVariable int id, @PathVariable int id_profesional, Model m) {
        Prop_Mejoras p = pm.buscarPropuestaPorId(id);
        m.addAttribute("propuesta", p);
        m.addAttribute("id_profesional", id_profesional);
        return "DetallePropMejoras";
    }
    
    @RequestMapping("/Profesional/irFormulario/{id}/{id_profesional}")
    public String formPropuesta(@PathVariable int id, @PathVariable int id_profesional, Model m) {
    	m.addAttribute("command", new Prop_Mejoras());
    	m.addAttribute("id_vis", id);
    	m.addAttribute("id_profesional", id_profesional);
        return "CrearPropuesta";
    }
     
    @RequestMapping(value = "Profesional/añadirPropuesta/{id_profesional}", method = RequestMethod.POST)
    public String agregarPropuesta(Prop_Mejoras p, @PathVariable int id_profesional) {
        pm.crearProp_Mejoras(p);
        int profesional = id_profesional;
        return "redirect:/Profesional/irGestionVisitas/" + profesional + ".html";
    }

    @RequestMapping(value = "/Profesional/ModificarPropuesta/{id}/{id_visita}")
    public String modificarPropuesta(@PathVariable int id, @PathVariable int id_visita, Model m) {
        Prop_Mejoras p = pm.buscarPropuestaPorId(id);
        m.addAttribute("command", p);
        m.addAttribute("id_vis", id_visita);
        return "modificarPropuesta";
    }

    @RequestMapping(value = "Profesional/ModificarSalvar/{id_visita}", method = RequestMethod.POST)
    public String editar(@ModelAttribute("pm") Prop_Mejoras p, @PathVariable int id_visita, Model m) {
        pm.modificarPropuesta(p);
        m.addAttribute("id_vis",id_visita);
        return "redirect:/profesional/irGestionMejora/" + id_visita + ".html";
    }
    
    // ---INFORME VISITA---//

    @RequestMapping("/Profesional/irGestionInformeV/{id}/{id_profesional}")
    public String irGestionInformeV(@PathVariable int id, @PathVariable int id_profesional, Model m) {
        Informe_Visita infVis = iv.buscarInformePorId(id);
   
        if (infVis == null) {
             m.addAttribute("command", new Informe_Visita());
            m.addAttribute("id_profesional", id_profesional);
           m.addAttribute("idvisita", id);
           return "InformeVisita";
        } else {
            m.addAttribute("command", infVis);
            return "EditInformeVisita";
        }
       
    }

    @RequestMapping(value = "/Profesional/crearInformeVisita/{id}", method = RequestMethod.POST)
    public String crearInformeVisita(@PathVariable int id, Informe_Visita i) {
        iv.crearInforme(i);
        int id_profesional = id;
        return "redirect:/Profesional/irGestionVisitas/" + id_profesional + ".html";
    }
    
    @RequestMapping(value = "/Profesional/editarInformeVisita/{id}", method = RequestMethod.POST)
    public String ediarInformeVisita(@PathVariable int id, Informe_Visita i) {
        iv.ediarInformeVisita(i);
        int id_profesional = id;
        return "redirect:/Profesional/irGestionVisitas/" + id_profesional + ".html";
    }

    // ------ASESORIA-----//

    @RequestMapping("/Profesional/gestionAsesorias/{id}")
    public String irGestionAsesorias(@PathVariable int id, Model m) {
        List<Asesoria> listaAsesorias = asd.buscarAsesoriasPorProfesional(id);
        List<Cliente> lclientes = cd.listaClientesEventos();
        m.addAttribute("command", new Asesoria());
        m.addAttribute("lasesorias", listaAsesorias);
        m.addAttribute("listaClientes", lclientes);
        return "AsesoriasProfesional";
    }

    @RequestMapping("/Profesional/irDetalleAsesoria/{id}")
    public String detalleAsesoriaPorId(@PathVariable int id, Model m) {
        Asesoria a = asd.buscarAsesoriaPorId(id);
        EventoAsesoria ea = eas.buscarEventoAsesoriaPorId(id);
        Lugar l = lug.buscarLugarPorAsesoria(id);
        m.addAttribute("lugar", l);
        m.addAttribute("asesoria", a);
        m.addAttribute("eventoasesoria", ea);
        return "DetalleAsesoria";
    }

    @RequestMapping("/Profesional/irAgendarAsesoria/{id}/{id_prof}")
    public String generarEventoAsesoriaPorId(@PathVariable int id, @PathVariable int id_prof, Model m) {
        EventoAsesoria ea = eas.buscarEventoAsesoriaPorId(id);
        if (ea == null) {
            m.addAttribute("command", new EventoAsesoria());
            m.addAttribute("id_profesional", id_prof);
            m.addAttribute("idAsesoria", id);
            return "EventoAsesoria";
        }else {
       return "AsesoriaConEvento";
    }
    }

    @RequestMapping(value = "Profesional/crearAsesoria", method = RequestMethod.POST)
    public String registrarAsesoria(Asesoria a) {
        asd.crearAsesoria(a);
        int idProfesional = a.getActividad().getProfesional().getId_profesional();
        return "redirect:/Profesional/gestionAsesorias/" + idProfesional + ".html";
    }

    @RequestMapping(value = "Profesional/crearEventoAsesoria", method = RequestMethod.POST)
    public String registrarEventoAsesoria(EventoAsesoria e) {
        eas.crearEventoAsesoria(e);
        int idProfesional = e.getAsesoria().getActividad().getProfesional().getId_profesional();
        return "redirect:/Profesional/gestionAsesorias/" + idProfesional + ".html";
    }

    // ------CAPACITACION-----//

    @RequestMapping("/Profesional/gestionCapacitaciones/{id}")
    public String irCapacitaciones(@PathVariable int id, Model m) {
        List<Capacitacion> listCapacitaciones = cad.listarCapacitacion(id);
        List<Cliente> lclientes = cd.listaClientesEventos();
        m.addAttribute("command", new Capacitacion());
        m.addAttribute("lcapacitaciones", listCapacitaciones);
        m.addAttribute("listaClientes", lclientes);
        return "ListaCapacitaciones";
    }

    @RequestMapping("/Profesional/irDetalleCapacitacion/{id}")
    public String detalleCapacitacionPorId(@PathVariable int id, Model m) {
        Capacitacion c = cad.buscarCapacitacionPorId(id);
        Lugar l = lug.buscarLugarPorCapacitacion(id);
        m.addAttribute("lugar", l);
        m.addAttribute("capacitacion", c);
        return "DetalleCapacitacion";
    }

    @RequestMapping(value = "Profesional/crearCapacitacion", method = RequestMethod.POST)
    public String registrarCapacitacion(Capacitacion c) {
        cad.crearCapacitacion(c);
        int idProfesional = c.getEvento().getActividad().getProfesional().getId_profesional();
        return "redirect:/Profesional/gestionCapacitaciones/" + idProfesional + ".html";
    }

    // -----ASISTENTES-------//

    @RequestMapping("/Profesional/listadoAsistentes/{id}/{id_profesional}")
    public String irAsistentes(@PathVariable int id, @PathVariable String id_profesional, Model m) {
        List<Asistente> listAsistentes = asisd.listarAsistentes(id);
        m.addAttribute("idCapacitacion", id);
        m.addAttribute("id_prof", id_profesional);
        m.addAttribute("command", new Asistente());
        m.addAttribute("lAsistentes", listAsistentes);
        return "AsistentesCapacitacion";
    }

    @RequestMapping(value = "/Profesional/crearAsistente/{id_profesional}", method = RequestMethod.POST)
    public String crearAsistente(@PathVariable String id_profesional, Asistente a, RedirectAttributes r) {
        String id_prof = id_profesional;
        asisd.crearAsistente(a);
        int id_cap = a.getCapacitacion().getId_capacitacion();
        r.addFlashAttribute("id_capx", id_cap);
        return "redirect:/Profesional/gestionCapacitaciones/" + id_prof + ".html";
    }


    // --- Mensajes ---

    @RequestMapping("/Profesional/irMensajesAdmin/{id}")
    public String mensajeriaProfesional(@PathVariable int id, Model m) {
        List<Profesional> listaD = pd.listarDestinatariosOtrosProfesioanles(id);
        List<Cliente> listaD2 = cd.listarDestinatariosProfesional();
        m.addAttribute("listaP", listaD);
        m.addAttribute("listaC", listaD2);
        m.addAttribute("command", new Mensaje());
        return "MensajesProfesional";
    }

    @RequestMapping(value = "/Profesional/generaMensaje", method = RequestMethod.POST)
    public String registrarMensajeProf(Mensaje m, RedirectAttributes r) {
        md.crearMensaje(m);
        String alert = "open";
        r.addFlashAttribute("open", alert);
        return "redirect:/Profesional/irMensajesAdmin.html";
    }

    @RequestMapping("/Profesional/todosLosMensajes/{id}")
    public String totalMensajesProf(@PathVariable int id, Model m) {
        List<Mensaje> news = md.buscarTodosLosMensajesPorDestinatario(id);
        m.addAttribute("newsP", news);
        return "AllMensajesProfesional";
    }

    @RequestMapping("/Profesional/todosLosMensajesNoLeidos/{id}")
    public String totalMensajesNoLeidosProf(@PathVariable int id, Model m) {
        List<Mensaje> news = md.buscarNotificacionesPorDestinatario(id);
        m.addAttribute("newsP", news);
        return "NoLeidosProfesional";
    }

    @RequestMapping("/Profesional/mensajesEnviados/{id}")
    public String totalMensajesEnviadosprof(@PathVariable int id, Model m) {
        List<Mensaje> news = md.buscarEnviadosPorRemitente(id);
        m.addAttribute("newsP", news);
        return "EnviadosProfesional";
    }

    @RequestMapping("/Profesional/irDetalleEnviado/{id}")
    public String mostrarEnviadoProf(@PathVariable int id, Model m) {
        Mensaje txt = md.buscarMensajeEnviadoPorId(id);
        m.addAttribute("mensaje", txt);
        return "DetalleEnviado";
    }

    @RequestMapping("/Profesional/quitarNotificacion/{id}")
    public String borrarNotificacion(@PathVariable int id, Model m) {
        Mensaje txt = md.buscarMensajePorId(id);
        md.cambiarLeido(id);
        m.addAttribute("mensaje", txt);
        return "DetalleMensaje";
    }

    // -------MI CUENTA--------//

    @RequestMapping("/Profesional/miCuenta/{id}")
    public String irMiCuenta(@PathVariable int id, Model m) {
        Profesional p = pd.buscarPorIdProfesional(id);
        m.addAttribute("profesional", p);
        m.addAttribute("command", new Usuario());
        return "CuentaProfesional";
    }

    @RequestMapping(value = "Profesional/cambioContrasena/{id}", method = RequestMethod.POST)
    public String actualizarClaveProfesional(@PathVariable int id, Usuario u, RedirectAttributes r) {
        ud.cambiarPassword(u);
        String alert = "open";
        r.addAttribute("open", alert);
        int id_profesional = id;
        return "redirect:/Profesional/miCuenta/" + id_profesional + ".html";
    }

    @RequestMapping("/Profesional/actualizarInfoProfesional")
    public String solicitudCambioDatos(Model m) {
        m.addAttribute("command", new Mensaje());
        return "SolicitudActualizacionProfesional";
    }

    // -----CheckList-----//
    @GetMapping(path = "/Profesional/checklist/{id}")
    public String irMisCheckList(@PathVariable int id, Model m) {
        List<CheckList> lmischecklist = ck.misCheckList(id);
        m.addAttribute("misCheckList", lmischecklist);
        List<Cliente> listaC = ck.listarClientes();
        m.addAttribute("listaC", listaC);
        List<Cliente> lclientes = cd.listaClientesEventos();
        m.addAttribute("listaClientes", lclientes);
        m.addAttribute("command", new Cliente());
        return "RevisarClientePorProfesional";
    }

    @GetMapping(path = "/Profesional/nuevocheck/{id}/{id_profesional}")
    public String crearcheck(@PathVariable int id, @PathVariable int id_profesional, RedirectAttributes r) {
        CheckList chl = ck.buscarPorId(id);
        String alert;
        if (chl == null) {
            ck.crearCheckList(id, id_profesional);
            alert = "chkCreado";
        }else {
            alert = "chkExistente";  
        }
        r.addFlashAttribute("chkAlert", alert);
        int id_prof = id_profesional;
        return "redirect:/Profesional/checklist/" + id_prof + ".html";
    }

    // -----Tareas-----//

    @RequestMapping("/Profesional/irNuevaTarea/{id}/{id_profesional}")
    public String formTarea(@PathVariable int id, @PathVariable int id_profesional, Model m) {
        m.addAttribute("id_ck", id);
        m.addAttribute("id_prof", id_profesional);
        m.addAttribute("command", new Tarea());
        
        return "FormTarea";

    }
    
    @RequestMapping(value = "Profesional/crearTarea/{id}", method = RequestMethod.POST)
    public String NuevaTarea(@PathVariable int id, Tarea tr, RedirectAttributes r) {
        t.crearTarea(tr);
        int id_profesional = id;
        return "redirect:/Profesional/checklist/" + id_profesional + ".html";
    
    }
    
    /*
    @RequestMapping(value = "Profesional/editarTarea/{id}", method = RequestMethod.POST)
    public String editarTarea(@PathVariable int id, Tarea tr, Model m, RedirectAttributes r) {
        t.editarTarea(tr);
        int id_profesional = id;
        m.addAttribute("command", new Tarea());
        return "redirect:/Profesional/checklist/" + id_profesional + ".html";
        
    }*/
    
   
    @RequestMapping(value = "/Profesional/editarTarea/{id}/{id_tarea}")
    public String editarTarea(@PathVariable int id, @PathVariable int id_tarea, Model m) {
        Tarea tar = t.buscarTareaPorId(id_tarea);
        m.addAttribute("command", tar);
        m.addAttribute("id_tarea", id_tarea);
        return "EditarTarea";
    }
    
    
    
    
    @RequestMapping(value = "Profesional/filtrarChecklist/{id}", method = RequestMethod.POST)
    public String filtrarTareas(@PathVariable int id, Cliente c, RedirectAttributes r) {
        int id_cliente = c.getId_cliente();
        List<Tarea> lTarea = t.misTareas(id_cliente);
        String empresa = cd.obtenerNombreCliente(id_cliente);
        r.addFlashAttribute("listTarea", lTarea);
        r.addFlashAttribute("nombreCliente",empresa);
        int id_profesional = id;
        return "redirect:/Profesional/checklist/" + id_profesional + ".html";
    }

    
    
    
    
    
    
    
    

}
