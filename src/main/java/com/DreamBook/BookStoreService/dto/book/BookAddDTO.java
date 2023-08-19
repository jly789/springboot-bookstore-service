package com.DreamBook.BookStoreService.dto.book;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import java.time.LocalDate;

@Getter
@Setter
public class BookAddDTO {


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



}
