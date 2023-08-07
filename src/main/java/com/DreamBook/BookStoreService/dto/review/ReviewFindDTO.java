package com.DreamBook.BookStoreService.dto.review;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class ReviewFindDTO {

    private int bookId;
    private int memberId;
    private String bookName;
    private String bookContent;
    private String author;
    private String publisher;
    private String genre;
    private String fileName;
    private String filePath;
    private int price;
    private int salesQuantity;
    private int bookLoan;
    private int views;
    private int orderNum;
    private int orderId;
    private String orderState;
    private int reviewId;
    private int reviewIdCount;
    private int grade;
    private String reviewSubject;
    private String reviewContent;
    private String reviewFileName;
    private String reviewFilePath;
    private String reviewState;
    private String userId; //리뷰작성자 아이디
    private String name; //리뷰작성자 이름
    private LocalDateTime reviewDate;



}
