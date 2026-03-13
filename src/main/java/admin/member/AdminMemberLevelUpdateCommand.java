package admin.member;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import admin.AdminInterface;
import member.MemberDAO;

public class AdminMemberLevelUpdateCommand implements AdminInterface {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String mid = request.getParameter("mid");
        int level = Integer.parseInt(request.getParameter("level"));

        MemberDAO dao = new MemberDAO();
        int res = dao.setMemberLevelUpdate(mid, level);

        if (res != 0) {
            request.setAttribute("message", mid + "님의 레벨이 변경되었습니다.");
        } else {
            request.setAttribute("message", "레벨 변경 실패");
        }
        request.setAttribute("url", "AdminMemberList.ad");
    }
}