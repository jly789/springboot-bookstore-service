package com.DreamBook.BookStoreService.service.member;


import com.DreamBook.BookStoreService.dto.member.MemberFindDTO;
import com.DreamBook.BookStoreService.dto.member.MemberJoinDTO;

import javax.servlet.http.HttpServletResponse;

public interface MemberService {

    public int maxNum() throws Exception;

    public Integer loginData(MemberFindDTO memberFindDTO,HttpServletResponse response) throws  Exception;

    public void insertData(MemberJoinDTO memberJoinDTO) throws Exception;

}
