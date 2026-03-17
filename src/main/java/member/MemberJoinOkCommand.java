package member;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.SecurityUtil;

public class MemberJoinOkCommand implements MemberInterface {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String realPath = request.getServletContext().getRealPath("/images/member");
    java.io.File dir = new java.io.File(realPath);
    if (!dir.exists()) dir.mkdirs();

    MultipartRequest multi = new MultipartRequest(
        request, realPath, 10 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy()
    );

    String mid      = multi.getParameter("mid")      == null ? "" : multi.getParameter("mid");
    String pwd      = multi.getParameter("pwd")      == null ? "" : multi.getParameter("pwd");
    String nickName = multi.getParameter("nickName") == null ? "" : multi.getParameter("nickName");
    String name     = multi.getParameter("name")     == null ? "" : multi.getParameter("name");
    String gender   = multi.getParameter("gender")   == null ? "" : multi.getParameter("gender");
    String birthday = multi.getParameter("birthday") == null ? "" : multi.getParameter("birthday");
    String tel      = multi.getParameter("tel")      == null ? "" : multi.getParameter("tel");
    String address  = multi.getParameter("address")  == null ? "" : multi.getParameter("address");
    String email    = multi.getParameter("email")    == null ? "" : multi.getParameter("email");
    String homePage = multi.getParameter("homePage") == null ? "" : multi.getParameter("homePage");
    String job      = multi.getParameter("job")      == null ? "" : multi.getParameter("job");
    String content  = multi.getParameter("content")  == null ? "" : multi.getParameter("content");
    String userInfor= multi.getParameter("userInfor")== null ? "" : multi.getParameter("userInfor");

    String[] hobbys = multi.getParameterValues("hobby");
    String hobby = "";
    if (hobbys != null && hobbys.length != 0) {
        for (String h : hobbys) hobby += h + "/";
        hobby = hobby.substring(0, hobby.lastIndexOf("/"));
    }

    // 사진 처리
    String savedPhoto = multi.getFilesystemName("fName");
    String photo = (savedPhoto != null) ? savedPhoto : "noimage.jpg";

    MemberDAO dao = new MemberDAO();
    if (dao.isReJoinBlocked(mid)) {
        request.setAttribute("message", "탈퇴 후 1달간 재가입이 불가합니다.");
        request.setAttribute("url", "MemberJoin.mem");
        return;
    }

    UUID uid = UUID.randomUUID();
    String salt = uid.toString().substring(0, 8);
    SecurityUtil security = new SecurityUtil();
    pwd = security.encryptSHA256(pwd + salt) + salt;

    MemberVO vo = new MemberVO();
    vo.setMid(mid);
    vo.setPwd(pwd);
    vo.setNickName(nickName);
    vo.setName(name);
    vo.setGender(gender);
    vo.setBirthday(birthday);
    vo.setTel(tel);
    vo.setAddress(address);
    vo.setEmail(email);
    vo.setHomePage(homePage);
    vo.setJob(job);
    vo.setHobby(hobby);
    vo.setPhoto(photo);
    vo.setContent(content);
    vo.setUserInfor(userInfor);

    int res = dao.setMemberJoinOk(vo);

    if (res != 0) {
        request.setAttribute("message", "회원 가입되셨습니다.\\n다시 로그인해 주세요.");
        request.setAttribute("url", "MemberLogin.mem");
    } else {
        request.setAttribute("message", "회원 가입 실패~~");
        request.setAttribute("url", "MemberJoin.mem");
    }
}
}