package com.DreamBook.BookStoreService.service.comment.impl;

import com.DreamBook.BookStoreService.mapper.comment.CommentMapper;
import com.DreamBook.BookStoreService.service.comment.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;
}
