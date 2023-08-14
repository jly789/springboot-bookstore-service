package com.DreamBook.BookStoreService.controller.book;

import com.DreamBook.BookStoreService.dto.book.*;
import com.DreamBook.BookStoreService.dto.comment.CommentFindDTO;
import com.DreamBook.BookStoreService.dto.review.ReviewFindDTO;
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
    public String bookMain( Model model,HttpSession session,BookFindDTO bookFindDTO,
                            @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
                            @RequestParam(value = "cntPerPage", required = false, defaultValue = "1") int cntPerPage,
                            @RequestParam(value = "pageSize", required = false, defaultValue = "100") int pageSize

                            )throws Exception{
        String choice = "정렬";
        String genreName = "전체";
        int firstPriceRange = 0; //처음 가격범위 0원이상

        if(session.getAttribute("userId")!=null) {
            String userId = (String) session.getAttribute("userId");

            if (userId.equals("admin")) { //관리자모드
                model.addAttribute("genreName", genreName);
                model.addAttribute("priceRange", firstPriceRange);


                int listCnt = bookService.testTableCount();
                Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
                pagination.setTotalRecordCount(listCnt);

                model.addAttribute("pagination", pagination);
                model.addAttribute("bookAndReview", bookService.SelectAllList(pagination));
                model.addAttribute("userId", userId);


                return "book/mainAdmin";

            }

        }

        model.addAttribute("genreName",genreName);
        model.addAttribute("priceRange",firstPriceRange);


        int listCnt = bookService.testTableCount();
        Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
        pagination.setTotalRecordCount(listCnt);

        model.addAttribute("pagination",pagination);
        model.addAttribute("bookAndReview",bookService.SelectAllList(pagination));



        return "book/main";


    }

    @GetMapping("/bookPrice{price}")
    public String bookMainPriceGet( Model model,
                                HttpSession session,

                                @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
                                @RequestParam(value = "cntPerPage", required = false, defaultValue = "1") int cntPerPage,
                                @RequestParam(value = "pageSize", required = false, defaultValue = "100") int pageSize)throws Exception {
        String choice = "정렬";
        int firstPriceRange = 0; //처음 가격범위 0원이상
        String genreName = "전체";

        if(session.getAttribute("priceRange")!=null) {
            int priceRange = (int) session.getAttribute("priceRange");



            int listCnt = bookService.SearchPriceRangeTableCount(priceRange);
            PaginationPriceRange paginationPriceRange = new PaginationPriceRange(currentPage, cntPerPage, pageSize);
            paginationPriceRange.setTotalRecordCount(listCnt);
            paginationPriceRange.setPrice(priceRange);


            model.addAttribute("pagination",paginationPriceRange);
            model.addAttribute("genreName",choice);
            model.addAttribute("searchPrice",bookService.SelectPriceSearch(paginationPriceRange));
            model.addAttribute("price",priceRange);
//            session.removeAttribute("priceRange");





            return "book/main";
        }




        return "book/main";
    }

    @PostMapping("/bookPrice")
    public String bookMainPricePost( Model model,
                               HttpSession session,
                                @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
                                @RequestParam(value = "cntPerPage", required = false, defaultValue = "1") int cntPerPage,
                                @RequestParam(value = "pageSize", required = false, defaultValue = "100") int pageSize)throws Exception {
        String choice = "정렬";
        int firstPriceRange = 0; //처음 가격범위 0원이상
        String genreName = "전체";

        if(session.getAttribute("priceRange")!=null) {
            int priceRange = (int) session.getAttribute("priceRange");



            int listCnt = bookService.SearchPriceRangeTableCount(priceRange);
            PaginationPriceRange paginationPriceRange = new PaginationPriceRange(currentPage, cntPerPage, pageSize);
            paginationPriceRange.setTotalRecordCount(listCnt);
            paginationPriceRange.setPrice(priceRange);


            model.addAttribute("pagination",paginationPriceRange);
            model.addAttribute("genreName",choice);
            model.addAttribute("searchPrice",bookService.SelectPriceSearch(paginationPriceRange));
            model.addAttribute("price",priceRange);
//            session.removeAttribute("priceRange");





            return "book/main";
        }




        return "book/main";
    }



    @GetMapping("/sort{abc}")
    public String bookMainSort( Model model,@PathVariable("abc") String bb,
                                @RequestParam("abc")int state,HttpSession session,
                                @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
                                @RequestParam(value = "cntPerPage", required = false, defaultValue = "1") int cntPerPage,
                                @RequestParam(value = "pageSize", required = false, defaultValue = "100") int pageSize)throws Exception{
        String choice = "정렬";
        int firstPriceRange = 0; //처음 가격범위 0원이상
        String genreName = "전체";

        session.removeAttribute("priceRange");
        if(state ==0){

            int listCnt = bookService.testTableCount();
            Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
            pagination.setTotalRecordCount(listCnt);

            model.addAttribute("pagination",pagination);
            model.addAttribute("bookAndReview",bookService.SelectAllList(pagination));
            model.addAttribute("genreName",genreName);
            model.addAttribute("priceRange",firstPriceRange);

            return "book/main";
        }

        if(state ==1){


            int listCnt = bookService.testTableCount();
            Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
            pagination.setTotalRecordCount(listCnt);

            model.addAttribute("pagination",pagination);
            model.addAttribute("bookAndReviewHighPrice",bookService.SelectHighPriceList(pagination));
            model.addAttribute("genreName",genreName);
            model.addAttribute("priceRange",firstPriceRange);



            return "book/main";


        }
        if(state == 2) {



            int listCnt = bookService.testTableCount();
            Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
            pagination.setTotalRecordCount(listCnt);

            model.addAttribute("pagination",pagination);
            model.addAttribute("bookAndReviewLowPrice",bookService.SelectLowPriceList(pagination));
            model.addAttribute("genreName",genreName);
            model.addAttribute("priceRange",firstPriceRange);
            return "book/main";
        }

        if(state == 3) {
            int listCnt = bookService.testTableCount();
            Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
            pagination.setTotalRecordCount(listCnt);

            model.addAttribute("pagination",pagination);
            model.addAttribute("bookAndReviewManyOrders",bookService.SelectManyOrders(pagination));
            model.addAttribute("genreName",genreName);
            model.addAttribute("priceRange",firstPriceRange);
            return "book/main";
        }
        if(state == 4) {
            int listCnt = bookService.testTableCount();
            Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
            pagination.setTotalRecordCount(listCnt);

            model.addAttribute("pagination",pagination);
            model.addAttribute("bookAndReviewManyReview",bookService.SelectManyReview(pagination));
            model.addAttribute("genreName",genreName);
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
    public String genreSearch( Model model,@PathVariable("choice") String bb,HttpSession session,
                                @RequestParam("choice")String choice,
                               @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
                               @RequestParam(value = "cntPerPage", required = false, defaultValue = "1") int cntPerPage,
                               @RequestParam(value = "pageSize", required = false, defaultValue = "100") int pageSize)throws Exception {

        session.removeAttribute("priceRange");

        int firstPriceRange = 0; //처음 가격범위 0원이상
        if (choice.equals("전체")) {
            List<BookFindDTO> genreSearch=  bookService.genreSearchAll();
            model.addAttribute("genreSearch", genreSearch);
            model.addAttribute("genreName",choice);
            model.addAttribute("priceRange",firstPriceRange);

            return "book/main";
        }

        if (choice.equals("공포")) {

            int listCnt = bookService.SearchGenreTableCount(choice);
            PaginationGenre paginationGenre = new PaginationGenre(currentPage, cntPerPage, pageSize);
            paginationGenre.setTotalRecordCount(listCnt);
            paginationGenre.setGenre("공포");




            model.addAttribute("pagination",paginationGenre);
            model.addAttribute("genreSearch",bookService.SelectGenreSearch(paginationGenre));

            model.addAttribute("genreName",choice);
            model.addAttribute("priceRange",firstPriceRange);

            return "book/main";

        }

        if (choice.equals("수필")) {

            int listCnt = bookService.SearchGenreTableCount(choice);
            PaginationGenre paginationGenre = new PaginationGenre(currentPage, cntPerPage, pageSize);
            paginationGenre.setTotalRecordCount(listCnt);
            paginationGenre.setGenre("수필");


            model.addAttribute("pagination",paginationGenre);
            model.addAttribute("genreSearch",bookService.SelectGenreSearch(paginationGenre));

            model.addAttribute("genreName",choice);
            model.addAttribute("priceRange",firstPriceRange);

            return "book/main";
        }

        if (choice.equals("코미디")) {
            int listCnt = bookService.SearchGenreTableCount(choice);
            PaginationGenre paginationGenre = new PaginationGenre(currentPage, cntPerPage, pageSize);
            paginationGenre.setTotalRecordCount(listCnt);
            paginationGenre.setGenre("코미디");


            model.addAttribute("pagination",paginationGenre);
            model.addAttribute("genreSearch",bookService.SelectGenreSearch(paginationGenre));

            model.addAttribute("genreName",choice);
            model.addAttribute("priceRange",firstPriceRange);

            return "book/main";

        }

        if (choice.equals("소설")) {
            int listCnt = bookService.SearchGenreTableCount(choice);
            PaginationGenre paginationGenre = new PaginationGenre(currentPage, cntPerPage, pageSize);
            paginationGenre.setTotalRecordCount(listCnt);
            paginationGenre.setGenre("소설");


            model.addAttribute("pagination",paginationGenre);
            model.addAttribute("genreSearch",bookService.SelectGenreSearch(paginationGenre));

            model.addAttribute("genreName",choice);
            model.addAttribute("priceRange",firstPriceRange);

            return "book/main";
        }

        if (choice.equals("연애")) {

            int listCnt = bookService.SearchGenreTableCount(choice);
            PaginationGenre paginationGenre = new PaginationGenre(currentPage, cntPerPage, pageSize);
            paginationGenre.setTotalRecordCount(listCnt);
            paginationGenre.setGenre("연애");


            model.addAttribute("pagination",paginationGenre);
            model.addAttribute("genreSearch",bookService.SelectGenreSearch(paginationGenre));

            model.addAttribute("genreName",choice);
            model.addAttribute("priceRange",firstPriceRange);
            return "book/main";

        }


        if (choice.equals("과학")) {
            int listCnt = bookService.SearchGenreTableCount(choice);
            PaginationGenre paginationGenre = new PaginationGenre(currentPage, cntPerPage, pageSize);
            paginationGenre.setTotalRecordCount(listCnt);
            paginationGenre.setGenre("과학");


            model.addAttribute("pagination",paginationGenre);
            model.addAttribute("genreSearch",bookService.SelectGenreSearch(paginationGenre));

            model.addAttribute("genreName",choice);
            model.addAttribute("priceRange",firstPriceRange);

            return "book/main";
        }


        if (choice.equals("우주과학")) {
            int listCnt = bookService.SearchGenreTableCount(choice);
            PaginationGenre paginationGenre = new PaginationGenre(currentPage, cntPerPage, pageSize);
            paginationGenre.setTotalRecordCount(listCnt);
            paginationGenre.setGenre("우주과학");


            model.addAttribute("pagination",paginationGenre);
            model.addAttribute("genreSearch",bookService.SelectGenreSearch(paginationGenre));

            model.addAttribute("genreName",choice);
            model.addAttribute("priceRange",firstPriceRange);

            return "book/main";
        }

        if (choice.equals("인문학")) {
            int listCnt = bookService.SearchGenreTableCount(choice);
            PaginationGenre paginationGenre = new PaginationGenre(currentPage, cntPerPage, pageSize);
            paginationGenre.setTotalRecordCount(listCnt);
            paginationGenre.setGenre("인문학");


            model.addAttribute("pagination",paginationGenre);
            model.addAttribute("genreSearch",bookService.SelectGenreSearch(paginationGenre));

            model.addAttribute("genreName",choice);
            model.addAttribute("priceRange",firstPriceRange);

            return "book/main";
        }

        if (choice.equals("사회과학")) {
            System.out.println(choice);
            int listCnt = bookService.SearchGenreTableCount(choice);
            PaginationGenre paginationGenre = new PaginationGenre(currentPage, cntPerPage, pageSize);
            paginationGenre.setTotalRecordCount(listCnt);
            paginationGenre.setGenre("사회과학");


            model.addAttribute("pagination",paginationGenre);
            model.addAttribute("genreSearch",bookService.SelectGenreSearch(paginationGenre));

            model.addAttribute("genreName",choice);
            model.addAttribute("priceRange",firstPriceRange);

            return "book/main";
        }

        if (choice.equals("어린이")) {
            int listCnt = bookService.SearchGenreTableCount(choice);
            PaginationGenre paginationGenre = new PaginationGenre(currentPage, cntPerPage, pageSize);
            paginationGenre.setTotalRecordCount(listCnt);
            paginationGenre.setGenre("어린이");


            model.addAttribute("pagination",paginationGenre);
            model.addAttribute("genreSearch",bookService.SelectGenreSearch(paginationGenre));

            model.addAttribute("genreName",choice);
            model.addAttribute("priceRange",firstPriceRange);

            return "book/main";
        }

        if (choice.equals("자서전")) {
            int listCnt = bookService.SearchGenreTableCount(choice);
            PaginationGenre paginationGenre = new PaginationGenre(currentPage, cntPerPage, pageSize);
            paginationGenre.setTotalRecordCount(listCnt);
            paginationGenre.setGenre("자서전");


            model.addAttribute("pagination",paginationGenre);
            model.addAttribute("genreSearch",bookService.SelectGenreSearch(paginationGenre));

            model.addAttribute("genreName",choice);
            model.addAttribute("priceRange",firstPriceRange);

            return "book/main";
        }


        if (choice.equals("잡지")) {
            int listCnt = bookService.SearchGenreTableCount(choice);
            PaginationGenre paginationGenre = new PaginationGenre(currentPage, cntPerPage, pageSize);
            paginationGenre.setTotalRecordCount(listCnt);
            paginationGenre.setGenre("잡지");


            model.addAttribute("pagination",paginationGenre);
            model.addAttribute("genreSearch",bookService.SelectGenreSearch(paginationGenre));

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
    public String bookDetail(@PathVariable("id") int id, Model model,HttpSession session,
                             @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
                             @RequestParam(value = "cntPerPage", required = false, defaultValue = "1") int cntPerPage,
                             @RequestParam(value = "pageSize", required = false, defaultValue = "100") int pageSize)throws Exception{

        if(session.getAttribute("userId")!=null) {
            String adminId = (String) session.getAttribute("userId");

            if (adminId.equals("admin")) {

                int memberId = (Integer) session.getAttribute("memberId");

                String userId = (String) session.getAttribute("userId");

                List<BookFindDTO> bookList = bookService.bookIdList(id);


                model.addAttribute("reviewAllList", reviewService.reviewBookList(id));


                model.addAttribute("id", id);
                model.addAttribute("checkId", userId);
                model.addAttribute("bookList", bookList);


                return "book/bookDetailAdmin";

            }
        }


        bookService.updateViews(id);

        if(session.getAttribute("memberId")==null &&session.getAttribute("userId")==null){






            List<BookFindDTO> bookList = bookService.bookIdList(id);


            model.addAttribute("id",id);

            model.addAttribute("bookList",bookList);

            return "book/bookDetailNologin";


        }

        int memberId = (Integer) session.getAttribute("memberId");

        String userId =(String) session.getAttribute("userId");

        List<BookFindDTO> bookList = bookService.bookIdList(id);


        model.addAttribute("reviewAllList",reviewService.reviewBookList(id));


        model.addAttribute("id",id);
        model.addAttribute("checkId",userId);
        model.addAttribute("bookList",bookList);



        return "book/bookDetail";
    }

    @GetMapping("/bookUpdate")
    public String bookUpdate(@RequestParam("bookId")int bookId, HttpSession session,Model model)throws Exception{



        List<BookFindDTO> bookList = bookService.bookIdList(bookId);


        model.addAttribute("bookList", bookList);



        return "book/bookUpdate";
    }

    @PostMapping("/bookUpdate")
    public String bookUpdatePost(BookUpdateDTO bookUpdateDTO,HttpSession session,Model model,MultipartFile file)throws Exception{




        if (file.isEmpty()) {


            bookService.updateBookDataNotImage(bookUpdateDTO);

            return "redirect:/bookMain";

        }
        else

        bookService.updateBookData(bookUpdateDTO,file);


        return "redirect:/bookMain";
    }


    @ResponseBody
    @PostMapping("/commentCheck")
    public List<CommentFindDTO> commentCheck(int bookId, HttpSession session,Model model)throws Exception{



      List<CommentFindDTO> commentFindDTOList = commentService.commentList(bookId);


        return commentFindDTOList;
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
