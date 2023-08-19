package com.DreamBook.BookStoreService.service.book.impl;

import com.DreamBook.BookStoreService.dto.book.*;
import com.DreamBook.BookStoreService.dto.comment.CommentFindDTO;
import com.DreamBook.BookStoreService.dto.order.OrderDTO;
import com.DreamBook.BookStoreService.dto.review.ReviewFindDTO;
import com.DreamBook.BookStoreService.dto.review.ReviewUpdateDTO;
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
    public List<BookFindDTO> SelectAllList() throws Exception {
        return bookMapper.SelectAllList();
    }

    @Override
    public List<BookFindDTO> SelectAllList(Pagination pagination) throws Exception {
        return bookMapper.SelectAllList(pagination);
    }

    @Override
    public List<BookFindDTO> SelectHighPriceList(Pagination pagination) throws Exception {
        return bookMapper.SelectHighPriceList(pagination);
    }


    @Override
    public List<BookFindDTO> SelectLowPriceList(Pagination pagination) throws Exception {
        return bookMapper.SelectLowPriceList(pagination);

    }

    @Override
    public List<BookFindDTO> SelectManyOrders(Pagination pagination) throws Exception {
        return bookMapper.SelectManyOrders(pagination);
    }

    @Override
    public List<BookFindDTO> SelectManyReview(Pagination pagination) throws Exception {
        return bookMapper.SelectManyReview(pagination);
    }

    @Override
    public List<BookFindDTO> SelectGenreSearch(PaginationGenre paginationGenre) throws Exception {
        return bookMapper.SelectGenreSearch(paginationGenre);
    }


    @Override
    public List<BookFindDTO> SelectPriceSearch(PaginationPriceRange paginationPriceRange) throws Exception {
        return bookMapper.SelectPriceSearch(paginationPriceRange);
    }



    @Override
    public List<CommentFindDTO> SelectCommentFindDTOList(PaginationGenre paginationComment) throws Exception {
        return bookMapper.SelectCommentFindDTOList(paginationComment);
    }

    @Override
    public int testTableCount() throws Exception {
        return bookMapper.testTableCount();
    }

    @Override
    public int SearchGenreTableCount(String bookName) throws Exception {
        return bookMapper.SearchGenreTableCount(bookName);
    }
    @Override
    public int SearchPriceRangeTableCount(int price) throws Exception {
        return bookMapper.SearchPriceRangeTableCount(price);
    }
    @Override
    public int ReviewTableCount() throws Exception {
        return bookMapper.ReviewTableCount();
    }

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
    public List<BookFindDTO> bookListPrice(int price) throws Exception {
        return bookMapper.bookListPrice(price);
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
    public List<BookFindDTO> bookListManyReview(List<BookFindDTO> bookAndReview) throws Exception {
        return bookMapper.bookListManyReview(bookAndReview);
    }

    @Override
    public List<BookFindDTO> bookAndReview(List<BookFindDTO> bookAndReview) throws Exception {  //기본 정렬
        return bookMapper.bookAndReview(bookAndReview);
    }

    @Override
    public List<BookFindDTO> bookAndReviewGrade(List<BookFindDTO> bookAndReview) throws Exception {
        return bookMapper.bookAndReviewGrade(bookAndReview);
    }

    @Override
    public List<BookFindDTO>  reviewGrade(List<BookFindDTO> bookAndReview) throws Exception {
        return bookMapper.reviewGrade(bookAndReview);
    }

    @Override
    public List<BookFindDTO> realReviewGrade(List<BookFindDTO> bookAndReview) throws Exception {
        return bookMapper.realReviewGrade(bookAndReview);
    }

    @Override
    public List<ReviewFindDTO> bookAndReviewList(List<ReviewFindDTO> bookAndReview) throws Exception {
        return bookMapper.bookAndReviewList(bookAndReview);
    }

    @Override
    public List<BookFindDTO> genreSearch(String genre) throws Exception {
        return bookMapper.genreSearch(genre);
    }

    @Override
    public List<BookFindDTO> genreSearchAll() throws Exception {
        return bookMapper.genreSearchAll();
    }

    @Override
    public List<BookFindDTO> bookPriceRange(int price) throws Exception {
        return bookMapper.bookPriceRange(price);
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
    public List<BookFindDTO> bookIdList2(List<OrderDTO> orderIdList,int memberId) throws Exception {
        //orderId리스트를 이용하여 book리스트찾기

        return bookMapper.bookIdList2(orderIdList,memberId);
    }

    @Override
    public List<BookDTO> bookCartList(int memberId) throws Exception { //회원아이디를 통해 해당 장바구니애 넣어둔 리스트 출력
        return bookMapper.bookCartList(memberId);
    }

    @Override
    public List<BookCartDTO> orderBookCartList(BookCartDTO bookCartDTO) throws Exception {
        return bookMapper.orderBookCartList(bookCartDTO);
    }

//    @Override
//    public void update(List<BookDTO> bookCartList,BookDTO bookDTO) throws Exception { //
//      bookMapper.update(bookCartList,bookDTO);
//    }



    @Override
    public void updateBookData(BookUpdateDTO bookUpdateDTO, MultipartFile file) throws Exception {

        String projectPath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\files";

//        UUID uuid =  UUID.randomUUID();

        String fileName = file.getOriginalFilename();



        File saveFile = new File(projectPath, fileName);

        file.transferTo(saveFile);


        bookUpdateDTO.setFileName(fileName);

        bookUpdateDTO.setFilePath("/files/" + fileName);
        bookMapper.updateBook(bookUpdateDTO);
    }

    @Override
    public void updateBookDataNotImage(BookUpdateDTO bookUpdateDTO) throws Exception {

        bookMapper.updateBookDataNotImage(bookUpdateDTO);
    }

    @Override
    public void updateSalesRate(int bookId) throws Exception {
        bookMapper.updateSalesRate(bookId);
    }

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

    @Override
    public void OrderDeleteCart(int cartId) throws Exception {
        bookMapper.OrderDeleteCart(cartId);
    }
}
