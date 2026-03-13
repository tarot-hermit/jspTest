package study.j0220;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/Test7")
public class Test7 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String mid = request.getParameter("mid");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String job = request.getParameter("job");
		String address = request.getParameter("address");
		String content = request.getParameter("content");
		
		PrintWriter out = response.getWriter();
		
		out.println("<p>mid : " + mid + "</p>");
		out.println("<p>pwd : " + pwd + "</p>");
		out.println("<p>name : " + name + "</p>");
		out.println("<p>age : " + age + "</p>");
		out.println("<p>gender : " + gender + "</p>");
		out.println("<p>job : " + job + "</p>");
		out.println("<p>address : " + address + "</p>");
		out.println("<p>content : " + content + "</p>");
		out.println("<a href='study/0220/test7.jsp'>돌아가기</a>");
		
		
	}
	
}
