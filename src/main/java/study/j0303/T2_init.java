package study.j0303;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/j0303/T2_init")
public class T2_init extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("init통과중...");
		String logoName = getServletContext().getInitParameter("logoName");
		String homeAddress = getServletContext().getInitParameter("homeAddress");
		
		HttpSession session = request.getSession();
		session.setAttribute("sLogoName", logoName);
		session.setAttribute("sHomeAddress", homeAddress);
		
		
		
		String viewPage = "/study/0303/t2_init.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
}
