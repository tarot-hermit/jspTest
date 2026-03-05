package common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/login/Logout")
public class Logout extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		
		String logoutSw = request.getParameter("logoutSw");
		String viewPage = "";
		
//		if(logoutSw.equals("storage_t5"))	viewPage = "/study/0224_storage/t5_Login.jsp";
		if(logoutSw.equals("storage_t5"))	viewPage = request.getContextPath()+"/study/0224_storage/t5_Login.jsp";
		// else if(logoutSw.equals("storage_t6"))	viewPage = "/study/0224_storage/t6_Login.jsp";
		//else if(logoutSw.equals("exam03"))	viewPage = "/study/exam/exam03_Login.jsp";
		else if(logoutSw.equals("exam03"))	viewPage = request.getContextPath()+"/login/Login?loginSw=Exam03_Login";
		else if(logoutSw.equals("main"))	viewPage = request.getContextPath()+"/login/Login?loginSw=main_Login";
		
//		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
//		dispatcher.forward(request, response);
		
		response.sendRedirect(viewPage);
	}
	
}
