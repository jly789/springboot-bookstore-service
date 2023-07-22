package com.DreamBook.BookStoreService.service.book;

import com.DreamBook.BookStoreService.dto.book.BookAddDTO;
import com.DreamBook.BookStoreService.dto.book.BookCartDTO;
import com.DreamBook.BookStoreService.dto.book.BookDTO;
import com.DreamBook.BookStoreService.dto.book.BookFindDTO;
import com.DreamBook.BookStoreService.dto.order.OrderDTO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface BookService {



    public int maxNum() throws Exception;
    public int maxNumCart() throws Exception;

    public void insertData(BookAddDTO bookAddDTO, MultipartFile file) throws Exception;

    public void bookCartInsertData(BookCartDTO bookCartDTO) throws Exception;

    public List<BookFindDTO> bookList() throws Exception;

    public List<BookFindDTO> bookIdList(int bookId) throws Exception;

    public List<BookFindDTO> bookIdList2(List<OrderDTO> orderIdList) throws Exception;

    public List<BookDTO> bookCartList(int memberId) throws Exception;
}
