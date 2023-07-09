package com.DreamBook.BookStoreService.controller.member;

import com.DreamBook.BookStoreService.dto.member.MemberFindDTO;
import com.DreamBook.BookStoreService.dto.member.MemberJoinDTO;
import com.DreamBook.BookStoreService.service.member.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Controller
public class MemberController {

    @Resource

    private MemberService memberService;

    @GetMapping("/login")
    public String login(Model model){




        return "member/login";
    }


    @PostMapping("/login")
    public String loginOk(Model model, MemberFindDTO memberFindDTO, HttpServletResponse response,
                          HttpSession session)throws Exception{

        if( memberService.loginData(memberFindDTO,response)==1) {

            session.setAttribute("userId",memberFindDTO.getUserId());
            return "main/main";
        }


        else
            return "member/login";



    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {

        session.getAttribute("userId");
        session.invalidate();

        return "main/main";


    }

    @GetMapping("/register")
    public String register(MemberJoinDTO memberJoinDTO){


        return "member/register";
    }

    @PostMapping("/register")
    public String registerOk(MemberJoinDTO memberJoinDTO)throws Exception{


        int maxNum = memberService.maxNum();
        memberJoinDTO.setMemberId(maxNum + 1);

        int now =  LocalDate.now().getYear();
        int birth =memberJoinDTO.getBirth().getYear();
        int age = now-birth;
        memberJoinDTO.setAge(age);



        memberService.insertData(memberJoinDTO);

        return "member/login";
    }


}
