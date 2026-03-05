package common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/Main")
public class Main extends HttpServlet {

  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    
    List<String> imgs = new ArrayList<>();
    for (int i = 11; i <= 20; i++) {
      imgs.add( i + ".jpg");
    }

    Collections.shuffle(imgs);
    List<String> pick5_1 = new ArrayList<>(imgs.subList(0, 5));

    
    Collections.shuffle(imgs);
    List<String> pick5_2 = new ArrayList<>(imgs.subList(0, 5));

    
    request.setAttribute("mainImgs1", pick5_1);
    request.setAttribute("mainImgs2", pick5_2);


    String viewPage = "/main/main.jsp";
    RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
    dispatcher.forward(request, response);
  }
}