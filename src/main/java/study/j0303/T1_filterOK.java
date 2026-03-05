package study.j0303;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0303/T1_filterOK")
public class T1_filterOK extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		response.setContentType("text/html; charset=utf-8");
		
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String introduce = request.getParameter("introduce")==null ? "" : request.getParameter("introduce");
		
		System.out.println("서블릿(컨트롤러)에서 한글처리 하지 않음");
		System.out.println("이곳은 /j0303/T1_filterOK 서블릿입니다.");
		System.out.println("content : " + content);
		System.out.println("introduce : " + introduce);
		
		request.setAttribute("content", content + "_한글연습1");
		request.setAttribute("introduce", introduce + "_한글연습2");
		
		String viewPage = "/study/0303/t1_filterRes.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
}
