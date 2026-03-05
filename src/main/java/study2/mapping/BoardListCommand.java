package study2.mapping;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.vo.TestVO;

public class BoardListCommand implements ReInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("이곳에서 전체리스트를 DB에서 가져와서 가공처리한다.");
		
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
		
		
		request.setAttribute("msg", "전체리스트 완료!!!");
	}

}
