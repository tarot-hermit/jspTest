<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  int aCount = application.getAttribute("aCount")==null ? 0 : (int) application.getAttribute("aCount");
  int sCount = session.getAttribute("sCount")==null ? 0 : (int) session.getAttribute("sCount");
  
  aCount++;
  sCount++;
  
  application.setAttribute("aCount", aCount);
  session.setAttribute("sCount", sCount);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>t3_StorageTest.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>서버 저장소를 이용한 방문카운트 연습</h2>
  <hr/>
  <p>어클리케이션 카운트 : ${aCount}</p>
  <hr/>
  <p>세션 카운트 : ${sCount}</p>
  <hr/>
  <p>
    <a href="t3_ApplicationClear.jsp" class="btn btn-success">어플리케이션 카운트 초기화</a>
    <a href="t3_SessionClear.jsp" class="btn btn-primary">세션 카운트 초기화</a>
    <a href="t3_StorageTest.jsp" class="btn btn-warning">방문수 증가</a>
  </p>
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>