package study.j0303;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/j0303/T3_LifeCycle")
public class T3_LifeCycle extends HttpServlet {

  @Override
  public void init() throws ServletException {
    System.out.println("1) init() : 서블릿 최초 1회 생성/초기화");
  }

  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    System.out.println("2) service() : 요청 올 때마다 호출 (GET/POST 분기 전)");
    super.service(request, response); 
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    System.out.println("3) doGet() : GET 요청 처리");

    response.setContentType("text/html; charset=UTF-8");
    response.getWriter().println("<h2>GET 요청 처리 완료</h2>");
    response.getWriter().println("<a href='" + request.getContextPath() + "/study/0303/t3_lifeCycle.jsp'>돌아가기</a>");
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    System.out.println("3) doPost() : POST 요청 처리");

    response.setContentType("text/html; charset=UTF-8");
    response.getWriter().println("<h2>POST 요청 처리 완료</h2>");
    response.getWriter().println("<a href='" + request.getContextPath() + "/study/0303/t3_lifeCycle.jsp'>돌아가기</a>");
  }

  @Override
  public void destroy() {
    System.out.println("4) destroy() : 서버 종료/언로드 시 1회 호출");
    
    
  }
}