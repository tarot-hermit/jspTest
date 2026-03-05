package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardInputCommand implements ReInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("이곳에서 게시판 등록 처리 를 DB에 저장 한다.");
		
		
		request.setAttribute("name", request.getParameter("name"));
		request.setAttribute("content", request.getParameter("content"));
		request.setAttribute("msg", "전송된 내용이 입력창에 표시됩니다.");
		
		
		
	}

}
