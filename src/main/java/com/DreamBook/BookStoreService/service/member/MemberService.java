package com.DreamBook.BookStoreService.service.member;


import com.DreamBook.BookStoreService.dto.member.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface MemberService {

    public int maxNum() throws Exception;

    public Integer loginData(MemberFindDTO memberFindDTO,HttpServletResponse response) throws  Exception;

    public Integer findId(MemberFindDTO memberFindDTO) throws  Exception;
    public int findMemberId(MemberFindDTO memberFindDTO) throws  Exception;
    public String findUserId(MemberFindDTO memberFindDTO) throws  Exception;

    public String findPwd(MemberFindDTO memberFindDTO) throws  Exception;

    public Integer IdCheck(String id) throws  Exception;

    public void insertData(MemberJoinDTO memberJoinDTO) throws Exception;

    public List<MemberDTO> memberDtoList(String userId) throws  Exception;

//    public List<MemberDTO> memberIdList(int memberId) throws  Exception;

    public void updateMember(MemberUpdateDTO memberUpdateDTO) throws  Exception;

    public void updatePoint(int point,int plusPoint,int plusPoint2,int memberId)throws Exception;
    public Integer deleteMember(MemberDeleteDTO MemberDeleteDTO,HttpServletResponse response) throws  Exception;


    public boolean selectCart(MemberDeleteDTO MemberDeleteDTO) throws  Exception;

    public boolean selectOrders(MemberDeleteDTO MemberDeleteDTO) throws  Exception;

    public boolean selectReview(MemberDeleteDTO MemberDeleteDTO) throws  Exception;

    public boolean selectComments(MemberDeleteDTO MemberDeleteDTO) throws  Exception;

    public boolean selectDelivery(MemberDeleteDTO MemberDeleteDTO) throws  Exception;
    public void deleteDelivery(MemberDeleteDTO MemberDeleteDTO) throws  Exception;
    public void deleteCart(MemberDeleteDTO MemberDeleteDTO) throws  Exception;

    public void deleteOrders(MemberDeleteDTO MemberDeleteDTO) throws  Exception;

    public void deleteReview(MemberDeleteDTO MemberDeleteDTO) throws  Exception;

    public void deleteComments(MemberDeleteDTO MemberDeleteDTO) throws  Exception;

}
