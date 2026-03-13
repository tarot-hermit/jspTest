package study.j0225;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
//@WebServlet("/j0225/Jstl5")
//@WebServlet(initParams = {@WebInitParam(name = "logoName2", value="SpringGreen Company2")})
public class Jstl5 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String won1 = "7654321";
		String won2 = "7654.56167";
		String won3 = "0.9876";
		
		request.setAttribute("won1", won1);
		request.setAttribute("won2", won2);
		request.setAttribute("won3", won3);
		
		Date today = new Date();
		request.setAttribute("today", today);
		
		// 초기값 설정 연습.
		String logoName2 = getInitParameter("logoName2");
		request.setAttribute("logoName2", logoName2);
		System.out.println("logoName2 : " + logoName2);
		
		String viewPage = "/study/0225/jstl5.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
}
