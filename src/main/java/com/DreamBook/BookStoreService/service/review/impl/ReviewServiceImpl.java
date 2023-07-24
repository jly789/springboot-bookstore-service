package com.DreamBook.BookStoreService.service.review.impl;

import com.DreamBook.BookStoreService.mapper.review.ReviewMapper;
import com.DreamBook.BookStoreService.service.review.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewMapper reviewMapper;
}
