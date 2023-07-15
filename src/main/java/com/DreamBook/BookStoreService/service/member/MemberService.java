package com.DreamBook.BookStoreService.service.member;


import com.DreamBook.BookStoreService.dto.member.MemberDTO;
import com.DreamBook.BookStoreService.dto.member.MemberFindDTO;
import com.DreamBook.BookStoreService.dto.member.MemberJoinDTO;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface MemberService {

    public int maxNum() throws Exception;

    public Integer loginData(MemberFindDTO memberFindDTO,HttpServletResponse response) throws  Exception;

    public Integer findId(MemberFindDTO memberFindDTO) throws  Exception;
    public int findMemberId(MemberFindDTO memberFindDTO) throws  Exception;
    public String findUserId(MemberFindDTO memberFindDTO) throws  Exception;

    public String findPwd(MemberFindDTO memberFindDTO) throws  Exception;

    public Integer IdCheck(String id) throws  Exception;

    public void insertData(MemberJoinDTO memberJoinDTO) throws Exception;

    public List<MemberDTO> memberDtoList(String userId) throws  Exception;

}
