package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;

public class MemberPwdCheckCommand implements MemberInterface {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String sMid = (String) session.getAttribute("sMid");

        String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");

        MemberDAO dao = new MemberDAO();
        MemberVO vo = dao.getMemberIdCheck(sMid);

        String result = "no";

        if (vo.getPwd() != null) {
            String salt   = vo.getPwd().substring(vo.getPwd().length() - 8);
            SecurityUtil security = new SecurityUtil();
            String encPwd = security.encryptSHA256(pwd + salt) + salt;

            if (vo.getPwd().equals(encPwd)) {
                result = "ok";
            }
        }

        response.setContentType("text/html; charset=UTF-8");
        response.getWriter().write(result);
    }
}
