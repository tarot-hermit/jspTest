<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>hoewonSearch.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>개별 회원 정보 검색 결과</h2>
  <hr/>
  <div>성명 : ${vo.name}</div>
  <div>나이 : ${vo.age}</div>
  <div>성별 : ${vo.gender}</div>
  <div>주소 : ${vo.address}</div>
  <hr/>
  <div><a href="DbTest.db" class="btn btn-success">돌아가기</a></div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>