package com.DreamBook.BookStoreService.mapper.member;


import com.DreamBook.BookStoreService.dto.member.*;
import com.DreamBook.BookStoreService.dto.review.ReviewUpdateDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface MemberMapper {

    public int maxNum() throws Exception;

    public Integer IdCheck(String id) throws  Exception;

    public Integer loginData(MemberFindDTO memberFindDTO) throws  Exception;

    public Integer findId(MemberFindDTO memberFindDTO) throws  Exception;

    public int findMemberId(MemberFindDTO memberFindDTO) throws  Exception;
    public String findUserId(MemberFindDTO memberFindDTO) throws  Exception;

    public String findPwd(MemberFindDTO memberFindDTO) throws  Exception;

    public void insertData(MemberJoinDTO memberJoinDTO) throws Exception;



    public List<MemberDTO> memberDtoList(String userId) throws  Exception;
//    public List<MemberDTO> memberIdList(int memberId) throws  Exception;

    public void updateMember(MemberUpdateDTO memberUpdateDTO) throws  Exception;


    public void updateMemberDataNotImage(MemberUpdateDTO memberUpdateDTO) throws Exception;

    public void updatePoint(int point,int plusPoint,int plusPoint2,int memberId)throws Exception;

    public int deleteMember(MemberDeleteDTO MemberDeleteDTO) throws  Exception;


    public int selectCart(MemberDeleteDTO MemberDeleteDTO) throws  Exception;
    public int selectDelivery(MemberDeleteDTO MemberDeleteDTO) throws  Exception;


    public int selectOrders(MemberDeleteDTO MemberDeleteDTO) throws  Exception;

    public int selectReview(MemberDeleteDTO MemberDeleteDTO) throws  Exception;

    public int selectComments(MemberDeleteDTO MemberDeleteDTO) throws  Exception;



    public void deleteCart(MemberDeleteDTO MemberDeleteDTO) throws  Exception;
    public void deleteDelivery(MemberDeleteDTO MemberDeleteDTO) throws  Exception;

    public void deleteOrders(MemberDeleteDTO MemberDeleteDTO) throws  Exception;

    public void deleteReview(MemberDeleteDTO MemberDeleteDTO) throws  Exception;

    public void deleteComments(MemberDeleteDTO MemberDeleteDTO) throws  Exception;

}
