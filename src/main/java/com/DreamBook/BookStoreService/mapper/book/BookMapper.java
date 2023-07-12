package com.DreamBook.BookStoreService.mapper.book;

import com.DreamBook.BookStoreService.dto.book.BookAddDTO;
import com.DreamBook.BookStoreService.dto.book.BookCartDTO;
import com.DreamBook.BookStoreService.dto.book.BookDTO;
import com.DreamBook.BookStoreService.dto.book.BookFindDTO;
import com.DreamBook.BookStoreService.dto.member.MemberJoinDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Mapper
public interface BookMapper {

    public int maxNum() throws Exception;

    public int maxNumCart() throws Exception;


    public void insertData(BookAddDTO bookAddDTO) throws Exception;

    public void bookCartInsertData(BookCartDTO bookCartDTO) throws Exception;

    public List<BookFindDTO> bookList() throws Exception;

    public List<BookFindDTO> bookIdList(int bookId) throws Exception;

    public List<BookDTO> bookCartList(int memberId) throws Exception;




}
