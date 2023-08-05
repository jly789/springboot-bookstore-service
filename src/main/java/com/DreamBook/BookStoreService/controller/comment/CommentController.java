package com.DreamBook.BookStoreService.controller.comment;

import com.DreamBook.BookStoreService.dto.book.BookCartDTO;
import com.DreamBook.BookStoreService.dto.book.BookDTO;
import com.DreamBook.BookStoreService.dto.book.BookFindDTO;
import com.DreamBook.BookStoreService.dto.comment.CommentAddDTO;
import com.DreamBook.BookStoreService.service.book.BookService;
import com.DreamBook.BookStoreService.service.comment.CommentService;
import lombok.Getter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CommentController {

    @Resource
    private BookService bookService;
    @Resource
    private CommentService commentService;


    @GetMapping("/commentAdd{bookId}")
    public String commentAdd(CommentAddDTO commentAddDTO, HttpSession session,Model model)throws Exception {

        int id = commentAddDTO.getBookId();

        String memberId = (String) session.getAttribute("userId");
        System.out.println(commentAddDTO.getBookId());
        System.out.println(commentAddDTO.getCommentContent());
        List<BookFindDTO> bookList = bookService.bookIdList(id);
        model.addAttribute("bookList",bookList);

        return "book/bookDetail";
    }







}
