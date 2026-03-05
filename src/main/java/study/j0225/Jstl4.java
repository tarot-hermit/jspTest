package study.j0225;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.vo.TestVO;

@SuppressWarnings("serial")
@WebServlet("/j0225/Jstl4")
public class Jstl4 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String message = "Welcome to My HomePage!!!";
		request.setAttribute("message", message);
		
		String[][] members = {
				{"홍길동","23","서울"},
				{"김말숙","26","청주"},
				{"이기자","33","제주"},
				{"강감찬","45","인천"},
				{"김연아","19","서울"}
		};
		request.setAttribute("members", members);
		
		List<TestVO> vos = new ArrayList<TestVO>();
		TestVO vo = null;
		for(int i=1; i<=10; i++) {
			vo = new TestVO();
			vo.setMid("hkd"+i);
			vo.setName("홍길동"+i);
			vo.setAge(25+i);
			vo.setAddress("서울"+i);
			vos.add(vo);
		}
		request.setAttribute("vos", vos);
		
		String viewPage = "/study/0225/jstl4.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
}
