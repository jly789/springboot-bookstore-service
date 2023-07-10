package com.DreamBook.BookStoreService.controller.member;

import com.DreamBook.BookStoreService.dto.member.MemberFindDTO;
import com.DreamBook.BookStoreService.dto.member.MemberJoinDTO;
import com.DreamBook.BookStoreService.service.member.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.time.LocalDate;

@Controller
@RequiredArgsConstructor
public class MemberController {

    @Resource

    private MemberService memberService;

    @GetMapping("/login")
    public String login(Model model) {


        return "member/login";
    }


    @PostMapping("/login")
    public String loginOk(Model model, MemberFindDTO memberFindDTO, HttpServletResponse response,
                          HttpSession session) throws Exception {

        if (memberService.loginData(memberFindDTO, response) == 1) {

            session.setAttribute("userId", memberFindDTO.getUserId());
            return "main/main";
        } else
            return "member/login";


    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {

        session.getAttribute("userId");
        session.invalidate();

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
                             BindingResult bindingResult, Model model) throws Exception {




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


            memberService.insertData(memberJoinDTO);



            return "member/login";
        }

        return "member/login";
    }


    @GetMapping("/idFind")
    public String loginFind() throws Exception {


        return "member/idFind";
    }

    @ResponseBody
    @PostMapping("/idFind")
    public String idCheck2(MemberFindDTO memberFindDTO,Model model) throws Exception {

   String result = memberService.findUserId(memberFindDTO);



        return result;
    }


    @GetMapping("/pwdFind")
    public String pwdFind() throws Exception {




        return "member/pwdFind";
    }
    @ResponseBody
    @PostMapping("/pwdFind")
    public String pwdFindOk() throws Exception {




        return "member/pwdFind";
    }


}


