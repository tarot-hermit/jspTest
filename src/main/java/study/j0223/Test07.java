package study.j0223;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0223/Test07")
public class Test07 extends HttpServlet {

  
  private int parseScore(HttpServletRequest request, String paramName, StringBuilder errors) {
    String value = request.getParameter(paramName);

   
    if (value == null || value.trim().isEmpty()) {
      errors.append(paramName).append(" 점수가 비어있습니다. ");
      return -1; 
    }

    
    int score;
    try {
      score = Integer.parseInt(value.trim());
    } catch (NumberFormatException e) {
      errors.append(paramName).append(" 점수는 숫자만 입력해야 합니다. ");
      return -1;
    }

    
    if (score < 0 || score > 100) {
      errors.append(paramName).append(" 점수는 0~100 사이여야 합니다. ");
      return -1;
    }

    return score;
  }

  
  private String safeParam(HttpServletRequest request, String name) {
    String v = request.getParameter(name);
    return (v == null) ? "" : v.trim();
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    request.setCharacterEncoding("UTF-8");

    
    String name = safeParam(request, "name");
    String hakbun = safeParam(request, "hakbun");

    
    StringBuilder errors = new StringBuilder();

    int kor = parseScore(request, "kor", errors);
    int eng = parseScore(request, "eng", errors);
    int mat = parseScore(request, "mat", errors); 
    int soc = parseScore(request, "soc", errors);
    int sci = parseScore(request, "sci", errors);

    
    if (errors.length() > 0) {
      request.setAttribute("errorMsg", errors.toString());

      
      request.setAttribute("name", name);
      request.setAttribute("hakbun", hakbun);

      
      request.getRequestDispatcher("/study/0223/test07.jsp").forward(request, response);
      return;
    }

    
    int total = kor + eng + mat + soc + sci;
    double avg = total / 5.0;

    String grade;
    if (avg >= 90) grade = "A";
    else if (avg >= 80) grade = "B";
    else if (avg >= 70) grade = "C";
    else if (avg >= 60) grade = "D";
    else grade = "F";

    
    String ip = request.getRemoteAddr();

   
    request.setAttribute("name", name);
    request.setAttribute("hakbun", hakbun);
    request.setAttribute("kor", kor);
    request.setAttribute("eng", eng);
    request.setAttribute("mat", mat);
    request.setAttribute("soc", soc);
    request.setAttribute("sci", sci);
    request.setAttribute("total", total);
    request.setAttribute("avg", avg);
    request.setAttribute("grade", grade);
    request.setAttribute("ip", ip);

    request.getRequestDispatcher("/study/0223/test07Res.jsp")
           .forward(request, response);
  }
}