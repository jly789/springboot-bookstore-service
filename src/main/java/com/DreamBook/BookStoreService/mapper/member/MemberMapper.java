package com.DreamBook.BookStoreService.mapper.member;


import org.apache.ibatis.annotations.Mapper;




@Mapper
public interface MemberMapper {

    public int maxNum() throws Exception;

}
