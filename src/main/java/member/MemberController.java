package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.mem")
public class MemberController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        MemberInterface command = null;
        String viewPage = "/WEB-INF/member/";
        
        HttpSession session = request.getSession();
        int level = session.getAttribute("sLevel") == null ? 999 : (int) session.getAttribute("sLevel");
        
        String com = request.getRequestURI();
        com = com.substring(com.lastIndexOf("/") + 1, com.lastIndexOf("."));
        
        // ✅ 로그인 없이 접근 가능한 것들
        if (com.equals("MemberLogin")) {
            command = new MemberLoginCommand();
            command.execute(request, response);
            viewPage += "memberLogin";
        }
        else if (com.equals("MemberLoginOk")) {
            command = new MemberLoginOkCommand();
            command.execute(request, response);
            viewPage = "/include/message";
        }
        else if (com.equals("MemberJoin")) {
            viewPage += "memberJoin";
        }
        else if (com.equals("MemberJoinOk")) {
            command = new MemberJoinOkCommand();
            command.execute(request, response);
            viewPage = "/include/message";
        }
        else if (com.equals("IdSearch")) {
            command = new IdSearchCommand();
            command.execute(request, response);
            return;
        }
        else if (com.equals("NickSearch")) {
            command = new NickSearchCommand();
            command.execute(request, response);
            return;
        }
        
        // ✅ 로그인 체크 (이 아래는 로그인 필수)
        else if (level == 999) {
            response.sendRedirect(request.getContextPath() + "/MemberLogin.mem");
            return;
        }
        
        // ✅ 로그인한 사용자만 접근 가능
        else if (com.equals("MemberLogout")) {
            command = new MemberLogoutCommand();
            command.execute(request, response);
            viewPage = "/include/message";
        }
        else if (com.equals("MemberMain")) {
            command = new MemberMainCommand();
            command.execute(request, response);
            viewPage += "memberMain";
        }
        else if (com.equals("MemberList")) {
            command = new MemberListCommand();
            command.execute(request, response);
            viewPage += "memberList";
        }
        else if (com.equals("MemberDelete")) {  // ✅ 이제 정상 실행됨
            command = new MemberDeleteCommand();
            command.execute(request, response);
            viewPage = "/include/message";
        }
        else if (com.equals("MemberPwdCheck")) {
          command = new MemberPwdCheckCommand();
          command.execute(request, response);
          return; 
	      }
	
	      else if (com.equals("MemberPwdCheckOk")) {
	          command = new MemberPwdCheckOkCommand();
	          command.execute(request, response);
	          viewPage = "/include/message";
	      }
	      else if (com.equals("MemberUpdateForm")) {
	      	command = new MemberUpdateFormCommand();
	      	command.execute(request, response);
	      	viewPage += "memberUpdateForm";
	      }
	      else if (com.equals("MemberUpdateOk")) {
	      	command = new MemberUpdateOkCommand();
	      	command.execute(request, response);
	      	viewPage = "/include/message";
	      }
	
	      else if (com.equals("MemberPwdCheckForm")) {
	          viewPage += "memberPwdCheck";
	      }

        
        viewPage += ".jsp";
        request.getRequestDispatcher(viewPage).forward(request, response);
    }
}