package com.DreamBook.BookStoreService.dto.book;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BookCartDTO {

    private int cartId;
    private int memberId;
    private int bookId;
    private int wishQuantity;
    private int amount;
    private int price;



}
