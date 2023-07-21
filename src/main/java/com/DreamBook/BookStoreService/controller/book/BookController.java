package com.DreamBook.BookStoreService.controller.book;

import com.DreamBook.BookStoreService.dto.book.BookAddDTO;
import com.DreamBook.BookStoreService.dto.book.BookCartDTO;
import com.DreamBook.BookStoreService.dto.book.BookDTO;
import com.DreamBook.BookStoreService.dto.book.BookFindDTO;
import com.DreamBook.BookStoreService.service.book.BookService;
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

    @GetMapping("/bookMain")
    public String bookMain(Model model)throws Exception{

        List<BookFindDTO> bookList = bookService.bookList();
        model.addAttribute("bookList",bookList);


        return "book/main";
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
    public String bookCartList(BookDTO bookDTO, HttpSession session,Model model)throws Exception {

        int memberId = (Integer) session.getAttribute("memberId");
        int totalPrice=0;

        model.addAttribute("memberId",memberId);

        List<BookDTO> bookCartList = bookService.bookCartList(memberId);

        model.addAttribute("bookCartList", bookCartList);
        model.addAttribute("bookCartList");

      for(int i=0; i<bookCartList.size(); i++) {
          totalPrice= totalPrice+  bookCartList.get(i).getPrice();


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

    @ResponseBody
    @PostMapping("/cartPlus")
    public String bookCartListAjaxPlus(String price){


        System.out.println(price);

        int i = 0;

        i = i+ Integer.parseInt(price);

        System.out.println(price);



        return price;
    }
//
//    @ResponseBody
//    @PostMapping("/cartMinus")
//    public int bookCartListAjaxMinus(int minus){
//
//
//        int result = minus-1;
//
//        System.out.println(result);
//
//
//        return result;
//    }


    @PostMapping("/cartAdd")
    public String bookCart(BookCartDTO bookCartDTO, HttpSession session,Model model)throws Exception{

        int memberId =(Integer) session.getAttribute("memberId");
        System.out.println(memberId);
        int maxNum = bookService.maxNumCart();
        bookCartDTO.setCartId(maxNum+1);
        bookCartDTO.setMemberId(memberId);
        bookService.bookCartInsertData(bookCartDTO);

        List<BookDTO> bookCartList = bookService.bookCartList(memberId);

        model.addAttribute("bookCartList",bookCartList);






        return "book/cart";
    }


}
