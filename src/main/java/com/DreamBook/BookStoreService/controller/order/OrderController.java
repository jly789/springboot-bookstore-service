package com.DreamBook.BookStoreService.controller.order;

import com.DreamBook.BookStoreService.dto.book.BookCartDTO;
import com.DreamBook.BookStoreService.dto.book.BookDTO;
import com.DreamBook.BookStoreService.dto.book.BookFindDTO;
import com.DreamBook.BookStoreService.dto.book.BookUpdateDTO;
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
import org.springframework.scheduling.annotation.EnableScheduling;
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


@EnableScheduling
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
    public String  myOrder(Model model, HttpSession session,OrderDTO orderDTO,ReviewFindDTO reviewFindDTO)throws Exception{



        int memberId = (int)session.getAttribute("memberId");
        String userId = (String) session.getAttribute("userId");
        List<OrderDTO> orderList =   orderService.orderFindList(memberId);


        model.addAttribute("userId",userId);
        model.addAttribute("bookList",orderList);
        return  "order/myOrder";
    }



    @PostMapping("/order")
    public String  order(BookCartDTO cartDTO,Model model, HttpSession session,@RequestParam("cartId")int cartId,@RequestParam("totalPrice")int totalPrice)throws Exception{
        int memberId = (Integer) session.getAttribute("memberId");



        List<BookCartDTO> orderBookCartList = bookService.orderBookCartList(cartDTO);

        model.addAttribute("orderBookCartList",orderBookCartList);

        model.addAttribute("memberId",memberId);

        List<BookDTO> bookCartList = bookService.bookCartList(memberId);



        model.addAttribute("bookCartList", bookCartList);
        model.addAttribute("totalPrice",totalPrice);
        model.addAttribute("cartId",cartId);

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
    public String  payment(Model model, HttpSession session, OrderDTO orderDTO, DeliveryDTO deliveryDTO
                           , @RequestParam("bookId") int[] bookId, @RequestParam("wishQuantity") int[] wishQuantity
                          , @RequestParam("cartId") int[] cartId, @RequestParam("usePoint") int point, Math math,
                           @RequestParam("plusPoint")int plusPoint, @RequestParam("memberId") int memberId)

    throws Exception{

        int plusPoint2 = 0;

        plusPoint2 =  plusPoint /20; //계산금액의 5프로 포인트 추가적립


        for (int i= 0; i < bookId.length; i++) {
            int maxNum = orderService.maxNum();
            int orderMaxNum = orderService.maxNumDelivery();
            orderDTO.setOrderId(maxNum+1);


            String orderNum = orderDTO.getOrderNum();
            session.setAttribute("orderNum",orderNum);


                orderDTO.setBookId(bookId[i]);
               orderDTO.setWishQuantity(wishQuantity[i]);

            orderService.orderInsertData(orderDTO);
            bookService.OrderDeleteCart(cartId[i]);
            bookService.updateSalesRate(bookId[i]);

            deliveryDTO.setDeliveryId(orderMaxNum+1);


            deliveryDTO.setOrderId(maxNum+1);

            orderService.deliveryInsertData(deliveryDTO);

        }

        memberService.updatePoint(point,plusPoint,plusPoint2,memberId);




        return "bookMain";
    }

    @ResponseBody
    @PostMapping("/deferredPayment")
    public  int  deferredPaymentCheck(@RequestParam("deferredPayment")int deferredPayment,Model model)throws Exception {




        return deferredPayment;
    }



}
