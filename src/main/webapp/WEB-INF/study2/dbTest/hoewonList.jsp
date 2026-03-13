<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>hoewonList.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center mb-3">회 원 리 스 트</h2>
  <table class="table table-hover">
    <tr class="table-secondary">
    	<th>번호</th>
    	<th>성명</th>
    	<th>나이</th>
    	<th>성별</th>
    	<th>주소</th>
    </tr>
    <c:set var="totCount" value="${fn:length(vos)}" />
    <c:forEach var="vo" items="${vos}" varStatus="st">
	    <tr>
	      <td>${totCount - st.index}</td>
	      <td>${vo.name}</td>
	      <td>${vo.age}</td>
	      <td>${vo.gender}</td>
	      <td>${vo.address}</td>
	    </tr>
    </c:forEach>
  </table>
  <div class="text-center"><a href="DbTest.db" class="btn btn-success">돌아가기</a></div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>