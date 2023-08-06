package com.DreamBook.BookStoreService.mapper.comment;

import com.DreamBook.BookStoreService.dto.comment.CommentAddDTO;
import com.DreamBook.BookStoreService.dto.comment.CommentFindDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentMapper {


    public int maxNum() throws Exception;
    public void insertDataComment(CommentAddDTO commentAddDTO)throws Exception;

    public List<CommentFindDTO> commentList(int bookId) throws  Exception;
}
