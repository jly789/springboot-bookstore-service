package com.DreamBook.BookStoreService.service.review;

import com.DreamBook.BookStoreService.dto.book.BookAddDTO;
import com.DreamBook.BookStoreService.dto.book.Pagination;
import com.DreamBook.BookStoreService.dto.book.PaginationReview;
import com.DreamBook.BookStoreService.dto.member.MemberFindDTO;
import com.DreamBook.BookStoreService.dto.order.OrderDTO;
import com.DreamBook.BookStoreService.dto.review.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ReviewService {

    public int maxNum() throws Exception;

    public void insertReviewData(ReviewAddDTO ReviewAddDTO, MultipartFile file) throws Exception;

    public void insertReviewNotImage(ReviewAddDTO ReviewAddDTO,MultipartFile file) throws Exception;

    public void updateReviewData(ReviewUpdateDTO reviewUpdateDTO, MultipartFile file) throws Exception;
    public void updateReviewDataNotImage(ReviewUpdateDTO reviewUpdateDTO) throws Exception;

    public void deleteReview(int reviewId) throws Exception;

    public int ReviewOrderIdFind(int orderId) throws Exception;

    public List<ReviewFindDTO> reviewAllList(PaginationReview pagination) throws Exception;

    public List<ReviewFindDTO>  reviewBookList(Pagination pagination) throws Exception; //해당도서의 리뷰작성리스트
    public List<ReviewFindDTO> reviewDetailList(int reviewId) throws Exception;


    public List<ReviewFindDTO> reviewWriter() throws Exception;



//    public List<ReviewFindDTO> reviewMemberList(List<OrderDTO>orderDTOList) throws Exception;

    public List<ReviewFindDTO> ReviewCheck(List<OrderDTO> orderId) throws Exception;

    public List<OrderDTO> myOrderReviewCheck(List<OrderDTO> orderDTO) throws Exception;




}
