package study2.fileUpload;

import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import guest.GuestInterface;

public class FileUpload2OkCommand implements GuestInterface {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String realPath = request.getServletContext().getRealPath("/images/fileUpload");
        java.io.File dir = new java.io.File(realPath);
        if (!dir.exists()) dir.mkdirs();

        MultipartRequest multi = new MultipartRequest(
            request, realPath, 10 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy()
        );

        String title  = multi.getParameter("title");
        String writer = multi.getParameter("writer");

        List<String> allowedExt = Arrays.asList(
            "jpg","jpeg","gif","png","zip","hwp",
            "ppt","pptx","xls","xlsx","doc","pdf","txt"
        );

        List<String> savedNames  = new ArrayList<>();
        List<String> originNames = new ArrayList<>();
        List<String> errorList   = new ArrayList<>();

        @SuppressWarnings("unchecked")
        java.util.Enumeration<String> fileNames = multi.getFileNames();
        while(fileNames.hasMoreElements()) {
            String inputName  = fileNames.nextElement();
            String savedName  = multi.getFilesystemName(inputName);
            String originName = multi.getOriginalFileName(inputName);
            
            // 디버그
            System.out.println("inputName: " + inputName + ", savedName: " + savedName + ", originName: " + originName);
            
            
           

            if(savedName == null) continue;

            String ext = savedName.substring(savedName.lastIndexOf(".") + 1).toLowerCase();

            if(!allowedExt.contains(ext)) {
                new java.io.File(realPath + "/" + savedName).delete();
                errorList.add("[" + originName + "] 허용되지 않는 파일 형식입니다.");
                continue;
            }

            java.io.File uploadedFile = new java.io.File(realPath + "/" + savedName);
            if(uploadedFile.length() > 10 * 1024 * 1024) {
                uploadedFile.delete();
                errorList.add("[" + originName + "] 파일 크기는 10MB를 초과할 수 없습니다.");
                continue;
            }

            saveInfo(realPath, savedName, title, writer);

            savedNames.add(savedName);
            originNames.add(originName);
        }

        if(savedNames.isEmpty() && errorList.isEmpty()) {
            errorList.add("파일을 선택해주세요.");
        }

        if(!errorList.isEmpty()) {
            request.setAttribute("errorList", errorList);
            request.setAttribute("title",  title);
            request.setAttribute("writer", writer);
            request.setAttribute("isError", "Y");
            return;
        }

        String[] fileList = dir.list();
        request.setAttribute("title",       title);
        request.setAttribute("writer",      writer);
        request.setAttribute("savedNames",  savedNames);
        request.setAttribute("originNames", originNames);
        request.setAttribute("fileList",    fileList);
    }

    private void saveInfo(String realPath, String savedName, String title, String writer) {
        if(savedName == null) return;
        try {
            java.io.FileWriter fw = new java.io.FileWriter(
                realPath + "/" + savedName + ".info",
                java.nio.charset.StandardCharsets.UTF_8
            );
            fw.write((title != null ? title : "") + "|" + (writer != null ? writer : ""));
            fw.close();
        } catch(Exception e) {
            
        }
    }
}