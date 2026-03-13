package study2.dbTest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.db")
public class HoewonController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HoewonInterface command = null;
		String viewPage = "/WEB-INF/study2/dbTest/";
		
		String com = request.getRequestURI();	// www.naver.com:9090/springGreen/hoewon/HoewonList.db
		com = com.substring(com.lastIndexOf("/")+1, com.lastIndexOf("."));
		
		if(com.equals("DbTest")) {
			viewPage += "dbTest";
		}
		else if(com.equals("HoewonList")) {
			command = new HoewonListCommand();
			command.execute(request, response);
			viewPage += "hoewonList";
		}
		else if(com.equals("HoewonInput")) {
			viewPage += "hoewonInput";
		}
		else if(com.equals("HoewonInputOk")) {
			command = new HoewonInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message";
		}
		else if(com.equals("HoewonUpdate")) {
			command = new HoewonUpdateCommand();
			command.execute(request, response);
			viewPage += "hoewonUpdate";
		}
		else if(com.equals("HoewonUpdateOk")) {
			command = new HoewonUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message";
		}
		else if(com.equals("HoewonDelete")) {
			command = new HoewonDeleteCommand();
			command.execute(request, response);
			viewPage = "/include/message";
		}
		else if(com.equals("HoewonSearch")) {
			command = new HoewonSearchCommand();
			command.execute(request, response);
			viewPage += "hoewonSearch";
		}
		viewPage += ".jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
}
