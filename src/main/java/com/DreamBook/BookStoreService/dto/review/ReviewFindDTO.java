package com.DreamBook.BookStoreService.dto.review;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class ReviewFindDTO {

    private int reviewId;
    private int memberId;
    private int bookId;
    private int orderId;
    private String reviewSubject;
    private String reviewContent;
    private String reviewFileName;
    private String fileName;
    private String reviewFilePath;
    private String grade;
    private int views;
    private String userId; //리뷰작성자 아이디
    private String name; //리뷰작성자 이름
    private String bookName; //구매도서
    private LocalDateTime reviewDate;
}
