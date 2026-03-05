package study.exam;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/login")
public class Exam03_Login extends HttpServlet {

  
  private static final String DEMO_ID = "admin";
  private static final String DEMO_PW = "1234";

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.setCharacterEncoding("UTF-8");

    String id = req.getParameter("loginId");
    String pw = req.getParameter("password");
    boolean saveId = (req.getParameter("saveId") != null);

    
    boolean ok = DEMO_ID.equals(id) && DEMO_PW.equals(pw);

    if(!ok) {
      resp.setContentType("text/html; charset=UTF-8");
      resp.getWriter().println("<script>alert('로그인 실패'); history.back();</script>");
      return;
    }

    
    HttpSession session = req.getSession();
    session.setAttribute("loginUser", id);

    
    Cookie rememberId = new Cookie("rememberId", id);
    rememberId.setPath(req.getContextPath());
    rememberId.setHttpOnly(true);

    if(saveId) rememberId.setMaxAge(60 * 60 * 24 * 7);
    else rememberId.setMaxAge(0); 

    resp.addCookie(rememberId);

    resp.sendRedirect(req.getContextPath() + "/main/main.jsp");
  }
}