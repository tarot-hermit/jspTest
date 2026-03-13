<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>test7.jsp</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>이곳은 test7.jsp입니다.</h2>
  <form name="myform" method="post" action="<%=request.getContextPath()%>/Test7">
  	<div>아이디 : <input type="text" name="mid" value="hkd1234" class="form-control" /></div>
  	<div>비밀번호 : <input type="password" name="pwd" value="1234" class="form-control" /></div>
  	<div>성명 : <input type="text" name="name" value="홍길동" class="form-control" /></div>
  	<div>나이 : <input type="number" name="age" value="20" class="form-control" /></div>
  	<div>성별 : 
  	  <input type="radio" name="gender" value="남자" />남자
  	  <input type="radio" name="gender" value="여자" checked />여자
  	</div>
  	<div>직업 : 
  	  <select name="job" class="form-select">
  	    <option selected>학생</option>
  	    <option>회사원</option>
  	    <option>공무원</option>
  	    <option>군인</option>
  	    <option>기타</option>
  	  </select>
  	</div>
  	<div>주소 : <input type="text" name="address" value="서울" class="form-control" /></div>
  	<div>자기소개 : <textarea rows="5" name="content" class="form-control"></textarea></div>
  	<div><input type="submit" value="전송" class="btn btn-success" /></div>
  </form>
</div>
</body>
</html>