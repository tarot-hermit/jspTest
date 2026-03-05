<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String mid = request.getParameter("mid");
  String pwd = request.getParameter("pwd");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>test5Ok.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>이곳은 test5Ok.jsp입니다.</h2>
  <div>아이디 : <%=mid %></div>
  <div>비밀번호 : <%=pwd %></div>
  <div><a href="test5.jsp">돌아가기</a></div>
</div>
</body>
</html>