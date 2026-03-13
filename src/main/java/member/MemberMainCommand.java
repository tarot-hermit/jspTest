package member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import guest.GuestDAO;
import guest.GuestVO;

public class MemberMainCommand implements MemberInterface {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {

      HttpSession session = request.getSession();
      String nickName = (String) session.getAttribute("sNickName");
      String mid = (String) session.getAttribute("sMid");
      
      MemberDAO dao1 = new MemberDAO();
      
      MemberVO vo = dao1.getMemberIdCheck(mid);
      
      GuestDAO dao = new GuestDAO();
      

      
      List<GuestVO> list = dao.getGuestListByName(nickName);

      request.setAttribute("sPoint", vo.getPoint());
      request.setAttribute("guestList", list);
  }
}