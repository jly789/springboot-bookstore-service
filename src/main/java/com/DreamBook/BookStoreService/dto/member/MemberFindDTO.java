package com.DreamBook.BookStoreService.dto.member;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;


@Getter
@Setter
public class MemberFindDTO {

        private int memberId;
        private String userId;
        private String pwd;
        private String name;
        private String email;













}
