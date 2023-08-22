package com.DreamBook.BookStoreService.controller.member;

import com.DreamBook.BookStoreService.dto.book.BookFindDTO;
import com.DreamBook.BookStoreService.dto.member.MemberFindDTO;
import com.DreamBook.BookStoreService.dto.member.MemberJoinDTO;
import com.DreamBook.BookStoreService.dto.member.MemberUpdateDTO;
import com.DreamBook.BookStoreService.service.main.MainService;
import com.DreamBook.BookStoreService.service.member.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.time.LocalDate;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class MemberController {

    @Resource

    private MemberService memberService;

    @Resource

    private MainService mainService;
    @GetMapping("/login")
    public String login(Model model) {



        List<BookFindDTO> bookList = mainService.bookList();
        List<BookFindDTO> bestSellerList = mainService.bestSeller(bookList);
        List<BookFindDTO> weekBook = mainService.weekBook();

        model.addAttribute("bestSellerList", bestSellerList);
        model.addAttribute("weekBook", weekBook);

        return "member/login";
    }

    @PostMapping("/login")
    public String loginOk(Model model, MemberFindDTO memberFindDTO, HttpServletResponse response,
                          HttpSession session) throws Exception {

        if (memberService.loginData(memberFindDTO, response) == 1) {
            int memberId  =memberService.findMemberId(memberFindDTO);
            session.setAttribute("userId", memberFindDTO.getUserId());
            session.setAttribute("memberId",memberId);


            String genre = "전체";

            List<BookFindDTO> bookList = mainService.bookList();
            List<BookFindDTO> bestSellerList = mainService.bestSeller(bookList);
            List<BookFindDTO> weekBook = mainService.weekBook();
            List<BookFindDTO> top5Genre = mainService.top5Genre(genre);
            List<BookFindDTO> genreList = mainService.GenreList();
            model.addAttribute("bestSellerList", bestSellerList);
            model.addAttribute("weekBook", weekBook);
            model.addAttribute("memberId", memberId);
            model.addAttribute("top5Genre", top5Genre);
            model.addAttribute("genreList", genreList);
            model.addAttribute("bestSellerList", bestSellerList);
            model.addAttribute("weekBook", weekBook);



            return "main/main";
        } else
            return "member/login";


    }
    @GetMapping("/logout")
    public String logout(HttpSession session,Model model) {

        session.getAttribute("userId");
        session.removeAttribute("userId");
        session.removeAttribute("memberId");


        String genre = "전체";
        List<BookFindDTO> bookList = mainService.bookList();
        List<BookFindDTO> bestSellerList = mainService.bestSeller(bookList);
        List<BookFindDTO> weekBook = mainService.weekBook();
        List<BookFindDTO> top5Genre = mainService.top5Genre(genre);
        List<BookFindDTO> genreList = mainService.GenreList();


        model.addAttribute("bestSellerList", bestSellerList);
        model.addAttribute("weekBook", weekBook);
        model.addAttribute("top5Genre", top5Genre);
        model.addAttribute("genreList", genreList);


        return "main/main";

    }

    @GetMapping("/register")
    public String register(MemberJoinDTO memberJoinDTO) {




        return "member/register";
    }
    @ResponseBody
    @PostMapping("/idCheck")
    public int idCheck(String id,MemberJoinDTO memberJoinDTO) throws Exception {
        int result = memberService.IdCheck(id);

        return result;
    }

    @PostMapping("/register")

    public String registerOk(@Valid @ModelAttribute("memberJoinDTO") MemberJoinDTO memberJoinDTO,
                             BindingResult bindingResult, Model model, MultipartFile file) throws Exception {

        if (file.isEmpty()) {
            if (memberService.IdCheck(memberJoinDTO.getUserId()) == 1) {

                if (bindingResult.hasFieldErrors()) {


                    model.addAttribute("memberJoinDTO", memberJoinDTO);


                    return "member/register";
                }

                int maxNum = memberService.maxNum();
                memberJoinDTO.setMemberId(maxNum + 1);

                int now = LocalDate.now().getYear();
                int birth = memberJoinDTO.getBirth().getYear();
                int age = now - birth;
                memberJoinDTO.setAge(age);

                memberService.insertMemberNotImage(memberJoinDTO,file);



                return "member/login";
            }
        }


        else {

            if (memberService.IdCheck(memberJoinDTO.getUserId()) == 1) {

                if (bindingResult.hasFieldErrors()) {


                    model.addAttribute("memberJoinDTO", memberJoinDTO);


                    return "member/register";
                }

                int maxNum = memberService.maxNum();
                memberJoinDTO.setMemberId(maxNum + 1);

                int now = LocalDate.now().getYear();
                int birth = memberJoinDTO.getBirth().getYear();
                int age = now - birth;
                memberJoinDTO.setAge(age);


                memberService.insertData(memberJoinDTO, file);

                return "member/login";
            }
        }

        return "member/login";
    }


    @GetMapping("/idFind")
    public String loginFind() throws Exception {

        return "member/idFind";
    }

    @ResponseBody
    @PostMapping("/idFind")
    public String idCheck2(MemberFindDTO memberFindDTO) throws Exception {

   String result = memberService.findUserId(memberFindDTO);

        return result;
    }

    @GetMapping("/pwdFind")
    public String pwdFind() throws Exception {

        return "member/pwdFind";
    }
    @ResponseBody
    @PostMapping("/pwdFind")
    public String pwdFindOk(MemberFindDTO memberFindDTO) throws Exception {

        String result = memberService.findPwd(memberFindDTO);


        return result;
    }



}


