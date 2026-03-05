package study.j0223;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0223/Test05_2")
public class Test05_2 extends HttpServlet {

	@SuppressWarnings("deprecation")
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
		
//		PrintWriter out = response.getWriter();
//		out.println("<p>mid : " + mid + "</p>");
//		out.println("<p>pwd : " + pwd + "</p>");
//		out.println("<p>name : " + name + "</p>");
//		out.println("<p>age : " + age + "</p>");
//		out.println("<p>gender : " + gender + "</p>");
//		out.println("<p>job : " + job + "</p>");
//		out.println("<p>address : " + address + "</p>");
//		out.println("<p>content : " + content + "</p>");
//		out.println("<a href='"+request.getContextPath()+"/study/0223/test05Ok.jsp?mid="+mid+"&pwd="+pwd+"&age="+age+"&gender="+gender+"&job="+job+"&address="+address+"&content="+content+"'>test05Ok.jsp</a>");
		
		// BackEnd 처리.......
		
		//response.sendRedirect(request.getContextPath()+"/study/0223/test05Ok.jsp?mid="+mid+"&pwd="+pwd+"&age="+age+"&gender="+gender+"&job="+job+"&address="+address+"&content="+content);
		response.sendRedirect(request.getContextPath()+"/study/0223/test05Ok.jsp?mid="+mid+"&pwd="+pwd+"&name="+name+"&age="+age+"&gender="+URLEncoder.encode(gender)+"&job="+URLEncoder.encode(job)+"&address="+URLEncoder.encode(address)+"&content="+URLEncoder.encode(content));
		
	}
	
}
