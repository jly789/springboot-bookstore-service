package com.DreamBook.BookStoreService.dto.book;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
public class BookFindDTO {


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
    private int grade;
    private String reviewSubject;
    private String reviewContent;
    private String reviewFileName;
    private String reviewFilePath;
    private String reviewState;
    private String userId; //리뷰작성자 아이디
    private String name; //리뷰작성자 이름
    private LocalDateTime reviewDate;
    private int reviewGrade;
    private int reviewIdCount;









    @NotNull(message = "필수 정보입니다.")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate publicationYear;


}
