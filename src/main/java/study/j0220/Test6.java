package study.j0220;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/Test6")
public class Test6 extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String mid = request.getParameter("mid");
		String pwd = request.getParameter("pwd");
		
		
		//response.getWriter().append("mid = ");
		
		PrintWriter out = response.getWriter();
		
		out.println("아이디 : " + mid + "<br/>");
		out.println("비밀번호 : " + pwd + "<br/>");
		out.println("<a href='study/0220/test6.jsp'>돌아가기</a>");
	}

}
