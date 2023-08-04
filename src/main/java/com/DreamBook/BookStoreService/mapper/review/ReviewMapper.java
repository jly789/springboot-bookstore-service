package com.DreamBook.BookStoreService.mapper.review;

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



    public List<ReviewFindDTO> reviewAllList() throws Exception;

    public List<ReviewFindDTO> reviewDetailList(int reviewId) throws Exception;

    public List<ReviewFindDTO> reviewWriter() throws Exception;

    public int ReviewOrderIdFind(int orderId) throws Exception;

    public List<ReviewFindDTO> ReviewCheck(List<OrderDTO> orderId) throws Exception;

}
