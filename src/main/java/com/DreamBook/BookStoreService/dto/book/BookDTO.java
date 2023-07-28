package com.DreamBook.BookStoreService.dto.book;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Setter
public class BookDTO {

    private int bookId;
    private int memberId;
    private String bookName;
    private String bookSubject;
    private String bookContent;
    private String author;
    private String publisher;
    private String genre;
    private String fileName;
    private String filePath;
    private int price;
    private int bookLoan;
    private int views;
    private int wishQuantity;
    private int cartId;
    private int bookPrice;
    private int bookTotal;
    private int bookRealTotal;
    private int amount;
    private int reviewId;
    private String grade;
    private LocalDateTime reviewDate;
    @NotNull(message = "필수 정보입니다.")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate publicationYear;



}
