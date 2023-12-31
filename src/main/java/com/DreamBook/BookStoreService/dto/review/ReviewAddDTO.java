package com.DreamBook.BookStoreService.dto.review;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class ReviewAddDTO {



    private int reviewId;
    private int memberId;
    private int bookId;
    private int orderId;
    private String reviewSubject;
    private String reviewContent;
    private String reviewFileName;
    private String reviewFilePath;
    private String grade;
    private int views;
    private LocalDateTime reviewDate;
}
