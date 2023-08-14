package com.DreamBook.BookStoreService.dto.comment;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class CommentFindDTO {

    private int commentId;
    private int memberId;
    private int bookId;
    private String reviewId;
    private String commentContent;
    private LocalDateTime commentDate;
    private String name;
    private String reviewSubject;
    private String reviewContent;
    private String reviewFileName;
    private String reviewFilePath;
    private int grade;
    private LocalDateTime reviewDate;
    private String userId;
    private String fileName;
    private String filePath;



}

