<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>t0_CookieCheck.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>저장된 쿠키 확인하기</h2>
  <hr/>
  <p>
<%
  Cookie[] cookies = request.getCookies();

	out.println("저장된 쿠키는?<br/>");
	/* 
	for(Cookie cookie : cookies) {
		out.println("쿠키 : " + cookie + "<br/>");
	}
	*/
	for(int i=0; i<cookies.length; i++) {
		out.println("쿠키명 : " + cookies[i].getName() + " , ");
		out.println("쿠키값 : " + cookies[i].getValue() + "<br/>");
	}
%>
  <hr/>
  <div><a href="t0_Cookie.jsp" class="btn btn-warning">돌아가기</a></div>
  </p>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>