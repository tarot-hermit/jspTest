<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String sId = session.getId();
  pageContext.setAttribute("pId", sId);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
  <script>
    'use strict';
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">세션 연습 메인 메뉴</h2>
  <hr/>
  <form name="myform" method="post" action="t1_SessionSave.jsp">
  	<table class="table table-bordered text-center">
  	  <tr>
  	    <td colspan="2"><font size="5">로 그 인(세션아이디 : ${pId})</font></td>
  	  </tr>
  	  <tr>
  	    <th>아이디</th>
  	    <td><input type="text" name="mid" id="mid" value="${sMid}" autofocus required class="form-control"/></td>
  	  </tr>
  	  <tr>
  	    <th>닉네임</th>
  	    <td><input type="text" name="nickName" id="nickName" value="${sNickName}" required class="form-control"/></td>
  	  </tr>
  	  <tr>
  	    <th>성명</th>
  	    <td><input type="text" name="name" id="name" value="${sName}" required class="form-control"/></td>
  	  </tr>
  	  <tr>
  	    <td colspan="2">
  	      <button type="submit" class="btn btn-success btn-sm me-2">세션저장</button>
  	      <a href="t1_SessionCheck.jsp" class="btn btn-primary btn-sm me-2">세션확인</a>
  	      <button type="button" onclick="location.href='t1_SessionAllDelete.jsp'" class="btn btn-warning btn-sm me-2">세션전체삭제</button>
  	      <input type="button" value="세션부분삭제" onclick="location.href='t1_SessionDelete.jsp'" class="btn btn-danger btn-sm me-2">
  	    </td>
  	  </tr>
  	</table>
  </form>
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>