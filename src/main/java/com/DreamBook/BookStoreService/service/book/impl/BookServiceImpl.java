package com.DreamBook.BookStoreService.service.book.impl;

import com.DreamBook.BookStoreService.dto.book.BookAddDTO;
import com.DreamBook.BookStoreService.dto.book.BookCartDTO;
import com.DreamBook.BookStoreService.dto.book.BookDTO;
import com.DreamBook.BookStoreService.dto.book.BookFindDTO;
import com.DreamBook.BookStoreService.dto.order.OrderDTO;
import com.DreamBook.BookStoreService.mapper.book.BookMapper;
import com.DreamBook.BookStoreService.service.book.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;
import java.util.UUID;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookMapper bookMapper;

    @Override
    public int maxNum() throws Exception {
        return bookMapper.maxNum();
    }

    @Override
    public int maxNumCart() throws Exception {
        return bookMapper.maxNumCart();
    }

    @Override
    public void insertData(BookAddDTO bookAddDTO, MultipartFile file) throws Exception {

        String projectPath = System.getProperty("user.dir")+ "\\src\\main\\resources\\static\\files";

        UUID uuid =  UUID.randomUUID();

        String fileName = uuid + "_"+file.getOriginalFilename();

        File saveFile = new File(projectPath ,fileName);

        file.transferTo(saveFile);

        bookAddDTO.setFileName(fileName);
        bookAddDTO.setFilePath("/files/" + fileName);

        bookMapper.insertData(bookAddDTO);
    }


    @Override
    public void bookCartInsertData(BookCartDTO bookCartDTO) throws Exception {

        bookMapper.bookCartInsertData(bookCartDTO);
    }
    @Override
    public List<BookFindDTO> bookList() throws Exception {
        return bookMapper.bookList();

    }

    @Override
    public List<BookFindDTO> bookIdList(int bookId) throws Exception {
        return bookMapper.bookIdList(bookId);
    }

    @Override
    public List<BookFindDTO> bookIdList2(List<OrderDTO> orderIdList) throws Exception {
        return bookMapper.bookIdList2(orderIdList);
    }

    @Override
    public List<BookDTO> bookCartList(int memberId) throws Exception {
        return bookMapper.bookCartList(memberId);
    }

    @Override
    public void update(List<BookDTO> bookCartList,BookDTO bookDTO) throws Exception {
      bookMapper.update(bookCartList,bookDTO);
    }

    @Override
    public void updateWishQuantity(BookCartDTO bookCartDTO) throws Exception {
        bookMapper.updateWishQuantity(bookCartDTO);
    }

    @Override
    public void updateAmount(BookCartDTO bookCartDTO) throws Exception {

        bookMapper.updateAmount(bookCartDTO);

    }
}
