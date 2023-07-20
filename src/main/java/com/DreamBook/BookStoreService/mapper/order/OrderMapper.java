package com.DreamBook.BookStoreService.mapper.order;

import com.DreamBook.BookStoreService.dto.order.OrderDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface OrderMapper {

    public int maxNum() throws Exception;

    public void orderInsertData(OrderDTO orderDTO) throws Exception;
}
