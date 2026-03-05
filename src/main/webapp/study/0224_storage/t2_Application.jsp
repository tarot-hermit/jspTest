<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>t2_Application.jsp</title>
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
  <h2 class="text-center">Application 연습 메인 메뉴</h2>
  <hr/>
  <form name="myform" method="post" action="t2_ApplicationSave.jsp">
  	<table class="table table-bordered text-center">
  	  <tr>
  	    <td colspan="2"><font size="5">로 그 인</font></td>
  	  </tr>
  	  <tr>
  	    <th>아이디</th>
  	    <td><input type="text" name="mid" id="mid" value="${aMid}" autofocus required class="form-control"/></td>
  	  </tr>
  	  <tr>
  	    <th>닉네임</th>
  	    <td><input type="text" name="nickName" id="nickName" value="${aNickName}" required class="form-control"/></td>
  	  </tr>
  	  <tr>
  	    <th>성명</th>
  	    <td><input type="text" name="name" id="name" value="${aName}" required class="form-control"/></td>
  	  </tr>
  	  <tr>
  	    <td colspan="2">
  	      <button type="submit" class="btn btn-success btn-sm me-2">어플리케이션저장</button>
  	      <a href="t2_ApplicationCheck.jsp" class="btn btn-primary btn-sm me-2">어플리케이션확인</a>
  	      <input type="button" value="어플리케이션부분삭제" onclick="location.href='t2_ApplicationDelete.jsp'" class="btn btn-danger btn-sm me-2">
  	    </td>
  	  </tr>
  	</table>
  </form>
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>