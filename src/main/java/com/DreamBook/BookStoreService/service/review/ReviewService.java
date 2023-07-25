package com.DreamBook.BookStoreService.service.review;

import com.DreamBook.BookStoreService.dto.book.BookAddDTO;
import com.DreamBook.BookStoreService.dto.review.ReviewAddDTO;
import org.springframework.web.multipart.MultipartFile;

public interface ReviewService {

    public int maxNum() throws Exception;

    public void insertReviewData(ReviewAddDTO ReviewAddDTO, MultipartFile file) throws Exception;





}
