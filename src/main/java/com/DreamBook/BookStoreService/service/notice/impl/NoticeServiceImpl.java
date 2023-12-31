package com.DreamBook.BookStoreService.service.notice.impl;


import com.DreamBook.BookStoreService.dto.book.PaginationNotice;
import com.DreamBook.BookStoreService.dto.notice.NoticeAddDTO;
import com.DreamBook.BookStoreService.dto.notice.NoticeDeleteDTO;
import com.DreamBook.BookStoreService.dto.notice.NoticeFindDTO;
import com.DreamBook.BookStoreService.dto.notice.NoticeUpdateDTO;
import com.DreamBook.BookStoreService.dto.review.ReviewAddDTO;
import com.DreamBook.BookStoreService.mapper.notice.NoticeMapper;
import com.DreamBook.BookStoreService.service.notice.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;


    @Override
    public int maxNum() throws Exception {
        return noticeMapper.maxNum();
    }

    @Override
    public void insertDataNotice(NoticeAddDTO noticeAddDTO) throws Exception {
        noticeMapper.insertDataNotice(noticeAddDTO);
    }

    @Override
    public List<NoticeFindDTO> noticeList(PaginationNotice paginationNotice) throws Exception {
        return noticeMapper.noticeList(paginationNotice);
    }

    @Override
    public List<NoticeFindDTO> noticeList(int noticeId) throws Exception {
        return noticeMapper.noticeDetail(noticeId);
    }

    @Override
    public void noticeUpdate(NoticeUpdateDTO noticeUpdateDTO) throws Exception {
        noticeMapper.noticeUpdate(noticeUpdateDTO);
    }


    @Override
    public void noticeDelete(int noticeId) throws Exception {
        noticeMapper.noticeDelete(noticeId);
    }
}
