<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>test01.jsp</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2 class="mb-3">이곳은 test01.jsp입니다.</h2>
  <!-- <form name="myform" method="post" action="/j0223/Test01"> -->
  <form name="myform" method="post" action="<%=request.getContextPath()%>/j0223/Test01">
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