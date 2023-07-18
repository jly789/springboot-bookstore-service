package com.DreamBook.BookStoreService.service.member.impl;



import com.DreamBook.BookStoreService.dto.member.MemberDTO;
import com.DreamBook.BookStoreService.dto.member.MemberFindDTO;
import com.DreamBook.BookStoreService.dto.member.MemberJoinDTO;
import com.DreamBook.BookStoreService.mapper.member.MemberMapper;
import com.DreamBook.BookStoreService.service.member.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;


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

    @Override
    public Integer loginData(MemberFindDTO memberFindDTO, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();


        if (memberMapper.loginData(memberFindDTO) == 1) {
            out.println("<script>alert('로그인성공'); </script>");
            out.flush();
            return 1;
        }

        if (memberMapper.loginData(memberFindDTO) == 0) {
            out.println("<script>alert('아이디/비밀번호 오류 다시입력하세요'); </script>");
            out.flush();
            return 0;
        }

        return 1;
    }

    @Override
    public Integer IdCheck(String id) throws Exception {
        if (memberMapper.IdCheck(id) == 1) {
            return 0;
        }
        return 1;
    }



    @Override
    public Integer findId(MemberFindDTO memberFindDTO) throws Exception {
        if (memberMapper.findId(memberFindDTO) == 1) {

            return 0;
        }
        return 1;

    }

    @Override
    public String findUserId(MemberFindDTO memberFindDTO) throws Exception {
       return memberMapper.findUserId(memberFindDTO);
    }

    @Override
    public String findPwd(MemberFindDTO memberFindDTO) throws Exception {
        return memberMapper.findPwd(memberFindDTO);
    }

    @Override
    public int findMemberId(MemberFindDTO memberFindDTO) throws Exception {
        return memberMapper.findMemberId(memberFindDTO);
    }

    @Override
    public List<MemberDTO> memberDtoList(String userId) throws Exception {
        return memberMapper.memberDtoList(userId);
    }

//    @Override
//    public List<MemberDTO> memberIdList(int memberId) throws Exception {
//        return memberMapper.memberIdList(memberId);
//    }
}