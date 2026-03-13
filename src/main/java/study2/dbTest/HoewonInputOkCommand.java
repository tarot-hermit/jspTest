package study2.dbTest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HoewonInputOkCommand implements HoewonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		int age = (request.getParameter("age")==null) || (request.getParameter("age").equals("")) ? 0 : Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender")==null ? "" : request.getParameter("gender");
		String address = request.getParameter("address")==null ? "" : request.getParameter("address");
		
		HoewonDAO dao = new HoewonDAO();
		
		// 회원 동명 2인 조회....(성명 중복체크)
		HoewonVO vo = new HoewonVO();
		vo = dao.getHoewonSearch(name);
		//System.out.println("vo(23) : " + vo);
		if(vo.getName() != null) {
			request.setAttribute("message", "이미 등록된 성명이 존재합니다.\\n다른 이름을 사용하세요.");
			request.setAttribute("url", "HoewonInput.db");
			return;
		}
		
		vo.setName(name);
		vo.setAge(age);
		vo.setGender(gender);
		vo.setAddress(address);
		
		
		// 회원 등록처리
		int res = dao.setHoewonInputOk(vo);
		
		if(res != 0) {
			request.setAttribute("message", "회원 가입 되셨습니다.");
			request.setAttribute("url", "HoewonList.db");
		}
		else {
			request.setAttribute("message", "회원 가입 실패~~");
			request.setAttribute("url", "HoewonInput.db");
		}
	}

}
