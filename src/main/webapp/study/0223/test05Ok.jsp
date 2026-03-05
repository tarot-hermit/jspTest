<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>test05Ok.jsp</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>이곳은 test05Ok.jsp 입니다.</h2>
  <hr/>
  <p>아이디 : ${vo.mid}</p>
  <p>비밀번호 : ${vo.pwd}</p>
  <p>성명 : ${vo.name}</p>
  <p>나이 : ${vo.age}</p>
  <p>성별 : ${vo.gender}</p>
  <p>직업 : ${vo.job}</p>
  <p>주소 : ${vo.address}</p>
  <p>자기소개 : ${vo.content}</p>
  <p><a href="test05.jsp">돌아가기</a></p>
</div>
</body>
</html>