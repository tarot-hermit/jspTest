package study2.test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/study2/Test1")
public class Test1 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("msg", "디렉토리패턴 연습");
		
		String viewPage = "/WEB-INF/study2/test/test1.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
}
