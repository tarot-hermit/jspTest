package study.j0224;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/j0224/T4_ServerStorage")
public class T4_ServerStorage extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mid = request.getParameter("mid")==null ? "guest" : request.getParameter("mid");
		System.out.println("mid : " + mid);
		
		// 세션 객체 생성
		HttpSession session = request.getSession();
		session.setAttribute("sMid", mid);
		
		// 어플리케이션 객체 생성
		// ServletContext application = request.getSession().getServletContext();
		// ServletContext application = session.getServletContext();
		ServletContext application = request.getServletContext();
		application.setAttribute("aMid", mid);
		
		String viewPage = request.getContextPath()+"/study/0224_storage/t4_ServerStorage.jsp";
		response.sendRedirect(viewPage);
	}
	
	
}
