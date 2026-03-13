package study2.dbTest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HoewonDeleteCommand implements HoewonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		
		HoewonDAO dao = new HoewonDAO();
		
		// 회원 정보 삭제처리
		int res = dao.setHoewonDelete(name);
		
		if(res != 0) {
			request.setAttribute("message", "회원 정보가 삭제 되었습니다.");
			request.setAttribute("url", "HoewonList.db");
		}
		else {
			request.setAttribute("message", "회원 정보 삭제 실패~~");
			request.setAttribute("url", "DbTest.db");
		}
	}

}
