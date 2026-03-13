package study.j0223;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.vo.SungjukVO;

@SuppressWarnings("serial")
@WebServlet("/j0223/Test07")
public class Test07 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String hakbun = request.getParameter("hakbun")==null ? "" : request.getParameter("hakbun");		
		String hostIp = request.getParameter("hostIp")==null ? "" : request.getParameter("hostIp");		
		int kor = request.getParameter("kor")==null || request.getParameter("kor").equals("") ? 0 : Integer.parseInt(request.getParameter("kor"));		
		int eng = request.getParameter("eng")==null || request.getParameter("eng").equals("") ? 0 : Integer.parseInt(request.getParameter("eng"));		
		int mat = request.getParameter("mat")==null || request.getParameter("mat").equals("") ? 0 : Integer.parseInt(request.getParameter("mat"));		
		int soc = request.getParameter("soc")==null || request.getParameter("soc").equals("") ? 0 : Integer.parseInt(request.getParameter("soc"));		
		int sci = request.getParameter("sci")==null || request.getParameter("sci").equals("") ? 0 : Integer.parseInt(request.getParameter("sci"));	
		
		int tot = kor + eng + mat + soc + sci;
		double avg = tot / 5.0;
		String grade = "";
		
		if(avg >= 90) grade = "A";
		else if(avg >= 80) grade = "B";
		else if(avg >= 70) grade = "C";
		else if(avg >= 60) grade = "D";
		else grade = "F";
		
		SungjukVO vo = new SungjukVO(name, hakbun, kor, eng, mat, soc, sci, tot, avg, grade, hostIp);
		
		request.setAttribute("vo", vo);
		
		String viewPage = "/study/0223/test07Res.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
}
