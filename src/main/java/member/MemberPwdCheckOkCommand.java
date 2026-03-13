package member;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;

public class MemberPwdCheckOkCommand implements MemberInterface {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String sMid = (String) session.getAttribute("sMid");

        String newPwd = request.getParameter("newPwd") == null ? "" : request.getParameter("newPwd");

        UUID uid  = UUID.randomUUID();
        String salt   = uid.toString().substring(0, 8);
        SecurityUtil security = new SecurityUtil();
        String encPwd = security.encryptSHA256(newPwd + salt) + salt;

        MemberDAO dao = new MemberDAO();
        int res = dao.setMemberPwdUpdate(sMid, encPwd);

        if (res != 0) {
        		session.invalidate();
            request.setAttribute("message", "비밀번호가 변경되었습니다.");
            request.setAttribute("url", "MemberMain.mem");
        } else {
            request.setAttribute("message", "비밀번호 변경에 실패했습니다.");
            request.setAttribute("url", "MemberPwdCheck.mem");
        }
    }
}
