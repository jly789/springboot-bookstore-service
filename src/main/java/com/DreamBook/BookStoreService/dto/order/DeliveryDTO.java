package com.DreamBook.BookStoreService.dto.order;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;


@Getter
@Setter
public class DeliveryDTO {

    private int deliveryId;
    private int orderId;//주문번호 PK
    private String recipient;
    private String deliveryTel;
    private String postcode;
    private String address;
    private String detailAddress;
    private String extraAddress;
    private int deliveryCost;

}
