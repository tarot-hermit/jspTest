package study.j0223;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0223/Test01")
public class Test01 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String mid = request.getParameter("mid");
		String pwd = request.getParameter("pwd");
		
		System.out.println("mid : " + mid);
		System.out.println("pwd : " + pwd);
		
		PrintWriter out = response.getWriter();
		
		out.println("<p>아이디 : "+mid+"</p>");
		out.println("<p>비밀번호 : "+pwd+"</p>");
		out.println("<p><a href='"+request.getContextPath()+"/study/0223/test01Ok.jsp?mid="+mid+"&pwd="+pwd+"'>test01Ok.jsp</a></p>");
	}
	
}
