package com.DreamBook.BookStoreService.controller.review;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewController {

    @GetMapping("/review")
    public String review(Model model){

        return "review/review";
    }

}
