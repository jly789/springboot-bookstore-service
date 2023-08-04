package com.DreamBook.BookStoreService.dto.member;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Getter
@Setter
public class MemberDeleteDTO {


    private int memberId;

    private String role;

    @NotEmpty(message = "필수 정보입니다.")
    @Pattern(regexp = "^[a-z0-9]{5,20}$", message = "5~20자리 영어 소문자와 숫자만 사용해 주세요.")
    private String userId;

    @NotEmpty(message = "필수 정보입니다.")
    @Pattern(regexp = "(?=.*[a-z])(?=.*[0-9]).{4,20}", message = "4~20자리 영문 소문자, 숫자를 사용해 주세요.")
    private String pwd;

    @NotEmpty(message = "필수 정보입니다.")
    private String name;


    private String gender;

    private int age;

    @NotBlank(message = "필수 정보입니다.")
    @Pattern(regexp = "^[ㄱ-ㅎ가-힣a-z0-9-_]{2,10}$", message = "닉네임은 특수문자를 제외한 2~10 자리여야 합니다.")
    @Size(min = 2, max = 15, message = "2~15자 이내로 입력해 주세요.")
    private String nikname;

//    @NotNull(message = "필수 정보입니다.")
//    @PastOrPresent(message = "과거 또는 현재의 날짜여야 합니다.")
//    @DateTimeFormat(pattern = "yyyy-MM-dd")
//    private LocalDate birth;

    @NotBlank(message = "필수 정보입니다.")
    @Pattern(regexp = "(01[016789])(\\d{3,4})(\\d{4})", message = "휴대폰 번호 형식이 올바르지 않습니다.")
    private String tel;

    @NotBlank(message = "필수 정보입니다.")
    @Size(min = 5, max = 5, message = "우편번호 5자리를 입력해 주세요.")
    private String postcode;

    @NotBlank(message = "필수 정보입니다.")
    private String address;

    @NotBlank(message = "필수 정보입니다.")
    private String detailAddress;


    private String extraAddress;

    @NotBlank(message = "필수 정보입니다.")
    @Pattern(regexp = "^(?:\\w+\\.?)*\\w+@(?:\\w+\\.)+\\w+$", message = "이메일 형식이 올바르지 않습니다.")
    private String email;

    private String favoriteGenre;

    private String userGrade;

    private int purchaseAmount;

    private int point;


    private int wishQuantity;
}
