package com.DreamBook.BookStoreService.controller.member;

import com.DreamBook.BookStoreService.dto.member.MemberJoinDTO;
import com.DreamBook.BookStoreService.service.member.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.annotation.Resource;
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
