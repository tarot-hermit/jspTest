package study.j0223;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0223/Test04_3")
public class Test04_3 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		System.out.println("mid : " + mid);
		System.out.println("pwd : " + pwd);
		
		// front에서 전송되어온 mid와 pwd값을 DB에 저장된 mid/pwd와 비교후 처리....
		
		if(!mid.equals("admin") || !pwd.equals("1234")) {
			response.sendRedirect(request.getContextPath()+"/study/0223/test04.jsp?msg=no");
			return;
		}
		
		// response.sendRedirect(request.getContextPath()+"/study/0223/test04Ok.jsp?mid="+mid+"&pwd="+pwd);
		
		// 정상로그인된 회원들에 대한 처리부분.....
		System.out.println("처리중.......");
		
		//RequestDispatcher dispatcher = request.getRequestDispatcher(request.getContextPath()+"/study/0223/test04Ok.jsp?mid="+mid+"&pwd="+pwd); // 오류(404)
		
		//RequestDispatcher dispatcher = request.getRequestDispatcher("/study/0223/test04Ok.jsp?mid="+mid+"&pwd="+pwd);
		String viewPage = "/study/0223/test04Ok.jsp?mid="+mid+"&pwd="+pwd;
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
	
}
