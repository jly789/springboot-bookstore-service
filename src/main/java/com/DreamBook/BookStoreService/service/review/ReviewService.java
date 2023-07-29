package com.DreamBook.BookStoreService.service.review;

import com.DreamBook.BookStoreService.dto.book.BookAddDTO;
import com.DreamBook.BookStoreService.dto.order.OrderDTO;
import com.DreamBook.BookStoreService.dto.review.ReviewAddDTO;
import com.DreamBook.BookStoreService.dto.review.ReviewDTO;
import com.DreamBook.BookStoreService.dto.review.ReviewFindDTO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ReviewService {

    public int maxNum() throws Exception;

    public void insertReviewData(ReviewAddDTO ReviewAddDTO, MultipartFile file) throws Exception;

    public void insertReviewNotImage(ReviewAddDTO ReviewAddDTO) throws Exception;

    public int ReviewOrderIdFind(int orderId) throws Exception;

    public List<ReviewFindDTO> reviewAllList() throws Exception;

    public List<ReviewFindDTO> ReviewCheck(List<OrderDTO> orderId) throws Exception;



}
