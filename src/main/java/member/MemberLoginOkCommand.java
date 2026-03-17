package member;

import java.io.IOException;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import common.SecurityUtil;

public class MemberLoginOkCommand implements MemberInterface {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");

		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberIdCheck(mid);

		if (vo.getPwd() == null) {
			request.setAttribute("message", "로그인 실패~~\\n다시 로그인해 주세요.");
			request.setAttribute("url", "MemberLogin.mem");
			return;
		}

		// salt 추출 후 암호화
		String salt = vo.getPwd().substring(vo.getPwd().length() - 8);
		SecurityUtil security = new SecurityUtil();
		String encPwd = security.encryptSHA256(pwd + salt) + salt;

		// 암호화된 값으로 비교
		if (!vo.getPwd().equals(encPwd)) {
			request.setAttribute("message", "로그인 실패~~\\n다시 로그인해 주세요.");
			request.setAttribute("url", "MemberLogin.mem");
			return;
		}
		if ("Y".equals(vo.getUserDel())) {
	    request.setAttribute("message", "탈퇴한 회원입니다.\\n같은 아이디로 1달간 재가입 할 수 없습니다.");
	    request.setAttribute("url", "MemberLogin.mem");
	    return;
	}

		// ── 쿠키 처리 ──────────────────────────────────────
		String idSave = request.getParameter("idSave") == null ? "off" : request.getParameter("idSave");
		Cookie cookieMid = new Cookie("cMid", mid);
		cookieMid.setPath("/");
		if (idSave.equals("on")) cookieMid.setMaxAge(60 * 60 * 24 * 7);
		else cookieMid.setMaxAge(0);
		response.addCookie(cookieMid);

		// ── 세션 처리 ──────────────────────────────────────
		String strLevel = "";
		if      (vo.getLevel() == 0) strLevel = "관리자";
		else if (vo.getLevel() == 1) strLevel = "준회원";
		else if (vo.getLevel() == 2) strLevel = "정회원";
		else if (vo.getLevel() == 3) strLevel = "우수회원";

		HttpSession session = request.getSession();
		session.setAttribute("sMid",      mid);
		session.setAttribute("sNickName", vo.getNickName());
		session.setAttribute("sLevel",    vo.getLevel());
		session.setAttribute("strLevel",  strLevel);
		session.setAttribute("sPhoto",    vo.getPhoto());   
		session.setAttribute("sPoint",    vo.getPoint());  

		// ── 로그인 포인트 지급 (+10p, 하루 3회 제한) ───────
		// ※ setMemberPointPlus 안에서 visitCnt 를 더 이상 건드리지 않음
		dao.setMemberPointPlus(mid);

		// ── 방문수 처리: 날짜가 다를 때만 visitCnt +1 ──────
		String lastDate = vo.getLastDate(); // "yyyy-MM-dd HH:mm:ss" 형식
		String today    = LocalDate.now().toString(); // "yyyy-MM-dd"

		boolean isNewDay = (lastDate == null) || !lastDate.substring(0, 10).equals(today);

		if (isNewDay) {
			// 오늘 처음 방문 → visitCnt +1, lastDate 갱신
			dao.updateVisitCntAndLastDate(mid);
		} else {
			// 오늘 재방문 → lastDate(최근접속)만 갱신, visitCnt 유지
			dao.updateLastDate(mid);
		}

		

		request.setAttribute("message", mid + "님 로그인 되었습니다.");
		request.setAttribute("url",     "MemberMain.mem");
	}
}
