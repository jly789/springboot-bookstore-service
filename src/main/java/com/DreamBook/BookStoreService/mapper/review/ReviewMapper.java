package com.DreamBook.BookStoreService.mapper.review;

import com.DreamBook.BookStoreService.dto.review.ReviewAddDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

@Mapper
public interface ReviewMapper {

    public int maxNum() throws Exception;
    public void insertReviewData(ReviewAddDTO ReviewAddDTO) throws Exception;
}
