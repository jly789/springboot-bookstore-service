package com.DreamBook.BookStoreService.controller.review;

import com.DreamBook.BookStoreService.dto.book.BookDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class ReviewController {



    @GetMapping("/reviewAdd")
    public String reviewAdd(Model model, BookDTO bookDTO, HttpSession session){

         int memberId =(Integer) session.getAttribute("memberId");


        return "review/reviewAdd";
    }

    @GetMapping("/review")
    public String review(){




        return "review/review";
    }

    @PostMapping("/review")
    public String reviewList(){




        return "review/review";
    }

}
