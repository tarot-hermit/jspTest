package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GuestDeleteCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null || request.getParameter("idx").equals("") ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		GuestDAO dao = new GuestDAO();
		
		int res = dao.setGuestDeleteOk(idx);
		
		if(res != 0) {
			request.setAttribute("message", "방명록에 글이 삭제 되었습니다.");
		}
		else {
			request.setAttribute("message", "방명록 글삭제 실패~~~");
		}
		HttpSession session = request.getSession();
		int level = (int) session.getAttribute("sLevel");
		if(level == 0) request.setAttribute("url", "AdminGuestList.ad");
		else request.setAttribute("url", "GuestList.gu");
		
	}

}
