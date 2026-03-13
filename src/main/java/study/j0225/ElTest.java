package study.j0225;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0225/ElTest")
public class ElTest extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String[] hobbys = request.getParameterValues("hobby");
		
		String str = "";
		for(String hobby : hobbys) {
			System.out.println(hobby);
			str += hobby + "/";
		}
		str = str.substring(0, str.length()-1);
		
		System.out.println("취미 : " + str);
		
		String viewPage = "/study/0225/elOk.jsp";
		
		request.setAttribute("name", name);
		request.setAttribute("hobby", str);
		
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
}
