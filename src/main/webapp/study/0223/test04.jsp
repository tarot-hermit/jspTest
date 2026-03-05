<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String msg = request.getParameter("msg");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>test04.jsp</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    'use strict';
    
    if('<%=msg%>' == 'no') alert("로그인 실패~~~\n정보를 다시 입력해 주세요.");
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2 class="mb-3">이곳은 test04.jsp입니다.</h2>
  <form name="myform" method="post" action="<%=request.getContextPath()%>/j0223/Test04">
  	<div class="mb-3">아이디 : <input type="text" name="mid" value="hkd1234" class="form-control" /></div>
  	<div class="mb-3">비밀번호 : <input type="password" name="pwd" value="1234" class="form-control" /></div>
  	<div class="mb-3">
  	  <input type="submit" value="전송" class="btn btn-success" />
  	  <input type="reset" value="다시입력" class="btn btn-warning" />
  	</div>
  </form>
</div>
</body>
</html>