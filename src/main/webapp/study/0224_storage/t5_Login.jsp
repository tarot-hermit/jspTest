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
  <title>t5_Login.jsp</title>
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
  <form name="myform" method="post" action="t5_LoginOk.jsp">
  <%-- <form name="myform" method="post" action="<%=request.getContextPath()%>/study/0224_storage/t5_LoginOk.jsp"> --%>
  	<table class="table table-bordered text-center">
  	  <tr>
  	    <td colspan="2"><font size="5">로 그 인</font></td>
  	  </tr>
  	  <tr>
  	    <th>아이디</th>
  	    <td><input type="text" name="mid" id="mid" value="admin" autofocus required class="form-control"/></td>
  	  </tr>
  	  <tr>
  	    <th>비밀번호</th>
  	    <td><input type="password" name="pwd" id="pwd" value="1234" required class="form-control"/></td>
  	  </tr>
  	  <tr>
  	    <td colspan="2">
  	      <button type="submit" class="btn btn-success btn-sm me-2">로그인</button>
  	      <button type="reset" class="btn btn-warning btn-sm me-2">다시입력</button>
  	      <button type="button" onclick="location.href='<%=request.getContextPath()%>/'" class="btn btn-info btn-sm me-2">돌아가기</button>
  	    </td>
  	  </tr>
  	</table>
  </form>
</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>