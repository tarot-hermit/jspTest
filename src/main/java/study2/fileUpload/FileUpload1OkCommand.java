package study2.fileUpload;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import guest.GuestInterface;

public class FileUpload1OkCommand implements GuestInterface {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String realPath = request.getServletContext().getRealPath("/images/fileUpload");
        java.io.File dir = new java.io.File(realPath);
        if (!dir.exists()) dir.mkdirs();

        MultipartRequest multi = new MultipartRequest(
            request, realPath, 10 * 1024 * 1024, "UTF-8"
        );

        String title      = multi.getParameter("title");
        String writer     = multi.getParameter("writer");
        String savedName  = multi.getFilesystemName("uploadFile");
        String originName = multi.getOriginalFileName("uploadFile");

        java.util.List<String> errorList = new java.util.ArrayList<String>();

        if (title == null || title.trim().isEmpty()) {
            errorList.add("제목을 입력해주세요.");
        }
        if (writer == null || writer.trim().isEmpty()) {
            errorList.add("작성자를 입력해주세요.");
        }
        if (savedName == null) {
            errorList.add("파일을 선택해주세요.");
        } else {
            String ext = savedName.substring(savedName.lastIndexOf(".") + 1).toLowerCase();
            List<String> allowedExt = Arrays.asList("jpg", "jpeg", "gif", "png", "zip", "hwp", "ppt", "pptx", "xls", "xlsx", "doc", "pdf", "txt");
            if (!allowedExt.contains(ext)) {
                new java.io.File(realPath + "/" + savedName).delete();
                errorList.add("허용되지 않는 파일 형식입니다.");
            } else {
                java.io.File uploadedFile = new java.io.File(realPath + "/" + savedName);
                if (uploadedFile.exists() && uploadedFile.length() > 10 * 1024 * 1024) {
                    uploadedFile.delete();
                    errorList.add("파일 크기는 10MB를 초과할 수 없습니다.");
                }
            }
        }

        if (!errorList.isEmpty()) {
            request.setAttribute("errorList", errorList);
            request.setAttribute("title",  title);
            request.setAttribute("writer", writer);
            request.setAttribute("isError", "Y");
            return;
        }

        // .info 파일 저장 (제목|작성자)
        try {
            java.io.FileWriter fw = new java.io.FileWriter(
                realPath + "/" + savedName + ".info",
                java.nio.charset.StandardCharsets.UTF_8
            );
            fw.write(title + "|" + writer);
            fw.close();
        } catch (Exception e) {
            // info 저장 실패해도 업로드는 정상 처리
        }

        String[] fileList = dir.list();
        request.setAttribute("title",      title);
        request.setAttribute("writer",     writer);
        request.setAttribute("savedName",  savedName);
        request.setAttribute("originName", originName);
        request.setAttribute("fileList",   fileList);
    }
}