package admin.member;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import admin.AdminInterface;
import member.MemberDAO;
import member.MemberVO;

public class AdminMemberListCommand implements AdminInterface {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MemberDAO dao = new MemberDAO();
        int currentPage = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
        int pageSize = 3;

        // ✅ 탈퇴 회원 포함 전체 건수
        int totalCount = dao.getAdminTotRecCnt();

        int totalPage = (totalCount % pageSize) == 0 ? (totalCount / pageSize) : (totalCount / pageSize) + 1;
        if (totalPage < 1) totalPage = 1;
        if (currentPage < 1) currentPage = 1;
        if (currentPage > totalPage) currentPage = totalPage;
        int startIndexNo = (currentPage - 1) * pageSize;
        int start = startIndexNo;
        int scrSize = 3;
        int curBlock = (currentPage - 1) / scrSize;
        int lastBlock = (totalPage - 1) / scrSize;

        List<MemberVO> vos = dao.getAdminMemberList(startIndexNo, pageSize);

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