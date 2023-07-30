package com.DreamBook.BookStoreService.controller.main;

import com.DreamBook.BookStoreService.dto.member.MemberDTO;
import com.DreamBook.BookStoreService.dto.member.MemberFindDTO;
import com.DreamBook.BookStoreService.dto.member.MemberJoinDTO;
import com.DreamBook.BookStoreService.dto.member.MemberUpdateDTO;
import com.DreamBook.BookStoreService.service.member.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.time.LocalDate;
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

//    @GetMapping("/myPage")
//    public String myPage(Model model,HttpSession session)throws  Exception{
//
//        String userId = (String) session.getAttribute("userId");
//
//       List<MemberDTO> memberDTOList =  memberService.memberDtoList(userId);
//        model.addAttribute("memberDTOList",memberDTOList);
//
//        return "main/myPage";
//    }


    @GetMapping("/myPage")
    public String myPage(MemberUpdateDTO MemberUpdateDTO,Model model,HttpSession session)throws Exception {




        String userId = (String) session.getAttribute("userId");

        List<MemberDTO> memberDTOList =  memberService.memberDtoList(userId);
        model.addAttribute("memberDTOList",memberDTOList);

        return "main/myPage";
    }

    @ResponseBody
    @PostMapping("/UpdateIdCheck")
    public int UpdateIdCheck(String id,MemberUpdateDTO memberUpdateDTO) throws Exception {
        int result = memberService.IdCheck(id);

        return result;
    }


    @PostMapping("/myPageUpdate")
    public String myPageUpdate(@Valid @ModelAttribute("memberUpdateDTO") MemberUpdateDTO memberUpdateDTO,
                             BindingResult bindingResult, Model model,HttpSession session) throws Exception {


        if (memberService.IdCheck(memberUpdateDTO.getUserId()) == 1) {

//            if (bindingResult.hasFieldErrors()) {
//
//
//                model.addAttribute("memberUpdateDTO", memberUpdateDTO);
//
//                return "main/myPage";
//            }

//            int maxNum = memberService.maxNum();
//            memberUpdateDTO.setMemberId(maxNum + 1);

//            int now = LocalDate.now().getYear();
//            int birth = memberUpdateDTO.getBirth().getYear();
//            int age = now - birth;
//            memberUpdateDTO.setAge(age);





            memberService.updateMember(memberUpdateDTO);

            String userId = (String) session.getAttribute("userId");
            session.setAttribute("memberId",memberUpdateDTO.getMemberId());
            session.setAttribute("userId",memberUpdateDTO.getUserId());




            return "redirect:/";
        }

        return "redirect:/";
    }

    @GetMapping("/index")
    public String index(Model model){

        return "main/index";
    }




}
