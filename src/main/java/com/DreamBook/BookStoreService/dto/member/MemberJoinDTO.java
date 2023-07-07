package com.DreamBook.BookStoreService.dto.member;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;


@Getter
@Setter
public class MemberJoinDTO {

        private int memberId;
        private String role;
        private String userId;
        private String pwd;
        private String name;
        private String gender;
        private int age;
        private String nikname;
        @DateTimeFormat(pattern = "yyyy-MM-dd")
        private LocalDate birth;
        private String tel;
        private String postcode;
        private String address;
        private String detailAddress;
        private String extraAddress;
        private String email;
        private String favoriteGenre;
        private String userGrade;
        private int purchaseAmount;
        private int point;












}
