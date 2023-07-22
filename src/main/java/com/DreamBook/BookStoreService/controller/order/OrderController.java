package com.DreamBook.BookStoreService.controller.order;

import com.DreamBook.BookStoreService.dto.book.BookCartDTO;
import com.DreamBook.BookStoreService.dto.book.BookDTO;
import com.DreamBook.BookStoreService.dto.book.BookFindDTO;
import com.DreamBook.BookStoreService.dto.member.MemberDTO;
import com.DreamBook.BookStoreService.dto.member.MemberFindDTO;
import com.DreamBook.BookStoreService.dto.order.DeliveryDTO;
import com.DreamBook.BookStoreService.dto.order.OrderDTO;
import com.DreamBook.BookStoreService.service.book.BookService;
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

    @Resource
    private BookService bookService;

    @Resource
    private OrderService orderService;


    @GetMapping("/myOrder")
    public String  myOrder(Model model, HttpSession session,OrderDTO orderDTO)throws Exception{

//        List list = (List) session.getAttribute("orderNum");
        List<OrderDTO> list = orderService.orderFindList((int)session.getAttribute("memberId"));

        List<OrderDTO> orderIdList = orderService.orderIdList(list);


//        for(int i =0; i<orderIdList.size(); i++){
//            System.out.println(orderIdList.get(i).getOrderNum());
//            System.out.println(orderIdList.get(i).getBookId());
//        }


        List<BookFindDTO> bookList = new ArrayList<>();

      List<BookDTO> bookDTOList=  bookService.bookCartList((int)session.getAttribute("memberId"));
        model.addAttribute("bookDTOList",bookDTOList);

     //   List<OrderDTO> orderFindDTOList = orderService.orderFindList((int)session.getAttribute("memberId"));
       session.getAttribute("orderNum"); //주문결제 merchant_1689950279236 번호

//       String orderNum = (String) session.getAttribute("orderNum");
//        List<OrderDTO> orderDTOList = orderService.orderList(orderNum);

        bookList = bookService.bookIdList2(orderIdList);
                model.addAttribute("bookList",bookList);

                for(int i=0; i<bookList.size(); i++){
                    System.out.println(bookList.get(i).getBookId());
                }

//        System.out.println(model.getAttribute("orderNum"));
//
//        String orderNum = (String) session.getAttribute("orderNum");
//
//        List<OrderDTO> orderDTOList = orderService.orderList(orderNum);
//

//
//
//

//



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

        //System.out.println(orderDTO.getOrderNum());


        List<BookDTO> bookCartList = bookService.bookCartList(orderDTO.getMemberId());
       // orderDTO.setList(bookCartList);
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
