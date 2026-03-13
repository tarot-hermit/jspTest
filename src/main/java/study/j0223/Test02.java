package study.j0223;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0223/Test02")
public class Test02 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
//		String mid = request.getParameter("id");
//		if(mid == null) mid = "";
		
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		int age = request.getParameter("age")==null ? 0 : Integer.parseInt(request.getParameter("age"));
		
		System.out.println("mid : " + mid);
		System.out.println("pwd : " + pwd);
		System.out.println("age : " + age);
		
		age = age - 1;
		
		boolean loginOk = true;
		if(!mid.equals("admin") || !pwd.equals("1234")) loginOk = false;
		
		PrintWriter out = response.getWriter();
		
		if(loginOk) {
			out.println("<script>");
			out.println("alert('로그인 승인완료!!!');");
			out.println("location.href='"+request.getContextPath()+"/study/0223/test02Ok.jsp?mid="+mid+"&pwd="+pwd+"&age="+age+"';");
			out.println("</script>");
		}
		else {
			out.println("<script>");
			out.println("alert('로그인 실패~~~');");
			out.println("location.href='"+request.getContextPath()+"/study/0223/test02.jsp';");
			out.println("</script>");
		}
		
	}
	
}
