package com.DreamBook.BookStoreService.controller.order;

import com.DreamBook.BookStoreService.dto.book.BookCartDTO;
import com.DreamBook.BookStoreService.dto.book.BookDTO;
import com.DreamBook.BookStoreService.dto.book.BookFindDTO;
import com.DreamBook.BookStoreService.dto.member.MemberDTO;
import com.DreamBook.BookStoreService.dto.member.MemberFindDTO;
import com.DreamBook.BookStoreService.dto.order.DeliveryDTO;
import com.DreamBook.BookStoreService.dto.order.OrderDTO;
import com.DreamBook.BookStoreService.dto.review.ReviewDTO;
import com.DreamBook.BookStoreService.dto.review.ReviewFindDTO;
import com.DreamBook.BookStoreService.service.book.BookService;
import com.DreamBook.BookStoreService.service.member.MemberService;
import com.DreamBook.BookStoreService.service.order.OrderService;
import com.DreamBook.BookStoreService.service.review.ReviewService;
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

    @Resource
    private BookService bookService;

    @Resource
    private ReviewService reviewService;
    @Resource
    private OrderService orderService;




    @GetMapping("/myOrder")
    public String  myOrder(Model model, HttpSession session,OrderDTO orderDTO)throws Exception{



        List<OrderDTO> list = orderService.orderFindList((int)session.getAttribute("memberId"));
        model.addAttribute("list",list);

//        List<ReviewFindDTO> reviewDTOList = reviewService.reviewOrderIdCheck(list);
//          List<ReviewFindDTO> reviewFindDTOS= reviewService.ReviewCheck(list);


        List<OrderDTO> orderIdList = orderService.orderIdList(list);
        model.addAttribute("orderIdList",orderIdList);


        List<OrderDTO> orderStateList = orderService.orderListOrderState(list);
        model.addAttribute("orderStateList",orderStateList);

        List<BookFindDTO> bookList = new ArrayList<>();

        bookList = bookService.bookIdList2(orderIdList);
                model.addAttribute("bookList",bookList);


        return  "order/myOrder";
    }

    @PostMapping("/order")
    public String  order(Model model, HttpSession session,@RequestParam("totalPrice")int totalPrice)throws Exception{
        int memberId = (Integer) session.getAttribute("memberId");

        model.addAttribute("memberId",memberId);

        List<BookDTO> bookCartList = bookService.bookCartList(memberId);

        model.addAttribute("bookCartList", bookCartList);
        model.addAttribute("totalPrice",totalPrice);

       return  "order/order";
    }


    @ResponseBody
    @PostMapping("/AddressFind")
    public List<MemberDTO>  AddressFind(Model model, HttpSession session, @RequestParam("memberId")int memberId)throws Exception {

        String userId = (String) session.getAttribute("userId");

        List<MemberDTO> list = memberService.memberDtoList(userId);


        return list;
    }

    @ResponseBody
    @PostMapping("/pointCheck")
    public List<MemberDTO>  pointCheck(HttpSession session)throws Exception {

        String userId = (String) session.getAttribute("userId");

        List<MemberDTO> point = memberService.memberDtoList(userId);


        return point;
    }


    @ResponseBody
    @PostMapping("/payment")
    public String  payment(Model model, HttpSession session, OrderDTO orderDTO, DeliveryDTO deliveryDTO)
    throws Exception{


        List<BookDTO> bookCartList = bookService.bookCartList(orderDTO.getMemberId());

        for(int i =0; i<bookCartList.size(); i++) {
            int maxNum = orderService.maxNum();
            orderDTO.setOrderId(maxNum+1);
            String orderNum = orderDTO.getOrderNum();
            session.setAttribute("orderNum",orderNum);
            deliveryDTO.setOrderId(maxNum+1);
            orderDTO.setBookId(bookCartList.get(i).getBookId());
            orderService.orderInsertData(orderDTO);
        }

        orderService.deliveryInsertData(deliveryDTO);



        return "book/main";
    }


}
