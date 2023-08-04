package com.DreamBook.BookStoreService.controller.main;

import com.DreamBook.BookStoreService.dto.member.MemberDTO;
import com.DreamBook.BookStoreService.dto.member.MemberDeleteDTO;
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
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
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
                             BindingResult bindingResult, Model model,HttpSession session) throws Exception {

        String userId = (String) session.getAttribute("userId");
        String updateId = memberUpdateDTO.getUserId();


        if (memberService.IdCheck(memberUpdateDTO.getUserId()) == 1 || userId.equals(updateId)) {

            if (bindingResult.hasFieldErrors()) {


                List<MemberDTO> memberDTOList =  memberService.memberDtoList(userId);
                model.addAttribute("memberDTOList",memberDTOList);


                return "main/myPageUpdate";
            }



            memberService.updateMember(memberUpdateDTO);


            session.setAttribute("memberId",memberUpdateDTO.getMemberId());
            session.setAttribute("userId",memberUpdateDTO.getUserId());




            return "redirect:/";
        }

        return "redirect:/";
    }


    @GetMapping("/myPageDelete")
    public String myPageDelete(MemberUpdateDTO MemberUpdateDTO,Model model,HttpSession session)throws Exception {




        String userId = (String) session.getAttribute("userId");

        List<MemberDTO> memberDTOList =  memberService.memberDtoList(userId);
        model.addAttribute("memberDTOList",memberDTOList);

        return "main/myPageDelete";
    }


    @PostMapping("/")
    public String myPageDeleteOk(MemberDeleteDTO memberDeleteDTO, HttpServletResponse response, HttpSession session)throws Exception {


        if (memberService.deleteMember(memberDeleteDTO,response) == 1) {

            session.removeAttribute("userId");

            return "main/main";
        }
        else
            return "main/myPageDelete";


    }
    @GetMapping("/index")
    public String index(Model model){

        return "main/index";
    }




}
