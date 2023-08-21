package com.DreamBook.BookStoreService.mapper.main;

import com.DreamBook.BookStoreService.dto.book.BookFindDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MainMapper {

    public List<BookFindDTO> bookList();

    public List<BookFindDTO> bestSeller(List<BookFindDTO>bookList);

    public List<BookFindDTO> weekBook();

    public List<BookFindDTO>  top5Genre(String genre);




}
