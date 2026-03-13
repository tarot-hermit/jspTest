package admin.guest;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminInterface;
import guest.GuestDAO;
import guest.GuestVO;

public class AdminGuestListCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestDAO dao = new GuestDAO();
				
				// 1.현재 페이지번호를 구해온다.
		int currentPage = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		
		// 2. 한페이지의 분량을 정해준다.
		int pageSize = 3;
		
		// 3. 총 레코드 건수 구한다.
		int totalCount = dao.getTotRecCnt();
		
		// 4. 총 페이지 수를 구한다.
		int totalPage = (totalCount % pageSize) == 0 ? (totalCount / pageSize) : (totalCount / pageSize) + 1;
		if (totalPage < 1) totalPage = 1; // 최소 1페이지 보정
		
		// 5. 현재페이지 범위 보정
		if (currentPage < 1) currentPage = 1;
		if (currentPage > totalPage) currentPage = totalPage;
		
		// 6. 현재페이지에 출력할 시작 인덱스 번호
		int startIndexNo = (currentPage - 1) * pageSize;
		
		// 7. 현재 화면에 표시될 시작 글번호
		int start = startIndexNo;
		
		// 8. 블록의 크기결정
		int scrSize = 3;
		
		// 9. 현재페이지가 속한 블록의 번호
		int curBlock = (currentPage - 1) / scrSize;
		
		// 10. 마지막블록 구한다.
		int lastBlock = (totalPage - 1) / scrSize;
		
		List<GuestVO> vos = dao.getGuestList(startIndexNo, pageSize);
		
		request.setAttribute("vos", vos);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("start", start);
		request.setAttribute("scrSize", scrSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		}
		}