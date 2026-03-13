package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberDeleteCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String mid = (String) session.getAttribute("sMid");
		
		MemberDAO  dao = new MemberDAO();
		
		
		int res = dao.setMemberDelete(mid);
		
		if(res != 0) {
			request.setAttribute("message", mid +"탈퇴 되었습니다.\\n같은 아이디로 1달간 재가입 할수 없습니다.");
			request.setAttribute("url", "MemberLogin.mem");
		}
		else {
			request.setAttribute("message", "탈퇴 실패");
			request.setAttribute("url", "MemberMain.mem");
		}
	}

}
