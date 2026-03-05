package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardUpdateCommand implements ReInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("이곳에서 게시판 DB에 수정처리한다.");
		
		request.setAttribute("name", "김말숙");
		request.setAttribute("content", "말숙이 소개서...");
		
		request.setAttribute("msg", "게시판 수정폼 보여주기 완료!!!");
	}

}
