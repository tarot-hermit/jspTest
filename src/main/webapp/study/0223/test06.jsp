<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>test06.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>서버의 환경변수값 확인...</h2>
  <hr/>
  <div>컨텍스 명 : <%=request.getContextPath() %></div>
  <div>호스트IP(접속IP) : <%=request.getRemoteAddr() %></div>
  <div>전송방식 : <%=request.getMethod() %></div>
  <div>접속프로토콜 : <%=request.getProtocol() %></div>
  <div>접속(서버)포트 : <%=request.getServerPort() %></div>
  <div>접속(서버)이름-도메인 : <%=request.getServerName() %></div>
  <div>접속 URL : <%=request.getRequestURL() %></div>
  <div>접속 URI : <%=request.getRequestURI() %></div>
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>