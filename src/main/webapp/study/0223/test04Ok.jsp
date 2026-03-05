<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String mid = request.getParameter("mid");
  String pwd = request.getParameter("pwd");
  String age = request.getParameter("age");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>test04Ok.jsp</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    'use strict';
    
    function logoutOk() {
    	let ans = confirm("<%=mid%>님 로그아웃 하시겠습니까?");
    	if(ans) {
    		alert("<%=mid%>님 로그아웃 되었습니다.");
    		location.href = 'test04.jsp';
    	}
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>이곳은 test04Ok.jsp 입니다.</h2>
  <hr/>
  <p>아이디 : <%=mid%></p>
  <p>비밀번호 : <%=pwd%></p>
  <p><a href="javascript:logoutOk()" class="btn btn-success">로그아웃</a></p>
</div>
</body>
</html>