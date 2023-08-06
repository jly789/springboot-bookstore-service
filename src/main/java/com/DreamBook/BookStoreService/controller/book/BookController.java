package com.DreamBook.BookStoreService.controller.book;

import com.DreamBook.BookStoreService.dto.book.BookAddDTO;
import com.DreamBook.BookStoreService.dto.book.BookCartDTO;
import com.DreamBook.BookStoreService.dto.book.BookDTO;
import com.DreamBook.BookStoreService.dto.book.BookFindDTO;
import com.DreamBook.BookStoreService.dto.comment.CommentFindDTO;
import com.DreamBook.BookStoreService.service.book.BookService;
import com.DreamBook.BookStoreService.service.comment.CommentService;
import com.DreamBook.BookStoreService.service.review.ReviewService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.*;

@Controller
public class BookController {

    @Resource
    private BookService bookService;

    @Resource
    private ReviewService reviewService;

    @Resource
    private CommentService commentService;

    @GetMapping("/bookMain")
    public String bookMain( Model model,HttpSession session,BookFindDTO bookFindDTO)throws Exception{

        String genreName = "전체";
        int firstPriceRange = 0; //처음 가격범위 0원이상

        if(session.getAttribute("priceRange")!=null) {
            int priceRange = (int) session.getAttribute("priceRange");

            List<BookFindDTO> bookList = bookService.bookListPrice(priceRange);
            List<BookFindDTO>  bookListGrade  = bookService.bookAndReviewGrade(bookList);
            model.addAttribute("bookAndReview",bookListGrade);
            model.addAttribute("genreName",genreName);
            model.addAttribute("priceRange",priceRange);
            session.removeAttribute("priceRange");
            return "book/main";
        }

       List<BookFindDTO> bookList = bookService.bookList();
        List<BookFindDTO> bookListGrade = bookService.bookAndReviewGrade(bookList);
        model.addAttribute("bookAndReview",bookListGrade);
        model.addAttribute("genreName",genreName);
        model.addAttribute("priceRange",firstPriceRange);


        return "book/main";
    }

    @GetMapping("/sort{abc}")
    public String bookMainSort( Model model,@PathVariable("abc") String bb,
                                @RequestParam("abc")int state,HttpSession session)throws Exception{
        String choice = "정렬";
        int firstPriceRange = 0; //처음 가격범위 0원이상

        if(state ==0){
            List<BookFindDTO> bookList = bookService.bookList();
            List<BookFindDTO> bookListGrade = bookService.bookAndReviewGrade(bookList);
            model.addAttribute("bookAndReview",bookListGrade);
            model.addAttribute("genreName",choice);
            model.addAttribute("priceRange",firstPriceRange);

            return "book/main";
        }

        if(state ==1){
            List<BookFindDTO> bookList = bookService.bookList();
            List<BookFindDTO> bookAndReviewHighPrice =bookService.bookListHighPrice(bookList);
            model.addAttribute("bookAndReviewHighPrice",bookAndReviewHighPrice);
            model.addAttribute("genreName",choice);
            model.addAttribute("priceRange",firstPriceRange);
            return "book/main";
        }
        if(state == 2) {
            List<BookFindDTO> bookList = bookService.bookList();
            List<BookFindDTO> bookAndReviewLowPrice =bookService.bookListLowPrice(bookList);
            model.addAttribute("bookAndReviewLowPrice",bookAndReviewLowPrice);
            model.addAttribute("genreName",choice);
            model.addAttribute("priceRange",firstPriceRange);
            return "book/main";
        }

        if(state == 3) {
            List<BookFindDTO> bookList = bookService.bookList();
            List<BookFindDTO> bookManyOrder =bookService.bookListManyOrders(bookList);
            model.addAttribute("bookManyOrder",bookManyOrder);
            model.addAttribute("genreName",choice);
            model.addAttribute("priceRange",firstPriceRange);
            return "book/main";
        }
        if(state == 4) {
            List<BookFindDTO> bookList = bookService.bookList();
            List<BookFindDTO> bookManyReview =bookService.bookListManyReview(bookList);
            model.addAttribute("bookManyReview",bookManyReview);
            model.addAttribute("genreName",choice);
            model.addAttribute("priceRange",firstPriceRange);
            return "book/main";
        }

        return "book/main";
        }

    @ResponseBody
    @PostMapping("/choiceResult")
    public String choiceResult ( @RequestParam("choice")String choice)throws Exception {

        return choice;
    }
    @ResponseBody
    @PostMapping("/genreChoice")
    public String genreChoice ( @RequestParam("choice")String choice)throws Exception {
        return choice;
    }

    @GetMapping("/genre{choice}")
    public String genreSearch( Model model,@PathVariable("choice") String bb,
                                @RequestParam("choice")String choice)throws Exception {
        int firstPriceRange = 0; //처음 가격범위 0원이상
        if (choice.equals("전체")) {
            List<BookFindDTO> genreSearch=  bookService.genreSearchAll();
            model.addAttribute("genreSearch", genreSearch);
            model.addAttribute("genreName",choice);
            model.addAttribute("priceRange",firstPriceRange);

            return "book/main";
        }

        if (choice.equals("수필")) {

            List<BookFindDTO> genreSearch=  bookService.genreSearch(choice);
            model.addAttribute("genreSearch", genreSearch);
            model.addAttribute("genreName",choice);
            model.addAttribute("priceRange",firstPriceRange);

            return "book/main";
        }
        if (choice.equals("공포")) {
            List<BookFindDTO> genreSearch=  bookService.genreSearch(choice);
            model.addAttribute("genreSearch", genreSearch);
            model.addAttribute("genreName",choice);
            model.addAttribute("priceRange",firstPriceRange);
            return "book/main";

        }
        if (choice.equals("코미디")) {
            List<BookFindDTO> genreSearch=  bookService.genreSearch(choice);
            model.addAttribute("genreSearch", genreSearch);
            model.addAttribute("genreName",choice);
            model.addAttribute("priceRange",firstPriceRange);

            return "book/main";

        }

        if (choice.equals("소설")) {
            List<BookFindDTO> genreSearch=  bookService.genreSearch(choice);
            model.addAttribute("genreSearch", genreSearch);
            model.addAttribute("genreName",choice);
            model.addAttribute("priceRange",firstPriceRange);

            return "book/main";
        }

        if (choice.equals("연애")) {

            List<BookFindDTO> genreSearch=  bookService.genreSearch(choice);
            model.addAttribute("genreSearch", genreSearch);
            model.addAttribute("genreName",choice);
            model.addAttribute("priceRange",firstPriceRange);

            return "book/main";

        }
        return "book/main";
    }
    @ResponseBody
    @PostMapping("/priceRange")
    public int priceRange ( @RequestParam("price")int price,Model model,HttpSession session)throws Exception {

        session.setAttribute("priceRange",price);
        return price;

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

        bookService.updateViews(id);

        List<BookFindDTO> bookList = bookService.bookIdList(id);
        List<CommentFindDTO> commentFindDTOList = commentService.commentList(id);


        model.addAttribute("bookList",bookList);
        model.addAttribute("commentFindDTOList",commentFindDTOList);
        return "book/bookDetail";
    }

    @GetMapping("/cart")
    public String bookCartList(BookDTO bookDTO,BookCartDTO bookCartDTO, HttpSession session,Model model)throws Exception {

        int memberId = (Integer) session.getAttribute("memberId");
        int totalPrice=0;
        model.addAttribute("memberId",memberId);
        List<BookDTO> bookCartList = bookService.bookCartList(memberId);
        model.addAttribute("bookCartList", bookCartList);

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

    @GetMapping("/cartMinus")
    public String cartMinus(HttpSession session , Model model, BookCartDTO bookCartDTO
    , HttpServletResponse response)throws Exception{

        if(bookCartDTO.getWishQuantity() ==1){

            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('수량은 최소 1개이상입니다!'); </script>");
            out.flush();

            int memberId = (Integer) session.getAttribute("memberId");
            int totalPrice=0;

            model.addAttribute("memberId",memberId);

            List<BookDTO> bookCartList = bookService.bookCartList(memberId);

            model.addAttribute("bookCartList", bookCartList);

            for(int i=0; i<bookCartList.size(); i++) {

                totalPrice = totalPrice + bookCartList.get(i).getAmount();
            }
            model.addAttribute("totalPrice",totalPrice);

            return "book/cart";
        }

        else

         bookService.updateWishQuantityMinus(bookCartDTO);
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
    @GetMapping("/cartDelete")
    public String bookCartDelete(BookCartDTO bookCartDTO,HttpSession session,Model model)throws Exception{

        bookService.deleteCart(bookCartDTO);
        int memberId = (Integer) session.getAttribute("memberId");
        int totalPrice=0;

        model.addAttribute("memberId",memberId);

        List<BookDTO> bookCartList = bookService.bookCartList(memberId);

        model.addAttribute("bookCartList", bookCartList);

        for(int i=0; i<bookCartList.size(); i++) {

            totalPrice = totalPrice + bookCartList.get(i).getAmount();
        }
        model.addAttribute("totalPrice",totalPrice);

        return "book/cart";
    }



}
