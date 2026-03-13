package study.j0223;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.vo.TestVO;

@SuppressWarnings("serial")
@WebServlet("/j0223/Test05")
public class Test05 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		int age = request.getParameter("age")==null ? 0 : Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender")==null ? "" : request.getParameter("gender");
		String job = request.getParameter("job")==null ? "" : request.getParameter("job");
		String address = request.getParameter("address")==null ? "" : request.getParameter("address");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		
		// BackEnd 유효성검사처리.....
		
		TestVO vo = new TestVO();
		
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setAge(age);
		vo.setGender(gender);
		vo.setJob(job);
		vo.setAddress(address);
		vo.setContent(content);
		
		System.out.println("vo : " + vo);
		
		// BackEnd 처리.......
		
		//response.sendRedirect(request.getContextPath()+"/study/0223/test05Ok.jsp?vo="+vo);
		
		request.setAttribute("vo", vo);
		
		String viewPage = "/study/0223/test05Ok.jsp";
//		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
//		dispatcher.forward(request, response);
		
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
}
