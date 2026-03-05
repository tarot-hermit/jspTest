<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_ApplicationDeleteOk.jsp -->
<%
	String applicationSw = request.getParameter("applicationSw");
	application.removeAttribute(applicationSw);
%>
<script>
  alert("선택된 어플리케이션이 삭제 되었습니다.");
  location.href = "t2_Application.jsp";
</script>