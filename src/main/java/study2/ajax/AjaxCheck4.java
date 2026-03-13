package study2.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

@SuppressWarnings("serial")
@WebServlet("/AjaxCheck4")
public class AjaxCheck4 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberIdCheck(mid);
		System.out.println("vo : " + vo);
		
		String str = "검색 결과 : <br/>";
		if(vo.getNickName() == null) str = "검색한 자료가 없습니다.";
		else {
			String strLevel = "";
			if(vo.getLevel() == 0) strLevel = "관리자";
			else if(vo.getLevel() == 1) strLevel = "준회원";
			else if(vo.getLevel() == 2) strLevel = "정회원";
			else if(vo.getLevel() == 3) strLevel = "우수회원";
			
			str += "닉네임 : " + vo.getNickName() + "/";
			str += "성명 : " + vo.getName() + "/";
			str += "성별 : " + vo.getGender() + "/";
			str += "이메일 : " + vo.getEmail() + "/";
			str += "레벨 : " + strLevel;
		}
		
		response.getWriter().write(str);
	}
	
}
