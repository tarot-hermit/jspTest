package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
//@WebServlet("*.re")
public class ReController2 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("이곳은 ReController 입니다.");
		
		String uri = request.getRequestURI();
		//System.out.println("uri : " + uri);
		
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		//System.out.println("com : " + com);
		
		if(com.equals("boardList")) {
			System.out.println("게시판 전체보기 처리.....");
		}
		else if(com.equals("boardInput")) {
			System.out.println("게시판 등록 처리.....");
		}
		else if(com.equals("boardUpdate")) {
			System.out.println("게시판 수정 처리.....");
		}
		else if(com.equals("boardDelete")) {
			System.out.println("게시판 삭제 처리.....");
		}
		else if(com.equals("boardSearch")) {
			System.out.println("게시판 개별조회 처리.....");
		}
		
		String viewPage = "/WEB-INF/study2/mapping/test2.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
}
