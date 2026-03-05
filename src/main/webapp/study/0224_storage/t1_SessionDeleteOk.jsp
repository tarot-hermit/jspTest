<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t1_SessionDeleteOk.jsp -->
<%
	String sessionSw = request.getParameter("sessionSw");
	session.removeAttribute(sessionSw);
%>
<script>
  alert("선택된 세션이 삭제 되었습니다.");
  location.href = "t1_Session.jsp";
</script>