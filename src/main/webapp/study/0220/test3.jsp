<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>test3.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>이곳은 test3.jsp입니다.(QueryString방식)</h2>
  <hr/>
  <div><a href="<%=request.getContextPath() %>/Test3">Test3요청1</a></div>
  <div><a href="<%=request.getContextPath() %>/Test3?name=홍길동1234abcd">Test3요청2</a></div>
</div>
</body>
</html>