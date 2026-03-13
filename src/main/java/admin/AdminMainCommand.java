package admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class AdminMainCommand implements AdminInterface {

	 @Override
   public void execute(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {

       MemberDAO dao = new MemberDAO();

       // ✅ 탈퇴 처리중인 회원 수
       int memberDeleteCnt = dao.getDeleteMemberCnt();
       
       List<MemberVO> deleteMemberList = dao.getDeleteMemberList(0, 10);

       // 나머지는 나중에 추가
       request.setAttribute("memberDeleteCnt", memberDeleteCnt);
       request.setAttribute("deleteMemberList", deleteMemberList);
       request.setAttribute("memberCnt", 0);
       request.setAttribute("guestCnt", 0);
       request.setAttribute("boardCnt", 0);
   }
}