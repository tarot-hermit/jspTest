package study2.dbTest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HoewonUpdateCommand implements HoewonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		
		HoewonDAO dao = new HoewonDAO();
		
		HoewonVO vo = dao.getHoewonSearch(name);
		
		if(vo.getName() == null) {
			request.setAttribute("message", "검색하신 성명이 없습니다. 다시 검색하세요.");
			request.setAttribute("url", "DbTest.db");
			request.getRequestDispatcher("/include/message.jsp").forward(request, response);
			return;
		}
		else {
			request.setAttribute("vo", vo);
		}
		
	}

}
