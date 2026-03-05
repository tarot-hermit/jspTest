<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>t5_LoginMain.jsp</title>
  <%@ include file="/include/bs5.jsp" %>
  <script>
    'use strict';
    
    function logoutCheck() {
  		alert("로그아웃 되었습니다.");
  		<%-- <% session.invalidate(); %> --%>
  		<%-- location.href = '<%=request.getContextPath()%>/study/0224_storage/t5_Login.jsp'; --%>
  		location.href = '<%=request.getContextPath()%>/Logout?logoutSw=storage_t5';
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container text-center">
  <h2>회원 메인 방</h2>
  <hr/>
  <div><img src="<%=request.getContextPath()%>/images/19.jpg" width="400px" /></div>
  <hr/>
  <p>정회원의 등록정보등을 처리/출력</p>
  <div><input type="button" value="로그아웃" onclick="logoutCheck()" class="btn btn-warning"/></div>
  <hr/>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>