package com.DreamBook.BookStoreService.controller.order;

import com.DreamBook.BookStoreService.service.order.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.annotation.Resource;

@Controller
public class OrderController {

    @Resource
    private OrderService orderService;

    @GetMapping("/order")
    public String  order(){


       return  "order/order";
    }


}
