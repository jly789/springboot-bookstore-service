package com.DreamBook.BookStoreService.dto.book;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Setter
public class BookUpdateDTO {

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
    @NotNull(message = "필수 정보입니다.")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate publicationYear;
    private int salesRate;
    private int recommendedBook; //추천도서여부 0이면 x 1이면 추천도서




}
