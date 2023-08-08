package com.DreamBook.BookStoreService.service.comment.impl;

import com.DreamBook.BookStoreService.dto.comment.CommentAddDTO;
import com.DreamBook.BookStoreService.dto.comment.CommentDeleteDTO;
import com.DreamBook.BookStoreService.dto.comment.CommentFindDTO;
import com.DreamBook.BookStoreService.mapper.comment.CommentMapper;
import com.DreamBook.BookStoreService.service.comment.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public int maxNum() throws Exception {
        return commentMapper.maxNum();
    }

    @Override
    public void insertDataComment(CommentAddDTO commentAddDTO) throws Exception {
       commentMapper.insertDataComment(commentAddDTO);

    }

    @Override
    public List<CommentFindDTO> commentList(int bookId) throws Exception {
        return commentMapper.commentList(bookId);
    }

    @Override
    public List<CommentFindDTO> commentFindList(int bookId, int memberId) throws Exception {
        return commentMapper.commentFindList(bookId,memberId);
    }

    @Override
    public void commentDelete(CommentDeleteDTO commentDeleteDTO) throws Exception {
        commentMapper.commentDelete(commentDeleteDTO);
    }
}
