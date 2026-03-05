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
public class CertificationFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();	
		
		String login = "";
		if(session != null) {
			login = (String) session.getAttribute("sLogin");
		}

		String uri = req.getRequestURI();

		System.out.println("URI : " + uri);
		System.out.println("login : " + login);

		
		if(uri.contains("/Login") ||
		   uri.contains("/Main") ||
		   uri.contains("/guest/") ||
		   uri.contains("/login/") ||
		   uri.contains("/study/") ||
		   uri.contains("/css/") ||
		   uri.contains("/js/")) {

			chain.doFilter(request, response);
			return;
		}

		
		if(login == null || login.equals("")) {

			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println("alert('로그인후 사용하세요.');");
			out.println("location.href='"+req.getContextPath()+"/Login?loginSw=main_Login';");
			out.println("</script>");

			return;
		}

		chain.doFilter(request, response);
	}
}