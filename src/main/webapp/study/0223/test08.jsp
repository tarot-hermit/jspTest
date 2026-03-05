<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>test08.jsp</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2 class="text-center">성적 자료</h2>
  <form name="myform" method="post" action="test08Res.jsp">
    <div class="input-group mb-2">
      <div class="input-group-text">성명</div>
      <input type="text" name="name" value="홍길동" class="form-control"/>
    </div>
    <div class="input-group mb-2">
      <div class="input-group-text">학번</div>
      <input type="text" name="hakbun" value="G1234" class="form-control"/>
    </div>
    <div class="input-group mb-2">
      <div class="input-group-text">국어</div>
      <input type="number" name="kor" value="100" class="form-control"/>
    </div>
    <div class="input-group mb-2">
      <div class="input-group-text">영어</div>
      <input type="number" name="eng" value="90" class="form-control"/>
    </div>
    <div class="input-group mb-2">
      <div class="input-group-text">수학</div>
      <input type="number" name="mat" value="80" class="form-control"/>
    </div>
    <div class="input-group mb-2">
      <div class="input-group-text">사회</div>
      <input type="number" name="soc" value="70" class="form-control"/>
    </div>
    <div class="input-group mb-2">
      <div class="input-group-text">과학</div>
      <input type="number" name="sci" value="60" class="form-control"/>
    </div>
    <div class="text-center">
      <input type="submit" value="계산" class="btn btn-success" />
      <input type="reset" value="다시입력" class="btn btn-warning" />
    </div>
    <input type="hidden" name="hostIp" value="<%=request.getRemoteAddr()%>" />
  </form>
</div>
</body>
</html>