package com.DreamBook.BookStoreService.service.comment;

import com.DreamBook.BookStoreService.dto.comment.CommentAddDTO;
import com.DreamBook.BookStoreService.dto.comment.CommentFindDTO;

import java.util.List;

public interface CommentService {

    public int maxNum() throws Exception;
    public void insertDataComment(CommentAddDTO commentAddDTO)throws Exception;

    public List<CommentFindDTO> commentList(int bookId) throws  Exception;
}
