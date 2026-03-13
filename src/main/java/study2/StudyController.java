package study2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guest.GuestInterface;
import study2.ajax.AjaxCheck1Command;
import study2.ajax.AjaxCheck2Command;
import study2.modal.ModalFormOkCommand;
import study2.password.PasswordCheckCommand;

@SuppressWarnings("serial")
@WebServlet("*.st")
public class StudyController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestInterface command = null;
		String viewPage = "/WEB-INF/study2/";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/")+1, com.lastIndexOf("."));
		
		if(com.equals("GuestList")) {
//			command = new GuestListCommand();
//			command.execute(request, response);
//			viewPage += "guestList";
		}
		else if(com.equals("Password")) {
			viewPage += "password/password";
		}
		else if(com.equals("PasswordCheck")) {
			command = new PasswordCheckCommand();
			command.execute(request, response);
			viewPage += "password/password";
		}
		else if(com.equals("AjaxForm")) {
			viewPage += "ajax/ajaxForm";
		}
		else if(com.equals("AjaxCheck1")) {
			command = new AjaxCheck1Command();
			command.execute(request, response);
			viewPage += "ajax/ajaxForm";
		}
		else if(com.equals("AjaxCheck2")) {
			command = new AjaxCheck2Command();
			command.execute(request, response);
			return;
		}
		else if(com.equals("UUIDForm")) {
			viewPage += "uuid/uuidForm";
		}
		else if(com.equals("ModalForm")) {
			viewPage += "modal/modalForm";
		}
		else if(com.equals("ModalFormOk")) {
			command = new ModalFormOkCommand();
			command.execute(request, response);
			viewPage += "modal/modalForm";
		}

		viewPage += ".jsp";
		
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
}
