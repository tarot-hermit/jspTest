<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
	<jsp:include page="jstlMenu.jsp" />
  <h2>JSTL 반복문을 활용하여 저장된 객체의 값을 출력하시오.</h2>
<%
	String[][] members = {
		{"홍길동","23","서울"},
		{"김말숙","26","청주"},
		{"이기자","33","제주"},
		{"강감찬","45","인천"},
		{"김연아","19","서울"}
	};
  pageContext.setAttribute("members", members);
%>
  <c:forEach var="member" items="${members}" varStatus="st">
    <c:forEach var="m" items="${member}"> 
  		${m} /
  	</c:forEach>
  	<br/>
  </c:forEach>
  <br/>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>