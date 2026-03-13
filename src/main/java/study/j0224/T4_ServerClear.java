package study.j0224;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/j0224/T4_ServerClear")
public class T4_ServerClear extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		ServletContext application = session.getServletContext();
		application.removeAttribute("aMid");
		
		// String viewPage = request.getContextPath()+"/study/0224_storage/t4_ServerStorage.jsp";
		// response.sendRedirect(viewPage);
		
		String viewPage = "/study/0224_storage/t4_ServerStorage.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
}
