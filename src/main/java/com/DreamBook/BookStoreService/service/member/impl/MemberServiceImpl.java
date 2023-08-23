package com.DreamBook.BookStoreService.service.member.impl;



import com.DreamBook.BookStoreService.dto.member.*;
import com.DreamBook.BookStoreService.mapper.member.MemberMapper;
import com.DreamBook.BookStoreService.service.member.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
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
    public void insertData(MemberJoinDTO memberJoinDTO,MultipartFile file) throws Exception {

        String projectPath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\profileImg";

//        UUID uuid =  UUID.randomUUID();

        String fileName = file.getOriginalFilename();


        System.out.println(fileName);
        File saveFile = new File(projectPath, fileName);

        file.transferTo(saveFile);

        memberJoinDTO.setFileName(fileName);

        memberJoinDTO.setFilePath("/profileImg/" + fileName);
        memberMapper.insertData(memberJoinDTO);
    }

    @Override
    public void insertMemberNotImage(MemberJoinDTO memberJoinDTO, MultipartFile file) throws Exception {


        String projectPath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\profileImg\\noImage.jpg";

//        UUID uuid =  UUID.randomUUID();

        String fileName = "noImage.jpg";


        System.out.println(fileName);


        memberJoinDTO.setFileName(fileName);

        memberJoinDTO.setFilePath("/profileImg/" + fileName);



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

    @Override
    public void updateMember(MemberUpdateDTO memberUpdateDTO,MultipartFile file) throws Exception {

        String projectPath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\profileImg";

//        UUID uuid =  UUID.randomUUID();

        String fileName = file.getOriginalFilename();



        File saveFile = new File(projectPath, fileName);

        file.transferTo(saveFile);

        memberUpdateDTO.setFileName(fileName);

        memberUpdateDTO.setFilePath("/profileImg/" + fileName);


        memberMapper.updateMember(memberUpdateDTO);
    }

    @Override
    public void updateMemberDeliveryName(String userId,String deliveryName) throws Exception {
        memberMapper.updateMemberDeliveryName(userId,deliveryName);
    }

    @Override
    public void updateMemberDataNotImage(MemberUpdateDTO memberUpdateDTO) throws Exception {
        memberMapper.updateMemberDataNotImage(memberUpdateDTO);
    }

    @Override
    public void updatePoint(int point,int plusPoint,int plusPoint2,int memberId) throws Exception {
        memberMapper.updatePoint(point,plusPoint,plusPoint2,memberId);
    }

    @Override
    public Integer deleteMember(MemberDeleteDTO MemberDeleteDTO,HttpServletResponse response) throws Exception {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();


        if (  memberMapper.deleteMember(MemberDeleteDTO) == 1) {
            out.println("<script>alert('회원탈퇴 성공!'); </script>");
            out.flush();
            return 1;
        }

        if (memberMapper.deleteMember(MemberDeleteDTO) == 0) {
            out.println("<script>alert('아이디/비밀번호 오류 다시입력하세요'); </script>");
            out.flush();
            return 0;
        }
        return 3;
    }

    @Override
    public boolean selectCart(MemberDeleteDTO MemberDeleteDTO) throws Exception {
        if(memberMapper.selectCart(MemberDeleteDTO)==0){

            return false;
        }

        return true;
    }

    @Override
    public boolean selectOrders(MemberDeleteDTO MemberDeleteDTO) throws Exception {
        if(memberMapper.selectOrders(MemberDeleteDTO)==0){

            return false;
        }
        return true;
    }

    @Override
    public boolean selectReview(MemberDeleteDTO MemberDeleteDTO) throws Exception {
        if(memberMapper.selectReview(MemberDeleteDTO)==0){
            return false;
        }

        return true;
    }

    @Override
    public boolean selectComments(MemberDeleteDTO MemberDeleteDTO) throws Exception {


        if(memberMapper.selectComments(MemberDeleteDTO)==0){
            return false;
        }

        return true;
    }

    @Override
    public boolean selectDelivery(MemberDeleteDTO MemberDeleteDTO) throws Exception {
        if(memberMapper.selectDelivery(MemberDeleteDTO)==0){
            return false;
        }

        return true;
    }

    @Override
    public void deleteDelivery(MemberDeleteDTO MemberDeleteDTO) throws Exception {
        memberMapper.deleteDelivery(MemberDeleteDTO);
    }

    @Override
    public void deleteCart(MemberDeleteDTO MemberDeleteDTO) throws Exception {
       memberMapper.deleteCart(MemberDeleteDTO);
    }

    @Override
    public void deleteOrders(MemberDeleteDTO MemberDeleteDTO) throws Exception {
        memberMapper.deleteOrders(MemberDeleteDTO);
    }

    @Override
    public void deleteReview(MemberDeleteDTO MemberDeleteDTO) throws Exception {
    memberMapper.deleteReview(MemberDeleteDTO);
    }

    @Override
    public void deleteComments(MemberDeleteDTO MemberDeleteDTO) throws Exception {
    memberMapper.deleteComments(MemberDeleteDTO);
    }
}