package com.DreamBook.BookStoreService.service.notice;


import com.DreamBook.BookStoreService.dto.book.PaginationNotice;
import com.DreamBook.BookStoreService.dto.notice.NoticeAddDTO;
import com.DreamBook.BookStoreService.dto.notice.NoticeDeleteDTO;
import com.DreamBook.BookStoreService.dto.notice.NoticeFindDTO;
import com.DreamBook.BookStoreService.dto.notice.NoticeUpdateDTO;

import java.util.List;


public interface NoticeService {

    public int maxNum() throws Exception;
    public void insertDataNotice(NoticeAddDTO noticeAddDTO) throws Exception;
    public List<NoticeFindDTO> noticeList(PaginationNotice paginationNotice)throws Exception;

    public List<NoticeFindDTO>noticeList(int noticeId)throws Exception;

    public void noticeUpdate(NoticeUpdateDTO noticeUpdateDTO)throws Exception;

    public void noticeDelete(int noticeId)throws Exception;

}
