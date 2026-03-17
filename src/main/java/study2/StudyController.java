package study2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guest.GuestInterface;
import study2.ajax.AjaxCheck1Command;
import study2.ajax.AjaxCheck2Command;
import study2.fileUpload.FileDeleteCommand;
import study2.fileUpload.FileDownloadCommand;
import study2.fileUpload.FileUpload1OkCommand;
import study2.fileUpload.FileUpload2OkCommand;
import study2.modal.ModalFormOkCommand;
import study2.password.PasswordCheckCommand;

@SuppressWarnings("serial")
@WebServlet("*.st")
public class StudyController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestInterface command = null;
		String viewPage = "/WEB-INF/study2/";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/")+1, com.lastIndexOf("."));
		
		if(com.equals("GuestList")) {
//			command = new GuestListCommand();
//			command.execute(request, response);
//			viewPage += "guestList";
		}
		else if(com.equals("Password")) {
			viewPage += "password/password";
		}
		else if(com.equals("PasswordCheck")) {
			command = new PasswordCheckCommand();
			command.execute(request, response);
			viewPage += "password/password";
		}
		else if(com.equals("AjaxForm")) {
			viewPage += "ajax/ajaxForm";
		}
		else if(com.equals("AjaxCheck1")) {
			command = new AjaxCheck1Command();
			command.execute(request, response);
			viewPage += "ajax/ajaxForm";
		}
		else if(com.equals("AjaxCheck2")) {
			command = new AjaxCheck2Command();
			command.execute(request, response);
			return;
		}
		else if(com.equals("UUIDForm")) {
			viewPage += "uuid/uuidForm";
		}
		else if(com.equals("ModalForm")) {
			viewPage += "modal/modalForm";
		}
		else if(com.equals("ModalFormOk")) {
			command = new ModalFormOkCommand();
			command.execute(request, response);
			viewPage += "modal/modalForm";
		}
		else if(com.equals("FileUploadForm")) {	
			viewPage += "fileUpload/fileUploadForm";
		}
		else if(com.equals("FileUpload1Ok")) {
	    command = new FileUpload1OkCommand();
	    command.execute(request, response);

	    if("Y".equals(request.getAttribute("isError"))) {
	        viewPage += "fileUpload/fileUploadForm";  // 폼으로 돌아가기
	    } else {
	        viewPage += "fileUpload/fileUploadResult"; // 결과 페이지
	    }
	}
		else if(com.equals("FileUploadForm2")) {	
			viewPage += "fileUpload/fileUploadForm2";
		}
		else if(com.equals("FileUpload2Ok")) {
	    command = new FileUpload2OkCommand();
	    command.execute(request, response);
	    if("Y".equals(request.getAttribute("isError"))) {
	        viewPage += "fileUpload/fileUploadForm2"; // 에러시 폼으로
	    } else {
	        viewPage += "fileUpload/fileUploadResult"; // 결과 페이지
	    }
	}
		else if(com.equals("FileDownloadForm")) {
	    String savePath = request.getServletContext().getRealPath("/images/fileUpload");
	    java.io.File dir = new java.io.File(savePath);
	    if(!dir.exists()) dir.mkdirs();

	    String[] fileList = dir.list((d, name) -> {
	        java.io.File f = new java.io.File(d, name);
	        return f.isFile() && !name.startsWith(".") && !name.endsWith(".info"); // info 파일 제외
	    });

	    if(fileList != null && fileList.length > 0) {
	        java.util.Arrays.sort(fileList);
	    } else {
	        fileList = new String[0];
	    }

	    java.util.Map<String, String> titleMap = new java.util.HashMap<>();
	    for(String f : fileList) {
	        java.io.File infoFile = new java.io.File(savePath + "/" + f + ".info");
	        if(infoFile.exists()) {
	            java.util.Scanner sc = new java.util.Scanner(infoFile, "UTF-8");
	            titleMap.put(f, sc.nextLine());
	            sc.close();
	        }
	    }

	    request.setAttribute("fileList",  fileList);
	    request.setAttribute("titleMap",  titleMap);
	    viewPage += "fileUpload/fileDownloadForm";
	}
		else if(com.equals("FileDownload")) {
	    command = new FileDownloadCommand();
	    command.execute(request, response);
	    return; 
	}
		else if(com.equals("FileDelete")) {
	    command = new FileDeleteCommand();
	    command.execute(request, response);
	    response.sendRedirect(request.getContextPath() + "/FileDownloadForm.st");
	    return;
	}
		

		viewPage += ".jsp";
		
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
}
