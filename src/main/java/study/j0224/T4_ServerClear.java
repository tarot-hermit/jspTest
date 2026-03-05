package study.j0224;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/j0224/T4_ServerClear")
public class T4_ServerClear extends HttpServlet {

  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    
    HttpSession session = request.getSession();
    session.invalidate();   

    
    getServletContext().removeAttribute("aMid");
    

    
    response.sendRedirect(request.getContextPath() + "/study/0224_storage/t4_ServerStorage.jsp");
  }
}