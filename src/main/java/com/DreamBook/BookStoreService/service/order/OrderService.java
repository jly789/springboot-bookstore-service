package com.DreamBook.BookStoreService.service.order;


import com.DreamBook.BookStoreService.dto.book.BookCartDTO;
import com.DreamBook.BookStoreService.dto.book.BookDTO;
import com.DreamBook.BookStoreService.dto.book.BookFindDTO;
import com.DreamBook.BookStoreService.dto.order.DeliveryDTO;
import com.DreamBook.BookStoreService.dto.order.OrderDTO;
import org.springframework.stereotype.Service;

import java.util.List;


public interface OrderService {

    public int maxNum() throws Exception;
    public int maxNumDelivery() throws Exception;


    public void orderInsertData(OrderDTO orderDTO) throws Exception;

    public void deliveryInsertData(DeliveryDTO deliveryDTO) throws Exception;

    public List<OrderDTO> orderList(String orderNum) throws Exception;

    public List<OrderDTO> orderFindList(int memberId) throws Exception;

    public List<OrderDTO> orderIdList(List<OrderDTO> list) throws Exception;

    public List<OrderDTO> orderListOrderState(List<OrderDTO> list) throws Exception;

    public List<OrderDTO> dd(OrderDTO orderDTO) throws Exception;

    public void updateDeliveryState()throws Exception;

    public void updateDeliveryOk()throws Exception;


}
