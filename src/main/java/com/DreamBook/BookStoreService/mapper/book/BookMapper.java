package com.DreamBook.BookStoreService.mapper.book;

import com.DreamBook.BookStoreService.dto.book.*;
import com.DreamBook.BookStoreService.dto.comment.CommentFindDTO;
import com.DreamBook.BookStoreService.dto.order.OrderDTO;
import com.DreamBook.BookStoreService.dto.review.ReviewFindDTO;
import com.DreamBook.BookStoreService.dto.review.ReviewUpdateDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BookMapper {


    //select * from Test_Table
    public List<BookFindDTO> SelectAllList() throws Exception;

    //Paging
    public List<BookFindDTO> SelectAllList(Pagination pagination) throws Exception;

    public List<BookFindDTO> SelectHighPriceList(Pagination pagination) throws Exception;

    public List<BookFindDTO> SelectLowPriceList(Pagination pagination) throws Exception;
    public List<BookFindDTO> SelectManyOrders(Pagination pagination) throws Exception;
    public List<BookFindDTO> SelectManyReview(Pagination pagination) throws Exception;


    public List<BookFindDTO> SelectGenreSearch(PaginationGenre paginationGenre) throws Exception;

    public List<BookFindDTO> SelectPriceSearch(PaginationPriceRange paginationPriceRange) throws Exception;

    public List<CommentFindDTO> SelectCommentFindDTOList(PaginationGenre pagination) throws Exception;

    //count
    public int testTableCount() throws Exception;

    public int SearchGenreTableCount(String genreName) throws Exception;
    public int SearchPriceRangeTableCount(int price) throws Exception;

    public int ReviewTableCount() throws Exception;
    public int NoticeTableCount() throws Exception;

    public int maxNum() throws Exception;

    public int maxNumCart() throws Exception;


    public void insertData(BookAddDTO bookAddDTO) throws Exception;


    public void   updateRecommendedBook (int bookId) throws Exception; //추천도서설정
    public void  updateViews (int id) throws Exception;

    public void bookCartInsertData(BookCartDTO bookCartDTO) throws Exception;

    public List<BookFindDTO> bookList() throws Exception;
    public List<BookFindDTO> bookListPrice(int price) throws Exception;

    public List<BookFindDTO> bookListHighPrice(List<BookFindDTO>bookAndReview) throws Exception;

    public List<BookFindDTO> bookListLowPrice(List<BookFindDTO>bookAndReview) throws Exception;

    public List<BookFindDTO> bookListManyOrders(List<BookFindDTO>bookAndReview) throws Exception;

    public List<BookFindDTO> bookListManyReview(List<BookFindDTO>bookAndReview) throws Exception;



    public List<BookFindDTO> bookAndReview(List<BookFindDTO>bookAndReview)throws Exception;

    public List<BookFindDTO> bookAndReviewGrade(List<BookFindDTO>bookAndReview)throws Exception;

    public List<BookFindDTO>  reviewGrade(List<BookFindDTO>bookAndReview)throws Exception;

    public List<BookFindDTO>  realReviewGrade(List<BookFindDTO>bookAndReview)throws Exception;

    public List<ReviewFindDTO> bookAndReviewList(List<ReviewFindDTO>bookAndReview)throws Exception;

    public List<BookFindDTO> genreSearch(String genre)throws Exception;
    public List<BookFindDTO> genreSearchAll()throws Exception;

    public List<BookFindDTO> bookPriceRange(int price)throws Exception;


    public List<BookFindDTO> bookIdList(int bookId) throws Exception;

    public List<BookFindDTO> manyBookOrders(List bookId) throws Exception;


    public List<BookFindDTO> bookIdList2(List<OrderDTO>orderIdList,int memberId) throws Exception;

    public List<BookFindDTO> recommendedBook() throws Exception; //추천도서인 리스트출력

    public List<BookDTO> bookCartList(int memberId) throws Exception;

    public List<BookCartDTO> orderBookCartList(BookCartDTO bookCartDTO) throws Exception;

    public void update(List<BookDTO> bookCartList,BookDTO bookDTO) throws Exception;

    public void updateBook(BookUpdateDTO bookUpdateDTO) throws Exception; //admin book 정보수정

    public void updateBookDataNotImage(BookUpdateDTO bookUpdateDTO) throws Exception; //admin book이미지없을시

    public void   updateWishQuantity(BookCartDTO bookCartDTO) throws Exception;

    public void       updateSalesRate(int bookId) throws Exception;


    public void wishQuantityCheck(BookCartDTO bookCartDTO)throws Exception;

    public void   updateWishQuantityMinus(BookCartDTO bookCartDTO) throws Exception;
    public void   updateAmount(BookCartDTO bookCartDTO) throws Exception;

    public void   deleteCart(BookCartDTO bookCartDTO) throws Exception;
    public void   OrderDeleteCart(int cartId) throws Exception;

}
