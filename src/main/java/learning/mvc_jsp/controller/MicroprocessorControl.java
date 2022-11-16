package learning.mvc_jsp.controller;

import learning.mvc_jsp.db.Microprocessor;
import learning.mvc_jsp.service.MicroprocessorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/microprocessor")
public class MicroprocessorControl {
    @Autowired
    private MicroprocessorService service;

    @GetMapping("/all")
    public String showAllMicroprocessors(Model model) {
        List<Microprocessor> microprocessorList = service.listAll();
        model.addAttribute("microprocessors", microprocessorList);
        return "index";
    }

    @GetMapping("/new")
    public ModelAndView showNewMicroprocessorForm(Model model) {
        model.addAttribute("action", "create");
        Microprocessor microprocessor = new Microprocessor();
        microprocessor.setClockSpeeds("0");
        return new ModelAndView("microprocessor-form", "microprocessor", microprocessor);
    }

    @PostMapping("/new")
    public String saveNewMicroprocessor(@ModelAttribute("microprocessor") Microprocessor microprocessor) {
        service.saveMicroprocessor(microprocessor);
        return "redirect:/microprocessor/all";
    }

    @GetMapping("/update/{id}")
    public ModelAndView showMicroprocessorForm(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("action", "update");
        Microprocessor microprocessor = service.findMicroprocessor(id);
        return new ModelAndView("microprocessor-form", "microprocessor", microprocessor);
    }

    @PostMapping("/update/{id}")
    public String updateMicroprocessorForm(@ModelAttribute("microprocessor") Microprocessor microprocessor) {
        service.updateMicroprocessor(microprocessor);
        return "redirect:/microprocessor/all";
    }

    @GetMapping("/delete/{id}")
    public String deleteMicroprocessor(@PathVariable("id") Integer id) {
        service.deleteMicroprocessorById(id);
        return "redirect:/microprocessor/all";
    }
}
