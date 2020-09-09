package cl.awakelab.nmd;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import cl.awakelab.nmd.DAO.CapacitacionDAO;

import cl.awakelab.nmd.beans.Capacitacion;


@Controller
public class ClienteJsonController {
    
    @Autowired
    CapacitacionDAO cd;
        
    @RequestMapping(value = "/visitasProfesional", method = RequestMethod.GET,  headers = "Accept=application/json")
    public @ResponseBody List<Capacitacion> listarCapacitacionesProfesional() {
            List<Capacitacion> listaCapacitaciones = cd.listarCapacitacionesJsonProf(1);
            return listaCapacitaciones;
    }

}
