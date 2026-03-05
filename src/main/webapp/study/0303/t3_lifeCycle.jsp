<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>t3_lifeCycle.jsp</title>
	<%@ include file="/include/bs5.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
	<h2>서블릿 메소드의 LifeCycle(생명주기)</h2>
	<form action="${ctp}/j0303/T3_LifeCycle">
	<input type="submit" value="전송" class="btn btn-success"/>
	
	</form>
	
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>