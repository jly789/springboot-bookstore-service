package com.DreamBook.BookStoreService.mapper.book;

import com.DreamBook.BookStoreService.dto.book.BookAddDTO;
import com.DreamBook.BookStoreService.dto.book.BookCartDTO;
import com.DreamBook.BookStoreService.dto.book.BookDTO;
import com.DreamBook.BookStoreService.dto.book.BookFindDTO;
import com.DreamBook.BookStoreService.dto.member.MemberJoinDTO;
import com.DreamBook.BookStoreService.dto.order.OrderDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Mapper
public interface BookMapper {

    public int maxNum() throws Exception;

    public int maxNumCart() throws Exception;


    public void insertData(BookAddDTO bookAddDTO) throws Exception;

    public void  updateViews (int id) throws Exception;

    public void bookCartInsertData(BookCartDTO bookCartDTO) throws Exception;

    public List<BookFindDTO> bookList() throws Exception;

    public List<BookFindDTO> bookListHighPrice(List<BookFindDTO>bookAndReview) throws Exception;

    public List<BookFindDTO> bookListLowPrice(List<BookFindDTO>bookAndReview) throws Exception;

    public List<BookFindDTO> bookListManyOrders(List<BookFindDTO>bookAndReview) throws Exception;

    public List<BookFindDTO> bookListManyReview(List<BookFindDTO>bookAndReview) throws Exception;

    public List<BookFindDTO> bookAndReview(List<BookFindDTO>bookAndReview)throws Exception;

    public List<BookFindDTO> bookAndReviewGrade(List<BookFindDTO>bookAndReview)throws Exception;

    public List<BookFindDTO> bookIdList(int bookId) throws Exception;

    public List<BookFindDTO> manyBookOrders(List bookId) throws Exception;

    public List<BookFindDTO> bookIdList2(List<OrderDTO>orderIdList,int memberId) throws Exception;



    public List<BookDTO> bookCartList(int memberId) throws Exception;


    public void update(List<BookDTO> bookCartList,BookDTO bookDTO) throws Exception;

    public void   updateWishQuantity(BookCartDTO bookCartDTO) throws Exception;

    public void wishQuantityCheck(BookCartDTO bookCartDTO)throws Exception;

    public void   updateWishQuantityMinus(BookCartDTO bookCartDTO) throws Exception;
    public void   updateAmount(BookCartDTO bookCartDTO) throws Exception;

    public void   deleteCart(BookCartDTO bookCartDTO) throws Exception;
}
