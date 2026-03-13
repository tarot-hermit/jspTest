package study.j0220;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/Test3")
public class Test3 extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name");
		System.out.println("name : " + name);
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.getWriter().append("<br/><br/><div><a href='test3.jsp'>test3.jsp</a></div>");
		
		//PrintWriter out = response.getWriter();
		
		//out.println("<p><a href='"+request.getContextPath()+"/study/0220/test3.jsp'>돌아가기</a></p>");
	}

}
