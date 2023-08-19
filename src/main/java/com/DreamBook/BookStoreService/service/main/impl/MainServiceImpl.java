package com.DreamBook.BookStoreService.service.main.impl;

import com.DreamBook.BookStoreService.dto.book.BookFindDTO;
import com.DreamBook.BookStoreService.mapper.main.MainMapper;
import com.DreamBook.BookStoreService.service.main.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MainServiceImpl implements MainService {

    @Autowired
    private MainMapper mainMapper;

    @Override
    public List<BookFindDTO> bookList() {
        return mainMapper.bookList();
    }

    @Override
    public List<BookFindDTO> bestSeller(List<BookFindDTO> bookList) {
        return mainMapper.bestSeller(bookList);
    }

    @Override
    public List<BookFindDTO> weekBook() {
        return mainMapper.weekBook();   //이주의 top5 책
    }
}
