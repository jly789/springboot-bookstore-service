package com.DreamBook.BookStoreService.service.order.impl;

import com.DreamBook.BookStoreService.dto.order.OrderDTO;
import com.DreamBook.BookStoreService.mapper.order.OrderMapper;
import com.DreamBook.BookStoreService.service.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public int maxNum() throws Exception {

        return orderMapper.maxNum();
    }


    @Override
    public void orderInsertData(OrderDTO orderDTO ) throws Exception {
        orderMapper.orderInsertData(orderDTO);
    }
}
