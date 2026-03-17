package study2.fileUpload;

import java.io.File;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import guest.GuestInterface;

public class FileDeleteCommand implements GuestInterface {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

    		String[] deleteFiles = request.getParameterValues("deleteFiles");

        if (deleteFiles != null && deleteFiles.length > 0) {
            String savePath = request.getServletContext().getRealPath("/images/fileUpload");

            for (String fileName : deleteFiles) {
                if (fileName.contains("..") || fileName.contains("/") || fileName.contains("\\")) {
                    continue;
                }
                File file = new File(savePath + File.separator + fileName);
                if (file.exists()) {
                    file.delete();
                }
            }
        }
    }
}