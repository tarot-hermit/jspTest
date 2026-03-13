<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>test6.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>이곳은 test6.jsp입니다.</h2>
  <form name="myform" method="post" action="<%=request.getContextPath()%>/Test6">
  	<div>아이디 : <input type="text" name="mid" value="hkd1234" /></div>
  	<div>비밀번호 : <input type="password" name="pwd" value="1234" /></div>
  	<div><input type="submit" value="전송" /></div>
  </form>
</div>
</body>
</html>