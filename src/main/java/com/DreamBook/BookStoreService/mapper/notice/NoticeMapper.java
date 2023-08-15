package com.DreamBook.BookStoreService.mapper.notice;

import com.DreamBook.BookStoreService.dto.notice.NoticeAddDTO;
import com.DreamBook.BookStoreService.dto.notice.NoticeFindDTO;
import com.DreamBook.BookStoreService.dto.review.ReviewAddDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Mapper
public interface NoticeMapper {

    public int maxNum() throws Exception;
    public void insertDataNotice(NoticeAddDTO noticeAddDTO) throws Exception;

    public List<NoticeFindDTO>noticeList()throws Exception;





}
