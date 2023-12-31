package com.DreamBook.BookStoreService.dto.comment;


import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class CommentDeleteDTO {

    private int commentId;
    private int memberId;
    private int bookId;
    private String commentContent;
    private LocalDateTime commentDate;
}
