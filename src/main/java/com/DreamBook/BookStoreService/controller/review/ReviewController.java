package com.DreamBook.BookStoreService.controller.review;

import com.DreamBook.BookStoreService.dto.book.BookDTO;
import com.DreamBook.BookStoreService.dto.order.OrderDTO;
import com.DreamBook.BookStoreService.dto.review.ReviewAddDTO;
import com.DreamBook.BookStoreService.dto.review.ReviewDTO;
import com.DreamBook.BookStoreService.dto.review.ReviewFindDTO;
import com.DreamBook.BookStoreService.service.review.ReviewService;
import com.DreamBook.BookStoreService.util.AlertMessage;
import org.apache.logging.log4j.message.Message;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.http.HttpResponse;
import java.util.List;

@Controller
public class ReviewController {

    @Resource
    private ReviewService reviewService;


    @GetMapping("/reviewAdd")
    public String reviewAdd(Model model, BookDTO bookDTO, OrderDTO orderDTO, HttpSession session) {

        int memberId = (Integer) session.getAttribute("memberId");

        model.addAttribute("memberId", memberId);
        model.addAttribute("bookId", bookDTO.getBookId());
        model.addAttribute("orderId", orderDTO.getOrderId());


        return "review/reviewAdd";
    }

    @GetMapping("/review")
    public String review(Model model)throws Exception {



//        List<ReviewFindDTO> reviewAllList = reviewService.reviewAllList();


        List<ReviewFindDTO> reviewAllList = reviewService.reviewWriter();

        model.addAttribute("reviewAllList",reviewAllList);



        return "review/review";
    }



    @PostMapping("/review")
    public String reviewList(ReviewAddDTO reviewAddDTO, OrderDTO orderDTO, MultipartFile file, HttpServletResponse response) throws Exception {

        if (file.isEmpty()) {

            if (reviewService.ReviewOrderIdFind(orderDTO.getOrderId()) == 0) {
                int maxNum = reviewService.maxNum();

                reviewAddDTO.setReviewId(maxNum + 1);


                reviewService.insertReviewNotImage(reviewAddDTO);

                return "redirect:/";

            }


            if (reviewService.ReviewOrderIdFind(orderDTO.getOrderId()) == 1) {
                System.out.println("a");
                AlertMessage.warningMessage(response, "/myOrder", "이미 등록된 리뷰입니다!.");
                return "redirect:/myOrder";

            }
        } else


            if (reviewService.ReviewOrderIdFind(orderDTO.getOrderId()) == 0) {

                int maxNum = reviewService.maxNum();

                reviewAddDTO.setReviewId(maxNum + 1);


                reviewService.insertReviewData(reviewAddDTO, file);


                return "redirect:/review";

            }


            if (reviewService.ReviewOrderIdFind(orderDTO.getOrderId()) == 1) {

                AlertMessage.warningMessage(response, "/myOrder", "이미 등록된 리뷰입니다!.");
                return "redirect:/myOrder";

            }

            return "review/review";
        }

    @GetMapping("/reviewDetail{reviewId}")
    public String reviewDetail(Model model, @RequestParam("reviewId") int reviewId,@RequestParam("userId")String reviewWriter)throws Exception {


        List<ReviewFindDTO> reviewDetail = reviewService.reviewDetailList(reviewId);

        model.addAttribute("reviewDetail",reviewDetail);
        model.addAttribute("reviewWriter",reviewWriter);


        return "review/reviewDetail";
    }




}