package com.DreamBook.BookStoreService.controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/")
    public String main(Model model){


        return "main/main";
    }

    @GetMapping("/index")
    public String index(Model model){


        return "main/index";
    }




}
