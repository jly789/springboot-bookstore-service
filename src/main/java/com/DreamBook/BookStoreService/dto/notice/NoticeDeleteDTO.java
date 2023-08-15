package com.DreamBook.BookStoreService.dto.notice;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
@Getter
@Setter
public class NoticeDeleteDTO {

    private int noticeId;
    private int memberId;
    private int noticeViews;
    private String noticeSubject;
    private String noticeContent;
    private String noticeType;   //중요,공지,긴급
    private LocalDateTime noticeDate;
}
