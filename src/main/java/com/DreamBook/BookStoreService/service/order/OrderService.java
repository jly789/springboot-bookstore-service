package com.DreamBook.BookStoreService.service.order;


import com.DreamBook.BookStoreService.dto.book.BookCartDTO;
import com.DreamBook.BookStoreService.dto.order.DeliveryDTO;
import com.DreamBook.BookStoreService.dto.order.OrderDTO;
import org.springframework.stereotype.Service;

import java.util.List;


public interface OrderService {

    public int maxNum() throws Exception;

    public void orderInsertData(OrderDTO orderDTO) throws Exception;

    public void deliveryInsertData(DeliveryDTO deliveryDTO) throws Exception;

}
