package com.DreamBook.BookStoreService.controller.order;

import com.DreamBook.BookStoreService.dto.member.MemberDTO;
import com.DreamBook.BookStoreService.dto.member.MemberFindDTO;
import com.DreamBook.BookStoreService.service.member.MemberService;
import com.DreamBook.BookStoreService.service.order.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Controller
public class OrderController {

    @Resource
    private MemberService memberService;
    private OrderService orderService;



    @GetMapping("/order")
    public String  order(Model model,HttpSession session){



            model.getAttribute("list");

       return  "order/order";
    }



    @ResponseBody
    @PostMapping("/AddressFind")
    public List<MemberDTO>  AddressFind(Model model, HttpSession session, @RequestParam("memberId")int memberId)throws Exception {

        String userId = (String) session.getAttribute("userId");

        List<MemberDTO> list = memberService.memberDtoList(userId);



         List aa = new ArrayList<>();
        for(int i =0; i<list.size(); i++){

        aa.add(0,list.get(i).getName());
        aa.add(1,list.get(i).getTel());
            aa.add(2,list.get(i).getEmail());
        }

//        System.out.println(aa.get(2));

        return aa;
    }
}
