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
  <title>test4.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>이곳은 test4Ok.jsp입니다.(결과처리)</h2>
  <hr/>
  <div>아이디 : <%=mid %></div>
  <div>비밀번호 : <%=pwd %></div>
  <div>
    <a href="test4.jsp">전송</a>
  </div>
</div>
</body>
</html>