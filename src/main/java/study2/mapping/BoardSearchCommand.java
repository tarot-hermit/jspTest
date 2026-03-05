package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardSearchCommand implements ReInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("이곳에서 게시판 개별자료를 DB에서 가져와 가공처리한다.");
		
		request.setAttribute("msg", "게시판 개별조회 완료!!!");
	}

}
