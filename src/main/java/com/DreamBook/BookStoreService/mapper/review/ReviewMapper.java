package com.DreamBook.BookStoreService.mapper.review;

import com.DreamBook.BookStoreService.dto.book.Pagination;
import com.DreamBook.BookStoreService.dto.book.PaginationReview;
import com.DreamBook.BookStoreService.dto.order.OrderDTO;
import com.DreamBook.BookStoreService.dto.review.*;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Mapper
public interface ReviewMapper {

    public int maxNum() throws Exception;
    public void insertReviewData(ReviewAddDTO ReviewAddDTO) throws Exception;
    public void insertReviewDataNotImg(ReviewAddDTO ReviewAddDTO) throws Exception;
    public void updateReviewData(ReviewUpdateDTO reviewUpdateDTO) throws Exception;

    public void updateReviewDataNotImage(ReviewUpdateDTO reviewUpdateDTO) throws Exception;

    public void deleteReview(int reviewId) throws Exception;


    public List<ReviewFindDTO> reviewAllList(PaginationReview pagination) throws Exception;

    public List<ReviewFindDTO>  reviewBookList(Pagination pagination) throws Exception; //해당도서의 리뷰작성리스트


    public List<ReviewFindDTO> reviewDetailList(int reviewId) throws Exception;

    public List<ReviewFindDTO> reviewWriter() throws Exception;



//    public List<ReviewFindDTO> reviewMemberList(List<OrderDTO>orderDTOList) throws Exception; //해당회원이 작성한 리뷰리스트


    public int ReviewOrderIdFind(int orderId) throws Exception;

    public List<ReviewFindDTO> ReviewCheck(List<OrderDTO> orderId) throws Exception;

    public List<OrderDTO> myOrderReviewCheck(List<OrderDTO> orderDTO) throws Exception;




}
