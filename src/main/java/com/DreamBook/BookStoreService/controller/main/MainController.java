package com.DreamBook.BookStoreService.controller.main;

import com.DreamBook.BookStoreService.dto.member.MemberDTO;
import com.DreamBook.BookStoreService.dto.member.MemberFindDTO;
import com.DreamBook.BookStoreService.service.member.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MainController {

    @Resource
    private MemberService memberService;

    @GetMapping("/")
    public String main(Model model, HttpSession session){

        if(session.getAttribute("memberId") !=null) {

            if (session.getAttribute("userId")=="admin") {
                model.addAttribute("memberId", session.getAttribute("memberId"));
                model.addAttribute("userId", session.getAttribute("userId"));
            }

            return "main/main";

        }

        else
        return "main/main";
    }

    @GetMapping("/myPage")
    public String myPage(Model model,HttpSession session)throws  Exception{

        String userId = (String) session.getAttribute("userId");

       List<MemberDTO> memberDTOList =  memberService.memberDtoList(userId);
        model.addAttribute("memberDTOList",memberDTOList);

        return "main/myPage";
    }

    @GetMapping("/index")
    public String index(Model model){

        return "main/index";
    }




}
