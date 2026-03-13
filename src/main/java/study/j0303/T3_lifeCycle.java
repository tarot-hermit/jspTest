package study.j0303;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0303/T3_lifeCycle")
public class T3_lifeCycle extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 doGet메소드 입니다.");
		
		String viewPage = "/study/0303/t3_lifeCycle.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 doPost메소드 입니다.");

		String viewPage = "/study/0303/t3_lifeCycle.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 service메소드 입니다.");
		
		String viewPage = "/study/0303/t3_lifeCycle.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
	@Override
	public void init() throws ServletException {
		System.out.println("이곳은 init메소드 입니다.");
	}
	
	@Override
	public void destroy() {
		System.out.println("이곳은 destroy메소드 입니다.");
	}
	
	@PostConstruct
	public void initPostConstruct() {
		System.out.println("이곳은 init메소드 보다 먼저 수행합니다.");
	}
	
	@PreDestroy
	public void initPreDestroy() {
		System.out.println("이곳은 destroy메소드 보다 나중에 수행합니다.");
	}
	
}
