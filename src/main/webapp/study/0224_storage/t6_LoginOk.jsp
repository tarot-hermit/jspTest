<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t6_LoginOk.jsp -->
<%
	String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
	String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");

	if(!mid.equals("admin") || !pwd.equals("1234")) {
%>
		<script>
		  alert("로그인 실패~~\n회원정보를 확인하신후 다시 로그인해주세요.");
		  location.href = "t6_Login.jsp";
		</script>
<%
  } 
	else { 
	  session.setAttribute("sLogin", "OK");
%>
		<script>
		  alert("<%=mid%>님 로그인 되셨습니다.");
		  location.href = "t6_LoginMain.jsp";
		</script>
<%} %>