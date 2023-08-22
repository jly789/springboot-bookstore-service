package com.DreamBook.BookStoreService.service.order.impl;

import com.DreamBook.BookStoreService.dto.order.DeliveryDTO;
import com.DreamBook.BookStoreService.dto.order.OrderDTO;
import com.DreamBook.BookStoreService.mapper.order.OrderMapper;
import com.DreamBook.BookStoreService.service.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.config.Task;
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
    public int maxNumDelivery() throws Exception {
        return orderMapper.maxNumDelivery();
    }

    @Override
    public void orderInsertData(OrderDTO orderDTO ) throws Exception {
        orderMapper.orderInsertData(orderDTO);
    }

    @Override
    public void deliveryInsertData(DeliveryDTO deliveryDTO) throws Exception {
        orderMapper.deliveryInsertData(deliveryDTO);
    }

    @Override
    public List<OrderDTO> orderList(String orderNum) throws Exception {
        return orderMapper.orderList(orderNum);
    }



    @Override
    public List<OrderDTO> orderFindList(int memberId) throws Exception {
        return orderMapper.orderFindList(memberId);
    }

    @Override
    public List<OrderDTO> orderIdList(List<OrderDTO> list) throws Exception {
        return orderMapper.orderIdList(list);
    }


    @Override
    public List<OrderDTO> orderListOrderState(List<OrderDTO> list) throws Exception {
        return orderMapper.orderListOrderState(list);
    }

    @Override
    public List<OrderDTO> dd(OrderDTO orderDTO) throws Exception {
        return orderMapper.dd(orderDTO);
    }


    @Scheduled(initialDelay = 60000,fixedRate = 120000) //12시간뒤 상품준비중 ->배송중
    @Override
    public void updateDeliveryState()throws Exception {
        orderMapper.updateDeliveryState();
    }
    @Scheduled(initialDelay = 120000,fixedRate = 240000) //12시간뒤 배송중 ->배송완료
    @Override
    public void updateDeliveryOk()throws Exception {
        orderMapper.updateDeliveryOk();
    }

}
