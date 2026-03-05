package study.j0224;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/storage")
public class ServerStorageServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    
    Integer aTemp = (Integer) getServletContext().getAttribute("aCount");
    Integer sTemp = (Integer) request.getSession().getAttribute("sCount");

    int aCount = (aTemp == null) ? 0 : aTemp;
    int sCount = (sTemp == null) ? 0 : sTemp;

    
    request.setAttribute("aCount", aCount);
    request.setAttribute("sCount", sCount);

    request.getRequestDispatcher("/study/0224/t4_ServerStorage.jsp").forward(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    request.setCharacterEncoding("UTF-8");

    String action = request.getParameter("action"); // inc / resetApp / resetSess

    Integer aTemp = (Integer) getServletContext().getAttribute("aCount");
    Integer sTemp = (Integer) request.getSession().getAttribute("sCount");

    int aCount = (aTemp == null) ? 0 : aTemp;
    int sCount = (sTemp == null) ? 0 : sTemp;

    if ("resetApp".equals(action)) {
      aCount = 0;
      getServletContext().setAttribute("aCount", aCount);
    }
    else if ("resetSess".equals(action)) {
      sCount = 0;
      request.getSession().setAttribute("sCount", sCount);
    }
    else if ("inc".equals(action)) {
      aCount++;
      sCount++;
      getServletContext().setAttribute("aCount", aCount);
      request.getSession().setAttribute("sCount", sCount);
    }

    // PRG(새로고침 중복 처리 방지) - 서블릿 GET으로 이동
    response.sendRedirect(request.getContextPath() + "/storage");
  }
}