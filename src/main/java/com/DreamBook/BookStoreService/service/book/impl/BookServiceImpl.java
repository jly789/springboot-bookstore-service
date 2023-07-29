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
    public void updateViews(int id) throws Exception {
        bookMapper.updateViews(id);

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
    public void bookCartInsertData(BookCartDTO bookCartDTO) throws Exception { //관리자 도서추가 서비스

        bookMapper.bookCartInsertData(bookCartDTO);
    }
    @Override
    public List<BookFindDTO> bookList() throws Exception { //book 전체리스트
        return bookMapper.bookList();

    }

    @Override
    public List<BookFindDTO> bookListHighPrice(List<BookFindDTO>bookAndReview) throws Exception { //높은가격순에 의한 정렬
        return  bookMapper.bookListHighPrice(bookAndReview);
    }

    @Override
    public List<BookFindDTO> bookListLowPrice(List<BookFindDTO>bookAndReview) throws Exception {  //낮은가격순에 의한 정렬
        return bookMapper.bookListLowPrice(bookAndReview);
    }

    @Override
    public List<BookFindDTO> bookListManyOrders(List<BookFindDTO> bookAndReview) throws Exception {
        return bookMapper.bookListManyOrders(bookAndReview);
    }

    @Override
    public List<BookDTO> bookAndReview(List<BookFindDTO> bookAndReview) throws Exception {  //기본 정렬
        return bookMapper.bookAndReview(bookAndReview);
    }

    @Override
    public List<BookFindDTO> bookIdList(int bookId) throws Exception { //bookId로 통해 book리스트 출력
        return bookMapper.bookIdList(bookId);
    }

    @Override
    public List<BookFindDTO> manyBookOrders(List bookId) throws Exception {
        return bookMapper.manyBookOrders(bookId);
    }

    @Override
    public List<BookFindDTO> bookIdList2(List<OrderDTO> orderIdList) throws Exception {
        //orderId리스트를 이용하여 book리스트찾기

        return bookMapper.bookIdList2(orderIdList);
    }

    @Override
    public List<BookDTO> bookCartList(int memberId) throws Exception { //회원아이디를 통해 해당 장바구니애 넣어둔 리스트 출력
        return bookMapper.bookCartList(memberId);
    }



//    @Override
//    public void update(List<BookDTO> bookCartList,BookDTO bookDTO) throws Exception { //
//      bookMapper.update(bookCartList,bookDTO);
//    }

    @Override
    public void updateWishQuantity(BookCartDTO bookCartDTO) throws Exception { //장바구니 해당도서의 수량증가
        bookMapper.updateWishQuantity(bookCartDTO);
    }

    @Override
    public void updateWishQuantityMinus(BookCartDTO bookCartDTO) throws Exception { //장바구니 해당도서의 수량증가
       bookMapper.updateWishQuantityMinus(bookCartDTO);
    }

    @Override
    public void wishQuantityCheck(BookCartDTO bookCartDTO) throws Exception {
        bookMapper.wishQuantityCheck(bookCartDTO);
    }

    @Override
    public void updateAmount(BookCartDTO bookCartDTO) throws Exception { //장바구니 해당도서의 수량증가로인한 총가격상승

        bookMapper.updateAmount(bookCartDTO);

    }

    @Override
    public void deleteCart(BookCartDTO bookCartDTO) throws Exception {
        bookMapper.deleteCart(bookCartDTO);
    }
}
