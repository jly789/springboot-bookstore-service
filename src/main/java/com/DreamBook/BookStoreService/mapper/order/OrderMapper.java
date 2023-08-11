package com.DreamBook.BookStoreService.mapper.order;

import com.DreamBook.BookStoreService.dto.order.DeliveryDTO;
import com.DreamBook.BookStoreService.dto.order.OrderDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface OrderMapper {

    public int maxNum() throws Exception;

    public int maxNumDelivery() throws Exception;

    public void orderInsertData(OrderDTO orderDTO) throws Exception;

    public void deliveryInsertData(DeliveryDTO deliveryDTO) throws Exception;

    public List<OrderDTO> orderList(String orderNum) throws Exception;

    public List<OrderDTO> orderFindList(int memberId) throws Exception;
    public List<OrderDTO> orderIdList(List<OrderDTO> list) throws Exception;

    public List<OrderDTO> orderListOrderState(List<OrderDTO> list) throws Exception;


    public List<OrderDTO> dd(OrderDTO orderDTO) throws Exception;


}
