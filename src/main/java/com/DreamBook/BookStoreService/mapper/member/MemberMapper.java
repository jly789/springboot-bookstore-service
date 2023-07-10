package com.DreamBook.BookStoreService.mapper.member;


import com.DreamBook.BookStoreService.dto.member.MemberFindDTO;
import com.DreamBook.BookStoreService.dto.member.MemberJoinDTO;
import org.apache.ibatis.annotations.Mapper;




@Mapper
public interface MemberMapper {

    public int maxNum() throws Exception;

    public Integer IdCheck(String id) throws  Exception;

    public Integer loginData(MemberFindDTO memberFindDTO) throws  Exception;

    public Integer findId(MemberFindDTO memberFindDTO) throws  Exception;

    public String findUserId(MemberFindDTO memberFindDTO) throws  Exception;

    public void insertData(MemberJoinDTO memberJoinDTO) throws Exception;

}
