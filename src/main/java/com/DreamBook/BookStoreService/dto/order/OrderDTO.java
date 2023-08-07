package com.DreamBook.BookStoreService.dto.order;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
public class OrderDTO {



    private int orderId;//주문번호 PK
    private int reviewId;
    private int memberId;//회원번호 FK
    private int bookId;//상품번호 FK
    private int cartId;//
    private String bookName;//
    private int wishQuantity;
    private String orderNum;//주문번호
    private String impUid;//결제번호
    private int amount;//결제금액
    private String orderState;//주문상태-order,delivery,cancel,complete
    private LocalDateTime orderDate;//주문시간
    private int usePoint;//사용포인트
    private String fileName;
    private String filePath;
    private int price;
    private String reviewState; //리뷰상태 리뷰완료or 리뷰쓰기

}
