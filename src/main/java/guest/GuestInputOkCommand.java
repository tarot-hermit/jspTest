	package guest;
	
	import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDAO;
	
	public class GuestInputOkCommand implements GuestInterface {
	
		@Override
		public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String name = request.getParameter("name")==null ? "" : request.getParameter("name");
			String content = request.getParameter("content")==null ? "" : request.getParameter("content");
			String email = request.getParameter("email")==null ? "" : request.getParameter("email");
			String homePage = request.getParameter("homePage")==null ? "" : request.getParameter("homePage");
			String clientIp = request.getParameter("clientIp")==null ? "" : request.getParameter("clientIp");
			
			GuestVO vo = new GuestVO();
			vo.setName(name);
			vo.setContent(content);
			vo.setEmail(email);
			vo.setHomePage(homePage);
			vo.setClientIp(clientIp);
			
			GuestDAO dao = new GuestDAO();
			MemberDAO memberDao = new MemberDAO();
			
			
			int res = dao.setGuestInputOk(vo);
			
			if(res != 0) {
				int dayCnt = dao.getGuestWriteDayCnt(name);
				System.out.println("★ name : " + name);
		    System.out.println("★ dayCnt : " + dayCnt);
		    
		    if(dayCnt >= 5) {
		        System.out.println("★ 등업 실행!");
		        memberDao.setMemberLevelUp(name);
		        HttpSession session = request.getSession();
		        session.setAttribute("sLevel", 2);
		        session.setAttribute("strLevel", "정회원");
		    
		    }
				request.setAttribute("message", "방명록이 저장되었습니다.");
				request.setAttribute("url", "GuestList.gu");
			}
			else {
				request.setAttribute("message", "방명록 글등록 실패~~~");
				request.setAttribute("url", "GuestInput.gu");
			}
			
		}
	
	}
