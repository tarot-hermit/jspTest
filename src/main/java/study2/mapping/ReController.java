package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.re")
public class ReController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReInterface command = null;
		String viewPage = "/WEB-INF/study2/mapping/";
		
		String uri = request.getRequestURI();
		
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		
		if(com.equals("boardList")) {
			command = new BoardListCommand();
			command.execute(request, response);
			viewPage += "boardList";
		}
		else if(com.equals("boardInput")) {
			viewPage += "boardInput";
		}
		else if(com.equals("boardInputOk")) {
			command = new BoardInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message";
		}
		else if(com.equals("boardUpdate")) {
			command = new BoardUpdateCommand();
			command.execute(request, response);
			viewPage += "boardUpdate";
		}
		else if(com.equals("boardUpdateOk")) {
			command = new BoardUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message";
		}
		else if(com.equals("boardDelete")) {
			command = new BoardDeleteCommand();
			command.execute(request, response);
			viewPage += "boardDelete";
		}
		else if(com.equals("boardSearch")) {
			command = new BoardSearchCommand();
			command.execute(request, response);
			viewPage += "boardSearch";
		}
		
		viewPage += ".jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
}
