package study2.fileUpload;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import guest.GuestInterface;

public class FileDownloadCommand implements GuestInterface {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String fileName = request.getParameter("fileName");
        String savePath = request.getServletContext().getRealPath("/images/fileUpload");

        File file = new File(savePath + "/" + fileName);

        if (!file.exists()) {
            response.getWriter().println("파일이 존재하지 않습니다.");
            return;
        }

        String ext = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();

        String contentType;
        switch (ext) {
            case "jpg": case "jpeg": contentType = "image/jpeg";       break;
            case "png":              contentType = "image/png";         break;
            case "gif":              contentType = "image/gif";         break;
            case "pdf":              contentType = "application/pdf";   break;
            case "zip":              contentType = "application/zip";   break;
            case "hwp":              contentType = "application/x-hwp"; break;
            case "ppt": case "pptx": contentType = "application/vnd.ms-powerpoint"; break;
            case "xls": case "xlsx": contentType = "application/vnd.ms-excel";      break;
            case "txt":              contentType = "text/plain";        break;
            default:                 contentType = "application/octet-stream"; break;
        }

        String encodedFileName = java.net.URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");

        response.setContentType(contentType);
        response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFileName + "\"");
        response.setContentLength((int) file.length());

        FileInputStream fis = new FileInputStream(file);
        OutputStream os = response.getOutputStream();

        byte[] buffer = new byte[1024];
        int length;
        while ((length = fis.read(buffer)) > 0) {
            os.write(buffer, 0, length);
        }

        fis.close();
        os.flush();
    }
}