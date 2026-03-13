<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>test2.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>이곳은 test2.jsp입니다.</h2>
  <hr/>
  <!-- <div><a href="/springGreen/Test2">Test2요청</a></div> -->
  <div><a href="<%=request.getContextPath() %>/Test2">Test2요청</a></div>
</div>
</body>
</html>