package com.DreamBook.BookStoreService.dto.book;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BookCartDTO {

    private int cartId;
    private int memberId;
    private int bookId;

    private String bookName;
    private int bookPrice;
    private int wishQuantity; //수량
    private int bookTotal;
    private int bookRealTotal;


}
