<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jstl3.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
	<jsp:include page="jstlMenu.jsp" />
  <h2>회원 리스트</h2>
  <table class="table table-hover">
    <tr>
    	<th>번호</th>
    	<th>아이디</th>
    	<th>성명</th>
    	<th>나이</th>
    	<th>주소</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
	    <tr>
	      <td>${st.count}</td>
	      <td>${vo.mid}</td>
	      <td>${vo.name}</td>
	      <td>${vo.age}</td>
	      <td>${vo.address}</td>
	    </tr>
    </c:forEach>
  </table>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>