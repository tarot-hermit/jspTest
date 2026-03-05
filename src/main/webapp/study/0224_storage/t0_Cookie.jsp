<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>t0_Cookie.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>쿠키 연습 메뉴 화면</h2>
  <hr/>
  <div class="row text-center">
    <div class="col"><a href="t0_CookieSave.jsp" class="btn btn-success">쿠키저장</a></div>
    <div class="col"><a href="t0_CookieCheck.jsp" class="btn btn-primary">쿠키확인</a></div>
    <div class="col"><a href="t0_CookieAllDelete.jsp" class="btn btn-warning">전체쿠키삭제</a></div>
    <div class="col"><a href="t0_CookiePwdDelete.jsp" class="btn btn-danger">비밀번호쿠키삭제</a></div>
  </div>
  <hr/>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>