package study.exam;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/study/exam/Exam03_LoginOk")
public class Exam03_LoginOk extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		String viewPage = "";
		
		if(!mid.equals("admin") || !pwd.equals("1234")) {
			request.setAttribute("loginSw", "NO");
			viewPage = "/study/exam/exam03_Login.jsp";
		}
		else {
			HttpSession session = request.getSession();
			session.setAttribute("sLogin", "OK");
			session.setAttribute("sMid", mid);
			
			String idSave = request.getParameter("idSave")==null ? "off" : "on";
			Cookie cookieMid = new Cookie("cMid", mid);
			cookieMid.setPath("/");
			
			if(idSave.equals("on")) cookieMid.setMaxAge(60*60*24*7);
			else cookieMid.setMaxAge(0);
			
			response.addCookie(cookieMid);
			
			request.setAttribute("mid", mid);
			viewPage = "/study/exam/exam03_Main.jsp";
		}
		
		request.getRequestDispatcher(viewPage).forward(request, response);;
	}
	
}
