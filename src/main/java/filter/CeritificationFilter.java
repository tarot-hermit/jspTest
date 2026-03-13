package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class CeritificationFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();	// req.getSession(false) : 세션이 없으면 만들지 않음.
		
		String login = session.getAttribute("sLogin")==null ? "" : (String) session.getAttribute("sLogin");
		
		//System.out.println("login : " + login);
		
		String uri = req.getRequestURI();
		
		
		if(!uri.contains("/") && !uri.contains("/Main") && !uri.contains("/guest/") && !uri.contains("/login/")) {
			System.out.println("인증창 통과중....");
			if(!uri.contains("/css/") && !uri.contains("/js/")) {
				request.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
			}
			if(login == null || login.equals("")) {
				PrintWriter out = response.getWriter();
				System.out.println("로그인 실패통과....");
				out.println("<script>");
				out.println("alert('로그인후 사용하세요.');");
				out.println("location.href='"+req.getContextPath()+"/login/Login?loginSw=main_Login'");
				out.println("</script>");
			}
		}
		
		
		chain.doFilter(request, response);
		
	}

}
