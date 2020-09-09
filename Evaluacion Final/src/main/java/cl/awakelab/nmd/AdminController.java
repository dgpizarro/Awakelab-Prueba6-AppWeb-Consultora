 package cl.awakelab.nmd;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cl.awakelab.nmd.DAO.ClienteDAO;
import cl.awakelab.nmd.DAO.MensajeDAO;
import cl.awakelab.nmd.DAO.ProfesionalDAO;
import cl.awakelab.nmd.DAO.UsuarioDAO;
import cl.awakelab.nmd.beans.Cliente;
import cl.awakelab.nmd.beans.Mensaje;
import cl.awakelab.nmd.beans.Profesional;
import cl.awakelab.nmd.beans.Usuario;


@Controller
@SessionAttributes({ "nombre", "id_usuario"})
public class AdminController {
    
    @Autowired
    ClienteDAO cd;
    
    @Autowired
    MensajeDAO md;
    
    @Autowired
    ProfesionalDAO pd;
    
    @Autowired
    UsuarioDAO ud;
    
 // Manejo de fechas desde formulario html Date a atributo de clase java Date
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true, 10));
    }
    
    //--- Home Admin ---
    
    @RequestMapping("/Admin/home")
    public String irPortalCliente(Model m) {
        String usuario = SecurityContextHolder.getContext().getAuthentication().getName();
        int id_usuario = ud.obtenerIDUsuario(usuario);
        String nombre_admin = ud.obtenerNombreUsuario(usuario);
        
        m.addAttribute("id_usuario", id_usuario);
        m.addAttribute("nombre", nombre_admin);
        return "PortalAdmin";
    }
    
    //--- Mensajes ---
    
    @RequestMapping("/Admin/irMensajesAdmin")
    public String mensajeriaAdmin(Model m) {
        List<Profesional> listaD = pd.listarDestinatariosCliente();
        List<Cliente> listaD2 = cd.listarDestinatariosProfesional();
        m.addAttribute("listaP", listaD);
        m.addAttribute("listaC", listaD2);
        m.addAttribute("command", new Mensaje());
        return "MensajesAdmin";
    }
    
    @RequestMapping(value = "/Admin/generaMensaje", method = RequestMethod.POST)
    public String registrarMensajeAdmin(Mensaje m, RedirectAttributes r) {
        md.crearMensaje(m);
        String alert = "open";
        r.addFlashAttribute("open", alert);
        return "redirect:/Admin/irMensajesAdmin.html";
    }
    
    @RequestMapping("/Admin/todosLosMensajes/{id}")
    public String totalMensajesAdmin(@PathVariable int id, Model m) {
        List<Mensaje> news = md.buscarTodosLosMensajesPorDestinatario(id);
        m.addAttribute("newsP", news);
        return "AllMensajesAdmin";
    }
    
    @RequestMapping("/Admin/todosLosMensajesNoLeidos/{id}")
    public String totalMensajesNoLeidosAdmin(@PathVariable int id, Model m) {
        List<Mensaje> news = md.buscarNotificacionesPorDestinatario(id);
        m.addAttribute("newsP", news);
        return "NoLeidosAdmin";
    }
    
    @RequestMapping("/Admin/mensajesEnviados/{id}")
    public String totalMensajesEnviadosAdmin (@PathVariable int id, Model m) {
        List<Mensaje> news = md.buscarEnviadosPorRemitente(id);
        m.addAttribute("newsP", news);
        return "EnviadosAdmin";
    }
    
    @RequestMapping("Admin/irDetalleEnviado/{id}")
    public String mostrarEnviadoAdmin (@PathVariable int id, Model m) {
        Mensaje txt = md.buscarMensajeEnviadoPorId(id);
        int id_profesional = txt.getDestinatario().getId_usuario();
        String profesion = pd.obtenerProfesion(id_profesional);
        m.addAttribute("mensaje", txt);
        m.addAttribute("profesion", profesion);
        return "DetalleEnviado";
    }
    
    @RequestMapping("Admin/quitarNotificacion/{id}")
    public String borrarNotificacion(@PathVariable int id, Model m) {
        Mensaje txt = md.buscarMensajePorId(id);
        int id_profesional = txt.getRemitente().getId_usuario();
        String profesion = pd.obtenerProfesion(id_profesional);
        md.cambiarLeido(id);
        m.addAttribute("mensaje", txt);
        m.addAttribute("profesion", profesion);
        return "DetalleMensaje";
    }
    
    //--- Gestion Clientes ----
    
    @RequestMapping("/Admin/irGestionCliente")
    public String gestionarCliente(Model m) {
        List<Cliente> lista = cd.listarResumenClientes();
        m.addAttribute("lclientes", lista);
        m.addAttribute("command", new Cliente());
        return "GestionCliente";
    }
    
    @RequestMapping(value = "/Admin/crearNuevoCliente", method = RequestMethod.POST)
    public String registrarCliente(Cliente c, RedirectAttributes r) {
        cd.crearCliente(c);
       String alert = "open";
        r.addFlashAttribute("open", alert);
        return "redirect:/Admin/irGestionCliente.html";
    }
    
    @RequestMapping("/Admin/irDetalleCliente/{id}")
    public String detalleCliente(@PathVariable int id, Model m) {
        Cliente c = cd.buscarPorIdCliente(id);
        String rut = c.getRut();
        Date fecha_registro = ud.obtenerFechaRegistro(rut);
        m.addAttribute("cliente", c);
        m.addAttribute("registro", fecha_registro);
        return "DetalleCliente";
    }
    
    @RequestMapping("/Admin/irModificarCliente/{id}")
    public String editarCliente(@PathVariable int id, Model m) {
        Cliente c_edit = cd.buscarPorIdCliente(id); 
        List <Mensaje> solicitudes = md.listarMensajesActualizacionCliente(id);
        m.addAttribute("command", c_edit);
        m.addAttribute("lista", solicitudes);
        return "ModificarCliente";
    }
    
    @RequestMapping(value = "/Admin/editarCliente", method = RequestMethod.POST)
    public String guardarEditCliente(Cliente c, RedirectAttributes r) {
       cd.editarCliente(c);
       String alert = "open";
        r.addFlashAttribute("open", alert);
        return "redirect:/Admin/irGestionCliente.html";
    }
    
    @RequestMapping("/Admin/irKeyCliente/{id_usuario}/{id_cliente}")
    public String cambiarKeyCliente(@PathVariable int id_usuario, @PathVariable int id_cliente, Model m) {
        m.addAttribute("command", new Usuario());
        m.addAttribute("id_us", id_usuario);
        m.addAttribute("id_cl", id_cliente);
        return "SetClaveAdmin";
    }
    
    @RequestMapping(value = "/Admin/cambioContrasena", method = RequestMethod.POST)
    public String actualizarClave(Usuario u) {
        ud.cambiarPassword(u);
        System.out.println("Cambio de contrasena exitoso");
       return "redirect:/Admin/irGestionCliente.html";
    }
    
    //-----Gestión Profesional-----//
    
    @RequestMapping("/Admin/irGestionProfesional")
    public String gestionarProfesional(Model m) {
        List<Profesional> lista = pd.listarResumenProfesionales();
        m.addAttribute("lprofesionales", lista);
        m.addAttribute("command", new Profesional());
        return "GestionProfesional";
    }
    
    @RequestMapping(value = "/Admin/crearNuevoProfesional", method = RequestMethod.POST)
    public String registrarProfesional(Profesional p, RedirectAttributes r) {
        pd.crearProfesional(p);
        String alert = "open";
        r.addFlashAttribute("open", alert);
        return "redirect:/Admin/irGestionProfesional.html";
    }
    
    @RequestMapping("/Admin/irDetalleProfesional/{id}")
    public String detalleProfesional(@PathVariable int id, Model m) {
        Profesional p = pd.buscarPorIdProfesional(id);
        String rut = p.getRut_profesional();
        Date fecha_registro = ud.obtenerFechaRegistro(rut);
        m.addAttribute("profesional", p);
        m.addAttribute("registro", fecha_registro);
        return "DetalleProfesional"; 
    }

    
    @RequestMapping("/Admin/irKeyProfesional/{id_usuario}/{id_profesional}")
    public String cambiarKeyProfesional(@PathVariable int id_usuario, @PathVariable int id_profesional, Model m) {
        m.addAttribute("command", new Usuario());
        m.addAttribute("id_us", id_usuario);
        m.addAttribute("id_pl", id_profesional);
        return "SetClaveAdminP";
    }
    
    @RequestMapping(value = "/Admin/cambioContrasenaP", method = RequestMethod.POST)
    public String actualizarClaveP(Usuario u) {
        ud.cambiarPassword(u);
        System.out.println("Cambio de contrasena exitoso");
       return "redirect:/Admin/irGestionProfesional.html";
    }
    
    @RequestMapping(value = "/Admin/editarProfesional", method = RequestMethod.POST)
    public String guardarEditProfesional(Profesional p, RedirectAttributes r) {
       pd.editarProfesional(p);
       String alert = "open";
        r.addFlashAttribute("open", alert);
        return "redirect:/Admin/irGestionProfesional.html";
    }
    
    @RequestMapping("/Admin/irModificarProfesional/{id}")
    public String editarProfesional(@PathVariable int id, Model m) {
        Profesional p_edit = pd.buscarPorIdProfesional(id); 
        List <Mensaje> solicitudes = md.listarMensajesActualizacionProfesional(id);
        m.addAttribute("command", p_edit);
        m.addAttribute("lista", solicitudes);
        return "ModificarProfesional";
    }
     

}
