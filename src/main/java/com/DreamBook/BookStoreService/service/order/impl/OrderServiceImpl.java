package com.DreamBook.BookStoreService.service.order.impl;

import com.DreamBook.BookStoreService.mapper.order.OrderMapper;
import com.DreamBook.BookStoreService.service.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;


}
