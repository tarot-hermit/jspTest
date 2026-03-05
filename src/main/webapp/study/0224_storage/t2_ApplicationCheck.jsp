<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String mid = (String) application.getAttribute("aMid");
  String nickName = (String) application.getAttribute("aNickName");
	pageContext.setAttribute("pNickName", nickName);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>t2_ApplicationCheck.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>applicationr값 출력</h2>
  <p>아이디 : <%=mid %></p>
  <p>닉네임 : ${pNickName}</p>
  <p>성명 : ${aName}</p>
  <hr/>
  <p><a href="t2_Application.jsp" class="btn btn-info">돌아가기</a>
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>