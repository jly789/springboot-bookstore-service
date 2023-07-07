package com.DreamBook.BookStoreService.mapper.member;


import com.DreamBook.BookStoreService.dto.member.MemberJoinDTO;
import org.apache.ibatis.annotations.Mapper;




@Mapper
public interface MemberMapper {

    public int maxNum() throws Exception;

    public void insertData(MemberJoinDTO memberJoinDTO) throws Exception;

}
