package com.DreamBook.BookStoreService.dto.crawling;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@Builder
@ToString
public class News {
    private String imageabc;
    private String subjectabc;
    private String url;

    private String  goods_link;
}