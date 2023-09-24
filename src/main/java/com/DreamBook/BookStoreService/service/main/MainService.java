package com.DreamBook.BookStoreService.service.main;

import com.DreamBook.BookStoreService.dto.book.BookFindDTO;

import java.util.List;

public interface MainService {

    public List<BookFindDTO> bookList();

    public List<BookFindDTO> bestSeller(List<BookFindDTO>bookList);

    public List<BookFindDTO> weekBook();//이주의 top5 책

    public List<BookFindDTO>  top10Genre(String genre);

    public List<BookFindDTO>  GenreList();
}
