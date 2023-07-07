package com.DreamBook.BookStoreService.service.member.impl;



import com.DreamBook.BookStoreService.dto.member.MemberJoinDTO;
import com.DreamBook.BookStoreService.mapper.member.MemberMapper;
import com.DreamBook.BookStoreService.service.member.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberMapper memberMapper;


    @Override
    public int maxNum() throws Exception {
        return memberMapper.maxNum();
    }

    @Override
    public void insertData(MemberJoinDTO memberJoinDTO) throws Exception {
        memberMapper.insertData(memberJoinDTO);
    }
}
