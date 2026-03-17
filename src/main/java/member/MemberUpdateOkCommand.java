package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MemberUpdateOkCommand implements MemberInterface {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String realPath = request.getServletContext().getRealPath("/images/member");
        java.io.File dir = new java.io.File(realPath);
        if (!dir.exists()) dir.mkdirs();

        MultipartRequest multi = new MultipartRequest(
            request, realPath, 10 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy()
        );

        HttpSession session = request.getSession();
        String sMid = (String) session.getAttribute("sMid");

        String nickName  = multi.getParameter("nickName")  == null ? "" : multi.getParameter("nickName");
        String name      = multi.getParameter("name")      == null ? "" : multi.getParameter("name");
        String gender    = multi.getParameter("gender")    == null ? "" : multi.getParameter("gender");
        String birthday  = multi.getParameter("birthday");
        if (birthday != null && birthday.trim().equals("")) birthday = null;
        String tel       = multi.getParameter("tel")       == null ? "" : multi.getParameter("tel");
        String address   = multi.getParameter("address")   == null ? "" : multi.getParameter("address");
        String email     = multi.getParameter("email")     == null ? "" : multi.getParameter("email");
        String homePage  = multi.getParameter("homePage")  == null ? "" : multi.getParameter("homePage");
        String job       = multi.getParameter("job")       == null ? "" : multi.getParameter("job");
        String content   = multi.getParameter("content")   == null ? "" : multi.getParameter("content");
        String userInfor = multi.getParameter("userInfor") == null ? "" : multi.getParameter("userInfor");

        String[] hobbys = multi.getParameterValues("hobby");
        String hobby = "";
        if (hobbys != null && hobbys.length != 0) {
            for (String h : hobbys) hobby += h + "/";
            hobby = hobby.substring(0, hobby.lastIndexOf("/"));
        }

        // 사진 처리 - 새 파일 선택시 교체, 없으면 기존 유지
        MemberDAO dao = new MemberDAO();
        MemberVO existVo = dao.getMemberIdCheck(sMid);
        String savedPhoto = multi.getFilesystemName("fName");
        String photo = (savedPhoto != null) ? savedPhoto : existVo.getPhoto();

        MemberVO vo = new MemberVO();
        vo.setMid(sMid);
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
        vo.setContent(content);
        vo.setUserInfor(userInfor);
        vo.setPhoto(photo);

        int res = dao.setMemberUpdate(vo);

        if (res != 0) {
            session.setAttribute("sNickName", nickName);
            session.setAttribute("sPhoto",    photo);  // ← 세션 사진 갱신
            request.setAttribute("message", "회원정보가 수정되었습니다.");
            request.setAttribute("url", "MemberMain.mem");
        } else {
            request.setAttribute("message", "회원정보 수정에 실패했습니다.");
            request.setAttribute("url", "MemberUpdateForm.mem");
        }
    }
}