package study2.password;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;
import guest.GuestInterface;

public class PasswordCheckCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		int flag = request.getParameter("flag")==null || request.getParameter("flag").equals("") ? 1 : Integer.parseInt(request.getParameter("flag"));

		System.out.println("* 원본자료 *");
		System.out.println("pwd : " + pwd);
		
		HttpSession session = request.getSession();
		
		if(flag == 1) {
			// 숫자만 암호화 하는 경우... 암호키(0x1234ABCD)
			int key = 0x1234ABCD;
			int encPwd, decPwd;
			
			encPwd = Integer.parseInt(pwd) ^ key;
			
			System.out.println("인코딩된 비밀번호 : " + encPwd);
			
			decPwd = encPwd ^ key;
			
			System.out.println("디코딩된 비밀번호 : " + decPwd);
		}
		else if(flag == 2) {
			// 숫자와 문자 암호화 하는 경우... 암호키(0x1234ABCD)
			long key = 0x1234ABCD;
			long intPwd, encPwd, decPwd;
			
			String strPwd = "";
			
			for(int i=0; i<pwd.length(); i++) {
				intPwd = (long) pwd.charAt(i);
				strPwd += intPwd;
			}
			System.out.println("조합된 자료 : " + strPwd);
			
			intPwd = Long.parseLong(strPwd);
			
			
			encPwd = intPwd ^ key;
			
			System.out.println("인코딩된 비밀번호 : " + encPwd);
			
//			decPwd = encPwd ^ key;
//			
//			System.out.println("디코딩된 비밀번호 : " + decPwd);
		}
		else if(flag == 3) {
			String encPwd = "";
			
			SecurityUtil security = new SecurityUtil();
			encPwd = security.encryptSHA256(pwd);
			
			System.out.println("인코딩된 비밀번호 : " + encPwd);
		}
		else if(flag == 4) {
			String encPwd = "";
			int salt = (int)(Math.random()*(9999-1000+1)) + 1000;
			System.out.println("salt : " + salt);
			SecurityUtil security = new SecurityUtil();
			encPwd = security.encryptSHA256(pwd+salt)+salt;
			// 앞에서 만들어준 암호화 비밀번호와 salt값을 같이 포함시켜 DB에 저장한다.(dbPwd)
			session.setAttribute("sPwd", encPwd);
			
			System.out.println("인코딩된 비밀번호 : " + encPwd);
		}
		else if(flag == 5) {
			// 4번에서 입력한 비밀번호와 같은지 판별한다.
			// DB에 저장된 비밀번호를 가져와서, salt값만을 추출한다.
			String encPwd = "";
			String dbPwd = (String) session.getAttribute("sPwd");
			System.out.println("dbPwd : " + dbPwd);
			
			String salt = dbPwd.substring(dbPwd.length()-4);
			System.out.println("salt : " + salt);
			
			SecurityUtil security = new SecurityUtil();
			encPwd = security.encryptSHA256(pwd+salt)+salt;
			// 앞에서 만들어준 암호화 비밀번호와 salt값을 같이 포함시켜 DB에 저장한다.
			
			System.out.println("비밀번호 확인: " + encPwd);
		}
	}

}
