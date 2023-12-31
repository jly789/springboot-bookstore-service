package com.DreamBook.BookStoreService.controller.comment;

import com.DreamBook.BookStoreService.dto.book.BookCartDTO;
import com.DreamBook.BookStoreService.dto.book.BookDTO;
import com.DreamBook.BookStoreService.dto.book.BookFindDTO;
import com.DreamBook.BookStoreService.dto.comment.CommentAddDTO;
import com.DreamBook.BookStoreService.dto.comment.CommentDeleteDTO;
import com.DreamBook.BookStoreService.dto.comment.CommentFindDTO;
import com.DreamBook.BookStoreService.dto.review.ReviewFindDTO;
import com.DreamBook.BookStoreService.service.book.BookService;
import com.DreamBook.BookStoreService.service.comment.CommentService;
import com.DreamBook.BookStoreService.service.review.ReviewService;
import lombok.Getter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CommentController {

    @Resource
    private BookService bookService;
    @Resource
    private CommentService commentService;

    @Resource
    private ReviewService reviewService;


    @GetMapping("/commentAdd{bookId}")
    public String commentAdd(CommentAddDTO commentAddDTO, HttpSession session, Model model) throws Exception {

        int id = commentAddDTO.getBookId();

        int memberId = (int) session.getAttribute("memberId");
        int maxNum = commentService.maxNum();
        commentAddDTO.setCommentId(maxNum + 1);
        commentAddDTO.setMemberId(memberId);
        commentService.insertDataComment(commentAddDTO);

        List<CommentFindDTO> commentFindDTOList = commentService.commentList(id);
        List<BookFindDTO> bookList = bookService.bookIdList(id);
        model.addAttribute("bookList", bookList);
        model.addAttribute("commentFindDTOList", commentFindDTOList);



        String userId =(String) session.getAttribute("userId");


        model.addAttribute("reviewAllList",reviewService.reviewBookList(id));
        model.addAttribute("id",id);
        model.addAttribute("checkId",userId);
        model.addAttribute("bookList",bookList);

        return "book/bookDetail";
    }


    @GetMapping("/deleteComment{bookId}")
    public String commentDelete(
            CommentDeleteDTO commentDeleteDTO, HttpSession session, Model model) throws Exception {

        int id = commentDeleteDTO.getBookId();

        commentService.commentDelete(commentDeleteDTO);


        List<CommentFindDTO> commentFindDTOList = commentService.commentList(id);
        List<BookFindDTO> bookList = bookService.bookIdList(id);

        model.addAttribute("bookList", bookList);
        model.addAttribute("commentFindDTOList", commentFindDTOList);

        return "book/bookDetail";
    }

    @GetMapping("/deleteCommentAdmin{commentId}")
    public String commentDeleteAdmin(HttpSession session, Model model, @RequestParam("commentId") int commentId,
                                     @RequestParam("bookId") int bookId) throws Exception {


        commentService.commentDeleteAdmin(commentId);


        return "redirect:/" + bookId;


    }


}
