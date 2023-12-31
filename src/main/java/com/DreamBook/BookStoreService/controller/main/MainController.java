package com.DreamBook.BookStoreService.controller.main;

import ch.qos.logback.core.joran.conditional.ElseAction;
import com.DreamBook.BookStoreService.dto.book.BookFindDTO;
import com.DreamBook.BookStoreService.dto.book.Pagination;
import com.DreamBook.BookStoreService.dto.book.PaginationSearchBookName;
import com.DreamBook.BookStoreService.dto.member.MemberDTO;
import com.DreamBook.BookStoreService.dto.member.MemberDeleteDTO;
import com.DreamBook.BookStoreService.dto.member.MemberUpdateDTO;
import com.DreamBook.BookStoreService.service.book.BookService;
import com.DreamBook.BookStoreService.service.comment.CommentService;
import com.DreamBook.BookStoreService.service.main.MainService;
import com.DreamBook.BookStoreService.service.member.MemberService;
import com.DreamBook.BookStoreService.service.order.OrderService;
import com.DreamBook.BookStoreService.service.review.ReviewService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
public class MainController {

    @Resource
    private MemberService memberService;

    @Resource
    private BookService bookService;

    @Resource
    private OrderService orderService;

    @Resource
    private ReviewService reviewService;

    @Resource
    private CommentService commentService;
    @Resource
    private MainService mainService;


    @GetMapping("/")
    public String main(Model model, HttpSession session,BookFindDTO bookFindDTO)throws Exception {




        if (session.getAttribute("memberId") == null) {

            String genre = "전체";

            List<BookFindDTO> bookList = mainService.bookList();
            List<BookFindDTO> bestSellerList = mainService.bestSeller(bookList);
            List<BookFindDTO> weekBook = mainService.weekBook();
            List<BookFindDTO> top10Genre = mainService.top10Genre(genre);
            List<BookFindDTO> genreList = mainService.GenreList();
            List<BookFindDTO> recommendedBook =bookService.recommendedBook();

            model.addAttribute("bestSellerList", bestSellerList);
            model.addAttribute("weekBook", weekBook);
            model.addAttribute("top10Genre", top10Genre);
            model.addAttribute("genreList", genreList);
            model.addAttribute("recommendedBook", recommendedBook);

            return "main/main";
        } else  {
            String userId = (String) session.getAttribute("userID");
            int memberId = (int) session.getAttribute("memberId");
            String genre = "전체";

            List<BookFindDTO> bookList = mainService.bookList();
            List<BookFindDTO> bestSellerList = mainService.bestSeller(bookList);
            List<BookFindDTO> weekBook = mainService.weekBook();
            List<BookFindDTO> top10Genre = mainService.top10Genre(genre);
            List<BookFindDTO> genreList = mainService.GenreList();
            List<BookFindDTO> recommendedBook =bookService.recommendedBook();


            model.addAttribute("bestSellerList", bestSellerList);
            model.addAttribute("weekBook", weekBook);
            model.addAttribute("userId", userId);
            model.addAttribute("memberId", memberId);
            model.addAttribute("top10Genre", top10Genre);
            model.addAttribute("genreList", genreList);
            model.addAttribute("recommendedBook", recommendedBook);

            return "main/main";
        }

    }

    @GetMapping("/myPage")
    public String myPage(MemberUpdateDTO MemberUpdateDTO,Model model,HttpSession session)throws Exception {




        String userId = (String) session.getAttribute("userId");

        List<MemberDTO> memberDTOList =  memberService.memberDtoList(userId);
        model.addAttribute("memberDTOList",memberDTOList);

        return "main/myPage";
    }


    @GetMapping("/deliveryName") //배송지 등록 윈도우창 띄우기
    public String deliveryNameAdd(MemberUpdateDTO MemberUpdateDTO,Model model,HttpSession session)throws Exception {

        int memberId = (int) session.getAttribute("memberId");
       String userId = (String) session.getAttribute("userId");



        return "main/deliveryName";
    }
    @PostMapping("/deliveryNameCheck") //배송지 입력후 체크
    public String deliveryNameCheck(MemberUpdateDTO MemberUpdateDTO,Model model,HttpSession session)throws Exception {

        System.out.println(MemberUpdateDTO.getDeliveryName());

        model.addAttribute("deliveryName",MemberUpdateDTO.getDeliveryName());

        return "main/deliveryNameCheck";
    }



    @GetMapping("/deliveryNameUpdate") //배송지 등록및 수정
    public String deliveryNameUpdate(@RequestParam("deliveryName")String deliveryName, MemberUpdateDTO MemberUpdateDTO, Model model, HttpSession session)throws Exception {

        String userId = (String) session.getAttribute("userId");

        List<MemberDTO> memberDTOList =  memberService.memberDtoList(userId);
        model.addAttribute("memberDTOList",memberDTOList);

        memberService.updateMemberDeliveryName(userId,deliveryName);


        return "redirect:/myPage";
    }


    @GetMapping("/myPageUpdate")
    public String myPageUpdate(MemberUpdateDTO MemberUpdateDTO,Model model,HttpSession session)throws Exception {




        String userId = (String) session.getAttribute("userId");

        List<MemberDTO> memberDTOList =  memberService.memberDtoList(userId);
        model.addAttribute("memberDTOList",memberDTOList);

        return "main/myPageUpdate";
    }

    @ResponseBody
    @PostMapping("/UpdateIdCheck")
    public int UpdateIdCheck(String id,MemberUpdateDTO memberUpdateDTO,HttpSession session) throws Exception {
        int result = memberService.IdCheck(id);

        String userId = (String) session.getAttribute("userId");



        if(id.equals(userId)){
            result = 2;
        }


        return result;
    }


    @PostMapping("/myPageUpdate")
    public String myPageUpdate(@Valid @ModelAttribute("memberUpdateDTO") MemberUpdateDTO memberUpdateDTO,
                               BindingResult bindingResult, Model model, HttpSession session, MultipartFile file) throws Exception {

        String userId = (String) session.getAttribute("userId");
        String updateId = memberUpdateDTO.getUserId();

        if (file.isEmpty()) {

            if (memberService.IdCheck(memberUpdateDTO.getUserId()) == 1 || userId.equals(updateId)) {

                if (bindingResult.hasFieldErrors()) {


                    List<MemberDTO> memberDTOList = memberService.memberDtoList(userId);
                    model.addAttribute("memberDTOList", memberDTOList);


                    return "main/myPageUpdate";
                }



                memberService.updateMemberDataNotImage(memberUpdateDTO);

                session.setAttribute("memberId", memberUpdateDTO.getMemberId());
                session.setAttribute("userId", memberUpdateDTO.getUserId());


                return "redirect:/";
            }

        }

        if (memberService.IdCheck(memberUpdateDTO.getUserId()) == 1 || userId.equals(updateId)) {

            if (bindingResult.hasFieldErrors()) {


                List<MemberDTO> memberDTOList = memberService.memberDtoList(userId);
                model.addAttribute("memberDTOList", memberDTOList);


                return "main/myPageUpdate";
            }


            memberService.updateMember(memberUpdateDTO,file);


            session.setAttribute("memberId", memberUpdateDTO.getMemberId());
            session.setAttribute("userId", memberUpdateDTO.getUserId());


            return "redirect:/";
        }

        return "redirect:/";
    }


    @GetMapping("/myPageDelete") //회원탈퇴
    public String myPageDelete(MemberUpdateDTO MemberUpdateDTO,Model model,HttpSession session)throws Exception {




        String userId = (String) session.getAttribute("userId");




        List<MemberDTO> memberDTOList =  memberService.memberDtoList(userId);
        model.addAttribute("memberDTOList",memberDTOList);

        return "main/myPageDelete";
    }


    @PostMapping("/")
    public String myPageDeleteOk(MemberDeleteDTO memberDeleteDTO, HttpServletResponse response, HttpSession session,Model model)throws Exception {




        if(!session.getAttribute("memberId").equals("admin")) {

            if (memberService.selectCart(memberDeleteDTO) == true) {

                memberService.deleteCart(memberDeleteDTO);

            }

            if (memberService.selectCart(memberDeleteDTO) == false) {



            }

            if (memberService.selectDelivery(memberDeleteDTO) == true) {

                memberService.deleteDelivery(memberDeleteDTO);

            }

            if (memberService.selectDelivery(memberDeleteDTO) == false) {



            }


            if (memberService.selectReview(memberDeleteDTO) == true) {

                memberService.deleteReview(memberDeleteDTO);

            }

            if (memberService.selectReview(memberDeleteDTO) == false) {



            }


            if (memberService.selectOrders(memberDeleteDTO) == true) {

                memberService.deleteOrders(memberDeleteDTO);

            }

            if (memberService.selectOrders(memberDeleteDTO) == false) {



            }


            if (memberService.selectComments(memberDeleteDTO) == true) {

                memberService.deleteComments(memberDeleteDTO);

            }

            if (memberService.selectComments(memberDeleteDTO) == false) {



            }


            if (memberService.deleteMember(memberDeleteDTO, response) == 1) {


                session.removeAttribute("userId");
                session.removeAttribute("memberId");

                if (session.getAttribute("memberId") == null) {

                    String genre = "전체";

                    List<BookFindDTO> bookList = mainService.bookList();
                    List<BookFindDTO> bestSellerList = mainService.bestSeller(bookList);
                    List<BookFindDTO> weekBook = mainService.weekBook();
                    List<BookFindDTO> top10Genre = mainService.top10Genre(genre);
                    List<BookFindDTO> genreList = mainService.GenreList();
                    List<BookFindDTO> recommendedBook =bookService.recommendedBook();

                    model.addAttribute("bestSellerList", bestSellerList);
                    model.addAttribute("weekBook", weekBook);
                    model.addAttribute("top10Genre", top10Genre);
                    model.addAttribute("genreList", genreList);
                    model.addAttribute("recommendedBook", recommendedBook);

                    return "main/main";
                }
            }


        }
        return "main/main";
    }

    @GetMapping("/searchBook")
    public String search(Model model,HttpSession session,
                         @RequestParam("searchBookName") String searchBookName,
                         @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
                         @RequestParam(value = "cntPerPage", required = false, defaultValue = "1") int cntPerPage,
                         @RequestParam(value = "pageSize", required = false, defaultValue = "100") int pageSize)throws Exception{

        model.addAttribute("searchBookName",searchBookName);

        String choice = "정렬";
        String genreName = "전체";
        int firstPriceRange = 0; //처음 가격범위 0원이상

        if(session.getAttribute("userId")!=null) {
            String userId = (String) session.getAttribute("userId");

            if (userId.equals("admin")) { //관리자모드
                model.addAttribute("genreName", genreName);
                model.addAttribute("priceRange", firstPriceRange);


                int listCnt = bookService.testTableCount();
                PaginationSearchBookName pagination = new PaginationSearchBookName(currentPage, cntPerPage, pageSize);
                pagination.setTotalRecordCount(listCnt);
                pagination.setSearchBookName(searchBookName);

                model.addAttribute("pagination",pagination);
                model.addAttribute("searchBook",bookService.SelectSearchList(pagination));
                model.addAttribute("userId", userId);


                return "book/mainAdmin";

            }

        }

        model.addAttribute("genreName",genreName);
        model.addAttribute("priceRange",firstPriceRange);


        int listCnt = bookService.SearchBookNameTableCount(searchBookName);
        PaginationSearchBookName pagination = new PaginationSearchBookName(currentPage, cntPerPage, pageSize);
        pagination.setTotalRecordCount(listCnt);
        pagination.setSearchBookName(searchBookName);


        model.addAttribute("pagination",pagination);
        model.addAttribute("searchBook",bookService.SelectSearchList(pagination));




        return "book/main";





    }


    @GetMapping("/index")
    public String index(Model model){

        return "main/index";
    }







}
