package com.DreamBook.BookStoreService.controller.notice;

import com.DreamBook.BookStoreService.dto.notice.NoticeAddDTO;
import com.DreamBook.BookStoreService.dto.notice.NoticeFindDTO;
import com.DreamBook.BookStoreService.dto.notice.NoticeUpdateDTO;
import com.DreamBook.BookStoreService.service.book.BookService;
import com.DreamBook.BookStoreService.service.notice.NoticeService;
import com.DreamBook.BookStoreService.service.review.ReviewService;
import com.DreamBook.BookStoreService.util.AlertMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class NoticeController {

    @Resource
    private NoticeService noticeService;
    @Resource
    private ReviewService reviewService;
    @Resource
    private BookService bookService;


    @GetMapping("/notice")
    public String notice(HttpSession session, Model model, @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
                         @RequestParam(value = "cntPerPage", required = false, defaultValue = "1") int cntPerPage,
                         @RequestParam(value = "pageSize", required = false, defaultValue = "100") int pageSize) throws Exception {

        String userId = (String)session.getAttribute("userId");

        List<NoticeFindDTO> noticeList = noticeService.noticeList();

        model.addAttribute("noticeList",noticeList);
        model.addAttribute("userId",userId);

        return "notice/notice";
    }


    @PostMapping("/notice") //공지등록
    public String noticePost(HttpSession session, Model model, NoticeAddDTO noticeAddDTO,
                             @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
                             @RequestParam(value = "cntPerPage", required = false, defaultValue = "1") int cntPerPage,
                             @RequestParam(value = "pageSize", required = false, defaultValue = "100") int pageSize) throws Exception {


        int maxNum = noticeService.maxNum();
        noticeAddDTO.setNoticeId(maxNum + 1);
        noticeService.insertDataNotice(noticeAddDTO);


        return "redirect:/notice";
    }

    @GetMapping("/noticeDetail") //공지등록
    public String noticeDetail(HttpSession session, Model model,@RequestParam("noticeId")int noticeId)throws Exception {

       int memberId =  (int)session.getAttribute("memberId");

        List<NoticeFindDTO> noticeDetail = noticeService.noticeList(noticeId);

        model.addAttribute("noticeDetail",noticeDetail);
        model.addAttribute("memberId",memberId);



        return "notice/noticeDetail";
    }




    @GetMapping("/noticeAdd")
    public String noticeAdd(HttpSession session, Model model, NoticeAddDTO NoticeAddDTO) throws Exception {


        return "notice/noticeAdd";
    }

    @GetMapping("/noticeUpdate")
    public String noticeUpdate(@RequestParam("noticeId")int noticeId,HttpSession session, Model model, NoticeUpdateDTO noticeUpdateDTO) throws Exception {


        String userId = (String)session.getAttribute("userId");

        List<NoticeFindDTO> noticeList = noticeService.noticeList();

        model.addAttribute("noticeList",noticeList);
        model.addAttribute("userId",userId);

        return "notice/notice";
    }


    @GetMapping("/noticeDelete{noticeId}")
    public String noticeDelete(@RequestParam("noticeId")int noticeId,HttpSession session, Model model, NoticeUpdateDTO noticeUpdateDTO) throws Exception {


        String userId = (String)session.getAttribute("userId");

        List<NoticeFindDTO> noticeList = noticeService.noticeList();

        model.addAttribute("noticeList",noticeList);
        model.addAttribute("userId",userId);


        return "notice/notice";
    }










}