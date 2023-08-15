package com.DreamBook.BookStoreService.service.notice;


import com.DreamBook.BookStoreService.dto.notice.NoticeAddDTO;
import com.DreamBook.BookStoreService.dto.notice.NoticeFindDTO;

import java.util.List;


public interface NoticeService {

    public int maxNum() throws Exception;
    public void insertDataNotice(NoticeAddDTO noticeAddDTO) throws Exception;
    public List<NoticeFindDTO> noticeList()throws Exception;

}
