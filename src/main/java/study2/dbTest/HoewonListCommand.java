package study2.dbTest;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HoewonListCommand implements HoewonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HoewonDAO dao = new HoewonDAO();

		List<HoewonVO> vos = dao.getHoewonList();
		
		request.setAttribute("vos", vos);
		
	}

}
