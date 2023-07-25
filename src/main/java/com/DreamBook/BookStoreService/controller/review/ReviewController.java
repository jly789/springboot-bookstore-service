package com.DreamBook.BookStoreService.controller.review;

import com.DreamBook.BookStoreService.dto.book.BookDTO;
import com.DreamBook.BookStoreService.dto.review.ReviewAddDTO;
import com.DreamBook.BookStoreService.service.review.ReviewService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
public class ReviewController {

    @Resource
    private ReviewService reviewService;



    @GetMapping("/reviewAdd")
    public String reviewAdd(Model model, BookDTO bookDTO, HttpSession session){

         int memberId =(Integer) session.getAttribute("memberId");

         model.addAttribute("memberId",memberId);
        model.addAttribute("bookId",bookDTO.getBookId());






        return "review/reviewAdd";
    }

    @GetMapping("/review")
    public String review(){




        return "review/review";
    }

//    @PostMapping("/review")
//    public String reviewList(ReviewAddDTO reviewAddDTO,MultipartFile file)throws Exception{
//
//
//
//            int maxNum = reviewService.maxNum();
//
//            reviewAddDTO.setReviewId(maxNum + 1);
//
//
//            reviewService.insertReviewData(reviewAddDTO, file);
//
//
//        return "review/review";
//    }
//
//}

    @PostMapping("/review")
    public String reviewList(ReviewAddDTO reviewAddDTO,MultipartFile file)throws Exception{



        int maxNum = reviewService.maxNum();

        reviewAddDTO.setReviewId(maxNum + 1);


        reviewService.insertReviewData(reviewAddDTO, file);


        return "review/review";
    }

}
