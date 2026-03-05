package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardInputOkCommand implements ReInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		
		System.out.println("올린이 : " + name + ", 내용 : "+content+" , 이곳에서 게시판 DB에 저장처리한다.");
		
		request.setAttribute("message", "게시판 등록 완료!!!");
		request.setAttribute("url", "boardList.re");
	}

}
