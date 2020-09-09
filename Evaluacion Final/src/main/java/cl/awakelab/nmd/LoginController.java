package cl.awakelab.nmd;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
    
 //--- Login ---
    
    @RequestMapping("/irLogin")
    public String login() {
        return "index";
    }
    
    @RequestMapping("/errorLogin")
    public String error(ModelMap model) {
        System.out.println("¡Error de credenciales!");
        model.addAttribute("error", "true");
        return "index";
    }
    
 //--- Logout Cliente ---
    
    @RequestMapping("Cliente/logout")
    public String logoutCliente() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            SecurityContextHolder.getContext().setAuthentication(null);
        }
        return "redirect:/irLogin.html";
    }
    
  //--- Logout Profesional ---
    
    @RequestMapping("Profesional/logout")
    public String logoutProfesional() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            SecurityContextHolder.getContext().setAuthentication(null);
        }
        return "redirect:/irLogin.html";
    }
    

    //--- Logout Admin ---
    
    @RequestMapping("Admin/logout")
    public String logoutAdmin() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            SecurityContextHolder.getContext().setAuthentication(null);
        }
        return "redirect:/irLogin.html";
    }

}
