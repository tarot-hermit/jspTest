package study.j0224;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/j0224/Cookie")
public class T0_CookieController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    request.setCharacterEncoding("UTF-8");

    String action = request.getParameter("action");
    if (action == null) action = "menu";

    switch (action) {
      case "menu":
        request.getRequestDispatcher("/study/0224_storage/t0_Cookie.jsp").forward(request, response);
        break;

      case "save":
        saveCookies(request, response);
        break;

      case "check":
        loadCookiesForView(request);
        request.getRequestDispatcher("/study/0224_storage/t0_CookieCheck.jsp").forward(request, response);
        break;

      case "delAll":
        deleteAllCookies(request, response);
        break;

      case "delPwd":
        deletePwdCookie(request, response);
        break;

      default:
        response.sendRedirect(request.getContextPath() + "/j0224/Cookie?action=menu");
    }
  }

  
  private void saveCookies(HttpServletRequest request, HttpServletResponse response) throws IOException {
    int age = 60 * 60 * 24; 

    String mid = "hkd1234";
    String pwd = "1234";
    String tel = "010-8434-6184";

    Cookie cMid = new Cookie("cMid", URLEncoder.encode(mid, "UTF-8"));
    Cookie cPwd = new Cookie("cPwd", URLEncoder.encode(pwd, "UTF-8"));
    Cookie cTel = new Cookie("cTel", URLEncoder.encode(tel, "UTF-8"));

    
    cMid.setPath("/");
    cPwd.setPath("/");
    cTel.setPath("/");

    cMid.setMaxAge(age);
    cPwd.setMaxAge(age);
    cTel.setMaxAge(age);

    response.addCookie(cMid);
    response.addCookie(cPwd);
    response.addCookie(cTel);

    response.sendRedirect(request.getContextPath() + "/j0224/Cookie?action=check");
  }

  
  private void loadCookiesForView(HttpServletRequest request) {
    Cookie[] cookies = request.getCookies();
    List<String[]> list = new ArrayList<>();

    if (cookies != null) {
      for (Cookie c : cookies) {
        String name = c.getName();
        if ("JSESSIONID".equals(name)) continue;

        String value = c.getValue();
        try { value = URLDecoder.decode(value, "UTF-8"); } catch (Exception e) {}

        list.add(new String[] { name, value });
      }
    }

    request.setAttribute("cookieList", list);
  }

  
  private void deleteAllCookies(HttpServletRequest request, HttpServletResponse response) throws IOException {
    Cookie[] cookies = request.getCookies();
    String cp = request.getContextPath();
    String[] paths = { "/", cp }; 

    if (cookies != null) {
      for (Cookie c : cookies) {
        String name = c.getName();
        if ("JSESSIONID".equals(name)) continue;

        for (String p : paths) {
          Cookie del = new Cookie(name, "");
          del.setMaxAge(0);
          del.setPath(p);
          response.addCookie(del);
        }
      }
    }

    response.sendRedirect(cp + "/j0224/Cookie?action=menu");
  }

  
  private void deletePwdCookie(HttpServletRequest request, HttpServletResponse response) throws IOException {
    String cp = request.getContextPath();
    String[] paths = { "/", cp };

    for (String p : paths) {
      Cookie del = new Cookie("cPwd", "");
      del.setMaxAge(0);
      del.setPath(p);
      response.addCookie(del);
    }

    response.sendRedirect(cp + "/j0224/Cookie?action=menu");
  }
}