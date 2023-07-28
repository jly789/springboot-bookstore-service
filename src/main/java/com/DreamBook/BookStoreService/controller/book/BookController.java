package com.DreamBook.BookStoreService.controller.book;

import com.DreamBook.BookStoreService.dto.book.BookAddDTO;
import com.DreamBook.BookStoreService.dto.book.BookCartDTO;
import com.DreamBook.BookStoreService.dto.book.BookDTO;
import com.DreamBook.BookStoreService.dto.book.BookFindDTO;
import com.DreamBook.BookStoreService.dto.member.MemberDTO;
import com.DreamBook.BookStoreService.dto.order.OrderDTO;
import com.DreamBook.BookStoreService.dto.review.ReviewFindDTO;
import com.DreamBook.BookStoreService.service.book.BookService;
import com.DreamBook.BookStoreService.service.review.ReviewService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class BookController {

    @Resource
    private BookService bookService;

    @Resource
    private ReviewService reviewService;

    @GetMapping("/bookMain")
    public String bookMain( Model model)throws Exception{

        List<BookFindDTO> bookList = bookService.bookList();
        model.addAttribute("bookList",bookList);

        List<BookDTO> bookAndReview = bookService.bookAndReview(bookList);
        model.addAttribute("bookAndReview",bookAndReview);

        return "book/main";
    }

    @GetMapping("/sort{abc}")
    public String bookMainSort( Model model,@PathVariable("abc") String bb,
                                @RequestParam("abc")int state)throws Exception{

        if(state ==0){

            List<BookFindDTO> bookList = bookService.bookList();
//            model.addAttribute("bookList",bookList);
            List<BookDTO> bookAndReview = bookService.bookAndReview(bookList);
            model.addAttribute("bookAndReviewAll",bookAndReview);
            return "book/main";

        }

        if(state ==1){

            List<BookFindDTO> bookList = bookService.bookList();
            List<BookFindDTO> bookAndReviewHighPrice =bookService.bookListHighPrice(bookList);
            model.addAttribute("bookAndReviewHighPrice",bookAndReviewHighPrice);
            return "book/main";

        }


        if(state == 2) {
            List<BookFindDTO> bookList = bookService.bookList();
            List<BookFindDTO> bookAndReviewLowPrice =bookService.bookListLowPrice(bookList);
            model.addAttribute("bookAndReviewLowPrice",bookAndReviewLowPrice);
            return "book/main";
        }

        return "book/main";
        }



    @ResponseBody
    @PostMapping("/choiceResult")
    public String choiceResult ( @RequestParam("choice")String choice)throws Exception {

        return choice;

    }


    @GetMapping("/bookAdd")
    public String bookAdd(){

        return "book/bookAdd";
    }

    @PostMapping("/bookAdd")
    public String bookAddOk(BookAddDTO bookAddDTO, MultipartFile file, HttpSession session)throws Exception{

        int memberId =(Integer) session.getAttribute("memberId");
        int maxNum = bookService.maxNum();

        bookAddDTO.setBookId(maxNum+1);
        bookAddDTO.setMemberId(memberId);

        bookService.insertData(bookAddDTO,file);

        return "book/bookAdd";
    }
    @GetMapping("/{id}")
    public String bookDetail(@PathVariable("id") int id, Model model)throws Exception{


        List<BookFindDTO> bookList = bookService.bookIdList(id);
        model.addAttribute("bookList",bookList);
        return "book/bookDetail";
    }

    @GetMapping("/cart")
    public String bookCartList(BookDTO bookDTO,BookCartDTO bookCartDTO, HttpSession session,Model model)throws Exception {

        int memberId = (Integer) session.getAttribute("memberId");
        int totalPrice=0;

        model.addAttribute("memberId",memberId);

        List<BookDTO> bookCartList = bookService.bookCartList(memberId);

        model.addAttribute("bookCartList", bookCartList);
        model.addAttribute("bookCartList");

      for(int i=0; i<bookCartList.size(); i++) {

          totalPrice = totalPrice + bookCartList.get(i).getAmount();
      }
        model.addAttribute("totalPrice",totalPrice);

        return "book/cart";
    }


    @ResponseBody
    @PostMapping("/cartList")
    public List<BookDTO> cartList(BookCartDTO BookCartDTO, HttpSession session, Model model)throws Exception {

        List<BookDTO> bookCartList = bookService.bookCartList(BookCartDTO.getMemberId());

        return bookCartList;
    }

    @GetMapping("/cartPlus")
    public String cartPlus(HttpSession session , Model model,BookCartDTO bookCartDTO)throws Exception{



        bookService.updateWishQuantity(bookCartDTO);
        bookService.updateAmount(bookCartDTO);

        int totalPrice = 0;


        int memberId = (Integer) session.getAttribute("memberId");

        model.addAttribute("memberId",memberId);

        List<BookDTO> bookCartList = bookService.bookCartList(memberId);
        for(int i=0; i<bookCartList.size(); i++) {

            totalPrice = totalPrice + bookCartList.get(i).getAmount();

        }

        model.addAttribute("totalPrice",totalPrice);
        model.addAttribute("bookCartList", bookCartList);

        return "book/cart";
    }

    @ResponseBody
    @PostMapping("/cartPlus")
    public List<BookDTO> bookCartListAjaxPlus(HttpSession session, String price,BookDTO bookDTO,@RequestParam("cartId")int cartId)throws Exception{

        int memberId = bookDTO.getMemberId();

        List<BookDTO> bookCartList = bookService.bookCartList(memberId);

        return bookCartList;
    }

    @PostMapping("/cartAdd")
    public String bookCart(BookCartDTO bookCartDTO, Model model,HttpSession session,Model mode
    ,@RequestParam("bookId")int bookId,@RequestParam("amount")int amount)throws Exception {

        bookCartDTO.setBookId(bookId);
        bookCartDTO.setPrice(amount);

        int totalPrice = 0;
        int memberId = (Integer) session.getAttribute("memberId");

        List<BookDTO> bookDTOList = bookService.bookCartList(memberId);

        if (bookDTOList.size() == 0) {

            int maxNum = bookService.maxNumCart();
            bookCartDTO.setCartId(maxNum + 1);
            bookCartDTO.setMemberId(memberId);
            bookService.bookCartInsertData(bookCartDTO);

            List<BookDTO> bookCartList = bookService.bookCartList(memberId);
            for (int i = 0; i < bookCartList.size(); i++) {

                totalPrice = totalPrice + bookCartList.get(i).getAmount();

            }

            model.addAttribute("totalPrice", totalPrice);
            model.addAttribute("bookCartList", bookCartList);

            return "book/cart";
        }


        if (bookDTOList.size() != 0) {

            for (int i = 0; i < bookDTOList.size(); i++) {
                if (bookDTOList.get(i).getBookId() == bookCartDTO.getBookId()) {
                    System.out.println(bookCartDTO.getBookId());
                    bookService.updateWishQuantity(bookCartDTO);
                    bookService.updateAmount(bookCartDTO);
                    return "redirect:/cart";
                }

            }

            int maxNum = bookService.maxNumCart();
            bookCartDTO.setCartId(maxNum + 1);
            bookCartDTO.setMemberId(memberId);
            bookService.bookCartInsertData(bookCartDTO);

            List<BookDTO> bookCartList = bookService.bookCartList(memberId);
            for (int i = 0; i < bookCartList.size(); i++) {

                totalPrice = totalPrice + bookCartList.get(i).getAmount();

            }

            model.addAttribute("totalPrice", totalPrice);
            model.addAttribute("bookCartList", bookCartList);

            return "book/cart";
        }
        return "book/cart";
    }
    @GetMapping("/delete")
    public String bookCartDelete(BookCartDTO bookCartDTO)throws Exception{


        System.out.println(bookCartDTO.getCartId());

        return "book/cart";
    }



}
