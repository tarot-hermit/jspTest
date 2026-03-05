package common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/login/Login")
public class Login extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie[] cookies = request.getCookies();
		String mid = "";

		if(cookies != null) {
			for(int i=0; i<cookies.length; i++) {
				cookies[i].setPath("/");
				if(cookies[i].getName().equals("cMid")) {
					//request.setAttribute("mid", cookies[i].getValue());
					mid = cookies[i].getValue();
					break;
				}
			}
		}
		
		String loginSw = request.getParameter("loginSw")==null ? "" : request.getParameter("loginSw");
		String viewPage = "";
		
		if(loginSw.equals("Exam03_Login")) viewPage = request.getContextPath() + "/study/exam/exam03_Login.jsp?mid="+mid;
		else if(loginSw.equals("main_Login")) viewPage = request.getContextPath() + "/study/exam/exam03_Login.jsp?mid="+mid;
		
		response.sendRedirect(viewPage);
//		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
//		dispatcher.forward(request, response);
	}
	
}
